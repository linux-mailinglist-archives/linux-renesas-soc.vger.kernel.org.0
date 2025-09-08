Return-Path: <linux-renesas-soc+bounces-21581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A8B49433
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 17:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AE903B80EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 15:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6B23115A3;
	Mon,  8 Sep 2025 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fe633TAO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J+0O/sGC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE2E311595;
	Mon,  8 Sep 2025 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346296; cv=none; b=hAWBshEwnI5gqL4Tg9TM9qQq2ESFQ+YtCfV7qqOr6r8NIIkxUqT8qYjruUgpKM+N6ST4gYXrnvxL+5McHYhldhPry7IH5Ofzop4pI+lFbfi65RXBSimmtTblRWWGk/EhBJH/GqfAYsczIiYcP65AqTB7dNX6dHR1+/I++byiryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346296; c=relaxed/simple;
	bh=jOlTBtmfzKbyHUfNSllNI/VF3q9Tj1s9LVUvqxWL7/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oe8NlDfTzAQWRLk5zmBpYhGoVViu8nfO70enqHnXsfT6H1XsloJ4egtPkJ7h38vm675TXIaNahUvMSpH46LgSH+SwVnEtSQXs1RFaBdY0PtK7kOid15crJhkbBTBvt7D5J8kYpOLvNZxt/seNMmATRFpFx605FrVq+8zYXbIujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fe633TAO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J+0O/sGC; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C38AA7A0170;
	Mon,  8 Sep 2025 11:44:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 08 Sep 2025 11:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757346293;
	 x=1757432693; bh=IHfaIgeSupgRJx253nE/poCucMilaHxDJ3+g+9NV0zo=; b=
	fe633TAOyXy+Fj8sm8M9Dhs4Mzyxxm+UvO4ZLiOcsypq7+ZsH3zZbjyNt94hT2HT
	XTOckL2DiEJATe7KCF3GpiCVLV3V/o1gXWpR/WHCYdk1a3+EfI0B4l8q+Hf1ibyX
	rxJU67P6+eERjf0ZYSG1uMEzT5RYai1ptfIHZz6OxX3JQrMItmnVh4tT3W1aI08s
	LpeGJc9+VJ38TnZ6u7lV7CoBo2ohi1adfBl4xfBmnArRYgk98pP8QIv4XabJTJkj
	6q3HsPr3b6/zeTiNOTkaNcmtWIwvPYmcMtx+/Zfs6xNOA5GBY8dfqKHdS7OYrE+u
	G7Yzt9ttW/3h7rvfe7mF+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757346293; x=
	1757432693; bh=IHfaIgeSupgRJx253nE/poCucMilaHxDJ3+g+9NV0zo=; b=J
	+0O/sGCcqXLGvqcRYwqoE04Oa0SYcFArHTgftvuluvFvoNXCnMcNSJPy4DQIW25L
	I9tnZ/tzssj1vaAIjAnPflg07o36LqpGxrIQL6iUbwTkV+diNtTJcRZRMMnj10kH
	RqdGEYS44YMLLcutlCD/OVZ41TjNp5VWLJ0TJ7oCmBGtmxYAn5Wnw/xWSf42kxTg
	wjntkQqve37BEE1PmJIVi6mHd6jwasuFo0oNYmqHw8hN+Piskn2/Xi3QqtVDMjYO
	yNWSAb9yZLI4rGXGq8503+pV0Jdon1fbO9utIW8m+3GlTDaH1e9chynSKILZVHsg
	bKmQAtsdZELr3h8xugeAA==
X-ME-Sender: <xms:9fm-aKGMtJAXePzlM1rx_HjzPtoryw2Ke2TyHS0JxZKWyR12nSog1g>
    <xme:9fm-aItewnEUFn1D5uXu9_PDaVZL-X5DKVeiVUIbTfRU5nUnSO05xvGmH5wUtLOjg
    XSPTs3Xv338EHX0jVU>
X-ME-Received: <xmr:9fm-aLea2ZsLvdEa0-9MjE3QI5oHOFLnsM_QzZgv_lnuoaQZdh5yYk0YuSGwQj7Vs5T9S6GinEcAqD2qlhzCDDhJdg>
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
X-ME-Proxy: <xmx:9fm-aOmyG8OPtKEkLQZK-9ilrWWn5YOjsmPNv9d46B70nM8Jwo_4JA>
    <xmx:9fm-aOCTxrT-X1H0Z_1gp5OkYKd6O1twze3HO1y7kvNtZsWVHyh_wA>
    <xmx:9fm-aIP4Yn2lsdhATN7YA_aLdP0ZPtQ59yWekLoS16nvoJkE67176w>
    <xmx:9fm-aNMHpmNT7yfXvAxFz9uKDDceDLGcvzdJgOSmytXoL6MKMvauog>
    <xmx:9fm-aIV3zLEonkSFWH0x4cypaXa4rMDXc18F-BuLEPwt1L7dFsrh_CJn>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Sep 2025 11:44:52 -0400 (EDT)
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
Subject: [PATCH 1/3] net: ethernet: renesas: rcar_gen4_ptp: Remove different memory layout
Date: Mon,  8 Sep 2025 17:44:24 +0200
Message-ID: <20250908154426.3062861-2-niklas.soderlund+renesas@ragnatech.se>
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

When upstreaming the Gen4 PTP support for R-Car S4 the possibility for
different memory layouts on other Gen4 SoCs was build in. It turns out
this is not needed and instead needlessly makes the driver harder to
read, remove the support code that would have allowed different memory
layouts.

This change only deals with the public functions used by other drivers,
follow up work will clean up the rcar_gen4_ptp internals.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 11 +++--------
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h |  7 +------
 drivers/net/ethernet/renesas/rswitch_main.c  |  3 +--
 drivers/net/ethernet/renesas/rtsn.c          |  3 +--
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 4c3e8cc5046f..05d0ce193e97 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -130,12 +130,8 @@ static struct ptp_clock_info rcar_gen4_ptp_info = {
 	.enable = rcar_gen4_ptp_enable,
 };
 
-static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
-				  enum rcar_gen4_ptp_reg_layout layout)
+static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv)
 {
-	if (layout != RCAR_GEN4_PTP_REG_LAYOUT)
-		return -EINVAL;
-
 	ptp_priv->offs = &gen4_offs;
 
 	return 0;
@@ -151,8 +147,7 @@ static s64 rcar_gen4_ptp_rate_to_increment(u32 rate)
 	return div_s64(1000000000LL << 27, rate);
 }
 
-int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
-			   enum rcar_gen4_ptp_reg_layout layout, u32 rate)
+int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv, u32 rate)
 {
 	int ret;
 
@@ -161,7 +156,7 @@ int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
 
 	spin_lock_init(&ptp_priv->lock);
 
-	ret = rcar_gen4_ptp_set_offs(ptp_priv, layout);
+	ret = rcar_gen4_ptp_set_offs(ptp_priv);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index e22da5acd53d..3343216526fe 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -11,10 +11,6 @@
 
 #define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
 
-enum rcar_gen4_ptp_reg_layout {
-	RCAR_GEN4_PTP_REG_LAYOUT
-};
-
 /* driver's definitions */
 #define RCAR_GEN4_RXTSTAMP_ENABLED		BIT(0)
 #define RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT	BIT(1)
@@ -61,8 +57,7 @@ struct rcar_gen4_ptp_private {
 	bool initialized;
 };
 
-int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv,
-			   enum rcar_gen4_ptp_reg_layout layout, u32 rate);
+int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv, u32 rate);
 int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv);
 struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev);
 
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 59dceb81607c..ff5f966c98a9 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2090,8 +2090,7 @@ static int rswitch_init(struct rswitch_private *priv)
 	if (err < 0)
 		goto err_fwd_init;
 
-	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
-				     clk_get_rate(priv->clk));
+	err = rcar_gen4_ptp_register(priv->ptp_priv, clk_get_rate(priv->clk));
 	if (err < 0)
 		goto err_ptp_register;
 
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 05c4b6c8c9c3..15a043e85431 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1330,8 +1330,7 @@ static int rtsn_probe(struct platform_device *pdev)
 
 	device_set_wakeup_capable(&pdev->dev, 1);
 
-	ret = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
-				     clk_get_rate(priv->clk));
+	ret = rcar_gen4_ptp_register(priv->ptp_priv, clk_get_rate(priv->clk));
 	if (ret)
 		goto error_pm;
 
-- 
2.51.0


