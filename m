Return-Path: <linux-renesas-soc+bounces-24449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF9C4C89B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9048189DB08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66077333753;
	Tue, 11 Nov 2025 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lwBSy6rb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bZehYTkc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDCA33290B;
	Tue, 11 Nov 2025 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851793; cv=none; b=PSVe/P/G63pAOl/xVCZoZ7gB5VMRp3ZWiSgSUb4RuVf2SGpXrM4Ra4/yYqN7Q+b1FEAet67ChxCaVFMqhymUdktA5Rb+iXx3Ix+DzvTNztmkPmfvHadCZOzO/X+PRG5NXaoJRAncMQNXW4W/AaAg6VYbg96JsQEXq59D9gGcBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851793; c=relaxed/simple;
	bh=IIdedF+wJTnJhspTR294CNMXRYuw3mf5/HLltzHlgvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wf4cDaeSCiO2MAlx9Th2+nrCnkNZ3SSNMZkkDZF8oPpjzQS+yTGg/zCmoTxi7GUWhOsAM/XE3zlKjt8Yhxh0Hbb5+QTh4Z6dyWYiPkgpkT3AvdM4NyoEcjpWX4jBVG0JpdASKDGZJ/LhQNc0B9bCz5mPfvqT78P+8+u0bv4ihfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lwBSy6rb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bZehYTkc; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E9FC57A012A;
	Tue, 11 Nov 2025 04:03:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 11 Nov 2025 04:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762851787;
	 x=1762938187; bh=b7gKMdZKh4ypD2fI2NgyHjdN9GPCiJvW3BHCEKZIWLM=; b=
	lwBSy6rbST4wzB1maPABE9cJz8Nv4fwcvE+r437z9+g4wWAngeqWcyx1FDZGW3w8
	AR6U2Vx3/jPY77TUwynAgF5lCLmBY/zV1XZkPDmRrbqzYYldbRA51yDGTRweOSnD
	nXwgfg9q8RcSEYRLirLo0qjAAw/aZKA85YJVZ9ih9cFzLwwPnRgV5IEqp6bq1Alo
	OfHv3UILl+mVdMFVsyKuQPC9jk2o3759NQwOzaN1hXZPCJbF7+5HDqX71bOK9WZk
	Wj3V04/ubVk/FVI8rdfBZwwmTkG5flBwI5gfotrZge/r8LIaeRkarDjnEHz3z/5c
	/Rgri6alQBDEVUY64Rw1Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762851787; x=
	1762938187; bh=b7gKMdZKh4ypD2fI2NgyHjdN9GPCiJvW3BHCEKZIWLM=; b=b
	ZehYTkc+npLrmAv6n/mG+3fnBaVB64oJD4Kc7nMqVHBD6pR+fhN31/gvBhGaVbNz
	uSPEaQX+ADG1AW10rH6Zp34oBB9n59JRJg4h3M/mw43LfZShBPs6Nl10CWNJjlY8
	KxdI0ZyWbSEydpQgLnD/MxDjVd5hMCCN7dAK4nWrE1fK2DKnSvze394VRn7GOeT0
	XjU2IaXEMr03hiHr+VY7yIRdC8UYaduT4Kg7Bw47Yf5ddzOULIcgok1Xxc2S0XrV
	Sy8y7J0ko/j+IrzwxQmgb48ivXbHfDiXrXa6vk1ZKzXBNyrGUhOXJ5W1MYawJZ0o
	sNxKzR59N6BqXl6Y1cYOA==
X-ME-Sender: <xms:y_sSaZFtDAl0AjDqqBqrBWkO0X7cFI9Alp7M1K_-JfOIMzz_B0amMA>
    <xme:y_sSaYZMtBafcpZVTJNPxwzyzvNb5D2zdmlhqXU2-niYYnocyDPe5Wtw3U_wEdHV9
    tTlyqMGSAoIy9l6wSUs3uYUFi3UX8Ms9-adlq5gkv_R2dudLGqz_Q>
X-ME-Received: <xmr:y_sSabBU59qYU3vQ1JieKRCwt7nPDr81Zm11Z25kL7CSHyu4FU1KrUbtc3FSDT7RbXghCmA7bfAzKbJS2JuVsqMa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddtjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:y_sSaQkqPkuEAcVd-YSUcwFhGWoMBivKaIfgZKcxuIfbgFP900jfow>
    <xmx:y_sSacy5FAXqxRODzQqsE6BBD7osEv-M8IbUIAQrnkp9p4HnFr0acg>
    <xmx:y_sSaaSBuW04ibRySFHn1bD2sm-4nHCyvBW4YOUhKohEPbCdy-nq1A>
    <xmx:y_sSaU8Z5EVLbjsYALoOd-UsYGlXHUVeiQV61Y7qCnyf0-iXqJbKBA>
    <xmx:y_sSaaw6VUVB_YyIWXfNuIuvM25iuTkYiQsjIwl3DtKnp6gmyslEnAgy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:03:07 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 11/12] media: rppx1: Add support for Bayer Demosaicing
Date: Tue, 11 Nov 2025 10:02:27 +0100
Message-ID: <20251111090228.2511734-12-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Bayer Demosaicing
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters are all 6- or 10-bit while RPP are either 8- or
16-bit, the driver corrects for this allowing the RkISP1 parameters to
be used.

One particularity is that the RkISP1 driver lumps all settings in the
FILT_LUM_WEIGHT register in a single value in the configuration buffer.
As the format is slightly different for RPP we need to break it out and
fix it before applying it to the RPP.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../media/platform/dreamchip/rppx1/rppx1_db.c | 112 ++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index b5a4194ecab7..ddabb84e8df4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -32,6 +32,11 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT:
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM:
+			/* Both types handled by the same block. */
+			module = &rpp->post.db;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
index 5e233896cfc8..4a2a3719d7ed 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
@@ -39,6 +39,118 @@ static int rppx1_db_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_db_param_rkisp1_flt(struct rpp_module *mod,
+			  const union rppx1_params_rkisp1_config *block,
+			  rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_flt_config *cfg = &block->flt;
+	u32 gain, kink, min;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + FILT_MODE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RkISP1 values are 10-bit, RPP are 18-bit. Conversion verified with
+	 * table in datasheet and libcamera pipeline for rkisp1.
+	 */
+	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->config.thresh_bl0 << 8);
+	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->config.thresh_bl1 << 8);
+	write(priv, mod->base + FILT_THRESH_SH0_REG, cfg->config.thresh_sh0 << 8);
+	write(priv, mod->base + FILT_THRESH_SH1_REG, cfg->config.thresh_sh1 << 8);
+
+	/*
+	 * RkISP1 values are 6-bit, RPP are 8-bit. Conversion verified with
+	 * table in datasheet and libcamera pipeline for rkisp1.
+	 */
+	write(priv, mod->base + FILT_FAC_BL0_REG, cfg->config.fac_bl0 << 2);
+	write(priv, mod->base + FILT_FAC_BL1_REG, cfg->config.fac_bl1 << 2);
+	write(priv, mod->base + FILT_FAC_MID_REG, cfg->config.fac_mid << 2);
+	write(priv, mod->base + FILT_FAC_SH0_REG, cfg->config.fac_sh0 << 2);
+	write(priv, mod->base + FILT_FAC_SH1_REG, cfg->config.fac_sh1 << 2);
+
+	/*
+	 * For unknown reasons the 3 fields of the FILT_LUM_WEIGHT register
+	 * have been lumped together in a single field in the configuration
+	 * data and written as is to the hardware. For RkISP1 the register
+	 * layout is,
+	 *
+	 * 31:19	unused
+	 * 18:16	lum_weight_gain
+	 * 15:8		lum_weight_kink
+	 *  7:0		lum_weight_min
+	 *
+	 * For RPP the register layout is similar but kink and gain have higher
+	 * precision.
+	 *
+	 * 31		unused
+	 * 30:28	lum_weight_gain
+	 * 27:24	unused
+	 * 23:12	lum_weight_kink
+	 * 11:0		lum_weight_min
+	 *
+	 * Break apart the RkISP1 format, scale kink and min, and map to RPP.
+	 */
+	gain = (cfg->config.lum_weight & GENMASK(18, 16)) >> 16;
+	kink = (cfg->config.lum_weight & GENMASK(15, 8)) >> 8;
+	min = cfg->config.lum_weight & GENMASK(7, 0);
+
+	write(priv, mod->base + FILT_LUM_WEIGHT_REG,
+	      (gain << 28) | ((kink << 4) << 12) | (min << 4));
+
+	write(priv, mod->base + FILT_MODE_REG,
+	      (cfg->config.chr_v_mode << 4) |
+	      (cfg->config.chr_h_mode << 6) |
+	      (cfg->config.grn_stage1 << 8) |
+	      (cfg->config.mode ? FILT_MODE_FILT_MODE : 0) |
+	      FILT_MODE_FILT_ENABLE);
+
+	return 0;
+}
+
+static int
+rppx1_db_param_rkisp1_bdm(struct rpp_module *mod,
+			  const union rppx1_params_rkisp1_config *block,
+			  rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_bdm_config *cfg = &block->bdm;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DEMOSAIC_REG, 0x400);
+		return 0;
+	}
+
+	/*
+	 * Threshold for Bayer demosaicing texture detection.
+	 *
+	 * RkISP1 threshold are 8-bit, RPP threshold are 16-bit. Map the RkISP1
+	 * value range by left shifting by 8.
+	 */
+	write(priv, mod->base + DEMOSAIC_REG, cfg->config.demosaic_th << 8);
+
+	return 0;
+}
+
+static int
+rppx1_db_param_rkisp1(struct rpp_module *mod,
+		      const union rppx1_params_rkisp1_config *block,
+		      rppx1_reg_write write, void *priv)
+{
+	switch (block->header.type) {
+	case RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT:
+		return rppx1_db_param_rkisp1_flt(mod, block, write, priv);
+	case RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM:
+		return rppx1_db_param_rkisp1_bdm(mod, block, write, priv);
+	}
+
+	return -EINVAL;
+}
+
 const struct rpp_module_ops rppx1_db_ops = {
 	.probe = rppx1_db_probe,
+	.param_rkisp1 = rppx1_db_param_rkisp1,
 };
-- 
2.51.1


