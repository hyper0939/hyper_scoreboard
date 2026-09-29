$(document).ready(function() {
    $(".container").hide();

    window.addEventListener("message", (event) => {
        const msg = event.data;

        if (msg.action === "Open") {
            const d = msg.data;
            if (!d) return;

            $(".Label1").text(d.title1);
            $(".Label2").text(d.title2);
            $(".ServerStuff").text(`ID: ${d.serverId} | ${d.players}/ ${d.maxPlayers}`);

            d.boxes.forEach((box, i) => {
                const n = i + 1

                $(`.ExampleBox${n}`).css("background", box.color);
                $(`.ExampleName${n}`).text(`${box.name}: ${box.count}`);
            });

            $(".container").stop(true, true).fadeIn(350);
        }

        if (msg.action === "Close") {
            $(".container").stop(true, true).fadeOut(350);
        }
    });
})