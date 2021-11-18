Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7263B455A0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 12:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343799AbhKRLY1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 06:24:27 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:52865 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343737AbhKRLWp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 06:22:45 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5421120011;
        Thu, 18 Nov 2021 11:19:41 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] Renesas RZ/N1 NAND controller support
Date:   Thu, 18 Nov 2021 12:19:37 +0100
Message-Id: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Here is a short series bringing support for Renesas RZ/N1 NAND
controller. I tried to follow the upstream conventions for the
compatible name but used a more easy to read name for the driver itself,
please tell me if this is an issue.

So far this driver has been tested with a not-fully-upstream device tree
because clock tree is not yet described entirely, I am going to work on
it really soon but I believe we don't need full clock support to get the
NAND controller driver merged for now.

Cheers,
Miquèl

Miquel Raynal (3):
  dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND controller
  mtd: rawnand: rzn1: Add new NAND controller driver
  MAINTAINERS: Add an entry for Renesas RZ/N1 NAND controller

 .../renesas,r9a06g032-nand-controller.yaml    |   60 +
 MAINTAINERS                                   |    7 +
 drivers/mtd/nand/raw/Kconfig                  |    6 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/rzn1-nand-controller.c   | 1417 +++++++++++++++++
 5 files changed, 1491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
 create mode 100644 drivers/mtd/nand/raw/rzn1-nand-controller.c

-- 
2.27.0

