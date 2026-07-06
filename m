Return-Path: <linux-renesas-soc+bounces-34777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R/5bLbzrS2q5cwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 19:54:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932171424F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 19:54:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p5xD218H;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9DDD3036124
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 17:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38364438467;
	Mon,  6 Jul 2026 17:52:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50E8437848
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360319; cv=none; b=dB28x5H/nvubWpQDPjSY+TMdmxbcr8ZdpA/B/Y7ZLfwcLh2VPgRT6K/d77O56ip0wIG0ZSGZfluq8m90LrBxbNbp1Y1BwX6QP9TZrBt4r8Gh4MLh2FF7AGQQa1pbBbJ8UN6XfkyA0lnpRkn7nmPVV3WUiLgqcsMKCG1ENPQQ33I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360319; c=relaxed/simple;
	bh=aWItE0elYiG31I5PB4NtLni6+X27sXco0V1U4LPKbpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9JvR/UUImgqN489tUHGHGQOVdJxyCKNIkWzhm8kRm1qlvEKlLxKtlzZ+3eANy1lclcmz7UK8JgMqjjoicytoLUQx1nL4x3Y3E7KCgs4YlpG2lHT145m2vfNLbWDJwuVs/q4hONrDDuGzqHs6Tma/vwvEqDH1pCNsQ6ZbSPQsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5xD218H; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b7612475so31164935e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360316; x=1783965116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ei06sRFC9uD5bUwRkkwZP2csQsrDC15reaw8YbrgPTc=;
        b=p5xD218HGZytP5U1/yDzjSTvdwtaNGOajUaohWuzQBGnaf9xDpL2kqqQ6zE5PI7w6T
         gsvHe10ABSZGvf2LdYhMkye+7bsKmGRlOn8FMfT1dp8rXuXNurwOd3FVx7mJvIltqhpP
         xe3ypTRP50gHBhcklQsHU55oEsxZ4c8I7yoWs2+3+8a7RIrXqyavn2YVST2mPv3tAu0q
         lNpMNEip9Ob+b6lIeq3Y9XCw1uc3o3dBB/t3+RI5TIwlYQ0bumBl/T90miUtYU9VBirl
         8eEOWxS/TIh0VI/8OF5ZcBlwtpAwUEqucfyHaJ9Y9EIgiXe9UVsrHaHOFF6btQCanZhl
         o3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360316; x=1783965116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ei06sRFC9uD5bUwRkkwZP2csQsrDC15reaw8YbrgPTc=;
        b=pSlu3qlzIv1XKcDrOx7jaFZHQmGfA5m5EmIn3OAz+IsjzHY5iRBwghXsjKsiohfqir
         VY6rFSweE4Rp6E4e339r80+S5XZqVU3OmSBC7AxDuwotF+AobStu3sBuBWuoCEqHVSh/
         nh5V4GWJRpLlH21JpPnMGq41Q6YVFND6U4HRtqdjZvLZlcVZQ1lzwjcUnEiDhKW3Sr9G
         fY9kWPD3OHH21DLWfIL1DCE0LnQbP55wH0Tb0hVhRrwr+hme7xekSb+hZSAd6kmkbHFY
         isKDnMfSLjoyUqJhb3otmTcmLITaLF4/nK211XiT9TEBxRViO3vEcxD4JapWPiepI0gc
         eTng==
X-Forwarded-Encrypted: i=1; AHgh+RocPKTTAzMCt5UNVqBU9nwIBNzHD4OhyHL7VK+LItO8iluqCsoC36g0jOFyhK6BTMTEFwz10dXQ2dfUucxZrk5SEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqlkRqBpNsGfYj4IhIecpAWwkRuqKb4wAyx/B1xWi/CV30yfcD
	+ZlULFQ4IvJLDXCjW8Ax5QaHtiZyMMNnukyY2BEp6y+QltYcuwRnf8MH
X-Gm-Gg: AfdE7cl0WRE5LIIeCKP9BX8hNVMByECjq/gbwUsV7sO3A30wi3PR8h8bsAX0hYrSy3m
	qP4mpaaDNQKbDbtzNOllOse9FqoR8uiTn0f+7hXyJcjPBs8gfeBzUUrygV9v/CZxozT0uUyM8Fe
	ho8oYTfDVGxi1p8sRoR+GK9X4vyUAi9E5JjbBEGpLAj01Lp3JWx+5z2e6CvaSgqMK0St+ps4T9h
	cDSd1tthCdWk815NexwQMJylcWe9pAlrKrms16x1fIUKMMLPtAgaurFHOZZeXMHJBKD5RW5SSWd
	84u5xRRgyco1iX2BOqB/Pam+LRN3YGk8D67HTx1C2dRXSnEfJI0g8QiGwTzrG53IAzPGqIzf2tS
	fdB1JygAl3VsKybjDNM5pXeNu/MywJ/fY3OwrubFjp0GV29ufLjWJEJyxY45K3r89w8PGAeHczy
	c9flmGtl2zBKrdICl5M8nJ8PL9BgVLxmhQN00ZNjRpMqeBdRsikvC1ZHqW9TmptHl8R107q4MaA
	NeEGkhgysh0SsL9On0ThgYDz6cV6bcenzvHVQ==
X-Received: by 2002:a05:600c:4f81:b0:492:4c2e:9613 with SMTP id 5b1f17b1804b1-493df08ca62mr17765245e9.18.1783360315676;
        Mon, 06 Jul 2026 10:51:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 09/12] rtc: rzn1: Use temporary variable for struct device
Date: Mon,  6 Jul 2026 18:51:35 +0100
Message-ID: <20260706175138.12587-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34777-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8932171424F

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a temporary variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 763d9a98fd62..27a92c77f071 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -392,13 +392,14 @@ static void rzn1_rtc_disable_hardware(void *data)
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
 	int irq, ret;
 
-	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
@@ -406,13 +407,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base))
-		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
+		return dev_err_probe(dev, PTR_ERR(rtc->base), "Missing reg\n");
 
 	irq = platform_get_irq_byname(pdev, "alarm");
 	if (irq < 0)
 		return irq;
 
-	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
+	rtc->rtcdev = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc->rtcdev))
 		return PTR_ERR(rtc->rtcdev);
 
@@ -420,19 +421,19 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 	rtc->rtcdev->alarm_offset_max = 7 * 86400;
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
 		return ret;
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
-	ret = devm_add_action_or_reset(&pdev->dev, rzn1_rtc_disable_hardware, &pdev->dev);
+	ret = devm_add_action_or_reset(dev, rzn1_rtc_disable_hardware, dev);
 	if (ret)
 		return ret;
 
 	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
-	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
+	xtal = devm_clk_get_optional(dev, "xtal");
 	if (IS_ERR(xtal)) {
 		return PTR_ERR(xtal);
 	} else if (xtal) {
@@ -480,9 +481,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rtc->ctl1_access_lock);
 
-	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
+	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
+		dev_err(dev, "RTC alarm interrupt not available\n");
 		return ret;
 	}
 
@@ -490,12 +491,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (irq == -EPROBE_DEFER)
 		return irq;
 	if (irq >= 0)
-		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
+		ret = devm_request_irq(dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
 	if (irq < 0 || ret) {
 		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
-		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
+		dev_warn(dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
 	}
 
 	return devm_rtc_register_device(rtc->rtcdev);
-- 
2.54.0


