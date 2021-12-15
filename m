Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC38475C83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 17:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244334AbhLOP7e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 10:59:34 -0500
Received: from mslow1.mail.gandi.net ([217.70.178.240]:44151 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244336AbhLOP7c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 10:59:32 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 76AC1DB444
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 15:46:46 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 932EEFF815;
        Wed, 15 Dec 2021 15:46:20 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/4] Renesas RZ/N1 NAND controller support
Date:   Wed, 15 Dec 2021 16:46:15 +0100
Message-Id: <20211215154619.166360-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Here is a short series bringing support for Renesas RZ/N1 NAND
controller.

This time the driver has been tested with a fully-upstream device tree
on top of a v5.16-rc4. The DT used is very close to the r9a06g032-db.

Cheers,
Miquèl

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
  dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND controller
  mtd: rawnand: rzn1: Add new NAND controller driver
  MAINTAINERS: Add an entry for Renesas RZ/N1 NAND controller
  ARM: dts: r9a06g032: Describe NAND controller

 .../mtd/renesas,rzn1-nand-controller.yaml     |   64 +
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/r9a06g032.dtsi              |   12 +
 drivers/mtd/nand/raw/Kconfig                  |    6 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/rzn1-nand-controller.c   | 1422 +++++++++++++++++
 6 files changed, 1512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
 create mode 100644 drivers/mtd/nand/raw/rzn1-nand-controller.c

-- 
2.27.0

