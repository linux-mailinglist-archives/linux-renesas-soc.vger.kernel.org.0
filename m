Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05749478D46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 15:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbhLQOUj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 09:20:39 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37321 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbhLQOUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 09:20:39 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4EBDB60011;
        Fri, 17 Dec 2021 14:20:34 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 0/4] Renesas NAND controller support
Date:   Fri, 17 Dec 2021 15:20:29 +0100
Message-Id: <20211217142033.353599-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Here is a short series bringing support for Renesas NAND controller
found on R-Car Gen3 and RZ/N1 SoCs.

The driver has been tested with a fully-upstream device tree on top of a
v5.16-rc4. The DT used is very close to the r9a06g032-db.

Cheers,
Miquèl

Changes in v6:
* Added Geert's R-by on the DT patch.
* Changed all the naming due to Wolfram's feedback. This controller is
  also found on the R-Car Gen3 family. Hence I used a much more generic
  name for the driver, the bindings, the variables, etc. The bindings
  have been updated to match the two different SoC families as well.
* Updated the MODULE_LICENSE macro as suggested by Wolfram.
 
Changes in v5:
* Add Rob's ack on the bindings.
* Dropped the #address/size-cells properties (handled by nand-controller.yaml).
* Fixed a typo reported by the kernel test robot (when building as a module).

Changes in v4:
* Set unevaluatedProperties set to false in the bindings.
* Change the clock names by removing the nand_ prefix which is
  redundant, even though the clocks are named like this in the spec. The
  name remains clear enough anyway.

Changes in v3:
* Rebased on top of a fully-upstream recent kernel.
* Renamed the clocks in the bindings and the driver to match the
  documentation (lower-cased): nand_hclk & nand_eclk.
* Added a new commit describing the NAND controller in the r9a06g032
  DTSI.
* Added the Reviewed-by and Tested-by tags received.

Changes in v2:
* Added the family-specific rzn1 compatible as suggested by Geert.
  Updated the bindings, the binding file name, the compatible used in
  the driver, the MAINTAINERS entry, etc.
* Added an ARCH_RENESAS Kconfig dependency.
* Changed the type (to unsigned) of a couple of variables.
* Returned earlier when possible to reduce indentation.
* Used platform_get_irq_optional() instead of platform_get_irq() to avoid
  a useless warning.
* Handled probe deferral correctly.
* Applied a massive s/nfc/nandc/ as suggested by Geert to avoid
  confusions with the near-field-communication device.
* Mentioned Evatronix as original authors of the IP in the commit log and
  in the header.
* Added an additional check on the validity of the child nodes reg property.
* A couple of style fixes.

Miquel Raynal (4):
  dt-bindings: mtd: renesas: Describe Renesas R-Car Gen3 & RZ/N1 NAND
    controller
  mtd: rawnand: renesas: Add new NAND controller driver
  MAINTAINERS: Add an entry for Renesas NAND controller
  ARM: dts: r9a06g032: Describe the NAND controller

 .../bindings/mtd/renesas-nandc.yaml           |   66 +
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/r9a06g032.dtsi              |   11 +
 drivers/mtd/nand/raw/Kconfig                  |    7 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 .../mtd/nand/raw/renesas-nand-controller.c    | 1424 +++++++++++++++++
 6 files changed, 1516 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
 create mode 100644 drivers/mtd/nand/raw/renesas-nand-controller.c

-- 
2.27.0

