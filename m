Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2839C45EFCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 15:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348855AbhKZOZY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 09:25:24 -0500
Received: from mslow1.mail.gandi.net ([217.70.178.240]:41557 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348045AbhKZOXX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 09:23:23 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id E6A28C3487
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 14:06:55 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D1080FF804;
        Fri, 26 Nov 2021 14:06:25 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] Renesas RZ/N1 NAND controller support
Date:   Fri, 26 Nov 2021 15:06:22 +0100
Message-Id: <20211126140625.351697-1-miquel.raynal@bootlin.com>
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

So far this driver has been tested with a not-fully-upstream device tree
because clock tree is not yet described entirely, I am going to work on
it really soon but I believe we don't need full clock support to get the
NAND controller driver merged for now.

Cheers,
Miquèl

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

Miquel Raynal (3):
  dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND controller
  mtd: rawnand: rzn1: Add new NAND controller driver
  MAINTAINERS: Add an entry for Renesas RZ/N1 NAND controller

 .../mtd/renesas,rzn1-nand-controller.yaml     |   64 +
 MAINTAINERS                                   |    7 +
 drivers/mtd/nand/raw/Kconfig                  |    6 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/rzn1-nand-controller.c   | 1420 +++++++++++++++++
 5 files changed, 1498 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
 create mode 100644 drivers/mtd/nand/raw/rzn1-nand-controller.c

-- 
2.27.0

