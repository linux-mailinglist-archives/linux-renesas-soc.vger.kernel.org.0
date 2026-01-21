Return-Path: <linux-renesas-soc+bounces-27209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB0DKTn2cGmgbAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:52:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C77597E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7273B789DA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5924ADD88;
	Wed, 21 Jan 2026 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzSlOTFM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CCA4A5AFF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007717; cv=none; b=Eod7D0ap2frlZjOUPKtr4S6bQXHOar4mqVHXxVomTnMBk4VxBcohO1BVj1ASQ27rwB1cyMqC8WRW8hz1+SKyHk5hZUUzTRd0n4W4aE1BwCooHFokqH/HFY2AIiKBlU+gTt2DyRW5cWYYPVWMLqhj7waB3g+Z3Ez0M/velSakxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007717; c=relaxed/simple;
	bh=nu5eb5oRynroGMCnNukqj+nJoO3Q/QblFeLpl2shU4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0P0XTVMzLHmIIKmQSle7YElXEP2H4uTRJFPClmVR45n+6xriyDWjubkcfLufL/d4a/lgDbb9V6Di2zdxJqZ8dkHuWjerEQU26IbVC4FIskALrc5aXpGkpt3XQNMaKfgKVfkMxn9Hm3/Q0Wksx4X0QuzAbQ1zf+zQDpQG1AfKZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzSlOTFM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801d21c411so25316905e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 07:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769007714; x=1769612514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKfiqRkh5XtZUA4S099iclsE8WGfK6hAsLNATgk0+LQ=;
        b=YzSlOTFMUnxYn9hlBcGEqMpiBPNJAHWf2wPpmPF5W76cNULktAF6sn3lI9iL5hLVU9
         jnezAH2hOcu+l6PW7+Fk/Y9TJM/ctzayR82UAOouS5MgiFafm+yXJdLuszk4jBhqBwZJ
         p/Y2Zp9RxmnrKPoArS8oPBaQ0FrR/ZidbYGXKjs01NmqbPS+6VUERJyxwG6n6MV3hO41
         TJ+DWN4YqLwxgat3kSYLbZvxV51WloDtk0NoitDoyy1oqU24EEh3jxnCl8+mB0aKGP5w
         WjvfGB1li9AhSv8TovxZnA343kWq+Of2NWKVQyfiGqZ07LksxXTnTTuUwG9v8YEguXdN
         DWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007714; x=1769612514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKfiqRkh5XtZUA4S099iclsE8WGfK6hAsLNATgk0+LQ=;
        b=MIlYA1sOpvUi1oA+dJTw6G4NYSl0kU3YdlULmvuvVUtcAEyw/GPecVWUeMTtkuDM8c
         5l1aE86NJ3zdC7Bj3ZoTAlCJvVRXVeZX8G9ZkVTI1kDQVcXNtNNaIMmvzJ9C/HAWx7wX
         yq3sgU9t/9UBjJ66Yl0YEvv10yKhPcuufKqJelc6HWVaf70e58kffNENGf0WMmBLaWW2
         VueqI5s8oKWr3CHKD6+erMDx4e98KEGN33+rfxJyn0RCOJAf6jn0F7PLQmGJ9+LUB1mL
         U7VSyLxR8i71+3Xmg9riDUbLzrhJ3u4dJL+fNlu1HYHJIPLoq/uIoCBQdAJOyQXcRd9Q
         sYug==
X-Forwarded-Encrypted: i=1; AJvYcCV9EzdO4iCVj2VxVI13Cirtq+IkpOre9qQyCTxEhZjg3quG6Q09uISPXUGcZkQxQ780W8nfB/+vP8/Lsbdq1C31nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdfSlssJR4MArs8XqYiKvMP07XLkPKiOdkur69epfgFyHRLPd
	3HTrsCwrvbJTl0ZaKrPS7Q+zEuLVcAzHI4dlIvM6x+4uKfLO15SfhFY7
X-Gm-Gg: AZuq6aJmtD4W7lDGTT3kfNiZ/q1qPrZ8zfe4PKnx+YI1KpZzZG41vPF+/LuHqN7rEEy
	W4csZm/zxB0IfRWaQtPhGkHmFJZdIY5s0IyF9ZhrDZxS6zFfqj9/4BYztnj4yeSKa0YzdAh5U1c
	LB6LR2PNWQK5BglViqU6WR+8jkA/DVlej52R1D0rGVOjdzZoY6tLZ3KMkbJeYdrKwk8uN8GlHlR
	8hUCZWQKhgoA3/0gQktrbtFQ6RJuJjbq31Gu/u8FH5bbMcNwT3xgzS3xoobe6WPnBEo4uR/psab
	qZgghCl8PLSPNDiPX/2PKh8B8NhS2gciIq7X2ct0lSK+zwsyQ9NwNThlkMFx/aSMKKHutUGzFq/
	zZcB18AaPUhIYzeDhiTLjGeTR1ccQ4R+7ZlBOxZFDO+WSPuYu/ZFC2QspzorhGS5o8rHHLQQSgO
	iZsUkN/+2WWjVS4y+l87Mk4WvdlU1qA74jTFXjqoGCa7c0fjoZj1ZI2xdy38RoGwwOvxr8EPDMY
	MKnnDCSp12W++dFyAhjS2pSYThS1Ck6KlJHZWbRruk=
X-Received: by 2002:a05:600c:8b27:b0:480:3bba:1cac with SMTP id 5b1f17b1804b1-4803bba1da2mr99684705e9.6.1769007712723;
        Wed, 21 Jan 2026 07:01:52 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:3190:c653:bb13:4ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042b6a3e2sm24787585e9.1.2026.01.21.07.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:01:51 -0800 (PST)
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
Subject: [PATCH 2/6] irqchip/renesas-rzv2h: Use local device pointer in ICU probe
Date: Wed, 21 Jan 2026 15:01:33 +0000
Message-ID: <20260121150137.3364865-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27209-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 64C77597E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local struct device pointer in rzv2h_icu_probe_common() to avoid
repeated dereferencing of pdev->dev.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
2.52.0


