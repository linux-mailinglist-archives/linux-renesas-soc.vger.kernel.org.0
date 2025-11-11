Return-Path: <linux-renesas-soc+bounces-24450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EFFC4C886
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADCC03BB1E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5EA335552;
	Tue, 11 Nov 2025 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QC5ZUPvF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iAbI42BY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5002F0C46;
	Tue, 11 Nov 2025 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851796; cv=none; b=WEmarOHWvvTINSrnrvjS4lDtbY0zwYBkefvrvekpZLYHudp6WcaecHsoPFb68aK0LiiMV6jRKH8ipyXcvTzf19Nhh5AVbNUQQHZUH/e3kgOxwhY59utCy4g3E1p5VxPJL2w4as3M2i2xG7x1c/vQAHMSGnnCNtkJzKdfJPsEA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851796; c=relaxed/simple;
	bh=GxVXdmJn19/QIET0qnspwC0MhYBnPeKD+LQU8nWccuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gr3QpYifYgwBEN5uA5qAN8oxJnrmymibHMMRsc6x2g3L5LWq28oQB6OcZlvmJXUpAEqFROYhDDKrF4TNiP1Ma14oBo+nt9YxVn4Ia+3syx1k9JIk5fWe3cKDQoCHOzE4Q9JozSKv3Znx0ZnrZsCvfCmVpR6/7/gQLVKyrZ61chc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QC5ZUPvF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iAbI42BY; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5EF927A0113;
	Tue, 11 Nov 2025 04:03:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 11 Nov 2025 04:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762851790;
	 x=1762938190; bh=fvaDUv6tk7ky9WWjkSsdhnC/L7Tj5FUfpR3qOZDKYx0=; b=
	QC5ZUPvFu3d1f3aEkx3JFtsqFqNLyTXp6i2Hov36rdvMxxdn8v4ZRobVxiO5Ef7n
	fUFTd+Ci9BR/Z9OgAkuTMQ07az446cuL0Hbd4P3iGQRGJbbmmA6L7QNIFm0LrU7F
	/0aJmsYUWEui6pl0kCk+7PlyoQC/MGPM/7PjBBlVkpsqi4y7/2RZZvIypp08zBn4
	yPiUUSu1j2gH2G7qtVFZH4q7v1R194DRE9oHN7IwJjsBCG6at5P/C5T9+vEegOXU
	MAPWlRUyF67v+OWhcb8eE02BGYTeybiS5y64ExzHOaU5I7iJTHHu5ua9TUK9oehY
	Yn/YCx65S0YK5+o6/5XPTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762851790; x=
	1762938190; bh=fvaDUv6tk7ky9WWjkSsdhnC/L7Tj5FUfpR3qOZDKYx0=; b=i
	AbI42BY1FxW/Hc1n+6ONa+hyoiNc/3yYYt9U6KdoLBmGta8tqSeLmqcToBq8n600
	Uz4rWdw2RHiNoziZ8p7vDUHA9s5iKccR2gMO3bFW2BVDetcSFspN6L5JDUqQpbxC
	hnfDCBBzso6ZAjSNxQJEU/EC+oFCt+GA/UrZ5/ngYln2pAj6Xv7HjPVhHzaQHENF
	FiFO4ZHjYJxPh3rJcLAKSoCO01Cyl1uuDp03wIs8AGXZ4qN/QbdGceulBJRWpQ4I
	DXD692K7GJWSsVeDeaeTCgOnpsWLqDcvAHD6YFaoSxwu/LB0mXYig/qqgaqIG3VY
	zTe2JiYQ9qhOI2IT7xG2w==
X-ME-Sender: <xms:zfsSaeBemPCNbcQwRtMBRGz75hsahvkD2UkOliGHXX2zTAzkf1WUzA>
    <xme:zfsSaSkF6168U019QanPTmka7OUDUdg8o7517vitPG7uHfHFBhxabBk8EvBBHhac-
    NcXZUW1m2amf_7g1if3B_qKnhE6yoOu-EwB7eueobLaaRiG3id0>
X-ME-Received: <xmr:zfsSaRdkWlQZWURjWmgmGVEKlR5tQltpqDypj3prnyeeRBkuVxmai1Z3mzidYduu9TSsI1G_DHyEla8ZOvEDcZzD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddtjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefhueelvdfhvdff
    hedtieektdegjeegtefgffduffeludevteduheekvddvleefvdenucffohhmrghinhepgh
    gpfhhlthdrghgspdhgpghflhhtrdhgrhdpghgrihhnrdhnfhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluh
    hnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhr
    tghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrug
    drtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnug
    dorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:zfsSaeRCBubbYCdJdsUfpg3AZc4IZeTgwcl5kKAXURwpdNhUrxtfVA>
    <xmx:zfsSaQsRgIZZAtm94HhOhhFiTIi8hBfSfEbHv9BZqtqrWN0zSQDMAQ>
    <xmx:zfsSaXdB5Ahq04efbF4NWGqk0QLEhsZ4dQTR1xMdVA3tQdFrbXyR9Q>
    <xmx:zfsSaSZY849Q4WtT_hu-JoLq2zX4sDJNq9-o9wBq2dGFP5kA-fJMeg>
    <xmx:zvsSaR8qEr5vpTGtWlFQD_p2Pi0fbrIJqlE-XAMq18ho4bgEYl5kvQj9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:03:09 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 12/12] media: rppx1: Add support for Bilateral Denoising
Date: Tue, 11 Nov 2025 10:02:28 +0100
Message-ID: <20251111090228.2511734-13-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Bilateral Denoising
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

The parameter bit-sizes matches RkISP1 so there is no need to convert
between the two. Some bit flags are inverted however and RPP have
different registers for each color components coefficients where RkISP1
have one for covering all.

The biggest difference is that RPP have dropped the hardware bit
AWB_GAIN_COMP. Luckily it's behavior is easy to emulate in software.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../media/platform/dreamchip/rppx1/rppx1_bd.c | 158 ++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index ddabb84e8df4..835b3e1d126a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -43,6 +43,11 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC:
 			module = &rpp->hv.ga;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF:
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH:
+			/* Both types handled by the same block. */
+			module = &rpp->pre1.bd;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
index acbfbcd59591..3bb717d87ec5 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
@@ -47,6 +47,164 @@ static int rppx1_bd_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_bd_param_rkisp1_main(struct rpp_module *mod,
+			   const union rppx1_params_rkisp1_config *block,
+			   rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_dpf_config *cfg = &block->dpf;
+	unsigned int isp_dpf_mode, spatial_coeff;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DPF_MODE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RkISP1 have an extra hardware flag AWB_GAIN_COMP which was removed
+	 * in RPP DB module version 4 and later. If the bit is set the
+	 * programmed gains will be processed, if it's not set a default value
+	 * of 1 (0x100) will be used. From the RPP documentation for DB version
+	 * 4 changelog.
+	 *
+	 *   Removed RPP_DPF_MODE::awb_gain_comp. Always use programmed
+	 *   nf-gains for gain compensation.
+	 *
+	 * We can emulate this behavior if we keep track of when the RkISP1 do
+	 * set the flag.
+	 */
+	bool awb_gain_comp = false;
+
+	switch (cfg->config.gain.mode) {
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_NF_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_USE_NF_GAIN;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_LSC_GAINS:
+		isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_NF_LSC_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_USE_NF_GAIN | DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_AWB_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = 0;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_AWB_LSC_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RKISP1_CIF_ISP_DPF_GAIN_USAGE_DISABLED:
+	default:
+		isp_dpf_mode = 0;
+		break;
+	}
+
+	/* NOTE: Hardware bit for scale_mode is inverted compared to RkISP1. */
+	if (cfg->config.nll.scale_mode == RKISP1_CIF_ISP_NLL_SCALE_LINEAR)
+		isp_dpf_mode |= DPF_MODE_NLL_SEGMENTATION;
+	if (cfg->config.rb_flt.fltsize == RKISP1_CIF_ISP_DPF_RB_FILTERSIZE_9x9)
+		isp_dpf_mode |= DPF_MODE_RB_FILTER_SIZE;
+	if (!cfg->config.rb_flt.r_enable)
+		isp_dpf_mode |= DPF_MODE_R_FILTER_OFF;
+	if (!cfg->config.rb_flt.b_enable)
+		isp_dpf_mode |= DPF_MODE_B_FILTER_OFF;
+	if (!cfg->config.g_flt.gb_enable)
+		isp_dpf_mode |= DPF_MODE_GB_FILTER_OFF;
+	if (!cfg->config.g_flt.gr_enable)
+		isp_dpf_mode |= DPF_MODE_GR_FILTER_OFF;
+
+	isp_dpf_mode |= DPF_MODE_DPF_ENABLE;
+
+	if (awb_gain_comp) {
+		write(priv, mod->base + DPF_NF_GAIN_B_REG, cfg->config.gain.nf_b_gain);
+		write(priv, mod->base + DPF_NF_GAIN_R_REG, cfg->config.gain.nf_r_gain);
+		write(priv, mod->base + DPF_NF_GAIN_GB_REG, cfg->config.gain.nf_gb_gain);
+		write(priv, mod->base + DPF_NF_GAIN_GR_REG, cfg->config.gain.nf_gr_gain);
+	} else {
+		write(priv, mod->base + DPF_NF_GAIN_B_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_R_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_GB_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_GR_REG, 0x100);
+	}
+
+	/* The RkISP1 hardware have a single register for all components. */
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS; i++) {
+		write(priv, mod->base + DPF_NLL_G_COEFF_REG(i), cfg->config.nll.coeff[i]);
+		write(priv, mod->base + DPF_NLL_RB_COEFF_REG(i), cfg->config.nll.coeff[i]);
+	}
+
+	spatial_coeff = cfg->config.g_flt.spatial_coeff[0] |
+			(cfg->config.g_flt.spatial_coeff[1] << 8) |
+			(cfg->config.g_flt.spatial_coeff[2] << 16) |
+			(cfg->config.g_flt.spatial_coeff[3] << 24);
+	write(priv, mod->base + DPF_S_WEIGHT_G_1_4_REG, spatial_coeff);
+
+	spatial_coeff = cfg->config.g_flt.spatial_coeff[4] |
+			(cfg->config.g_flt.spatial_coeff[5] << 8);
+	write(priv, mod->base + DPF_S_WEIGHT_G_5_6_REG, spatial_coeff);
+
+	spatial_coeff = cfg->config.rb_flt.spatial_coeff[0] |
+			(cfg->config.rb_flt.spatial_coeff[1] << 8) |
+			(cfg->config.rb_flt.spatial_coeff[2] << 16) |
+			(cfg->config.rb_flt.spatial_coeff[3] << 24);
+	write(priv, mod->base + DPF_S_WEIGHT_RB_1_4_REG, spatial_coeff);
+
+	spatial_coeff = cfg->config.rb_flt.spatial_coeff[4] |
+			(cfg->config.rb_flt.spatial_coeff[5] << 8);
+	write(priv, mod->base + DPF_S_WEIGHT_RB_5_6_REG, spatial_coeff);
+
+	/*
+	 * Bilateral Denoising does not react on RPP_HDR_UPD::regs_gen_cfg_upd
+	 * (see Table 25). A change in configuration needs write of 1 to
+	 * RPP_HDR_UPD::regs_cfg_upd.
+	 */
+	write(priv, 4, 1);
+
+	write(priv, mod->base + DPF_MODE_REG, isp_dpf_mode);
+
+	return 0;
+}
+
+static int
+rppx1_bd_param_rkisp1_strength(struct rpp_module *mod,
+			       const union rppx1_params_rkisp1_config *block,
+			       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_dpf_strength_config *cfg = &block->dpfs;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DPF_MODE_REG, 0);
+		return 0;
+	}
+
+	/* Module version 5 adds shadowing for mode and spatial weights. */
+	write(priv, mod->base + DPF_STRENGTH_R_REG, cfg->config.r);
+	write(priv, mod->base + DPF_STRENGTH_G_REG, cfg->config.g);
+	write(priv, mod->base + DPF_STRENGTH_B_REG, cfg->config.b);
+
+	return 0;
+}
+
+static int
+rppx1_bd_param_rkisp1(struct rpp_module *mod,
+		      const union rppx1_params_rkisp1_config *block,
+		      rppx1_reg_write write, void *priv)
+{
+	switch (block->header.type) {
+	case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF:
+		return rppx1_bd_param_rkisp1_main(mod, block, write, priv);
+	case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH:
+		return rppx1_bd_param_rkisp1_strength(mod, block, write, priv);
+	}
+
+	return -EINVAL;
+}
+
 const struct rpp_module_ops rppx1_bd_ops = {
 	.probe = rppx1_bd_probe,
+	.param_rkisp1 = rppx1_bd_param_rkisp1,
 };
-- 
2.51.1


