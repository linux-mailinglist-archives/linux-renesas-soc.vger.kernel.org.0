Return-Path: <linux-renesas-soc+bounces-24447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C38C4C8AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 917594F1F24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034CF333733;
	Tue, 11 Nov 2025 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WhOfmIcu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EBwzuDM1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF3332902;
	Tue, 11 Nov 2025 09:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851791; cv=none; b=qF7IEwkyGpkmvLAiedUQzS+DLhZ0wfl7gkrZ7TKTbL2wEJ+9oTv+FeMMfkvHrokzD10oYyWMEAVSxeaBgC0qqWhciTvbWfPXMdf0dFTWlj6z5pTCM1L3vDm5h19idrRm5OpKrLqFocVvDHN1UYDSNQYxOswRZSb3vPPK6aHTLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851791; c=relaxed/simple;
	bh=Vv6Qm53SG9z22SLZWLXVx3pTDj3wYugTXk+aDp5ikDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuEC0QPk/XkR0sUgnA8NZQmrNd9zgVXbW2WOgDQz/TQ66D1rUjAb7AWAcn06ZS7jSm6+Lv1DL/6iikWz/7RJS0Kh4Du/gmu3xyuYr7QqHeYINPHDVpBe3wNuySwEi7tH5kfREZQzlm/WMbFjOt7i2SZYexTJHOdgWMvXD6HVq0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WhOfmIcu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EBwzuDM1; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 9CAF61D0012F;
	Tue, 11 Nov 2025 04:03:05 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 11 Nov 2025 04:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762851785;
	 x=1762938185; bh=3PYbm/5aSh9ytG9rKJz/Tw8/Ru246la1ryLF07u0RU0=; b=
	WhOfmIcuq8GmnKfcTJHTFf/ymBBtBC1oDAJj45eCy1SIRcFd4tVu2Q98KY379+dD
	YcBbKqhM5kodPlDF6a9PwWc+mcpmhOMQ8jGiuJJZLsFxXZJX4ZJ5fhHM4EbXG2wV
	Wyy84a/cDUZXcN5b73CcJrOkLVyLwhKCpkwPn3K166tZEEA73dAxM209W3DHP/n0
	5OAcWnqO/PWImDxZlN9ePn7W2TxP4Xr+yYV5fD4nt+SRaCwg7GX1Tq7pwvPAgxf2
	LNjt0Guu2Y9u2EqKw2o5tsOxksduMTz2Mk8EoKoekSZMNswhzj00pngfZTT59OrU
	b90s/6e95pJeeMExvmkAaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762851785; x=
	1762938185; bh=3PYbm/5aSh9ytG9rKJz/Tw8/Ru246la1ryLF07u0RU0=; b=E
	BwzuDM1calGlv/G9i/w+1kTSp4z0lQbnyvFSuaWLiKN6C3xURd8rxtfQRpN/yf/O
	Al1ihNYG+ykOIV3DEr0nis17PWGwithYiJHjbRE9KdoFMrA5K2QkCW4ru74TWNJG
	+1IbzKe6oXkbrQC7NA3rwfhDBExcQw53q+VXvPem1Kv/u32bATX19nu0koukVoI+
	NZDtG9RfRsF/hfKH63VtHN1Hu3hws3LfdnMT8121qghRZHxAlv2hMq8ea6HHr8bn
	0F0HGCD4rsIMCxxOu5qDmgFKERqwwNAz6RvIFZ7jf/ulphOhkT9X4OpSPYxHNeGE
	1n4N3QT+NQOTwnX2vRQ4A==
X-ME-Sender: <xms:yfsSaVdAnhcskJdTm8U0DCO9DcGwj-vwPg-CuYJrR6NLQTtc4i3u2Q>
    <xme:yfsSadTusFAl5C6OO9Ur4z4vpYqBOIHEV6yFGeNS-3SCVN596uoMaowcxzse4yM11
    bHbVwGAoPCaEkUTg7Kg7spdT2XjL1vVATY5l3Icw4i_IcmOGjuOOXEI>
X-ME-Received: <xmr:yfsSaeaDMsmVN1E86Q9aHdPwinWgIeH3Kk5CnYNafq_j16XgucOnNVmypPKLaFS958wNSvZPvMA--2osswQQAamZ>
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
X-ME-Proxy: <xmx:yfsSaQfIc6e0T3IJvm9IMpGTDZeP_faTT6n55FuwzlCPOJRd_s6j8w>
    <xmx:yfsSafIyA17xWIqeGcOOExlB0tncND_zdV6__it5knv6VXbOmDz8WA>
    <xmx:yfsSadI6Iy8Si4jrrn_0eLHMW4yUb1zFEHs-c2K6ltNPBJjo-MuCTg>
    <xmx:yfsSaeVFrzZ0FGI02wiOMVEK4ayQ9A9LU07WQuG8GaKdevzxUezW-A>
    <xmx:yfsSaRqSuDuq5zNVE976G5uHNhq6qzdkm8Dt4j4qq839muqOAxpmLkOC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:03:04 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 10/12] media: rppx1: Add support for Gamma Correction
Date: Tue, 11 Nov 2025 10:02:26 +0100
Message-ID: <20251111090228.2511734-11-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Gamma Correction
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and  its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters are all 10-bit while RPP can be either 12- or
24-bit, the driver corrects for this allowing the RkISP1 parameters to
be used.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 ++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 0519ad77d5c9..b5a4194ecab7 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -35,6 +35,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC:
+			module = &rpp->hv.ga;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
index d6c7f951cf29..a748190ef2dc 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
@@ -43,7 +43,41 @@ static int rppx1_ga_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ga_param_rkisp1(struct rpp_module *mod,
+		      const union rppx1_params_rkisp1_config *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_goc_config *cfg = &block->goc;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + GAMMA_OUT_ENABLE_REG, 0);
+		return 0;
+	}
+
+	write(priv, mod->base + GAMMA_OUT_MODE_REG,
+	      cfg->config.mode ? GAMMA_OUT_ENABLE_GAMMA_OUT_EN : 0);
+
+	/*
+	 * The RkISP mean values are 10-bit while the RPP can be 12 or 24 bit.
+	 * Figure out how much we need to adjust the output values.
+	 */
+	const unsigned int shift = mod->info.ga.colorbits - 10;
+
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
+		write(priv, mod->base + GAMMA_OUT_Y_REG(i),
+		      cfg->config.gamma_y[i] << shift);
+
+	/* Enable module. */
+	write(priv, mod->base + GAMMA_OUT_ENABLE_REG,
+	      GAMMA_OUT_ENABLE_GAMMA_OUT_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ga_ops = {
 	.probe = rppx1_ga_probe,
 	.start = rppx1_ga_start,
+	.param_rkisp1 = rppx1_ga_param_rkisp1,
 };
-- 
2.51.1


