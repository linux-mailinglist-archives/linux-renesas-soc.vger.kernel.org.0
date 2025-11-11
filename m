Return-Path: <linux-renesas-soc+bounces-24445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4E8C4C877
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86002189CC78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB64432D42A;
	Tue, 11 Nov 2025 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RQAswBfB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jOwtzPHu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4502F90E0;
	Tue, 11 Nov 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851781; cv=none; b=jTXj3jAYgOHNDXdpcNImD1WEeqUTDb6AgZVSKNKVj4C2Xqi7jdXDNEfeazScqgWw3GNrTIvYum0ApneEkE3sw7b0sGrV3THwDoiHlKz0+zlyTdp9Cg/oja52wgEpyuYr29JE5x0oAXuD/pVZeKJYIzfOYd+Ek7eQMuEJOMncpVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851781; c=relaxed/simple;
	bh=3sDrZtO2juNSiDg/E3Zj98H+/n1S/jrXWCXWMXFEq8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XF6hWg3G4GDshdvxtvN3r9jy7GJCHcy9+HWM0GDzShL80CbsIoSEMWQMBs13CvZFNtKtY8KMHc2YPv7u/LihP9ZiFLJFltraU4P6ynwOxjgvvzJvgg8lSOSDLFbfEFxU7eLNmPYhoqRhoVIC6FpoOCs/cOvkRyXCoemfXqHodVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RQAswBfB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jOwtzPHu; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C00E97A0058;
	Tue, 11 Nov 2025 04:02:58 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 11 Nov 2025 04:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762851778;
	 x=1762938178; bh=5euQqafy4k3dbHLRT6VECT7YkBhDPVyuKKBScthbyhA=; b=
	RQAswBfBMPoScmBFOkYeepNeQW721YCHdCbqNkMgXz4HF174z2EOZuMWCvh/arE2
	gXAfB2iZ1WBABS6pa8rbvJDmsDFXHBZMglF9ckvzdAw/AcsW2F2d4ry0vxRHtyyj
	jHhdtj+ZDCmzQtM/jTIY2iNt/xtfKbLzH/mjnDAbH2+VhpQmAOOHMpOGwyW3zvCI
	DmbFT34/RhS96Bn/6dg9ICkpdnTSZLb03NuYMmMxL+iCE11mn2wqtCDR5DqrJ3oT
	PCDMQtwWQQ7nTEh/UhRztLCcDmxbFjHSnloru9ZSHz4Jex1BMAx9COaYhu4LAMy3
	ZxqVNw4QOrQZgcJr/g5E5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762851778; x=
	1762938178; bh=5euQqafy4k3dbHLRT6VECT7YkBhDPVyuKKBScthbyhA=; b=j
	OwtzPHukwwDnZ8eXeHQiHULsnlSE3nwcoA3PtPivV48sXm5ERZBbD71YH2zGlpIr
	ev/GNLT0Dj+M+Au3Hs+9FOxr29GtgkyR53gf0JlyP6N87gODOs5rVA/lKk7jhUto
	IBGYmVhDf6UBXWEMPx5Kx6RlIzvm3Z7DfWqHEcEVOZii7yvhj6bdiZjXpS1iQcSA
	VrZ3z4HzWOzcmxEyPd5dS/YfGYwoGsICHxQPYqCX7/4IU/Twb6i6yLWyTY4V0a8/
	2X5i6K1In5UnvzQ+4veybtku9hy8rrYOFZ7MYdiYEI4E+np4z56UQi0FEFEd83K1
	3Tz6/W64vt94FWNRZnTjA==
X-ME-Sender: <xms:wvsSaQkkYl-rBbZR4coxXDyGPk7KMuQtK3CELUjgUkCffpe7AQ7sMA>
    <xme:wvsSaZ7NwiFY8Y7sKVlW_44xVPWbGvwhDf2OUiFltM3yg8GUbvCcJMziXKC760ose
    smwsg9h1LXxBHd0FmI1e7AH3mAguQuse_Z0vPZI5Es4IUstrwJYJQE>
X-ME-Received: <xmr:wvsSaejbL2pIyt60XLsfUDumrO0ncTryv0Ldn4nuutUbQvgzOjoTlPo7q4SLFJV5-E5rxlOP_CwUIZ3tqH57S0aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddtjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeekheetffdukedt
    keeijeevieehlefgfeekvdejueelheekfedutedvudetfeefieenucffohhmrghinhepfh
    higigvuggpvhgrlhdrghhrpdhfihigvggupghvrghlrdhgsgenucevlhhushhtvghrufhi
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
X-ME-Proxy: <xmx:wvsSaeEMPK7kv_cqbTIWxAlv1riidqwhKdd_sENU_Av8Q-ZheCdkpw>
    <xmx:wvsSacRfHLS50afdvUxUFRcOxQHXPyZdo3aiO8Vle8n6FXeYySPb3g>
    <xmx:wvsSaTz8t-P1agHi79ShoQJxWO9VEQa7UK2LMoqXol9gcdjo-Cic5A>
    <xmx:wvsSaQfcgvki1G7JOi0CMON64RqJ_YcMDo0N3N9yFRIzF7Y6ABoOkw>
    <xmx:wvsSaUSyHUYgob56WvZVrzabGZn_sIzgnGcYWqffEM37dn6DvUnobIOr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:02:57 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 07/12] media: rppx1: Add support for Black Level Subtraction
Date: Tue, 11 Nov 2025 10:02:23 +0100
Message-ID: <20251111090228.2511734-8-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Black Level Subtraction
(BLS) configuration using the RkISP1 parameter buffer format. It uses
the RPPX1 framework for parameters and  its writer abstraction to allow
the user to control how (and when) configuration is applied to the
RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   5 +-
 .../platform/dreamchip/rppx1/rppx1_bls.c      | 116 ++++++++++++++++++
 3 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 4d712b97b31d..a1f225b6609f 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -26,6 +26,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS:
+			module = &rpp->pre1.bls;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index 059bd76ecf64..1bffa6dd35f8 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -20,8 +20,11 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 		if (!rpp_module_call(&rpp->post.hist, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
 
-	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
+	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
 		if (!rpp_module_call(&rpp->pre1.exm, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
+
+		rpp_module_call(&rpp->pre1.bls, stats_rkisp1, &stats->params);
+	}
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
index de7008befd8e..164bc4a63c23 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -5,6 +5,7 @@
  */
 
 #include "rpp_module.h"
+#include "rppx1.h"
 
 #define BLS_VERSION_REG				0x0000
 
@@ -54,6 +55,121 @@ static int rppx1_bls_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static void
+rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
+{
+	static const unsigned int swap[4][4] = {
+		[RPP_RGGB] = { 0, 1, 2, 3 },
+		[RPP_GRBG] = { 1, 0, 3, 2 },
+		[RPP_GBRG] = { 2, 3, 0, 1 },
+		[RPP_BGGR] = { 3, 2, 1, 0 },
+	};
+
+	/* Swap to pattern used in our path, PRE1 or PRE2. */
+	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
+		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
+	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
+
+	for (unsigned int i = 0; i < 4; ++i)
+		output[i] = input[swap[pattern][i]];
+}
+
+static int
+rppx1_bls_param_rkisp1(struct rpp_module *mod,
+		       const union rppx1_params_rkisp1_config *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_bls_config *cfg = &block->bls;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + BLS_CTRL_REG, 0);
+		return 0;
+	}
+
+	u32 ctrl = BLS_CTRL_BLS_EN;
+
+	if (!cfg->config.enable_auto) {
+		static const u32 regs[] = {
+			BLS_A_FIXED_REG,
+			BLS_B_FIXED_REG,
+			BLS_C_FIXED_REG,
+			BLS_D_FIXED_REG,
+		};
+		u32 swapped[4];
+
+		rppx1_bls_swap_regs(mod, regs, swapped);
+
+		/*
+		 * The RkISP params are 12-bit + 1 signed bit, while the RPP can
+		 * be 12, 20 or 24 bit + 1 signed bit. Figure out how much we
+		 * need to adjust the input parameters.
+		 */
+		const unsigned int shift = mod->info.bls.colorbits - 12;
+
+		write(priv, mod->base + swapped[0], cfg->config.fixed_val.r << shift);
+		write(priv, mod->base + swapped[1], cfg->config.fixed_val.gr << shift);
+		write(priv, mod->base + swapped[2], cfg->config.fixed_val.gb << shift);
+		write(priv, mod->base + swapped[3], cfg->config.fixed_val.b << shift);
+	} else {
+		write(priv, mod->base + BLS_SAMPLES_REG, cfg->config.bls_samples);
+
+		if (cfg->config.en_windows & BIT(0)) {
+			write(priv, mod->base + BLS_H1_START_REG, cfg->config.bls_window1.h_offs);
+			write(priv, mod->base + BLS_H1_STOP_REG, cfg->config.bls_window1.h_size);
+			write(priv, mod->base + BLS_V1_START_REG, cfg->config.bls_window1.v_offs);
+			write(priv, mod->base + BLS_V1_STOP_REG, cfg->config.bls_window1.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN1;
+		}
+
+		if (cfg->config.en_windows & BIT(1)) {
+			write(priv, mod->base + BLS_H2_START_REG, cfg->config.bls_window2.h_offs);
+			write(priv, mod->base + BLS_H2_STOP_REG, cfg->config.bls_window2.h_size);
+			write(priv, mod->base + BLS_V2_START_REG, cfg->config.bls_window2.v_offs);
+			write(priv, mod->base + BLS_V2_STOP_REG, cfg->config.bls_window2.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN2;
+		}
+
+		ctrl |= BLS_CTRL_BLS_MODE_MEASURED;
+	}
+
+	write(priv, mod->base + BLS_CTRL_REG, ctrl);
+
+	return 0;
+}
+
+static int rppx1_bls_stats_rkisp1(struct rpp_module *mod,
+				  struct rkisp1_cif_isp_stat *stats)
+{
+	struct rkisp1_cif_isp_bls_meas_val *bls = &stats->ae.bls_val;
+
+	static const u32 regs[] = {
+		BLS_A_MEASURED_REG,
+		BLS_B_MEASURED_REG,
+		BLS_C_MEASURED_REG,
+		BLS_D_MEASURED_REG,
+	};
+	u32 swapped[4];
+
+	rppx1_bls_swap_regs(mod, regs, swapped);
+
+	/*
+	 * The RkISP BLS stats are 12-bit while the RPP can be 8, 20
+	 * or 24 bit. Figure out how much we need to adjust the output
+	 * statistics.
+	 */
+	const unsigned int shift = mod->info.bls.colorbits - 12;
+
+	bls->meas_r = rpp_module_read(mod, swapped[0]) >> shift;
+	bls->meas_gr = rpp_module_read(mod, swapped[1]) >> shift;
+	bls->meas_gb = rpp_module_read(mod, swapped[2]) >> shift;
+	bls->meas_b = rpp_module_read(mod, swapped[3]) >> shift;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_bls_ops = {
 	.probe = rppx1_bls_probe,
+	.param_rkisp1 = rppx1_bls_param_rkisp1,
+	.stats_rkisp1 = rppx1_bls_stats_rkisp1
 };
-- 
2.51.1


