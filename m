Return-Path: <linux-renesas-soc+bounces-24439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E4C4C838
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84581884E48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB392EDD51;
	Tue, 11 Nov 2025 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FqS6b7W8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="njUk+sTr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6932C2E975F;
	Tue, 11 Nov 2025 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851773; cv=none; b=hE0qD9mVSrxikU/P7/oLjxKiKSOuh3anvlLhIHjR1Xj8H3XK8k4Y5pSW8iwoXhgssKCJwTY9lNu6j8/Oiqo35edEpw38GFF7rA4OqY5iDTTVq+BS5H5wudcZ4XbJQKeWjNRGIlzUsTzIP9NJyzGZZGtB5ZjssenWEfq9zHjzBho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851773; c=relaxed/simple;
	bh=NnqOwYK4euxZQ45EmSgdPs+zN36Va8jqp7BhKdDkSxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ow0sQxdVd0q42WSigs33OIh0n9dDoI84Ncs5QG3+11gT0HthnYkGGBFpnpvptvRrxqfbnJIFZm8/LfBIvmx7lYT+J3Gl7kNmHVVaxWdgih/vveBykK2TfoDDUDx0Cv2DMPXNZpOH099a5dXsIc0KdSeFgy+Ei5I9TT0YkDvtRH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FqS6b7W8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=njUk+sTr; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A28BE7A014C;
	Tue, 11 Nov 2025 04:02:48 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 11 Nov 2025 04:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762851768;
	 x=1762938168; bh=noF4ZYqR3MMxXLww1luSVwY6fXHAIcHe/YhuFLntuyU=; b=
	FqS6b7W8RM0BWdvyrW394FBDdYKbYYcaZW5kLTRcvaxgq58X0uj6mCPJuPkoHQRS
	1URsueXS2o46JmJZqDBB/YQgTrd5RscsM1sUyaTY2R+cKpQdvsuF8eaVVCAOZaLW
	4MMn7zfMWFzg1vR/OuEQtpCRKJBhWQ+WZYi/nw3Utu4AKdaJ85MNLX+tN/BJZoNt
	+oE5/JbesDRGZkv7VdVdQrhh0NkW1ZBY2B3G9gBe31N14tHIj07zjt/ZtGwfUtrS
	DKiptPGFWlVTpszI1pHIlVI3vINj50ndICvc8+kTaD50qTroBfKoI2jscRKsTUIy
	gLsalvjf5U4eRC5YZonAOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762851768; x=
	1762938168; bh=noF4ZYqR3MMxXLww1luSVwY6fXHAIcHe/YhuFLntuyU=; b=n
	jUk+sTrrmdHx3+/VCZqDXbOeUhlHMDszOjV2vmdcsldJO5TALb03DkYDv95iaw5F
	q35Rx5Sn0FsFXAFaI7OnV1i9bvuPbIOzLC828KbFwapY3hvvv71ao3jjWngdO2HC
	3Db79dCRs3aSkDnYbd3+RbC94ZfqGEI0GJGIShKpZgr/QSaDktapXXYPd7fYZng4
	t4hEgvPLeS31f9H3nOXZPF0fcsVPlVCFmxgiRrTk25TnJZ2SlY9bq6sHyyneqOTP
	XN0UXF8el5WzdIBusa7DGr+IE0bOSXl/Y+Sa0QajQqJcT2wD8/vu4Y/Srm8YMDND
	yqA34K+rnOs8RWkQdK+EA==
X-ME-Sender: <xms:uPsSaZK0hl7zZ3odffNexo4VNfadQPuQCavFJlJCmPGnh1GmqeO2-g>
    <xme:uPsSafNte6r21V0_taySx-iVp2DwlFGVE-hbukeu84FkSsu_iGInX-JweaVzeBVzl
    eB6Wj2MO-wQTt7s8dOLMTp_h_q6uNosfi0LGEFruLDdo0wjbG3zJfQ>
X-ME-Received: <xmr:uPsSaRl-NAWrwrWlOgALT4Vsvwn4dW50Vk4k1feOUoA1Ugjunju4J0L82QWjggrGWhqAKN66j5gBi_fk_3HxqFyR>
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
X-ME-Proxy: <xmx:uPsSab4hGdxGgk-GfRZ3E6ccpxt4jl6a_qX8Q0A5jeHOv80c5uxncw>
    <xmx:uPsSad3PuL2dQu7bhtmFN_ymTZliXsWq6gHM8UV_qbZmcpScnVPSdQ>
    <xmx:uPsSaeEsFo2iASS-ZUMxxppRHwOuVysvQigQvFWxHsy0vlnl_QwF3Q>
    <xmx:uPsSaUjQbaRxNoj1raCXjkHxf8wCsm9jaMFHdKFQ0WDTktxcnE8EIA>
    <xmx:uPsSaUk0e1kd4oreKHOFbDO5SN6ua2MeOJ_T2d7jFGckGdWdxRgq3Kid>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:02:47 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 03/12] media: rppx1: Add support for AWB measurement parameters and statistics
Date: Tue, 11 Nov 2025 10:02:19 +0100
Message-ID: <20251111090228.2511734-4-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to parse parameter blocks configuring for the
auto white balance measurement window and parameters. As well as
producing the measurements as part of a statistics buffer.

This is the first ISP algorithm added to the RPPX1 driver and exercises
both the parameter and statistics API provided by the base driver. It
shows how the RkISP1 parameter and statistics buffer data can be scaled
and adopted to fit the RPPX1 hardware.

It also uses the parameter writing interface which allows the framework
user to specify how (and when) the configuration are applied to the
RPPX1.

As the RkISP1 parameters and statics buffers have lower precision then
the RPPX1 hardware the values needs to be scaled.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   4 +
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 127 ++++++++++++++++++
 3 files changed, 134 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a17a6ce82928..6e49f0e90c41 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -26,6 +26,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
+			module = &rpp->post.wbmeas;
+			break;
 		default:
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index a5daa28e09cf..a6abb85f0df1 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -11,5 +11,9 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 	struct rkisp1_stat_buffer *stats = buf;
 
 	stats->meas_type = 0;
+
+	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS)
+		if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))
+			stats->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
index 3d197d914d07..126972cfd57a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
@@ -56,6 +56,133 @@ static int rppx1_wbmeas_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_wbmeas_param_rkisp1(struct rpp_module *mod,
+			  const union rppx1_params_rkisp1_config *block,
+			  rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_awb_meas_config *cfg = &block->awbm;
+	/*
+	 * The RkISP params are 8-bit while the RPP can be 8, 20 or 24 bit.
+	 * Figure out how much we need to adjust the input parameters.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 8;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_MEAS_PROP_REG, 0);
+		return 0;
+	}
+
+	/* Program measurement window. */
+	write(priv, mod->base + AWB_MEAS_H_OFFS_REG,
+	      cfg->config.awb_wnd.h_offs);
+	write(priv, mod->base + AWB_MEAS_V_OFFS_REG,
+	      cfg->config.awb_wnd.v_offs);
+	write(priv, mod->base + AWB_MEAS_H_SIZE_REG,
+	      cfg->config.awb_wnd.h_size);
+	write(priv, mod->base + AWB_MEAS_V_SIZE_REG,
+	      cfg->config.awb_wnd.v_size);
+
+	/* Set number of frames to sample. */
+	write(priv, mod->base + AWB_MEAS_FRAMES_REG, cfg->config.frames);
+
+	if (cfg->config.awb_mode == RKISP1_CIF_ISP_AWB_MODE_YCBCR) {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->config.awb_ref_cb << shift);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->config.awb_ref_cr << shift);
+		write(priv, mod->base + AWB_MEAS_MAX_Y_REG,
+		      cfg->config.max_y << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->config.min_y << shift);
+		write(priv, mod->base + AWB_MEAS_MAX_CSUM_REG,
+		      cfg->config.max_csum << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_C_REG,
+		      cfg->config.min_c << shift);
+
+		/*
+		 * Match RkISP1 conversion, documented as
+		 *  Y = 16 + 0.2500 R + 0.5000 G + 0.1094 B
+		 *  Cb = 128 - 0.1406 R - 0.2969 G + 0.4375 B
+		 *  Cr = 128 + 0.4375 R - 0.3750 G - 0.0625 B
+		 *
+		 * Note map Y to G. Matrix is GBR, not RGB documented for RPPX1.
+		 */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x0800);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x01c0);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0400);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0xfb40);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x0700);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0xfdc0);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0xfa00);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0xff00);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x0700);
+
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00100000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00800000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00800000);
+
+		write(priv, mod->base + AWB_MEAS_PROP_REG,
+		      cfg->config.enable_ymax_cmp ? AWB_MEAS_PROP_YMAX : 0 |
+		      AWB_MEAS_PROP_AWB_MODE_ON);
+	} else {
+		/* The RkISP params are oddly named, but do map to RGB. */
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->config.awb_ref_cb << shift);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->config.awb_ref_cr << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->config.min_y << shift);
+
+		/* Values from datasheet to map G to Y, B to Cb and R to Cr. */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x1000);
+
+		/* Values from datasheet. */
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00000000);
+
+		write(priv, mod->base + AWB_MEAS_PROP_REG,
+		      AWB_MEAS_PROP_MEAS_MODE_RGB |
+		      AWB_MEAS_PROP_AWB_MODE_ON);
+	}
+
+	return 0;
+}
+
+static int rppx1_wbmeas_stats_rkisp1(struct rpp_module *mod,
+				     struct rkisp1_cif_isp_stat *stats)
+{
+	struct rkisp1_cif_isp_awb_meas *meas = &stats->awb.awb_mean[0];
+	/*
+	 * The RkISP YCbCr/RGB mean stats are 8-bit while the RPP can be 8, 20
+	 * or 24 bit. Figure out how much we need to adjust the output
+	 * statistics.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 8;
+
+	meas->cnt = rpp_module_read(mod, AWB_MEAS_WHITE_CNT_REG);
+	meas->mean_y_or_g =
+		rpp_module_read(mod, AWB_MEAS_MEAN_Y_G_REG) >> shift;
+	meas->mean_cb_or_b =
+		rpp_module_read(mod, AWB_MEAS_MEAN_CB_B_REG) >> shift;
+	meas->mean_cr_or_r =
+		rpp_module_read(mod, AWB_MEAS_MEAN_CR_R_REG) >> shift;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_wbmeas_ops = {
 	.probe = rppx1_wbmeas_probe,
+	.param_rkisp1 = rppx1_wbmeas_param_rkisp1,
+	.stats_rkisp1 = rppx1_wbmeas_stats_rkisp1
 };
-- 
2.51.1


