Return-Path: <linux-renesas-soc+bounces-24448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E54BBC4C8AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F1B0B4F75A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6F5333444;
	Tue, 11 Nov 2025 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZwHiMwuC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G7y5eT6N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5332F77F;
	Tue, 11 Nov 2025 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851791; cv=none; b=aolRNyOuGNLiLE4EA97pQNj/gIFEg4zHo4yz10NsrJBGE1ULhm5X29EsFEtT25h2xZv4s8iiFmNdhQ+0aGjiN2IbLtnIoX/jUlB0g5KF/lundVfi2ZDae5YQmSLpNd/uyxhH/g1oV6siRSFmdLEKv6vlpO5z+cRwNdTZvpjSNo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851791; c=relaxed/simple;
	bh=xsSkmufno6c7Fd/AZ8EfpuiE+UGXdBH6EGqJ/zQeJYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F1P0hPeRh8eLn0L6MTr72DAaiqdFFNwW8Aee5U56vJikdtxF0SYsuMK/VwKOP5PHfMR8TPEPbZxO38mrDzAxGNOQBksQ47jfCblQCNNyaEK3LB0NQwW3A/DJ/wDDXeY6LTkwMG+yrsAGSGY1mh2HHb5DKuOQDHT4tQJ1ihNx2wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZwHiMwuC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G7y5eT6N; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 5F4B51D00125;
	Tue, 11 Nov 2025 04:03:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 11 Nov 2025 04:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762851783;
	 x=1762938183; bh=GAt1xGnHQdXovEdPKJyaUL0HDIKAPCo6MTWC3cf6abk=; b=
	ZwHiMwuCpZCuFXVJr1GdMWCme4U9iMmJYtuMLZvTHc1Mvmlp85dXzOZJ8nUt7t0T
	DJxsU/DY+ydRhlx3JvnMPTc5gqYXpFR0fo0piN0HD1IDdbqSC8iI0qcvgd7DnEWB
	17CGx/ZqAy7Jx6xRfEaj1WHfONQ330pNpmiUoOFaZuzfU/sOq2ltGKDrr6q1eYoU
	48f65xyaHVAc790ue4VH8NuTVfqGlfchxEuNJQZs//YCW/5AlZ76xwkGC97M5zPW
	W4qmBzNaU4rgs2Y/qup1wklN4xqRWiftXh2NwXPQpa5kFmp4EGBmsyCd6OkBg9uJ
	H/cjca7hrJjOmVt1FUMIdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762851783; x=
	1762938183; bh=GAt1xGnHQdXovEdPKJyaUL0HDIKAPCo6MTWC3cf6abk=; b=G
	7y5eT6N0RB+BY+wCSs0xzAP3VEWMY3Nb+Luj9bg6BzvxbpbF4bRH6nqs0vE719WG
	OTsQX2rdtgFDdsH4xTUptcp9aFfgDwFNkHbi3rpVDnZlNqxDiAof6azjrC5YraNz
	OvdzXahmJxYKVPCFwpa4pGW198QOiAeSNp8ma14eAiQkyABR6fQRh64Omm94TwOB
	3gfpHSIhB1QpJRn/EQR/TD8L9od/+RQdAH2CQS3o3r3+LSAC4+ZoTlXT19qBFh7C
	NNlEDvqLWXqbp5mWtfWsewkIaP5H5cKB/DXTnRf2qPSqQXAqqfRfpW3dj9c9q56e
	+Bbl430z8wisok+02k6Bg==
X-ME-Sender: <xms:xvsSaeUI_E47jKGcgsNYWVVFn0TUF2ZhYDT_KBMoKwOU4hpedj9J5A>
    <xme:xvsSaUrntiyBbuCIcNcEqwRXzpi3nuH_cb4IWLqGksZkObUGcWJNwtF0SuczBok1O
    Wb2T57EkaHmZe8IYy4Co9Aaf0tkvEaKNXCXr8P_WOCg7Z5BGrh4Of8>
X-ME-Received: <xmr:xvsSaSRSvzX_G7-DOJrrRI2MspgFF9Q0jNPCCeF8bKpaCBG1r3c1mnozitREiE58zNFrLZHcsFK63QJUwHRAaug5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddtjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:x_sSaW1M20WcNRhAoWJ3b64YshunGSTKNtNdAvhcMDgw0vqZ5aJTGA>
    <xmx:x_sSaWA2ElOFdT3x86TWKpVxpIT5p-oezxA8tnycgrlFH5Ezw7FSuA>
    <xmx:x_sSaaiEBJGBUjWqV_PKAr2GBtsOL8VlHR0y-NboYVfiFtoi7fZS8g>
    <xmx:x_sSaQP6OfE01e7l5m6TULvfbWQpoJVGTmNEB4ymFXfNduqQwt2ryA>
    <xmx:x_sSaTCVfRL5HJhJGj-TAnP6GXq2NTywemwBU8Hq9vqS47WjnOE9cGwJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:03:02 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 09/12] media: rppx1: Add support for Lens Shade Correction
Date: Tue, 11 Nov 2025 10:02:25 +0100
Message-ID: <20251111090228.2511734-10-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111090228.2511734-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251111090228.2511734-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the RPPX1 driver to allow setting the Lens Shade Correction (LSC)
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and  its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer only describes one quadrant of the lens,
this is due to the RkISP1 hardware only allowing one quadrant to be
programmed to hardware. The hardware then extrapolates this to the other
three quadrants of the lens. For RPP all four quadrants are individually
programmable.

To compensate for the driver need to extrapolate all four quadrants from
the RkISP1 parameters buffer information.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rppx1_lsc.c      | 126 ++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index f7b9e14e2b5b..0519ad77d5c9 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -35,6 +35,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC:
+			module = &rpp->pre1.lsc;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
index e8acdf744956..00bdcc4aedb3 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -54,6 +54,10 @@
 #define LSC_TABLE_SEL_REG	0x00a8
 #define LSC_STATUS_REG		0x00ac
 
+#define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
+#define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
+#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
+
 static int rppx1_lsc_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -63,6 +67,128 @@ static int rppx1_lsc_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_lsc_param_rkisp1(struct rpp_module *mod,
+		       const union rppx1_params_rkisp1_config *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_lsc_config *cfg = &block->lsc;
+	const __u16 *v;
+
+	/* Always disable module as it needs be disabled before configuring. */
+	write(priv, mod->base + LSC_CTRL_REG, 0);
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)
+		return 0;
+
+	/*
+	 * Program the color correction sectors.
+	 *
+	 * There are two tables to one can program and switch between. As the
+	 * RPPX1 supports preparing a buffer of commands to be applied later
+	 * only use table 0. This works as long as the ISP is not used in
+	 * inline-mode.
+	 *
+	 * For inline-mode support using DMA for configuration is not possible
+	 * so this is not an issue, but needs to be address if inline-mode
+	 * support is added to the driver.
+	 */
+
+	/* Start writing at beginning of table 0. */
+	write(priv, mod->base + LSC_R_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_GR_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_B_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_GB_TABLE_ADDR_REG, 0);
+
+	/* Program data tables. */
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
+		const __u16 *r = cfg->config.r_data_tbl[i];
+		const __u16 *gr = cfg->config.gr_data_tbl[i];
+		const __u16 *b = cfg->config.b_data_tbl[i];
+		const __u16 *gb = cfg->config.gb_data_tbl[i];
+		unsigned int j;
+
+		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
+			write(priv, mod->base + LSC_R_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(r[j], r[j + 1]));
+			write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(gr[j], gr[j + 1]));
+			write(priv, mod->base + LSC_B_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(b[j], b[j + 1]));
+			write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(gb[j], gb[j + 1]));
+		}
+
+		write(priv, mod->base + LSC_R_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(r[j], 0));
+		write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(gr[j], 0));
+		write(priv, mod->base + LSC_B_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(b[j], 0));
+		write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(gb[j], 0));
+	}
+
+	/* Activate table 0. */
+	write(priv, mod->base + LSC_TABLE_SEL_REG, 0);
+
+	/*
+	 * Program X- and Y- sizes, and gradients.
+	 *
+	 * The RPP ISP can describe each quarter of the lens individually, this
+	 * differs from the Rk1ISP which can only describe one quarter of lens
+	 * with software and then extrapolates the other three.
+	 *
+	 * To adjust for this extrapolate the three missing quadrants using
+	 * software for the RPP ISP.
+	 */
+
+	v = cfg->config.x_grad_tbl;
+	write(priv, mod->base + LSC_XGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.y_grad_tbl;
+	write(priv, mod->base + LSC_YGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.x_size_tbl;
+	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.y_size_tbl;
+	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	/* Enable module. */
+	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_lsc_ops = {
 	.probe = rppx1_lsc_probe,
+	.param_rkisp1 = rppx1_lsc_param_rkisp1,
 };
-- 
2.51.1


