Return-Path: <linux-renesas-soc+bounces-21582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E121B4943A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 17:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF9187AD540
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 15:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900A2311596;
	Mon,  8 Sep 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gtJOkHY0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aUujdGyA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8623530DEC6;
	Mon,  8 Sep 2025 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346299; cv=none; b=UzvsO3lXAyfnxh5Qyla0t6MAXreLlo7F6x20/SGAn6RbZaP4du7XW2NlXV44RknObs/sRi+lJdvm/Uxe3fSumylb6NxwY95aMc4WhasCFUzCwBjBVUBLaAb88tpTPf1m6TcdfWr9MQlu/tCouNGmH8ykvGS/VSUUiT72UisFUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346299; c=relaxed/simple;
	bh=qJbDGOR3XjxtcnEVBkZH8sANOOuy70eTnZetrh9ITFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=duJ1QjFBCSLBOSyMxOgsVLDKv8BUza9/JPxGATotXtGtD7miU+Re1frfxvhakOa7XxThCY6eWO3hhTO3XbcrXE7o3ZD/ydfDYM7x0XLYKPjFIpb7JALbVbjylL9//BhDcbFf3KCTWjt0mnheU4hSW6g2UHL7aVLZBH3ZFD6yoJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gtJOkHY0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aUujdGyA; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7B0787A0171;
	Mon,  8 Sep 2025 11:44:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 08 Sep 2025 11:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757346296;
	 x=1757432696; bh=h4A9eojqnWiU8JyIjKCkZ5RM2W5RM6QrAUD+xxR29Wg=; b=
	gtJOkHY0qTfhHuM9k1RiGoegwlgWPLJwJuw27gHN+rU6nSkfBkV8cl9U6McyqYH3
	7gH4Fm0vX/WlFkEbewP5reAAvKrnKlXd0GQynS3EPWyO0ATSc5+Frvc8sODMSSVp
	qLi6cCsPJjBBIL8tQ6glkoqmjjbwAZyDxgJq/OGJk1B2ebF1vueK2lDQf0gp2uUQ
	jO2oC+gaCGjdVPMTz5rTL+QL8Q09lxBqRuhsc1lgMTmwnsWfbz+tdaqz9hGgoYnB
	c2F0P7plfeRQmCanfIJvm7GpA9y9Rfod8+TABs88C1Ko6Am+Kpdg/3WQRdcaL35D
	eu/+eqs+2f14QKu0AwTI4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757346296; x=
	1757432696; bh=h4A9eojqnWiU8JyIjKCkZ5RM2W5RM6QrAUD+xxR29Wg=; b=a
	UujdGyAZoumwA6q4GvCzkhkOvVHYyO+Qltg9ioIyy1edynB4fZn7tYArnDcGBX65
	+isExNDMltdeH3ZSWJBIXuw6IhPfmusWiplY31uch91jvstwjxhJTrWl8CZYnJxD
	XgxGzorY2KTz/Js6ciADQ5G3HXiZxsPyViVIZadRncFeLxKA495696dEUVCqabjc
	NhOjBahhiEn7sntMYXnzZZLtVz3XW0ujLD2C8ZzpAtNjtccUiRECj0yFsqJpx+t4
	2rdrQdtz8h38jSdSz7EyCS8h+3nwFPURGewmS8BvD7jSyvBofvaJYUQ8auLt0Th/
	L962TVKU66JYNAndGy0lg==
X-ME-Sender: <xms:9_m-aF4CyR9jFVBMbkZvNdk7DmBmov6LHQ_sX-ACNXLNYf0Y6rHJuA>
    <xme:9_m-aAROfC_gHJwc-80vr_EpHPssZ2ShAofmOBeCYB_pAnYaS4zpsnwRlonf9bZsJ
    QeQwerJb7eF_Q0DFXQ>
X-ME-Received: <xmr:9_m-aDxHtyJTH-cc3dKtryZ6dI3nGiRDpTAULcoz2NmFTOqJoOBKiZvhRhhfGK4QsfO9mu0j8BeI_Kgryje_ymXcWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopeihohhshhhihhhirhhordhshhhimhhouggrrdhuhhes
    rhgvnhgvshgrshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluh
    hnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgt
    phhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusg
    grsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgt
    ohhmpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9_m-aIqlGbkTVX5GS_N1x1PaaMnXHWbp5wuLp8wmcQB61Kf9OSwG_w>
    <xmx:9_m-aG2IT-Q-8DusOm6_oDVAexNh3Gq7LX_4BZzOb6IBIW0ozCowIA>
    <xmx:9_m-aIzGZX6qAsOBUpbUYWZaT6Pf_Gs8DGw9W8BfiEuUOaPX-wVriw>
    <xmx:9_m-aKjXPxWVe3pQRh_TSvNjraAoTx76jelBhF_d3yHjwUsOdL0OEg>
    <xmx:-Pm-aCKjVSed3DTrXqj5PivxrCpIpTGnVdrmvI1QUOrdqr-5WQR1BMr_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Sep 2025 11:44:55 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] net: ethernet: renesas: rcar_gen4_ptp: Hide register layout
Date: Mon,  8 Sep 2025 17:44:25 +0200
Message-ID: <20250908154426.3062861-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the support for multiple register layout removed all support
structures can be removed from the header file. Covert to a simpler
structure using defines for the register offsets.

There is no functional change, only switching from looking up offsets at
runtime to compile time.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 66 ++++++++------------
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 26 --------
 2 files changed, 26 insertions(+), 66 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 05d0ce193e97..cf13eba9b65e 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -12,20 +12,19 @@
 #include <linux/slab.h>
 
 #include "rcar_gen4_ptp.h"
+
+#define PTPTMEC_REG		0x0010
+#define PTPTMDC_REG		0x0014
+#define PTPTIVC0_REG		0x0020
+#define PTPTOVC00_REG		0x0030
+#define PTPTOVC10_REG		0x0034
+#define PTPTOVC20_REG		0x0038
+#define PTPGPTPTM00_REG		0x0050
+#define PTPGPTPTM10_REG		0x0054
+#define PTPGPTPTM20_REG		0x0058
+
 #define ptp_to_priv(ptp)	container_of(ptp, struct rcar_gen4_ptp_private, info)
 
-static const struct rcar_gen4_ptp_reg_offset gen4_offs = {
-	.enable = PTPTMEC,
-	.disable = PTPTMDC,
-	.increment = PTPTIVC0,
-	.config_t0 = PTPTOVC00,
-	.config_t1 = PTPTOVC10,
-	.config_t2 = PTPTOVC20,
-	.monitor_t0 = PTPGPTPTM00,
-	.monitor_t1 = PTPGPTPTM10,
-	.monitor_t2 = PTPGPTPTM20,
-};
-
 static int rcar_gen4_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 {
 	struct rcar_gen4_ptp_private *ptp_priv = ptp_to_priv(ptp);
@@ -38,7 +37,7 @@ static int rcar_gen4_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 	diff = div_s64(addend * scaled_ppm_to_ppb(scaled_ppm), NSEC_PER_SEC);
 	addend = neg_adj ? addend - diff : addend + diff;
 
-	iowrite32(addend, ptp_priv->addr + ptp_priv->offs->increment);
+	iowrite32(addend, ptp_priv->addr + PTPTIVC0_REG);
 
 	return 0;
 }
@@ -49,9 +48,9 @@ static void _rcar_gen4_ptp_gettime(struct ptp_clock_info *ptp,
 {
 	struct rcar_gen4_ptp_private *ptp_priv = ptp_to_priv(ptp);
 
-	ts->tv_nsec = ioread32(ptp_priv->addr + ptp_priv->offs->monitor_t0);
-	ts->tv_sec = ioread32(ptp_priv->addr + ptp_priv->offs->monitor_t1) |
-		     ((s64)ioread32(ptp_priv->addr + ptp_priv->offs->monitor_t2) << 32);
+	ts->tv_nsec = ioread32(ptp_priv->addr + PTPGPTPTM00_REG);
+	ts->tv_sec = ioread32(ptp_priv->addr + PTPGPTPTM10_REG) |
+		     ((s64)ioread32(ptp_priv->addr + PTPGPTPTM20_REG) << 32);
 }
 
 static int rcar_gen4_ptp_gettime(struct ptp_clock_info *ptp,
@@ -73,14 +72,14 @@ static void _rcar_gen4_ptp_settime(struct ptp_clock_info *ptp,
 {
 	struct rcar_gen4_ptp_private *ptp_priv = ptp_to_priv(ptp);
 
-	iowrite32(1, ptp_priv->addr + ptp_priv->offs->disable);
-	iowrite32(0, ptp_priv->addr + ptp_priv->offs->config_t2);
-	iowrite32(0, ptp_priv->addr + ptp_priv->offs->config_t1);
-	iowrite32(0, ptp_priv->addr + ptp_priv->offs->config_t0);
-	iowrite32(1, ptp_priv->addr + ptp_priv->offs->enable);
-	iowrite32(ts->tv_sec >> 32, ptp_priv->addr + ptp_priv->offs->config_t2);
-	iowrite32(ts->tv_sec, ptp_priv->addr + ptp_priv->offs->config_t1);
-	iowrite32(ts->tv_nsec, ptp_priv->addr + ptp_priv->offs->config_t0);
+	iowrite32(1, ptp_priv->addr + PTPTMDC_REG);
+	iowrite32(0, ptp_priv->addr + PTPTOVC20_REG);
+	iowrite32(0, ptp_priv->addr + PTPTOVC10_REG);
+	iowrite32(0, ptp_priv->addr + PTPTOVC00_REG);
+	iowrite32(1, ptp_priv->addr + PTPTMEC_REG);
+	iowrite32(ts->tv_sec >> 32, ptp_priv->addr + PTPTOVC20_REG);
+	iowrite32(ts->tv_sec, ptp_priv->addr + PTPTOVC10_REG);
+	iowrite32(ts->tv_nsec, ptp_priv->addr + PTPTOVC00_REG);
 }
 
 static int rcar_gen4_ptp_settime(struct ptp_clock_info *ptp,
@@ -130,13 +129,6 @@ static struct ptp_clock_info rcar_gen4_ptp_info = {
 	.enable = rcar_gen4_ptp_enable,
 };
 
-static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv)
-{
-	ptp_priv->offs = &gen4_offs;
-
-	return 0;
-}
-
 static s64 rcar_gen4_ptp_rate_to_increment(u32 rate)
 {
 	/* Timer increment in ns.
@@ -149,24 +141,18 @@ static s64 rcar_gen4_ptp_rate_to_increment(u32 rate)
 
 int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv, u32 rate)
 {
-	int ret;
-
 	if (ptp_priv->initialized)
 		return 0;
 
 	spin_lock_init(&ptp_priv->lock);
 
-	ret = rcar_gen4_ptp_set_offs(ptp_priv);
-	if (ret)
-		return ret;
-
 	ptp_priv->default_addend = rcar_gen4_ptp_rate_to_increment(rate);
-	iowrite32(ptp_priv->default_addend, ptp_priv->addr + ptp_priv->offs->increment);
+	iowrite32(ptp_priv->default_addend, ptp_priv->addr + PTPTIVC0_REG);
 	ptp_priv->clock = ptp_clock_register(&ptp_priv->info, NULL);
 	if (IS_ERR(ptp_priv->clock))
 		return PTR_ERR(ptp_priv->clock);
 
-	iowrite32(0x01, ptp_priv->addr + ptp_priv->offs->enable);
+	iowrite32(0x01, ptp_priv->addr + PTPTMEC_REG);
 	ptp_priv->initialized = true;
 
 	return 0;
@@ -175,7 +161,7 @@ EXPORT_SYMBOL_GPL(rcar_gen4_ptp_register);
 
 int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv)
 {
-	iowrite32(1, ptp_priv->addr + ptp_priv->offs->disable);
+	iowrite32(1, ptp_priv->addr + PTPTMDC_REG);
 
 	return ptp_clock_unregister(ptp_priv->clock);
 }
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 3343216526fe..f77e79e47357 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -19,37 +19,11 @@
 
 #define RCAR_GEN4_TXTSTAMP_ENABLED		BIT(0)
 
-#define PTPRO				0
-
-enum rcar_gen4_ptp_reg {
-	PTPTMEC		= PTPRO + 0x0010,
-	PTPTMDC		= PTPRO + 0x0014,
-	PTPTIVC0	= PTPRO + 0x0020,
-	PTPTOVC00	= PTPRO + 0x0030,
-	PTPTOVC10	= PTPRO + 0x0034,
-	PTPTOVC20	= PTPRO + 0x0038,
-	PTPGPTPTM00	= PTPRO + 0x0050,
-	PTPGPTPTM10	= PTPRO + 0x0054,
-	PTPGPTPTM20	= PTPRO + 0x0058,
-};
-
-struct rcar_gen4_ptp_reg_offset {
-	u16 enable;
-	u16 disable;
-	u16 increment;
-	u16 config_t0;
-	u16 config_t1;
-	u16 config_t2;
-	u16 monitor_t0;
-	u16 monitor_t1;
-	u16 monitor_t2;
-};
 
 struct rcar_gen4_ptp_private {
 	void __iomem *addr;
 	struct ptp_clock *clock;
 	struct ptp_clock_info info;
-	const struct rcar_gen4_ptp_reg_offset *offs;
 	spinlock_t lock;	/* For multiple registers access */
 	u32 tstamp_tx_ctrl;
 	u32 tstamp_rx_ctrl;
-- 
2.51.0


