Return-Path: <linux-renesas-soc+bounces-6937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0191E185
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 15:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C5C2B254B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 13:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343F816B74C;
	Mon,  1 Jul 2024 13:54:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E615FCE0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jul 2024 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842069; cv=none; b=pF38mWhbGbQmBbzP7E3gMUZTmIvWHWahEYIAbJHnE1QrC2tyK0rnlkrObFUpb/thB8fr+4SucwHICE8ncK18EJPfgEIpP9Q5nMx4eN3j5octa1fZrAC8Nwt9Pnf41mNjcqeP+Nqd3smH25qjQNBNeXhMLV0deZE6KF/cyVKNwG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842069; c=relaxed/simple;
	bh=mGAuCZgA2CcqrjhV6CHTOjJSYcLUjnH7A7J5jQMNJG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJe0fOt50mP3Tthxe92UB5V0ocWRs20QBU4UGoSHymyK8yb1rd934KPJBWe/ljfx1labXlFYdMARKCrW7a+SQzMSpi5tjpyBHpp/GRzpwx0EnL2I/sHf9r5TzCxv21skRjSpVUfR60dxT3pxFtgvFq9EtvfPFN8oY11LGNbSVV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTX-0001LY-6i; Mon, 01 Jul 2024 15:53:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 01 Jul 2024 15:53:41 +0200
Subject: [PATCH 2/9] mtd: add mtd_is_master helper
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 loongarch@lists.linux.dev, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Provide a simple helper to make it easy to detect an master mtd device.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 include/linux/mtd/mtd.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..bf3fc2ea7230 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -408,6 +408,11 @@ static inline struct mtd_info *mtd_get_master(struct mtd_info *mtd)
 	return mtd;
 }
 
+static inline bool mtd_is_master(struct mtd_info *mtd)
+{
+	return mtd->parent ? false : true;
+}
+
 static inline u64 mtd_get_master_ofs(struct mtd_info *mtd, u64 ofs)
 {
 	while (mtd->parent) {

-- 
2.39.2


