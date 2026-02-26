Return-Path: <linux-renesas-soc+bounces-28502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDUsNgOQoGkokwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 19:25:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 473F21AD8E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 19:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 192973105BA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 18:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002FB38B7A0;
	Thu, 26 Feb 2026 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTLKw0Pm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T9SJhdfC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43C38A72F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 18:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129866; cv=none; b=q1T1BnjcWthnvNnIGBNIjyvd3OyTVk3l41Gn3UgbYahGd8mt2d4/5JmAgs88ujo2aH/BwT9+16C8xC9HDjzTnPvG8OiIgNZqQkp9IOXJg9caifIn8Ws1u7CqXQghYK+nIXo/M+5kV6EyXX5TjpdUxwCgAZXMJ0pZimADGGSfUqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129866; c=relaxed/simple;
	bh=Nq3CMChIfPaEW53CpS7DRO/eUow2u/bScwRGHq/ah5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3V4A/gKpDxpEoQUJRcXxtmLq9cLJ7FlsXPZDH9pXdKGmKa39hRZjJZsTxdD4s4Mnnf+rLKXWr8jEWtb9aBPgFt/dvJWOIB9fOVvasv04x4ma2u/gKh8RF2TeBox4xev68W76DiUQteLwxPjpHhj7RLzYbv/yjRskpiLO6IvG8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTLKw0Pm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T9SJhdfC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SZUTvZ638AEjm5qo1oF8P/Ro4B+EvKlMp+AWJ5ktKic=;
	b=YTLKw0PmHnCkhMmHhyKIRKDj83ELoThI9ONG63S0XRyWiPCt2UiYATfXdoM/lOc4Litqv4
	ocsj5NO/AYdx/Gz9shWA9RLeDKB3eFbix7GzEyepnShA8CCdD914zAHFcMLi5odv1p0K9f
	SH2R+ww95EkaLUeuSRixoG79ww+hAmI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-DtX6upBfOna4-A2m3D08LA-1; Thu, 26 Feb 2026 13:17:43 -0500
X-MC-Unique: DtX6upBfOna4-A2m3D08LA-1
X-Mimecast-MFC-AGG-ID: DtX6upBfOna4-A2m3D08LA_1772129862
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b6b37d8so700447185a.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 10:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129862; x=1772734662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZUTvZ638AEjm5qo1oF8P/Ro4B+EvKlMp+AWJ5ktKic=;
        b=T9SJhdfClEKo4WZ0WI7ruoV/PtvgrjwotExnIIkUGCBOmE+fxTlfvwaV1781Ckdifv
         GRFWZ5A/95Mez8v1hWMvlyM+3X5RbQ7Klh4+1vSRCPIqHChcPyCjQgQnPKcswSyW7haJ
         cXGpcZi/yuHCzXNOo3o5rQR6OFqqskWisDS8UAlBDo5CJDOeHqVyVLKLtd9PRrmQj4R8
         ZsVOmZfIu3DGE5Nn4djI4HlVHczYio/sy6Qvx7blKn2FLBami4ySthpzwaex/JG/Ec/B
         QAetdvj8Eir8CfamP7yM9BT3NiCEEgVeaD4TC2bCvXLpRspoootTd5Z/XJcbdsrvjogA
         kVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129862; x=1772734662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZUTvZ638AEjm5qo1oF8P/Ro4B+EvKlMp+AWJ5ktKic=;
        b=Mw3SiHmMwUPFbgN1ezWgfs+MtVQ08EX++gpiwb+TeZHhFx1QT0YKwwytTiwPq8kh/M
         kwvxYhixHfb9nI66kqgIz+XqkzzPXLGPqfYdTllNj7IHAsPo0LIeQpJYTYxfpZ4/sTNF
         JozdOwCb9K4HP0s0NSWlNo3oLDXBB+ZGiicHcu9mWkYSW25u7NXgtIZ7UyzSeJS1bxN5
         Uhp+2hTdc4cf6zwJIqxHMa35c/QgiSWIfeIPl/dLmiOffKDs/y6dPH5zF/y3UvCHOZ1i
         d0mp7GdIDfz2IfFUlZ1P1jfzOEGRd0N5qrDFZHUyLfjWY4csQEupihjPrqEu4DggoYyo
         bcEg==
X-Forwarded-Encrypted: i=1; AJvYcCVCbJJPZnzrXpJ2I2VIPh7hLTSSHX7o29ap7hP0vBlUkONIrlV3NYdtJW41ohXnEaLV7Fm2IkrqBDwoNfP7SHfrhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy837hyawechwks12uMbAsjjQVH60AUuFMaj6XBbMu6lM3fuTWt
	G62P90ScqM8V2sxcCI7ZyD2EgSodr4CN4nbeo/DY0liMk8nqN6vmoikA2kHynD7dBeIsu5Ph/n2
	aWRYJNgJOguq5qV5M2/RocbUorU/jNLX1ZQ03sL45TFs3ii2+gH0fq/E0celVPnQmPYhavQUB
X-Gm-Gg: ATEYQzyav1D7mkDxD8iqMsBnC1za5JwD/0ZOpLlj7evgEBmaOHgWJSMQvrriqq/6GZ2
	cpFWYukhyKyhoZ62TBCG6KwYIosEvsroMr3jvldf7dADjm/3xOiiXzwUvQmjRfaKZDpWT+adv98
	thcS7Mvk/uA0476PohPojGXjEWqM2ve7XOmjm7MMEMBNnEOU8iBNaSiTGd09wTQ41/XL9CJkLXQ
	StyhcqMK3W7nXbERRujDXzxuapdyVHbynx8DC2QBkQRq8sR+J+o9ceXU4OCTKCyr9DU8iiNSl1C
	8FxZu+uGx5Ry/McaZKRQOGeHJaE7jElRN0mFmzAqplbwmlmVe9sXoiHC5ygZoY0O/wHWmLOcoG9
	9OYKBa3Cf6CGoo4g0fOnMP3OKmBf0BlzeTh6h8r9PPNN67WOI+ncJoTRIkmYM
X-Received: by 2002:a05:620a:1b8b:b0:8cb:c7b7:1be3 with SMTP id af79cd13be357-8cbc7b71dbfmr89300485a.38.1772129862195;
        Thu, 26 Feb 2026 10:17:42 -0800 (PST)
X-Received: by 2002:a05:620a:1b8b:b0:8cb:c7b7:1be3 with SMTP id af79cd13be357-8cbc7b71dbfmr89293185a.38.1772129861633;
        Thu, 26 Feb 2026 10:17:41 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:40 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:45 -0500
Subject: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4829; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Nq3CMChIfPaEW53CpS7DRO/eUow2u/bScwRGHq/ah5A=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Gl/8Qhn3nT5sJOJp63wTebDqndvHZo401bZ3U3v9
 fUq74XtHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEyILhf9mh5qLnnYv6ovVZ
 BV0j136w/qzwRDRlzgWDsnBfpx13LBkZbrjNE7DY37FVRFDaqplrc1X3XEOBzF0rNoqd8tWwMzj
 MAQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-28502-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 473F21AD8E2
X-Rspamd-Action: no action

There are some clocks where the rounding is managed by the hardware, and
the determine_rate() clk ops is just a noop that simply returns 0. Add a
new flag for these type of clocks, and update the clk core so that the
determine_rate() clk op is not required when this flag is set.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Frank Li <Frank.Li@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Orson Zhai <orsonzhai@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: arm-scmi@vger.kernel.org
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
---
 drivers/clk/clk.c            | 24 +++++++++++++++++++++---
 include/linux/clk-provider.h |  2 ++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..0a522a0817411c7f7c6e9cffd6f024e672a331a8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1557,6 +1557,20 @@ static int __init clk_disable_unused(void)
 }
 late_initcall_sync(clk_disable_unused);
 
+/**
+ * clk_is_rounding_fw_managed - Check to see if clk rounding is handled by the
+ * firmware.
+ * @core: the clk to check
+ *
+ * Clks that have this flag enabled do not need to have a determine_rate() op
+ * set, and will always return success for any rounding operation since the
+ * firmware will deal with the rounding.
+ */
+static inline bool clk_is_rounding_fw_managed(struct clk_core *core)
+{
+	return core->flags & CLK_ROUNDING_FW_MANAGED;
+}
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
@@ -1589,6 +1603,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 		req->rate = core->rate;
 	} else if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
+	} else if (clk_is_rounding_fw_managed(core)) {
+		return 0;
 	} else {
 		return -EINVAL;
 	}
@@ -1673,7 +1689,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
 
 static bool clk_core_can_round(struct clk_core * const core)
 {
-	return core->ops->determine_rate;
+	return core->ops->determine_rate || clk_is_rounding_fw_managed(core);
 }
 
 static int clk_core_round_rate_nolock(struct clk_core *core,
@@ -3528,6 +3544,7 @@ static const struct {
 	ENTRY(CLK_IS_CRITICAL),
 	ENTRY(CLK_OPS_PARENT_ENABLE),
 	ENTRY(CLK_DUTY_CYCLE_PARENT),
+	ENTRY(CLK_ROUNDING_FW_MANAGED),
 #undef ENTRY
 };
 
@@ -3906,7 +3923,7 @@ static int __clk_core_init(struct clk_core *core)
 
 	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
 	if (core->ops->set_rate && !core->ops->determine_rate &&
-	      core->ops->recalc_rate) {
+	      core->ops->recalc_rate && !clk_is_rounding_fw_managed(core)) {
 		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
 		       __func__, core->name);
 		ret = -EINVAL;
@@ -3920,7 +3937,8 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
-	if (core->ops->set_parent && !core->ops->determine_rate) {
+	if (core->ops->set_parent && !core->ops->determine_rate &&
+	    !clk_is_rounding_fw_managed(core)) {
 		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
 			__func__, core->name);
 		ret = -EINVAL;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..187f8248a9c840c701cbbba99bb7cdeef7b654ee 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* clock rate rounding is managed by firmware, don't require determine_rate */
+#define CLK_ROUNDING_FW_MANAGED		BIT(14)
 
 struct clk;
 struct clk_hw;

-- 
2.53.0


