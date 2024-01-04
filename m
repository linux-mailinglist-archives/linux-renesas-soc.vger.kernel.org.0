Return-Path: <linux-renesas-soc+bounces-1289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7CC8243F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 15:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E96B0B22BC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 14:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1388B22F1C;
	Thu,  4 Jan 2024 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3QGbaXP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857A21A05;
	Thu,  4 Jan 2024 14:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83763C433C8;
	Thu,  4 Jan 2024 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704379086;
	bh=WlYpjvT30jRf/dwAdbDN9Ba4Mz05UIfVBguP0C38l0I=;
	h=From:To:Cc:Subject:Date:From;
	b=U3QGbaXPz23/FfqcCyYNpwWKtUOty4SeVg2N67/f6xtv5yc9BTPgF5zREsqI7+jgc
	 Smri44QOgbTIi+b0nAhuHiBdRu3UnRMbR1VPu2bxBtmVOas9fN1qoFm1uicVM8oljN
	 kBVnu7Peznpp5sT3F95HAdxHnZ9dFyptHEiCVCZx0LpySI6QxIk1hHB5e+LCuDtO6I
	 mHzamUwf5gtEWwpkeopzxi6q+D5DQVMqh/uSyeHCI8Ub+I28y/nww6p1GlcKL3nkMx
	 vb0Lf3eJZREryzhm0s01UgP8LGBeHS6QVaZ/8hycfwQUxmbqdbscF7EZTinInWWogP
	 y76adzMnsgGRg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	Jakub Kicinski <kuba@kernel.org>,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	hauke@hauke-m.de,
	kurt@linutronix.de,
	woojung.huh@microchip.com,
	UNGLinuxDriver@microchip.com,
	arinc.unal@arinc9.com,
	daniel@makrotopia.org,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	claudiu.manoil@nxp.com,
	alexandre.belloni@bootlin.com,
	clement.leger@bootlin.com,
	george.mccollister@gmail.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
Date: Thu,  4 Jan 2024 06:37:59 -0800
Message-ID: <20240104143759.1318137-1-kuba@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
Add descriptions to all the DSA tag modules.

The descriptions are copy/pasted Kconfig names, with s/^Tag/DSA tag/.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: andrew@lunn.ch
CC: f.fainelli@gmail.com
CC: olteanv@gmail.com
CC: hauke@hauke-m.de
CC: kurt@linutronix.de
CC: woojung.huh@microchip.com
CC: UNGLinuxDriver@microchip.com
CC: arinc.unal@arinc9.com
CC: daniel@makrotopia.org
CC: Landen.Chao@mediatek.com
CC: dqfext@gmail.com
CC: sean.wang@mediatek.com
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: claudiu.manoil@nxp.com
CC: alexandre.belloni@bootlin.com
CC: clement.leger@bootlin.com
CC: george.mccollister@gmail.com
CC: linux-renesas-soc@vger.kernel.org
---
 net/dsa/tag_ar9331.c       | 1 +
 net/dsa/tag_brcm.c         | 1 +
 net/dsa/tag_dsa.c          | 1 +
 net/dsa/tag_gswip.c        | 1 +
 net/dsa/tag_hellcreek.c    | 1 +
 net/dsa/tag_ksz.c          | 1 +
 net/dsa/tag_lan9303.c      | 1 +
 net/dsa/tag_mtk.c          | 1 +
 net/dsa/tag_none.c         | 1 +
 net/dsa/tag_ocelot.c       | 1 +
 net/dsa/tag_ocelot_8021q.c | 1 +
 net/dsa/tag_qca.c          | 1 +
 net/dsa/tag_rtl4_a.c       | 1 +
 net/dsa/tag_rtl8_4.c       | 1 +
 net/dsa/tag_rzn1_a5psw.c   | 1 +
 net/dsa/tag_sja1105.c      | 1 +
 net/dsa/tag_trailer.c      | 1 +
 net/dsa/tag_xrs700x.c      | 1 +
 18 files changed, 18 insertions(+)

diff --git a/net/dsa/tag_ar9331.c b/net/dsa/tag_ar9331.c
index 92ce67b93a58..cbb588ca73aa 100644
--- a/net/dsa/tag_ar9331.c
+++ b/net/dsa/tag_ar9331.c
@@ -89,6 +89,7 @@ static const struct dsa_device_ops ar9331_netdev_ops = {
 	.needed_headroom = AR9331_HDR_LEN,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for Atheros AR9331 SoC with built-in switch");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AR9331, AR9331_NAME);
 module_dsa_tag_driver(ar9331_netdev_ops);
diff --git a/net/dsa/tag_brcm.c b/net/dsa/tag_brcm.c
index 83d283a5d27e..8c3c068728e5 100644
--- a/net/dsa/tag_brcm.c
+++ b/net/dsa/tag_brcm.c
@@ -335,4 +335,5 @@ static struct dsa_tag_driver *dsa_tag_driver_array[] =	{
 
 module_dsa_tag_drivers(dsa_tag_driver_array);
 
+MODULE_DESCRIPTION("DSA tag driver for Broadcom switches using in-frame headers");
 MODULE_LICENSE("GPL");
diff --git a/net/dsa/tag_dsa.c b/net/dsa/tag_dsa.c
index 8ed52dd663ab..2a2c4fb61a65 100644
--- a/net/dsa/tag_dsa.c
+++ b/net/dsa/tag_dsa.c
@@ -406,4 +406,5 @@ static struct dsa_tag_driver *dsa_tag_drivers[] = {
 
 module_dsa_tag_drivers(dsa_tag_drivers);
 
+MODULE_DESCRIPTION("DSA tag driver for Marvell switches using DSA headers");
 MODULE_LICENSE("GPL");
diff --git a/net/dsa/tag_gswip.c b/net/dsa/tag_gswip.c
index 3539141b5350..51a1f46a567f 100644
--- a/net/dsa/tag_gswip.c
+++ b/net/dsa/tag_gswip.c
@@ -107,6 +107,7 @@ static const struct dsa_device_ops gswip_netdev_ops = {
 	.needed_headroom = GSWIP_RX_HEADER_LEN,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for Lantiq / Intel GSWIP switches");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_GSWIP, GSWIP_NAME);
 
diff --git a/net/dsa/tag_hellcreek.c b/net/dsa/tag_hellcreek.c
index 6e233cd0aa38..663b25785d95 100644
--- a/net/dsa/tag_hellcreek.c
+++ b/net/dsa/tag_hellcreek.c
@@ -67,6 +67,7 @@ static const struct dsa_device_ops hellcreek_netdev_ops = {
 	.needed_tailroom = HELLCREEK_TAG_LEN,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for Hirschmann Hellcreek TSN switches");
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_HELLCREEK, HELLCREEK_NAME);
 
diff --git a/net/dsa/tag_ksz.c b/net/dsa/tag_ksz.c
index 9be341fa88f0..ee7b272ab715 100644
--- a/net/dsa/tag_ksz.c
+++ b/net/dsa/tag_ksz.c
@@ -459,4 +459,5 @@ static struct dsa_tag_driver *dsa_tag_driver_array[] = {
 
 module_dsa_tag_drivers(dsa_tag_driver_array);
 
+MODULE_DESCRIPTION("DSA tag driver for Microchip 8795/937x/9477/9893 families of switches");
 MODULE_LICENSE("GPL");
diff --git a/net/dsa/tag_lan9303.c b/net/dsa/tag_lan9303.c
index 1ed8ee24855d..258e5d7dc5ef 100644
--- a/net/dsa/tag_lan9303.c
+++ b/net/dsa/tag_lan9303.c
@@ -119,6 +119,7 @@ static const struct dsa_device_ops lan9303_netdev_ops = {
 	.needed_headroom = LAN9303_TAG_LEN,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for SMSC/Microchip LAN9303 family of switches");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_LAN9303, LAN9303_NAME);
 
diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 2483785f6ab1..b670e3c53e91 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -102,6 +102,7 @@ static const struct dsa_device_ops mtk_netdev_ops = {
 	.needed_headroom = MTK_HDR_LEN,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MTK, MTK_NAME);
 
diff --git a/net/dsa/tag_none.c b/net/dsa/tag_none.c
index 9a473624db50..e9c9670a9c44 100644
--- a/net/dsa/tag_none.c
+++ b/net/dsa/tag_none.c
@@ -27,4 +27,5 @@ static const struct dsa_device_ops none_ops = {
 
 module_dsa_tag_driver(none_ops);
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_NONE, NONE_NAME);
+MODULE_DESCRIPTION("DSA no-op tag driver");
 MODULE_LICENSE("GPL");
diff --git a/net/dsa/tag_ocelot.c b/net/dsa/tag_ocelot.c
index ef2f8fffb2c7..e0e4300bfbd3 100644
--- a/net/dsa/tag_ocelot.c
+++ b/net/dsa/tag_ocelot.c
@@ -217,4 +217,5 @@ static struct dsa_tag_driver *ocelot_tag_driver_array[] = {
 
 module_dsa_tag_drivers(ocelot_tag_driver_array);
 
+MODULE_DESCRIPTION("DSA tag driver for Ocelot family of switches, using NPI port");
 MODULE_LICENSE("GPL v2");
diff --git a/net/dsa/tag_ocelot_8021q.c b/net/dsa/tag_ocelot_8021q.c
index 210039320888..b059381310fe 100644
--- a/net/dsa/tag_ocelot_8021q.c
+++ b/net/dsa/tag_ocelot_8021q.c
@@ -133,6 +133,7 @@ static const struct dsa_device_ops ocelot_8021q_netdev_ops = {
 	.promisc_on_conduit	= true,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for Ocelot family of switches, using VLAN");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_OCELOT_8021Q, OCELOT_8021Q_NAME);
 
diff --git a/net/dsa/tag_qca.c b/net/dsa/tag_qca.c
index 6514aa7993ce..0cf61286b426 100644
--- a/net/dsa/tag_qca.c
+++ b/net/dsa/tag_qca.c
@@ -119,6 +119,7 @@ static const struct dsa_device_ops qca_netdev_ops = {
 	.promisc_on_conduit = true,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for Qualcomm Atheros QCA8K switches");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_QCA, QCA_NAME);
 
diff --git a/net/dsa/tag_rtl4_a.c b/net/dsa/tag_rtl4_a.c
index a019226ec6d2..feaefa0e179b 100644
--- a/net/dsa/tag_rtl4_a.c
+++ b/net/dsa/tag_rtl4_a.c
@@ -121,5 +121,6 @@ static const struct dsa_device_ops rtl4a_netdev_ops = {
 };
 module_dsa_tag_driver(rtl4a_netdev_ops);
 
+MODULE_DESCRIPTION("DSA tag driver for Realtek 4 byte protocol A tags");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RTL4_A, RTL4_A_NAME);
diff --git a/net/dsa/tag_rtl8_4.c b/net/dsa/tag_rtl8_4.c
index 07e857debabf..15c2bae2b429 100644
--- a/net/dsa/tag_rtl8_4.c
+++ b/net/dsa/tag_rtl8_4.c
@@ -258,4 +258,5 @@ static struct dsa_tag_driver *dsa_tag_drivers[] = {
 };
 module_dsa_tag_drivers(dsa_tag_drivers);
 
+MODULE_DESCRIPTION("DSA tag driver for Realtek 8 byte protocol 4 tags");
 MODULE_LICENSE("GPL");
diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 2ce866b45615..69d51221b1e5 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -110,6 +110,7 @@ static const struct dsa_device_ops a5psw_netdev_ops = {
 	.needed_headroom = A5PSW_TAG_LEN,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for Renesas RZ/N1 A5PSW switch");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
 module_dsa_tag_driver(a5psw_netdev_ops);
diff --git a/net/dsa/tag_sja1105.c b/net/dsa/tag_sja1105.c
index 1fffe8c2b589..2717e9d7b612 100644
--- a/net/dsa/tag_sja1105.c
+++ b/net/dsa/tag_sja1105.c
@@ -806,4 +806,5 @@ static struct dsa_tag_driver *sja1105_tag_driver_array[] = {
 
 module_dsa_tag_drivers(sja1105_tag_driver_array);
 
+MODULE_DESCRIPTION("DSA tag driver for NXP SJA1105 switches");
 MODULE_LICENSE("GPL v2");
diff --git a/net/dsa/tag_trailer.c b/net/dsa/tag_trailer.c
index 1ebb25a8b140..22742a53d6f4 100644
--- a/net/dsa/tag_trailer.c
+++ b/net/dsa/tag_trailer.c
@@ -59,6 +59,7 @@ static const struct dsa_device_ops trailer_netdev_ops = {
 	.needed_tailroom = 4,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for switches using a trailer tag");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_TRAILER, TRAILER_NAME);
 
diff --git a/net/dsa/tag_xrs700x.c b/net/dsa/tag_xrs700x.c
index c9c163598ef2..68d4633ddd5e 100644
--- a/net/dsa/tag_xrs700x.c
+++ b/net/dsa/tag_xrs700x.c
@@ -60,6 +60,7 @@ static const struct dsa_device_ops xrs700x_netdev_ops = {
 	.needed_tailroom = 1,
 };
 
+MODULE_DESCRIPTION("DSA tag driver for XRS700x switches");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_XRS700X, XRS700X_NAME);
 
-- 
2.43.0


