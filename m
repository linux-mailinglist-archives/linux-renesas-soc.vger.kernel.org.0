Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66AF546E9FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Dec 2021 15:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238645AbhLIOgG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Dec 2021 09:36:06 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:38141 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238646AbhLIOgG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 09:36:06 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9FCF620000C;
        Thu,  9 Dec 2021 14:32:29 +0000 (UTC)
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
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/4] Renesas RZ/N1 NAND controller support
Date:   Thu,  9 Dec 2021 15:32:24 +0100
Message-Id: <20211209143228.525234-1-miquel.raynal@bootlin.com>
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

