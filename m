Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC3346EA05
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Dec 2021 15:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238653AbhLIOgL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Dec 2021 09:36:11 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:36247 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238649AbhLIOgL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 09:36:11 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D90A5200011;
        Thu,  9 Dec 2021 14:32:35 +0000 (UTC)
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
Subject: [PATCH v3 3/4] MAINTAINERS: Add an entry for Renesas RZ/N1 NAND controller
Date:   Thu,  9 Dec 2021 15:32:27 +0100
Message-Id: <20211209143228.525234-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211209143228.525234-1-miquel.raynal@bootlin.com>
References: <20211209143228.525234-1-miquel.raynal@bootlin.com>
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
index 43007f2d29e0..48be4107d05e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16287,6 +16287,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
 F:	drivers/iio/adc/rzg2l_adc.c
 
+RENESAS RZ/N1X NAND CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
+F:	drivers/mtd/nand/raw/rzn1-nand-controller.c
+
 RESET CONTROLLER FRAMEWORK
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 S:	Maintained
-- 
2.27.0

