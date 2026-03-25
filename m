Return-Path: <linux-renesas-soc+bounces-30274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAsVFp42xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:25:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE432B2E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4596E302C304
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9573D35D5E2;
	Wed, 25 Mar 2026 19:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qkgu1RjI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4F3559C0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466699; cv=none; b=piFhnkcZOpM6yGbdhIbizV/Ur7GIgb1gopv8xxAAL8xZlEMXRWqHpwnqyt6tzj6B3sA5+Wdp2Pdb8S/NajD+pYvF0WTr10wOaBo3heu9vRKRI+t+YbGy6WHmfoz9InGoISpcX6+OyiiltZXZc652zEuLgahcwoHkU0OWKNcJlpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466699; c=relaxed/simple;
	bh=dgTRKIKHWY7QfN3siW9Vi5e1gxmjmQPPrZ9mAAUkB78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYgEIBJLnysl+QjL1EjfBbJYe0h8OYm3UuO7CiP0OPN58WEaTIGJHU8T6HNYJOan0YEKAA4LsZNpfkZxit8YUSphboHYsJMnmVdj9tiyuUyT6pBti5GKUiqsG4+AKDXiO7UAONbPau1JqmF6iXQJJreZBS7i0umQzL1zUA0fZE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qkgu1RjI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso2716455e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466696; x=1775071496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hpfes8V5zwVJBf7WF7qBQtPkrndgV/LsOU/3/FKcwaQ=;
        b=Qkgu1RjIucX3g90M1Hdzwb/mu0VVIyKSj0Z/HZC2AjBhUYy6Wop1avvGdKhQjU1W2N
         WVG+ZxjD9euLF0P9Rs21Rec5DjXSyfQDPDQAtcm9qXDviPSJ6D9yvd3GCFfhS3OT4LJe
         HRrqUStu+Ex+eReYHn61OibZ8DEjJ4JtNBJSSC3cpTcBcYTUyhWPcDrabXOA29z5ALMM
         s/NrZ4CNrAAhzkHga04r9bIfvzz16KvGI/6Bu6NzO0rnym8VMcY0sa33Zri76m+MTrNi
         yuoGp6HKt9d9mjOBdBfioSII5w5L4wV1/QPw3OcVL6UaSwksSWwLS6cBrOCZk/1MiZwh
         0vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466696; x=1775071496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hpfes8V5zwVJBf7WF7qBQtPkrndgV/LsOU/3/FKcwaQ=;
        b=pvFTEnQMRborpq6liZl+B5OaSfZ1p3Hm1HLotxAhKnypzyBzgQ52yd4J56TRfzOGZi
         dfwPvj7X1Mp9zUH2SKu/ejNtA7+AGMgz7PuJnFddlX4/SggyMjlwE7mltjvhm/GxWg6S
         kquXF3yd3AKA/RxbV7J4SZwMungMyhr0Xnn1e8LuH40MYvMJzjgWblk6cBsZ14NyT8Zj
         1BQAkbOMw6EHy5X7GARJNlQrI7huT4wOwxEJxspHgyMGcy7kIWjnXldPZnWQ2sClWNQT
         NC4FlKTR9V4TUIOkaE69TsRH4vQW5mK8ePop/2HS29kxCvxFwBr7G5HLS7exL1TORQq8
         ysdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnu5WHqTxaoJo15bpXyDUXcODRG2nArgl+PWJLp0hIvlv/lK+7Pu0hqI5K99pn4W62Ig8jl60hB/hf8dmieEsrVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnxDhOPqagd225DDcri+HHrwGmh/NoqA1nr9tYeJTH72U3kW7
	CQP/1B5K8H5JfGjXecHto3yx5WkJJ98ThXJkHz1TVL8EZGHqJv/p/6+W
X-Gm-Gg: ATEYQzwBMn0bx5GW/dJDdW+LAdzsoHfWjuiGItA55ZG3N/HTkDgf5lBeffqovQvoDo7
	FQZSFLOM3gSCorOXtymT9uZmNztm+w1Y3fZoIAYeCqTCt3PK8HMt9YaAWMdMLGMeL3GgG70EGph
	JNL/OK+qetYtoXz7BYUX+QyyruMkVFhXn3mHArrmLICtB04XQbmJMIujoUHcT65N9XjbDUYAXwA
	oQTyR6IAH/vtZm/t50OPZPQE7LAiGhYuDYahtyZW54sijkYw5DS/NZdDFDloDYp7Ooh9MGvZGL8
	CuYYXS93yhHpvvgr4b1TnEMtp2zzivdgWUb9e/hT/pwV2tD9sZttdAUBwGLYDAPrCv+d2DYAQ9A
	QQESaJNRxgBENAsLfvJtXsvnEBE8a7Wruo8/YeyeIHgSFE2Ed+pmybcZe+fNxYF0IakvWgxBMOs
	Yj4M1TnDqh+G9lwCRiRi7NnzIe1I7esIwettHeJEGcUOMgw1wdq/9qui/1zC4=
X-Received: by 2002:a05:600d:8449:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-487160afe8cmr51794595e9.33.1774466696438;
        Wed, 25 Mar 2026 12:24:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 03/16] irqchip/renesas-rzg2l: Fix error path in irq_domain_create_hierarchy()
Date: Wed, 25 Mar 2026 19:24:18 +0000
Message-ID: <20260325192451.172562-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30274-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CCBE432B2E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace pm_runtime_put() with pm_runtime_put_sync() in the
irq_domain_create_hierarchy() error path to ensure the device suspends
synchronously before devres cleanup disables runtime PM via
pm_runtime_disable().

Fixes: 7de11369ef30 ("irqchip/renesas-rzg2l: Use devm_pm_runtime_enable()")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e73d426cea6d..eb01d4c5aca7 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -577,7 +577,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, IRQC_NUM_IRQ, dev_fwnode(dev),
 						 &rzg2l_irqc_domain_ops, rzg2l_irqc_data);
 	if (!irq_domain) {
-		pm_runtime_put(dev);
+		pm_runtime_put_sync(dev);
 		return -ENOMEM;
 	}
 
-- 
2.43.0


