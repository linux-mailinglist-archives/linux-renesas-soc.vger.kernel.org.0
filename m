Return-Path: <linux-renesas-soc+bounces-24446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A7C4C889
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 071B5188596D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2120232ED2A;
	Tue, 11 Nov 2025 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hG/tJxJ7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UE6FaHGY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F95C32D452;
	Tue, 11 Nov 2025 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851784; cv=none; b=kOnqzusiVMMDCkS3jRn2AuFqrBlmaPzx9DgqE1uu3rGsXNPnLoofjweIBWTMT+th1i+8sKv4lVQ+LhT74EHP6rufxC8q7/KD9LTQLvLX3s3Hhc1Akhgy0SEIAO/njVYc5lsGI2oQd0J5xMO9CJ7Q9EW0EBKBmYBTRBAC4VfDnGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851784; c=relaxed/simple;
	bh=FW3+38pYQlVZtrlYdgbpLo1F7yefwIZu6KvOEPoYxBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNQdMT8xnq2HraG1Onl1+EZQeq7TxuC2M5HupuqzRWFfv3EYNP4JylpSXEGuZxXR+xUgJHjlWk1DCCeGHz33kux6KZg3x5TTA4ri2DYmIpqwg/5h/VhoKe8sZBzm3i88b7EJHYefo9jdWG6zXq8DfyQphOKe0iIut6GRzJYAFiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hG/tJxJ7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UE6FaHGY; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 124251D000B2;
	Tue, 11 Nov 2025 04:03:01 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 11 Nov 2025 04:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762851780;
	 x=1762938180; bh=iRftvDOV/7UuHEF4+ht+eoohpG2MIz2qvHL+TxoXVhA=; b=
	hG/tJxJ7jPV1VRJWVw8hRK9K57B4jt4zekdn2rrGQmfolW1ggnHwKeCOVRAU6Ed/
	7v30eYBuISTc1l3DGWxFatYvQw6QzDHZFVXpZPTao3sjG8fMntcow24a5HEN50uM
	BP3FlAqgpNPayRuYBPpQLb1e1cyzKMpcH8+Gpzg1E1P+3LAKLFWjtoTaXADAqjIF
	LERVZafzIWyP8Gl6/UJIZecnMK12ypXE28EpwQX+TaVGCHtGEHXGkG1GZgiswEm7
	vIqo/uQDdgLV3v/pcYUPcn2Rmr3rcu+F23DUT+Bz7Pkp/9kaZpPEIUb5GlQNmm1m
	xBBIm8Lan2lQFqj56q4VdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762851780; x=
	1762938180; bh=iRftvDOV/7UuHEF4+ht+eoohpG2MIz2qvHL+TxoXVhA=; b=U
	E6FaHGY16QydK8lMXtUdog5VwGAGRscDBu6ySCKdApe05WAsfPpxRXGkTo+a9IDk
	3UbB0sa0vS5u2dz2jbreIeO7Mq7s/XnDM97NxsMhVMsdIg0bzqkMaoE+X+9EGU+b
	loRTqmi2UlkRYhgbqPmm0BwcDCM+qg3Trt65LGvZext0nMuP+OQx/k7pltbI2/4m
	UGZOgxNYJ9xqC5IOHHhd6rIU516KiCrbWXrOa6of7ascroahRX6E7afc7fbD3I3m
	X1G7LJILU9WpOGvwOt8/Pw4Me/qJyb44HUrT3DaqfYvUzoW9Jfof3DmX+RmvSVUf
	Na0Evn9UOdbwHsXbNgv/g==
X-ME-Sender: <xms:xPsSaZH6uP7MJO1PGCoADJZ3wtgHDIwU8mbYkkxJO5qxPzzzD9Xbnw>
    <xme:xPsSaYZV2rO_33W_ojaGzZPk-Zy95YtolJFCNFt5MhvkMT8YoGCjd_1VIujKYqQtR
    rQB8psDHMJRdc_JopzTyZ3Sv14Ke-wOHsRiIwgX5hRTy-np8lrr80s>
X-ME-Received: <xmr:xPsSabApLzyFJ4dowjtmf4B1sjIr_SdxYgfzEneva7tgw5LKMOSll2QvBlfoXmIpj0IfyHZDFewXlEQ0sdfgaKWp>
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
X-ME-Proxy: <xmx:xPsSaQnbMZxsd7H7zVjOECqg51g6t6JjLvemgnSRmgb7-u-v3IxJTw>
    <xmx:xPsSacwW3ZnMjxCaiPvCpSkdlc51FfXryK-S_9ONsZaEZ3dePOYI3A>
    <xmx:xPsSaaQal4aVOqh8lRco0QuCNV9_i_92JjtU9XcF3Yvx4OsiTedHsQ>
    <xmx:xPsSaU8-tP8Vv2daY3EYdybSZCMwFtkcoQtSU1UpN7njY078hiLGNg>
    <xmx:xPsSaayzvYJ83pD5MFivwXjQaYQYUfM0jrUm4bsN3jGn0Vn59_oK_dDQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:03:00 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 08/12] media: rppx1: Add support for Color Correction Matrix
Date: Tue, 11 Nov 2025 10:02:24 +0100
Message-ID: <20251111090228.2511734-9-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Color Correction Matrix
(BLS) configuration using the RkISP1 parameter buffer format. It uses
the RPPX1 framework for parameters and  its writer abstraction to allow
the user to control how (and when) configuration is applied to the
RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 74 +++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a1f225b6609f..f7b9e14e2b5b 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -32,6 +32,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
+			module = &rpp->post.ccor;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
index 4754b0bbce0a..0ccaed8ce55d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -68,9 +68,83 @@ static int rppx1_ccor_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ccor_param_rkisp1(struct rpp_module *mod,
+			const union rppx1_params_rkisp1_config *block,
+			rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_ctk_config *cfg = &block->ctk;
+
+	/* If the modules is disabled, configure in bypass mode. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(2), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(5), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(8), 0x1000);
+
+		write(priv, mod->base + CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_B_REG, 0x00000000);
+
+		return 0;
+	}
+
+	/*
+	 * Coefficient n for color correction matrix.
+	 *
+	 * RkISP1 coefficients are 11-bit signed fixed-point numbers with 4 bit
+	 * integer and 7 bit fractional part, ranging from -8 (0x400) to +7.992
+	 * (0x3FF). 0 is represented by 0x000 and a coefficient value of 1 as
+	 * 0x080.
+	 *
+	 * RPP gains are 16-bit signed fixed-point numbers with 4 bit integer
+	 * and 12 bit fractional part ranging from -8 (0x8000) to +7.9996
+	 * (0x7FFF). 0 is represented by 0x0000 and a coefficient value of 1 as
+	 * 0x1000.
+	 *
+	 * Map the RkISP1 value range by left shifting by 5.
+	 */
+	write(priv, mod->base + CCOR_COEFF_REG(0), cfg->config.coeff[0][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(1), cfg->config.coeff[0][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(2), cfg->config.coeff[0][2] << 5);
+
+	write(priv, mod->base + CCOR_COEFF_REG(3), cfg->config.coeff[1][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(4), cfg->config.coeff[1][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(5), cfg->config.coeff[1][2] << 5);
+
+	write(priv, mod->base + CCOR_COEFF_REG(6), cfg->config.coeff[2][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(7), cfg->config.coeff[2][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(8), cfg->config.coeff[2][2] << 5);
+
+	/*
+	 * Offset for color components correction matrix.
+	 *
+	 * Values are a two's complement integer with one sign bit.
+	 *
+	 * The RkISP params are 11-bit while the RPP can be 12, 20 or 24 bit,
+	 * all values are excluding the sign bit. Figure out how much we need
+	 * to adjust the input parameters.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 12 + 1;
+
+	write(priv, mod->base + CCOR_OFFSET_R_REG, cfg->config.ct_offset[0] << shift);
+	write(priv, mod->base + CCOR_OFFSET_G_REG, cfg->config.ct_offset[1] << shift);
+	write(priv, mod->base + CCOR_OFFSET_B_REG, cfg->config.ct_offset[2] << shift);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ccor_ops = {
 	.probe = rppx1_ccor_probe,
 	.start = rppx1_ccor_start,
+	.param_rkisp1 = rppx1_ccor_param_rkisp1,
 };
 
 static int rppx1_ccor_csm_start(struct rpp_module *mod,
-- 
2.51.1


