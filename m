Return-Path: <linux-renesas-soc+bounces-27861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJh/KVKCgmneVgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:18:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93485DFA79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F4253033218
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 23:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6293246EB;
	Tue,  3 Feb 2026 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBWzV6F/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D7F3191D0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160713; cv=none; b=bmStaLWXng3np+giUhKnhNloVkHX53MwLYSloAHVqvxdrAzlSg5nk4+TMofk+hnU0EoVsgv18RTdjt9A8OTi6F4EdfL+IBKZwUfNVm6DFGckWzF9bF/jZQSJkjeEuP6x3mSIR84NOIfFoTpmgZ8H6zwG7SJIvKxXILiH4jKyzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160713; c=relaxed/simple;
	bh=a8vKkne77LOvoIoaom92AJVMtkb1e2GLPRNFL48TDnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpLe6VYSAEcKRzvjmVHnQFvKxmxD9xuLI4ywXHSkJfgnK6gtH40gkSj8zn4Oi8GKYVqmZKwn+cD8gwTZPbZqE3kuW9HADf8s35TLjqtOrdxeQS8uZ7WKqkUAxm+tx8rbUurwXozHYithXYCnLYUZHYdgx9ypLkLNkUA9xNjRAAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBWzV6F/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4991125f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 15:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160709; x=1770765509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omvaMk73tVK4sT4r3gG1rDVi2ZZXxOVPSdZBLdHJNa8=;
        b=HBWzV6F/80GnojClB05uBojqnuSnx9mgfqAAl7lM37z4401E3eNpS18Ydghnr73D/U
         ykLUy7jyJuPDp1/CU+CjxJNH0Xft+znp6hYiSq5RIfDPz+xGx6LgGxh0wAkMt9dLq7RC
         X/QINI8EIRRRzJ3jyQmf/PyCtOgce0lpfuZVX7AzLICKEn6RBx3/+k1FpivI/xF+571A
         7t/bAb2Pd0dxH60b0sjnvFN/ZZ9xfnvCCVOY+tojmgpCW5gnc+eUvEwizePvNx/r9GIS
         2GirZ/kXVljR/easHZ0xKZM1Ca8WrU3Vao1KsqdBg6bRl1vnrrEHXdk9HvNt2Q4txmep
         Yc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160709; x=1770765509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omvaMk73tVK4sT4r3gG1rDVi2ZZXxOVPSdZBLdHJNa8=;
        b=h0LUVKFF/korEVhpovHX+MBhdR+yLcu6udyOrzULhdXndaWsUIFG/npgUVNchmaLqG
         l9yzS4ySOasPexOy8JlBZx0YQxed9X2LqD70hZQO59RzD9TNI7HrTXUjIfJNmOjvp4x9
         ODk+XuNjJKXDRJJXB5LuZQYBg6DWVC+PZ88nao+oT/nQABv8ve9VKOCyvtQS6/S8xCZY
         nid0ldZSt20980s8YQeulAZywBq9VW4N1cH3RzW8hjhGyqCGtGWrcNAbAMNXaew+wb/N
         Sk7c5QFbD6HhzQb8N/T9F7rUk9q60xb5jWGOKdhtDjGJoO0rB74BhyCifqbbbMGQWHaU
         g75g==
X-Forwarded-Encrypted: i=1; AJvYcCWVz7m8TWsuWakSKO8q2wLNMBmCPosIW3ryp8ybimXMz4VHK2tXMQJUfBputzVkBEMlqdzM1aH4Zw3dadc7TosioQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0hop75rW/8j47fAUByQJID5wjgkt38VIrvzdRA4tl6u2/N/dh
	e9qQijiOjI02Nd9owwtuW9yeGmDVbjJZ9LQ5jyCPWLgu7VA6Cd9HaPv3ZQjAgwJf
X-Gm-Gg: AZuq6aJTDdWFAmnshWMnlwJVQow047sGQhVN77DGsTsgkeSrUxTnglWKMHO1TED2VkE
	xoFvXG+oEhVL6jlzhuh3wJD1ZUbYgz7f8J/NC1EXWjWhxI1VNApMdCdtBoIzgFiz+qlVQ0misqt
	quk8/S5YZJcnawiVYuVPkUe7egVZA4iAycyynC8GEYCyFPi+i1BOiEt81AkqDqpWRujQvnhO0pC
	NA1g264pvkpRsYGfdCL1LT2Q1Z/Dv5TkSAhh+pNgtAq+JsMG66I2ShsAcfMXRY2q1DhQzvt+sl1
	KOIB101y9+5J/8Q04d9dHfdssihk0hq8WR+agQUkRrx3fCF6s77leQIxkj/Xkqnd1OA8l1YRxjF
	V+bH6hQu1+iE19/gOqVX9Fxl2+sBuEPdCn9immio54fWt0yV6Yg2iEhUPwVtP6kULN7/k4rMJyr
	LX+c49zQiaQOPW0jDmMSIVNKk0iguZ8cdlbLY7AKBveKS/iUVrQ5pjeLj4HirE0LCS+0gw5ov+j
	FQYZW7sNXvId2qA8prLTxOD
X-Received: by 2002:a05:6000:2211:b0:430:f3fb:35fa with SMTP id ffacd0b85a97d-43618061b94mr1325430f8f.57.1770160709500;
        Tue, 03 Feb 2026 15:18:29 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:2e50:5c7f:afca:5f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180647aasm1739832f8f.41.2026.02.03.15.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:18:28 -0800 (PST)
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
Subject: [PATCH v2 2/6] irqchip/renesas-rzv2h: Use local device pointer in ICU probe
Date: Tue,  3 Feb 2026 23:18:19 +0000
Message-ID: <20260203231823.208661-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27861-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 93485DFA79
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local struct device pointer in rzv2h_icu_probe_common() to avoid
repeated dereferencing of pdev->dev.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
2.52.0


