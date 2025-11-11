Return-Path: <linux-renesas-soc+bounces-24442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B696FC4C848
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FAE24F26DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC5A2F25E7;
	Tue, 11 Nov 2025 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dleUHl1t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sPbj9TUh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74B725B2F4;
	Tue, 11 Nov 2025 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851776; cv=none; b=gc3vv36xPqfDUdxWS1Db9GVeR85XEcDMDsOAwlTBDOV23tWpXkB/C6j4w4YUe6uUqdasWI2XekGOMVWminCK4e/BoZ4kYgdf1aqaXud1cSdlrWKyWTxFjnFaZYF/FxFHkVXs0uxEVI/gC33gvYlC2MF3S9K1/znuzj/PRK59B14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851776; c=relaxed/simple;
	bh=5Q/DMSxxo3BIu1/mhM4LhFlARvAb+is2GW4yYxPlDqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebi3RzSdJbNhbRcHjLNA6QrtB0oJLhn7h3sdCP5P6KNFeyGCYmb/ZRIc2UI5V1u1RYJjSTJDQ1sS2bmiPPvnEN2PMdOyvyN0ZoNerDR3JcMDYY6TILJ2qrqiCZX1Pm8dU4Ztpsg2PVQ1kQXX/QdF+R9w8BvmyU3JDc1uPCWiEjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dleUHl1t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sPbj9TUh; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 04C3B1400056;
	Tue, 11 Nov 2025 04:02:52 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 11 Nov 2025 04:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762851772;
	 x=1762938172; bh=8e+oQ+gxn43TR79PTKdxuyF/HLtRBSjO6l2PfILgZV0=; b=
	dleUHl1tJuG3tzTE0pyQJJ8Z4KUUQ/ta26q/nKsvzCdzRxwZB+kkStAkxbtnIKsH
	uTxqPe8jDktTs+ol5gtOu04vs6WOqyLsgKld/DWGfW1kWasnRw8iZfPzRWLnVDiY
	C38ptquQdXAM+StMut32Y5QjfS3VkAFSH/xOPr8mMH85QjK4uEfWZDJkAoPP73Qf
	tF+wgfsf1iu4nAIf5KU4SpvtNpLEfFdNyhpNPwV15nqnlFfl1O1qqxqptFisRw/e
	eT2ueNB8QwZGzJWL+vmSPHjrf16v1r9ULobQJsoXWEPX35VtVZkfsALv91RQm8ck
	IMYXzq2+fSDf4fYM1UwVcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762851772; x=
	1762938172; bh=8e+oQ+gxn43TR79PTKdxuyF/HLtRBSjO6l2PfILgZV0=; b=s
	Pbj9TUh4uxrTKdMD/qQJw5+Ytgw+zvhkBxdZUOCZXOnECzttDuxoU/wDg2SKpqiF
	D23JjxoEv838JRRYdfittYwPul2rWI0wIi+76+EXhabHGLhNw8I6068OsfQbSrtE
	yKsr9mMGJaMyNVxqyg+OpTX/TWGn/B8Tg8Tb5fYFxxKKCYo9KppLceOLs8h/OjB7
	tgLwsGOzGFYCGbV6gWXI/bhPlyWBdsaTTC+tIlSzol7ddkiklVZaMR7+bysGfd9d
	QraddvqUzn72ovMIhJHN9k9orBcajTjiZtW3iwL3Y+KReQ5h+XY+e6omKSft5Sdm
	W2C8ayhUwj4GZ7iUAd+nw==
X-ME-Sender: <xms:uvsSaT9JaD6EeU8a0s2ltqZ1pzFgdz2n3LzAysfuNnqBmlD-roh_tg>
    <xme:uvsSaZwpl77u5WIhy3mFObbadj5WUrS6NqeCose7klCzkD1ndx0ddheeV2JQbRKJV
    VZZMzPpOSvhks-SUwDKfNjvdmHNGmKzFduBLPqBc05BSU6EZ4ROuQ>
X-ME-Received: <xmr:uvsSaQ47aQ0w7GJpbgllScTZGSjAIHiDlBveEyTNuMsOR7_8l9iA8sk_eG87KjWpx-KtNp6_uHVULPESy8FknIyy>
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
X-ME-Proxy: <xmx:uvsSaQ-0LWSSsHFOFoxOLuWUOhuhloXjCzJWfaqyEIG_UowgB4Qt7Q>
    <xmx:uvsSaVrim0qrFdh402zss5jSEUzT33fqrFzTUILZbusFRzQjJ2o5DA>
    <xmx:uvsSaRpanf0LscNGBAqfolPqbHGEVUEOdd8SuSaolI1hQvfcz1SctQ>
    <xmx:uvsSaY1HKR_DXBTST27lER57J5iZWwPlKJDirotjT0pcCCQjH10VJQ>
    <xmx:u_sSaXIW3213gsIpwHoYjFBsN9wLxWAf41h4OlRIuKuu1Z70qi7sPkMs>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 04:02:50 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 04/12] media: rppx1: Add support for AWB gain settings
Date: Tue, 11 Nov 2025 10:02:20 +0100
Message-ID: <20251111090228.2511734-5-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the AWB gains using the RkISP1
parameter buffer format. This is the second function block inside the
RPPX1 to be enabled and it uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how (and when)
configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 ++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     | 37 +++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 6e49f0e90c41..443eac0d8924 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -26,6 +26,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
+			module = &rpp->pre1.awbg;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
index e20bc369ca8c..da5ae3cfadb8 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -25,6 +25,43 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_awbg_param_rkisp1(struct rpp_module *mod,
+			const union rppx1_params_rkisp1_config *block,
+			rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_awb_gain_config *cfg = &block->awbg;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_ENABLE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RkISP1 gains are 10-bit with 8 bit fractional part and 0x100 = 1.0,
+	 * giving a possible range of 0.0 to 4.0.
+	 *
+	 * RPP gains are 18-bit with 12 bit fractional part and 0x1000 = 1.0,
+	 * giving a possible range of 0.0 to 64.0. NOTE: RPP documentation is
+	 * contradictory this is the register definition, the function
+	 * description states 0x400 = 1.0 AND 18-bit with 12 fractional bits,
+	 * which is not possible...
+	 *
+	 * Map the RkISP1 value range (0.0 - 4.0) by left shifting by 4.
+	 */
+
+	write(priv, mod->base + AWB_GAIN_GR_REG, cfg->config.gain_green_r << 4);
+	write(priv, mod->base + AWB_GAIN_GB_REG, cfg->config.gain_green_b << 4);
+	write(priv, mod->base + AWB_GAIN_R_REG, cfg->config.gain_red << 4);
+	write(priv, mod->base + AWB_GAIN_B_REG, cfg->config.gain_blue << 4);
+
+	write(priv, mod->base + AWB_ENABLE_REG, AWB_ENABLE_AWB_GAIN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_awbg_ops = {
 	.probe = rppx1_awbg_probe,
+	.param_rkisp1 = rppx1_awbg_param_rkisp1,
 };
-- 
2.51.1


