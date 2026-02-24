Return-Path: <linux-renesas-soc+bounces-28436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNuaMB7pnWlDSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:08:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A458918AFCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9738130DE959
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 18:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10922BF006;
	Tue, 24 Feb 2026 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7+MHZ0X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC625333F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956019; cv=none; b=ROFoq7HAsaT+B75FYAVZBkA1ofh8QJWB+CsFwBjDTUXBfhCDAx0/pw4WAG6h+mhoKQBUEwbxOSltesuUvFa7y1sGKLujuBEio4CgAQRgk+q4hQM8rna7fBqML9bV21kMu1FWj2ZSRg6q08oMFfqYmxrh9gPq1CRXNON8CBy4K+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956019; c=relaxed/simple;
	bh=nB6yMNuWdXjsroqhR6blVvypcH+3e9NyyYxrYb3pi/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN3uspMgctJDiwm/3P1e2A2LBFb8cNyihm2aIPiYLjjYIZ2Ovu8PJ2UxXIyU83xdb+ZeAGG3gyrI8bafQTzWJEk2mHjvhi37BjRiyhM6jtFUEabKTRofHQeI37QcQueLsp22RPgnZDnZXoySAbb5DsKukyBu6K2kyKLtwO7xnqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7+MHZ0X; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so63666125e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 10:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956016; x=1772560816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQj4h6bePVftt7yiE6gKHCYyxJvA1sNzyBCL9r4r0qU=;
        b=K7+MHZ0XaV/6Is/Qq2k13lgie0lXfs24GMjF+DMYqFlpUHIvMp8QG7bMe1861JxN3/
         YT+uLrsUVyURsbtK3W48ixnjrIt+SVrScgEefcRLnJJXJk1lQYKoecGLun8ef3W5afeS
         /P5pHCRdSNcgt+RX/OL7lTCqK2Cnp6L0fSVkqicvTSUy7NnJR7CQu+b/NmKtxatBCcmo
         KOSipPXtRMcTeShXdSaJwwZqxUNEWpLgKlC/nLXI2QL1rN7hi3DioJY9WZxWBx9P0EM8
         3px5/OnuK2ccFslf2X5nZW7F4rwZp1Fl2u52R2ShrhDJNJTlwyLYI633MQLQ9OZ43k9W
         xNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956016; x=1772560816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQj4h6bePVftt7yiE6gKHCYyxJvA1sNzyBCL9r4r0qU=;
        b=ZUV3CCZLzk1fPQC6dP6UUA42NWmfh9Xgu7otLxr6JKNiLjGXTI+9KTwrfolz5fd0BK
         n3BZFCL51T3uHPmVAY8TqtmYlBOz8pHfGwTX+8oJbZzOF5yZ0lby7SXVRr5PhA1sUiib
         3e2FvlbS4QZO0E1czQLyOK2U+zh6NbwFlUysKejE6sRyy8ncEWmH5K0lhomUcwX+rT/y
         lMqMk5Gd6/KbMsfbaywQy/3mjKF2Azy2IVJD62AzCC11uWZK2qkT3DKSh58UDYu507vF
         a3CpddKQ9iPXlktqp3CAigJFuvzqER26ga/PnDWvHs5NScvZXduE214SUUtaxu2oLAv2
         aS2g==
X-Forwarded-Encrypted: i=1; AJvYcCVZqHiOd45ke+kRbA8RpfNcOMftLjCQO69MnNkeaHqu6+BN5+MSevv2tXKT7BMonx3pFleMQX3bm/7fQG2/Q9VWbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsN4/7plr06bHpKVGA3qH+me1BdKW5bWZmLTFkZMkqia83pBH
	Codk9iA5Ayau0OuOBCx6saubtIkGsiDDYavdsPs5RJ797cYRWEJgG+rv
X-Gm-Gg: AZuq6aJ4rgAzX8oSCn4mgL3pj9XrHG00W1Sb3fS8hXGey7ZxVA4xMxD2Zn+X539b8VY
	N4o0QjM+PNOjZO61yq78jH4sYZnO8IuAskPlhE8r4LkUsdp2JOLNwKgtsUgDYIum5xZfdGZDl4y
	oSE4MBH8Rz5rpjr69H6Eowevi37NM8O+3aFweW2DePbFeTurAvL5h38V42s9677U0yVH/e/31+c
	aqBJayy8SStKURMI49QJJ/2kTTx8yuacq4RZJv1NaONuaMPyOdVYMuvBPxn1cxWE8oK99sRPDY1
	rtAF7MVSBD8VeR8o59elt52E57PkFuq/j/6x0xcIBk1UIXsVbMvf5dbFs7ZUGoBBEKfna2btPmU
	Xyz65b7PhmWGchGzAhlmWHbqEmCpFdz3puzsF9SOlYfeVgMs1SGg5LugQkG8SRYVZwwdFxgPo2j
	UZN7cGbMwi7uaYba7F/MqK+7HVH00bPKGNZHHHCeDP3pzw5hf0Ek0gpZ9P/yyOsFAcnhxZTdxRA
	OB11bbGfXlFp5+hvPPluX6H2lK/FZXwUML0DUjK5ia/xo0=
X-Received: by 2002:a05:600c:3f14:b0:483:6fe1:c057 with SMTP id 5b1f17b1804b1-483a95e1f15mr207937465e9.21.1771956016491;
        Tue, 24 Feb 2026 10:00:16 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:87da:e3e9:a9bf:6f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm13064095e9.11.2026.02.24.10.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:00:16 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/7] irqchip/renesas-rzv2h: Use local device pointer in ICU probe
Date: Tue, 24 Feb 2026 17:56:13 +0000
Message-ID: <20260224175618.3160270-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28436-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A458918AFCC
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local struct device pointer in rzv2h_icu_probe_common() to avoid
repeated dereferencing of pdev->dev.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change.

v2->v3:
- No change.

v1->v2:
- No change.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 20c0cd11ef25..766b981cf3d8 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -555,57 +555,58 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct reset_control *resetn;
 	int ret;
 
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
-		dev_err(&pdev->dev, "cannot find parent domain\n");
+		dev_err(dev, "cannot find parent domain\n");
 		return -ENODEV;
 	}
 
-	rzv2h_icu_data = devm_kzalloc(&pdev->dev, sizeof(*rzv2h_icu_data), GFP_KERNEL);
+	rzv2h_icu_data = devm_kzalloc(dev, sizeof(*rzv2h_icu_data), GFP_KERNEL);
 	if (!rzv2h_icu_data)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, rzv2h_icu_data);
 
-	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, node, 0, NULL);
+	rzv2h_icu_data->base = devm_of_iomap(dev, node, 0, NULL);
 	if (IS_ERR(rzv2h_icu_data->base))
 		return PTR_ERR(rzv2h_icu_data->base);
 
 	ret = rzv2h_icu_parse_interrupts(rzv2h_icu_data, node);
 	if (ret) {
-		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
+		dev_err(dev, "cannot parse interrupts: %d\n", ret);
 		return ret;
 	}
 
-	resetn = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+	resetn = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(resetn)) {
 		ret = PTR_ERR(resetn);
-		dev_err(&pdev->dev, "failed to acquire deasserted reset: %d\n", ret);
+		dev_err(dev, "failed to acquire deasserted reset: %d\n", ret);
 		return ret;
 	}
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "devm_pm_runtime_enable failed, %d\n", ret);
+		dev_err(dev, "devm_pm_runtime_enable failed, %d\n", ret);
 		return ret;
 	}
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
+		dev_err(dev, "pm_runtime_resume_and_get failed: %d\n", ret);
 		return ret;
 	}
 
 	raw_spin_lock_init(&rzv2h_icu_data->lock);
 
 	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, ICU_NUM_IRQ,
-						 dev_fwnode(&pdev->dev), &rzv2h_icu_domain_ops,
+						 dev_fwnode(dev), &rzv2h_icu_domain_ops,
 						 rzv2h_icu_data);
 	if (!irq_domain) {
-		dev_err(&pdev->dev, "failed to add irq domain\n");
+		dev_err(dev, "failed to add irq domain\n");
 		ret = -ENOMEM;
 		goto pm_put;
 	}
@@ -616,12 +617,12 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
 	/*
 	 * coccicheck complains about a missing put_device call before returning, but it's a false
-	 * positive. We still need &pdev->dev after successfully returning from this function.
+	 * positive. We still need dev after successfully returning from this function.
 	 */
 	return 0;
 
 pm_put:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 
 	return ret;
 }
-- 
2.53.0


