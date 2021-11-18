Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E9D455A0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 12:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343822AbhKRLY3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 06:24:29 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54953 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343693AbhKRLWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 06:22:49 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6DEF52001C;
        Thu, 18 Nov 2021 11:19:47 +0000 (UTC)
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
Subject: [PATCH 3/3] MAINTAINERS: Add an entry for Renesas RZ/N1 NAND controller
Date:   Thu, 18 Nov 2021 12:19:40 +0100
Message-Id: <20211118111940.1275351-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Point to the driver and the bindings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca6d6fde85cf..d5ecc57820e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16004,6 +16004,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
 F:	drivers/iio/adc/rzg2l_adc.c
 
+RENESAS RZ/N1X NAND CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
+F:	drivers/mtd/nand/raw/rzn1-nand-controller.c
+
 RESET CONTROLLER FRAMEWORK
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 S:	Maintained
-- 
2.27.0

