package by.potapenko.web.servlet;

import by.potapenko.database.enam.Status;
import by.potapenko.database.enam.UserRole;
import by.potapenko.database.entity.CarEntity;
import by.potapenko.database.entity.ClientEntity;
import by.potapenko.database.entity.RentalEntity;
import by.potapenko.database.entity.UserEntity;
import by.potapenko.service.RentalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;

import java.io.IOException;
import java.time.LocalDate;

import static by.potapenko.web.util.PagesUtil.UPDATE_RENTAL;

@WebServlet("/admin/rentals/rental/update_rental")
public class UpdateRentalServlet extends HttpServlet {
    private final RentalService rentalService = RentalService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        req.setAttribute("rental", rentalService.findById(Long.parseLong(id)).get());
        req.getRequestDispatcher(UPDATE_RENTAL).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RentalEntity updaterental = RentalEntity.builder()
                .id(Long.valueOf(req.getParameter("rental")))
                .car(CarEntity.builder()
                        .brand(req.getParameter("brand"))
                        .model(req.getParameter("model"))
                        .build())
                .client(ClientEntity.builder()
                        .firstName(req.getParameter("client"))
                        .build())
                .rentalDate(LocalDate.parse(req.getParameter("rental_date")))
                .returnDate(LocalDate.parse(req.getParameter("return_date")))
                .rentalDays(Integer.parseInt(req.getParameter("rental_days")))
                .price(Double.parseDouble(req.getParameter("price")))
                .status(Status.valueOf(req.getParameter("status")))
                .client(ClientEntity.builder()
                        .user(UserEntity.builder()
                                .role(UserRole.valueOf(req.getParameter("creator")))
                                .build())
                        .build())
                .build();
//        updaterental.setDateOfCreation(LocalDateTime.parse(req.getParameter("date_of_creation")));
        rentalService.update(updaterental).ifPresentOrElse(
                rental -> successCreateCar(req, resp, rental),
                () -> faultCreateCar(req, resp));
    }

    @SneakyThrows
    private static void successCreateCar(HttpServletRequest req, HttpServletResponse resp, RentalEntity rental) {
        req.setAttribute("update_rental_error", false);
        req.setAttribute("rental", rental);
        req.getRequestDispatcher(UPDATE_RENTAL).forward(req, resp);
    }

    @SneakyThrows
    private static void faultCreateCar(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("update_rental_error", true);
        req.getRequestDispatcher(UPDATE_RENTAL).forward(req, resp);
    }

}
