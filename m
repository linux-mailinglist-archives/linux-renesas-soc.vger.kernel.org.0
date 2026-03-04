Return-Path: <linux-renesas-soc+bounces-28757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHBdNZsYqGmgnwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:33:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A89B1FF053
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05C443037D5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA49386C01;
	Wed,  4 Mar 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+dbLhB+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8634D4F9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624004; cv=none; b=nn9gsmIL6GB6SIZZOzEdhlZw1MmSG3qPzhzQG05tKEEX0/sk9JMQS1bBdZVqKKgo/+7L1H7pktDaIDt7j36pTu7RcBKG9rf/a7Go42ki8muLbAxEU7epiH2ldo62kF79OwS3BrFFOhKbHcotlwChDL/gcRNTo5yPeCb9JiMKvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624004; c=relaxed/simple;
	bh=g0JpY4qqML6uYgF5lgCUFPoSd6CF+LvzL45sjQkSO9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/mQ/oa2Gd6oe2iyf/FEp1pHYwscQjgB0UtWTY47n1q8p6p+PYQob+LqaFpYVxcDUk9BYg3R85mJd3pvhHSjMFLUgH5LTU7+q3VHzxuyAcuadspN6g4qzeTvNQ/WezV4p+Fa2n74Fei1UELsPjcPmyBViAucQZE10pL5C3mhcd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+dbLhB+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48069a48629so71821195e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624001; x=1773228801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqDJQzyt/HO+E5E3p1uBbxbxOJuRk+sIa+A/ceu5jZ8=;
        b=X+dbLhB+03ljqQz07xGQLp1lbiLbHItZpNwX98I+AfzjRyo0vm9af7zWkrRCZtZnJm
         ORB6yzNSbBengvI7xU2uehdJv5LWPJM6DYGdLgwKUy0QoFRW5eHGqBw10nbbtS9yXwMS
         b/HPXvRzJ8zTIpfGysHmMETqUsRutEBLuGBm+RFFPQPd/r+aXt4JAzO3sPX5HWOxTDgd
         AF8OSJye/z63RA2RX9nLXXxkGDnmkW/iTqXCH85aFyQd/RMj4htFtPKmVZovXidBFvEu
         JLj1R0A8wYCv02Rp1ymxumtzrehBIOT6bMRVWk9d1UE73B2/iyJ9EgMLDDzpLldC4Mrj
         AkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624001; x=1773228801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqDJQzyt/HO+E5E3p1uBbxbxOJuRk+sIa+A/ceu5jZ8=;
        b=XlomnsS1/9zuaUmXNhxuMcdezHG+ScRf2yFsB9p0Tp5NoJTECwIYwFN1DyiNqq83Ux
         MGtA1R7Hh1Gy/0IV7wCnVqizf2yZZYpLMvHaOTY+mgkRviJT69Aj4OgQROeYo79rmTxE
         YxI5oqAz30XBkvz73lBuhDBLWGtZop9XkevwyeVSS5Z9FSlhDkLHVK/ymM1VkHgTw35U
         rhDEQB75x8W97A4b7W1RIOHLeME20Us22Ld4IImjcu0sE6dFj6lRohUzXUvs5CfvXWas
         n+ptG+WXBWJ5JGi2Kyq5fvwAa3rFAlrgiAGCeeAXNztVxLH3aCMtJ1++xiz+eh1gCW0J
         5+3w==
X-Forwarded-Encrypted: i=1; AJvYcCUcJW57OpJ9Ys+xjRafCQ3wcjD/F/1zoKRx6P10d+5nDVvz8ZPQ0X1a0FZY+b/ULBC7QW3lNt2TwrNdSyAujitBww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbIdInHbdJ/JYaFQ5RjSa5sfiC5EHNHX1PUepNjEXH6yoBMYDE
	D2OOjCtqOgIL8jc5LdZf7gZ1XLyooAHVDn6kwJjHjh2UObbzi8fb1PGY
X-Gm-Gg: ATEYQzxR2Efvd0SUrcp08OePktsZpcEl7St6gl5RSm+Gh7imHOBeMgeuKXCEwWfUpXW
	A+a5bibVZl90euoXoa0gs7KjSuX9PiR1rxNAdWzo7FypsXKs43msMnh8C6fICmCBK4IVXb3UDTd
	hk+BlSJBaBEVxbJqWhWFh3/z55Jm4oR4Zt0QHPPA0vDRunZOio7J0loFeYFXjv5OxLY7zYagIgp
	KREvOd02/K1sxYeV8bWXwmHk5qm5gFHBvznvOUoZnrWcjwz93YGoODEAZ5huzlInrcnAymjfIVV
	SkEcP6EdPwdwW2zkM9KclFcXSHxUyKb4XqM1EarNV2wVSrNnuWTnNn9BjJyuCNJvQ/+5bRDn6gQ
	WKy/zO5vsNLFBd6EVqNqo5kgmTwKOjYJM4TUyMYH4BRjMp8NzPezfJGXc3srg/UzYkIny/XdQPy
	ggbQ2kwhhY7qtiXuOc4RnxG5UqAm3aTt//jRNgzqfKYPZ1xXRksDF8Z/RhVac01/l7gqJe3jO9w
	CbpVR/iZDJinSnTN5RDR/vBJ1skyYDJWL2C3VptsctTaZ1UR51daYX7vQ==
X-Received: by 2002:a05:600c:45c6:b0:480:6999:27ec with SMTP id 5b1f17b1804b1-4851984b278mr29785695e9.13.1772624000723;
        Wed, 04 Mar 2026 03:33:20 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:bddd:d1ed:d1ee:a876])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm27345379f8f.18.2026.03.04.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:33:19 -0800 (PST)
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
Subject: [PATCH v5 2/7] irqchip/renesas-rzv2h: Use local device pointer in ICU probe
Date: Wed,  4 Mar 2026 11:33:12 +0000
Message-ID: <20260304113317.129339-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
X-Rspamd-Queue-Id: 9A89B1FF053
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
	TAGGED_FROM(0.00)[bounces-28757-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local struct device pointer in rzv2h_icu_probe_common() to avoid
repeated dereferencing of pdev->dev.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v5:
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


