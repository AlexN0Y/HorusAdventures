//
//  Constants.swift
//  HorusAdventures
//
//  Created by Alex Gav on 20.09.2024.
//

import MapKit

let attractions: [Attraction] = [
    Attraction(
        type: .pyramid,
        name: "Great Pyramid of Giza",
        baseImageName: "giza",
        location: "Giza Plateau, Cairo, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342),
        visitable: true,
        history: """
        The Great Pyramid, built for Pharaoh Khufu (also known as Cheops), is the largest of the three pyramids on the Giza Plateau and is the only surviving structure of the original Seven Wonders of the Ancient World. Constructed over a 20-year period during the Fourth Dynasty around 2580–2560 BC, it was originally 146.6 meters tall, though it stands at 138.8 meters today due to the loss of its smooth white casing stones. The pyramid was the tallest man-made structure in the world for over 3,800 years.

        The pyramid complex originally included the pyramid itself, a mortuary temple, smaller pyramids for Khufu's queens, and a causeway connecting the complex to the Nile. The burial chamber is located in the central core, deep within the structure. Theories about the pyramid’s construction vary, but most believe a massive labor force of tens of thousands of workers was employed to create this architectural marvel. The Great Pyramid has sparked centuries of fascination due to its incredible size, precision, and astronomical alignment. It is aligned with the four cardinal points and may have been aligned with specific stars in ancient Egypt. The chambers and passageways within are also a subject of interest, with the so-called "Queen’s Chamber" and the enigmatic "Grand Gallery" offering a glimpse into ancient engineering and symbolic designs.
        """,
        touristInterest: """
        Tourists are fascinated by the sheer size and mystery of the Great Pyramid. Visitors can explore the exterior and, with a separate ticket, access the inside to walk through the narrow passages to the King's Chamber. The Great Pyramid, along with the nearby Sphinx, is a quintessential symbol of ancient Egyptian civilization.
        """
    ),
    Attraction(
        type: .temple,
        name: "Temple of Karnak",
        baseImageName: "karnak",
        location: "Luxor, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 25.7194, longitude: 32.6572),
        visitable: true,
        history: """
        The Temple of Karnak is one of the largest religious structures ever built, dedicated to the god Amun, his consort Mut, and their son Khonsu, forming the Theban Triad. Construction began around 2055 BC and continued for nearly 2,000 years through various Egyptian dynasties, particularly during the Middle and New Kingdoms. The temple complex covers more than 100 hectares, featuring numerous sanctuaries, pylons, obelisks, and statues.

        The most famous part of the complex is the Hypostyle Hall, a forest of 134 massive stone columns, each intricately carved. These columns were built during the reign of Seti I and completed by Ramesses II around 1279 BC. The complex also includes the Sacred Lake, where priests would purify themselves, and the Avenue of Sphinxes, which once connected Karnak to Luxor Temple. Karnak was not just a place of worship but also a significant political and economic center of ancient Egypt, employing thousands of people and receiving vast quantities of tributes and offerings.
        """,
        touristInterest: """
        Karnak is a wonder for its sheer scale and the grandeur of its architectural features. The Hypostyle Hall is an awe-inspiring sight, with its towering columns and intricate carvings. The temple complex offers a glimpse into the religious and ceremonial practices of ancient Egypt, and visitors can enjoy an evening sound-and-light show that adds to the mystical atmosphere.
        """
    ),
    Attraction(
        type: .pyramid,
        name: "Pyramid of Djoser",
        baseImageName: "djoser",
        location: "Saqqara, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 29.8712, longitude: 31.2165),
        visitable: true,
        history: """
        The Pyramid of Djoser, located at the Saqqara necropolis, is considered the first pyramid ever built. It was constructed during the 27th century BC for Pharaoh Djoser by his architect, Imhotep, who is often credited with revolutionizing Egyptian architecture by introducing the use of stone for monumental buildings.

        Unlike later pyramids, Djoser’s pyramid is a stepped structure, consisting of six mastabas (rectangular structures) stacked on top of one another. This pyramid stands 62 meters high and was originally clad in smooth white limestone, though much of this has eroded away. The pyramid complex includes several other structures, such as a large courtyard, temples, and pavilions, all enclosed by a limestone wall. The Step Pyramid marked a transition from the traditional flat-roofed mastabas used in earlier tombs to the pyramidal form that would dominate royal burials for the next several centuries.
        """,
        touristInterest: """
        Tourists are drawn to the Step Pyramid for its historical significance as the earliest large-scale stone structure in Egypt. The surrounding complex is also fascinating, with many ancient tombs and ruins to explore. Recent restorations have opened more areas for visitors, including some of the underground tunnels beneath the pyramid.
        """
    ),
    Attraction(
        type: .temple,
        name: "Luxor Temple",
        baseImageName: "luxor",
        location: "Luxor, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 25.6994, longitude: 32.6396),
        visitable: true,
        history: """
        Luxor Temple was built primarily during the reigns of Amenhotep III (1390–1352 BC) and Ramesses II (1279–1213 BC), though some portions date back to the reign of Hatshepsut and earlier rulers. The temple is located on the east bank of the Nile and was dedicated to the Theban Triad, particularly Amun-Ra, the king of the gods.

        Unlike Karnak Temple, which was focused on state religious rituals, Luxor Temple was the center of the annual Opet Festival, which celebrated the re-birth of the pharaoh’s ka (spirit). During this festival, the statues of Amun, Mut, and Khonsu were transported from Karnak to Luxor Temple, linking the two temples.
        """,
        touristInterest: """
        Luxor Temple is a marvel of ancient architecture and one of the most visually striking sites along the Nile. Its proximity to the riverbank makes it particularly atmospheric at sunset. The temple comes alive in the evenings with a dramatic sound-and-light show that attracts many visitors.
        """
    ),
    Attraction(
        type: .pyramid,
        name: "Pyramid of Khafre",
        baseImageName: "khafre",
        location: "Giza Plateau, Cairo, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 29.9761, longitude: 31.1306),
        visitable: true,
        history: """
        The Pyramid of Khafre is the second-largest pyramid in the Giza complex, built for Pharaoh Khafre (also known as Chephren), who reigned during the Fourth Dynasty around 2570 BC. Though smaller than the Great Pyramid of Khufu, it appears taller due to being constructed on higher ground. It stands at 136.4 meters, originally around 143.5 meters, and is distinguished by the remnants of the smooth limestone casing that still covers the top third of the structure.

        The pyramid is part of a larger complex that includes a mortuary temple, a causeway, and the Great Sphinx, which is believed to have been built in Khafre's likeness. The mortuary temple was used for rituals conducted by priests in honor of the deceased king. The Great Sphinx, the largest monolith statue in the world, adds to the allure of Khafre's pyramid.
        """,
        touristInterest: """
        Visitors are captivated by the grandeur of Khafre’s pyramid and its proximity to the iconic Great Sphinx. Tourists can explore the pyramid's interior and enjoy panoramic views of the Giza Plateau. Many are drawn to the architectural precision and the ancient myths surrounding the Sphinx.
        """
    ),
    Attraction(
        type: .temple,
        name: "Temple of Philae",
        baseImageName: "philae",
        location: "Agilkia Island, near Aswan, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 24.0259, longitude: 32.8847),
        visitable: true,
        history: """
        The Temple of Philae was originally located on Philae Island but was moved to nearby Agilkia Island during the 1960s as part of an international effort to save the temple complex from submersion after the construction of the Aswan High Dam. The temple is dedicated to the goddess Isis and was one of the last temples where ancient Egyptian religion was practiced before the rise of Christianity.

        The temple dates back to the 4th century BC during the reign of Ptolemy II, though earlier structures may have existed on the site. Philae was an important religious center, and the temple was an active place of worship even during the Roman period. It was known for being a center of pilgrimage, where devotees of Isis from around the Mediterranean would come to honor the goddess of magic, fertility, and motherhood.
        """,
        touristInterest: """
        The temple’s setting on an island adds to its allure, and visitors enjoy the boat ride to the complex. The Temple of Philae is also famous for its evening sound-and-light show, which immerses tourists in the myths of ancient Egypt. The tranquil surroundings and the temple’s connection to the goddess Isis make it a magical and serene site.
        """
    ),
    Attraction(
        type: .temple,
        name: "Temple of Hatshepsut",
        baseImageName: "hatshepsut",
        location: "Deir el-Bahari, Luxor, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 25.7375, longitude: 32.6063),
        visitable: true,
        history: """
        The Temple of Hatshepsut is one of the most striking and well-preserved temples in Egypt, built by Queen Hatshepsut, one of Egypt's few female pharaohs. The temple is located in Deir el-Bahari, nestled against towering cliffs on the west bank of the Nile. It was constructed during the 18th Dynasty around 1479–1458 BC.

        Hatshepsut’s reign was marked by prosperity, extensive trade, and monumental architecture. She commissioned the temple to serve as a funerary complex, dedicated to the god Amun and intended to glorify her reign and her divine birth. The temple’s name, "Djeser-Djeseru," means "Holy of Holies," and it was designed by her architect, Senenmut.
        """,
        touristInterest: """
        The Temple of Hatshepsut is a favorite among tourists due to its dramatic location and unique design. Visitors can explore the terraces, view the detailed reliefs, and learn about Hatshepsut's remarkable reign. Its proximity to other major sites like the Valley of the Kings makes it a key stop on many tours.
        """
    ),
    Attraction(
        type: .pyramid,
        name: "Pyramid of Menkaure",
        baseImageName: "menkaure",
        location: "Giza Plateau, Cairo, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 29.9723, longitude: 31.1281),
        visitable: true,
        history: """
        The Pyramid of Menkaure is the smallest of the three major pyramids on the Giza Plateau, built for Pharaoh Menkaure during the Fourth Dynasty around 2510 BC. The pyramid originally stood 65.5 meters tall but now is around 61 meters due to the loss of the outer casing. It was constructed using limestone and granite, with the lower portion made of red granite from Aswan.

        The pyramid’s mortuary temple was more elaborate than that of Khafre or Khufu, reflecting Menkaure’s more detailed attention to the afterlife. The interior chambers of the pyramid follow a traditional design, with a descending passage leading to the burial chamber.
        """,
        touristInterest: """
        While smaller than the neighboring pyramids of Khufu and Khafre, the Pyramid of Menkaure offers visitors a more intimate experience. Tourists are often drawn to its relative tranquility compared to the crowds at the other pyramids, and the chance to enter the pyramid’s chambers is a rare opportunity to explore ancient burial practices.
        """
    ),
    Attraction(
        type: .temple,
        name: "Temple of Edfu",
        baseImageName: "edfu",
        location: "Edfu, Aswan Governorate, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 24.9780, longitude: 32.8733),
        visitable: true,
        history: """
        The Temple of Horus at Edfu is one of the best-preserved ancient temples in Egypt, built between 237 and 57 BC during the Ptolemaic period. The temple was dedicated to Horus, the falcon-headed god, who was associated with kingship and protection. Edfu was considered the site where Horus fought his uncle, Seth, the god of chaos, in Egyptian mythology.

        The temple complex is massive, covering over 25 acres, and includes a large courtyard, a hypostyle hall, and the sanctuary of Horus. The walls are covered with detailed reliefs depicting the battle between Horus and Seth, as well as ritual scenes showing offerings to the gods.
        """,
        touristInterest: """
        Tourists are drawn to Edfu for its impressive state of preservation and its striking depictions of ancient Egyptian mythology. The temple is a highlight of Nile River cruises, and the grandeur of its pylon and inner chambers makes it a key attraction.
        """
    ),
    Attraction(
        type: .pyramid,
        name: "Pyramid of Unas",
        baseImageName: "unas",
        location: "Saqqara, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 29.8684, longitude: 31.2101),
        visitable: true,
        history: """
        The Pyramid of Unas is one of the smaller pyramids built during the Fifth Dynasty (circa 2375–2345 BC) but is historically significant for being the first pyramid to include the Pyramid Texts, a collection of ancient religious spells intended to protect the pharaoh in the afterlife. The pyramid was constructed for Pharaoh Unas, the last ruler of the Fifth Dynasty.

        The Pyramid of Unas originally stood at 43 meters tall but has since degraded into a mound of rubble. Despite its modest size and dilapidated exterior, the pyramid is renowned for the richness of its interior, where the walls of the burial chamber are inscribed with some of the earliest religious texts in human history.
        """,
        touristInterest: """
        Though smaller and less visually impressive than the Giza pyramids, the Pyramid of Unas is a must-see for those interested in ancient Egyptian religious practices and the evolution of pyramid architecture. The well-preserved Pyramid Texts are a key highlight, providing a rare glimpse into the spiritual and magical beliefs of ancient Egyptians.
        """
    ),
    Attraction(
        type: .temple,
        name: "Temple of Kom Ombo",
        baseImageName: "komombo",
        location: "Kom Ombo, Aswan Governorate, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 24.4520, longitude: 32.9286),
        visitable: true,
        history: """
        The Temple of Kom Ombo is unique in Egypt because it is dedicated to two gods: Sobek, the crocodile god, and Horus the Elder, the falcon-headed sky god. Built during the Ptolemaic Dynasty, between 180–47 BC, the temple’s dual design reflects its twin dedication, with two parallel sections, one for each god.

        The temple is located near the Nile, where crocodiles once basked, and this proximity to the river is likely why Sobek was honored here. Reliefs within the temple depict both gods and scenes of the pharaoh making offerings.
        """,
        touristInterest: """
        Tourists are drawn to the temple for its unique dual dedication and beautiful location by the Nile. The crocodile mummies in the museum add an unusual and fascinating element to the visit.
        """
    ),
    Attraction(
        type: .temple,
        name: "Temple of Seti I",
        baseImageName: "setii",
        location: "Abydos, Sohag Governorate, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 26.1844, longitude: 31.9193),
        visitable: true,
        history: """
        The Temple of Seti I, located in Abydos, is one of the most significant religious sites in ancient Egypt, as Abydos was considered the burial place of Osiris, the god of the afterlife. Seti I, a pharaoh of the 19th Dynasty, built this temple to honor Osiris, along with other gods and goddesses.

        The temple is renowned for its beautiful reliefs and depictions of Seti I with various deities. The artwork in the temple is considered some of the finest from the New Kingdom period. The temple’s most famous feature is the Abydos King List, a chronological list of 76 pharaohs.
        """,
        touristInterest: """
        The Temple of Seti I is an off-the-beaten-path attraction for tourists who are particularly interested in ancient Egyptian history and religious practices. The Abydos King List is a key draw for history enthusiasts, and the fine quality of the reliefs makes it a must-see for art lovers.
        """
    ),
    Attraction(
        type: .pyramid,
        name: "Pyramid of Meidum",
        baseImageName: "meidum",
        location: "Meidum, Beni Suef Governorate, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 29.4731, longitude: 31.1837),
        visitable: true,
        history: """
        The Pyramid of Meidum is one of Egypt’s earliest pyramid structures, attributed to Pharaoh Sneferu of the Fourth Dynasty (circa 2613–2589 BC). Originally built as a step pyramid, it was later transformed into a smooth-sided pyramid by Sneferu, making it a transitional form between the step pyramid design of Djoser and the fully developed pyramids of Giza.

        Unfortunately, much of the pyramid collapsed in antiquity, leaving behind a distinctive structure that resembles a tower surrounded by rubble. It is thought that the outer casing and some of the internal layers fell away due to unstable foundations and design flaws, making the Pyramid of Meidum an important case study in the evolution of pyramid construction.
        """,
        touristInterest: """
        While not as visually striking as the Giza pyramids, the Pyramid of Meidum is interesting for its role in the development of pyramid construction. The site’s quiet and isolated atmosphere appeals to tourists who prefer exploring less-crowded locations.
        """
    ),
    Attraction(
        type: .temple,
        name: "Temple of Medinet Habu",
        baseImageName: "habu",
        location: "West Bank of Luxor, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 25.7228, longitude: 32.6062),
        visitable: true,
        history: """
        The Temple of Medinet Habu is one of the best-preserved temples in Egypt and was constructed by Pharaoh Ramesses III during the 20th Dynasty (circa 1186–1155 BC). The temple served as both a mortuary temple for Ramesses III and a religious site dedicated to the god Amun.

        Medinet Habu is notable for its massive walls and grand pylon entrance, which is adorned with scenes depicting Ramesses III’s military victories over the Sea Peoples, who posed a significant threat to Egypt during his reign. The temple complex was also used as a fortified administrative center.
        """,
        touristInterest: """
        Medinet Habu’s towering walls and intricately carved reliefs make it a favorite among tourists interested in New Kingdom history. The relative tranquility of the site, compared to nearby Luxor and Karnak temples, allows for a more reflective and immersive experience.
        """
    ),
    Attraction(
        type: .pyramid,
        name: "Bent Pyramid",
        baseImageName: "bent",
        location: "Dahshur, Egypt",
        coordinates: CLLocationCoordinate2D(latitude: 29.7967, longitude: 31.2084),
        visitable: true,
        history: """
        The Bent Pyramid is one of the most unique pyramids in Egypt, built for Pharaoh Sneferu during the Fourth Dynasty (circa 2600 BC). It is called the Bent Pyramid because of its unusual shape — the angle of the sides changes halfway up, giving the structure a "bent" appearance. This is thought to have occurred because the builders realized that the original angle was too steep, which could cause structural instability, leading to the adjustment during construction.

        The Bent Pyramid is significant because it represents an early attempt at constructing a smooth-sided pyramid, a design perfected later with the Red Pyramid and the Great Pyramid of Giza. The pyramid stands at 101 meters and retains much of its original polished limestone casing.
        """,
        touristInterest: """
        The Bent Pyramid’s unusual design makes it a fascinating site for tourists, especially those interested in the evolution of pyramid architecture. It has only recently been opened to the public, allowing visitors to enter and explore the interior.
        """
    )
]
