Return-Path: <linux-renesas-soc+bounces-28758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEHRK5wYqGmgnwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:33:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB51FF05A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 841CB301A2F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550B4386C05;
	Wed,  4 Mar 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bti/6ZHL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6999379EE0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624004; cv=none; b=N93lw/KULgTPDKWnwsDaD3VY7MVlKWETTZSA3KviioUi4wdovFLsTUz8blnbm+GUsxm1x8kOb4wQ7hPRZ45SjPCnHuW86i9ahqN/63LcI3m0Dif+ZFd1btGt6zy9ia5/d4JFMKObK5/A+eZZN+0lJBWJBsN6wY8BD5Y6QZsdLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624004; c=relaxed/simple;
	bh=HVot++CFYbj2fq3XhHb/ZARcDp+BpxyBrOr/jpWSvOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWVCh09Ozp6V0neDZCQDeIxt7XwP8Q1BrNhMr5rQtDWlMbzhcFCXxDOhZxXydMMSYRMg/5PI+Vi+O2ZL1oAaAN/cqCpMsSjhWdR4Y90XWr79WMjUgahlmJVCMuSroy0Hov4CpZDoIzqrlXlEOtIYCzGXk9B4i6QtrspN/MoT72s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bti/6ZHL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48069a48629so71821215e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624001; x=1773228801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95xYVWddCpQ/gguGzPSMWB2CI8VDmnrGAS6VKDyvCuU=;
        b=Bti/6ZHLkU2hkKGMS+EVmOKMcVCZQOrqUSqGFBzWNwM0lGyNmSX6GeGhz46fDlUVwJ
         E/Zjjx4GcuuIK5JPNsPTh2tu7Vz2zsvvoLPw0UvkDVrnydrl51wk5gfONtG1uaK/n+US
         8R7DYp2OE4Er2QPEs8Ue256k6uHBRdB03hmdYS6WGcty48y1g4Ibz7fxNtEjJYXuatD1
         hOnY3eLXEb3n7XuqmZ0MXozO4JU16v3uesDQwxVHKwqaxAQIJcCn0X0Kv4+gPcYWwC+Q
         01ctH6BJwTBN6dQM0wy8rarD7RRsikXyCpNvhF478W9QrwvMV1LB3+3foFCfrGjB3IZt
         zgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624001; x=1773228801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=95xYVWddCpQ/gguGzPSMWB2CI8VDmnrGAS6VKDyvCuU=;
        b=L4f0FDjiNFKuzRpWvi15f13Qx9FpXHYfuUY7MdOyq4TvogTltaYsI3JGtY1e8+fe8U
         sc732S1HSviBXPFRIlrqhC6YIn3ib2TRdYoW2dB8zAD8Gtc1Mvx4dNSbg2/ZUBcNhCT1
         s46/O5h6Qw9OP9j1CnwWBiVjxWH1bNZuje0GsWbEYw8yfaF3ugLtBJquJDzqqFZGM4wB
         YzokIepZc7VLYM67Ng2WDTt+d3E3LF4lXqbylFQZkKADJCjKj9ASqnvhjB7u4No+qCh6
         zu53djJk0MeXK+y+PpHBANFodmCzXvvULuG/Gd2KopPIeIAinLiiyR92+dgck8RTuERV
         tjaA==
X-Forwarded-Encrypted: i=1; AJvYcCW3PtUN7wW7YD0lf/mBnd8HsseIcC4qB9eRX8SHBJlr1kc/Tu1/3HEtpAyAZEM5dt3oNu1v3RJyY4UhQjmFKjjqxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4hZjEohIBtfZQGMYZiiOTCb+llI6FaNY78LzrRs+5aDKJ5HYF
	X3X6ven51MH9oIugZYyMO3uUeNzSBcCH9nOi4+X8WxAZMA9m77Wo5xmp
X-Gm-Gg: ATEYQzxGoL8vGHSvu7uU1Py4gfk7YusLrfTxVqUyypRN8ZzBG3FZEjW4z/pkgxxlgaw
	sbK5EvHW+agyWF5sFjfZso5nB+ZVsAY6ALhSyFcu22/nGdf9eD/qYUTSMVsAYuRaUklwaKK4jBl
	sM9vzLxXlDpraJ9CWek0lwrOxUS8ZdsXyvsNnI45u7JzDooOaZVJPr0QWkbh+kwTG+c562Wqmrq
	5GFslwcQWLpNeDcOSKgWDc07QNtOxolKPw/Yvvtt2GIj/Uo1azu4Ib0On+cO+9aizSOAlVaaW04
	hN4GmDkbGJDL1N3YNuXX5CrvniDZ9GRjShUDEvxtCC0fb9kAG3CUDKW0Z375T9iTCzrP1Zart6P
	qNho76r1c0rYOU/bdawLB9yALcvZk3Odfe3pCnnandmwnHZrueg5jT2AGwvbw5f9qLD/kWwTGIo
	QWIV27Ech9b3+8eQ+3h6RSkKaKcOo3XpN8ORzIoAsDBMS27SZ28uXSvzQLkYGHpntPFMKMM1kIo
	PhXaXqY1Th6CoezssIG5MqMcysN2ZgPtmAbEBgmt+oJIJc=
X-Received: by 2002:a05:600c:6098:b0:471:1717:411 with SMTP id 5b1f17b1804b1-48519888e49mr25537925e9.24.1772624001206;
        Wed, 04 Mar 2026 03:33:21 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:bddd:d1ed:d1ee:a876])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm27345379f8f.18.2026.03.04.03.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:33:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/7] irqchip/renesas-rzv2h: Switch to using dev_err_probe()
Date: Wed,  4 Mar 2026 11:33:13 +0000
Message-ID: <20260304113317.129339-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 54FB51FF05A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28758-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of dev_err_probe() to simplify rzv2h_icu_probe_common().

Keep dev_err() for -ENOMEM paths, as dev_err_probe() does not print for
allocation failures, ensuring they remain visible in logs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v5:
- No change.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 31 ++++++++++-------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 766b981cf3d8..444da7804f15 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -560,10 +560,8 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 	int ret;
 
 	parent_domain = irq_find_host(parent);
-	if (!parent_domain) {
-		dev_err(dev, "cannot find parent domain\n");
-		return -ENODEV;
-	}
+	if (!parent_domain)
+		return dev_err_probe(dev, -ENODEV, "cannot find parent domain\n");
 
 	rzv2h_icu_data = devm_kzalloc(dev, sizeof(*rzv2h_icu_data), GFP_KERNEL);
 	if (!rzv2h_icu_data)
@@ -576,29 +574,20 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 		return PTR_ERR(rzv2h_icu_data->base);
 
 	ret = rzv2h_icu_parse_interrupts(rzv2h_icu_data, node);
-	if (ret) {
-		dev_err(dev, "cannot parse interrupts: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot parse interrupts\n");
 
 	resetn = devm_reset_control_get_exclusive_deasserted(dev, NULL);
-	if (IS_ERR(resetn)) {
-		ret = PTR_ERR(resetn);
-		dev_err(dev, "failed to acquire deasserted reset: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(resetn))
+		return dev_err_probe(dev, PTR_ERR(resetn), "failed to acquire deasserted reset\n");
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret < 0) {
-		dev_err(dev, "devm_pm_runtime_enable failed, %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "devm_pm_runtime_enable failed\n");
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0) {
-		dev_err(dev, "pm_runtime_resume_and_get failed: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "pm_runtime_resume_and_get failed\n");
 
 	raw_spin_lock_init(&rzv2h_icu_data->lock);
 
-- 
2.53.0


