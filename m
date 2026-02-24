Return-Path: <linux-renesas-soc+bounces-28439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMofFaHrnWncSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:19:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F5F18B35D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AE33128194
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 18:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8DF3AE6E9;
	Tue, 24 Feb 2026 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yko5vxFU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBF32BE7C6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956022; cv=none; b=GfcjPVKDzIhd/uchc34xuwI/aiENiY1dO4c6ICNp1h97meEYGRq7crYlkHKiBZdUtrAf2oX4F5PxkKwjlOtf/9E1CFaW455W4kUgJsujH8rI85562cXTNPwO9estTVFHZObAAn1GZ0hIsd8hQISfSIaJLZHK3NdXaYNHIbic+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956022; c=relaxed/simple;
	bh=gzJbMWt2aZUOKuOZXLsCDZ4eaAvkAgOvQMED0lBhUhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3m9yD0OLpuBwHY6B8oaqhOLigUJeLN8dYFnpyyK0RR11L/8W/drNiGAMAfJHNZQxo62xcdQ/+5xSRjqEzCoivEChnz3zhna1nzb0oElrR9ZDanReGrNEcpEeJ/02Hoi8TGYYlBkeleyjt7yT6vlNeHEUmD083oe8ykEbD6VDx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yko5vxFU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4837584120eso40749025e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 10:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956018; x=1772560818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IVcOex3QhSRm1Q2lJzK4niVjsXwmc26ElUqg8fVxd4=;
        b=Yko5vxFUt4nA1CyVctnTnEu9ohhMOiPezt6Tj60wornY6g4C2G2lEgX38DZO5ine76
         bIkdEtGT7XaBfJQAMKy6bpvVpo5RISToelBQeHKFeunEfiODG8LpTU1rTuduFKdsHxzl
         gH7/47Pq4+PNKS3uqDR9dQcS6Tyu/c4z0mvR4BJYOqPculKpsXnF7XWNCXPEZIVhn1fq
         DRRrtAJyPkTszTOnn9GrANwd/EKAzS9RN60oB9psXiyd0LuSiAPq8jMkZtVxw4wDmZtk
         VJOls+riUHSXDLOohYDCoOpWvkR1Qjp1yUtD4CSurvHDHcNEUDm0siRxTrkTNWoF9adq
         vMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956018; x=1772560818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6IVcOex3QhSRm1Q2lJzK4niVjsXwmc26ElUqg8fVxd4=;
        b=jtNLK0ijBwraaCTxFpr51mimAabnwCSjztZ137QUSGtqzT32TEGUzI/gdS52Ej+cjV
         kAj0bmIcTNUOcHFQ2Vaf/M186cGdSeEvJG2jufQSg++Go4PdxyRdbuIWSFOD6tOWd1uI
         W2qF/UKOP7Fj24Oevn47FRCQFFqNLbHfkmwjIfiyutEqycFuD+gc5vJJAWdE3gZ8cRxa
         bjooEbXEIJXB38+ehunVEcjZubc2RMPJQKlTsQswcfqRDg0RZ6h83SCXYR2wOTiNkBAk
         f+qa7irgk26hPl2fE4hCUmuyl3iccTgyy3Vga5nMKvoYsyaLJ9F+oEFDE2eF+RwJHH+N
         wMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpaBjJxvDV+4n9wQPuTy5OY2T5/fEoD7Z5/Qs1jz6Fy6jZ4ecVnUqEt6SoSHPLRijKxj8VgDm0o/Pa/Wn4dq57tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOtokMW3wyRxnqpipzW75PMTT1WC9klp8j1Zyp/0snn7GoFwe3
	quYSGpwYhYzulKqV0ax2GJhofahZReHjqjLLOxrLAnByHK+iMw12OFJG
X-Gm-Gg: AZuq6aLVVXe+Vlnyny1gyoagc1Afhf3yVcFsC78rGbM5UqjxRjMEpsU7dhVDfMmC9x8
	YAfFD/tSmhLTbrmMtyUGUP1O7YwYX4tTXI4p+s0xljbk8LTLPLrpxYQltMYlaw2HKXdzqpF6JCK
	bVU7pgsA+W/pEJGOn3R3FCSOlAMDf0iQwFgKntullj5sz8wUHK5LouVe4+1yjyPcS8entt1UVVz
	vfudE41lRPNmF5SD23V+XTEnwNmT4V13J6EENBglgZn3UcUsj33m/mTfgEjFiK9zGCF/9UP++kF
	ELw4EyQTukXmWohDVsiakSh44n5ub6uR6WFujLy3yougWLy4CvgzfNtTldGtBOtT754R1mehpY/
	11tm0qyKfdQlYFtvKx8ccjejJS7nZ2cl0Lq9IRW6JXXvR9qIPld2aLhbORq72O4+pCYDVApSbI2
	XwN+jURBf5FXJj0g/pPvyzSqVGlXwbgV+6LaAmpq3lOQOaBhQAsDr4igileSs10SNaQyWgcb/n6
	fmi/UhgueWVlp9ad7CMY4fllSA/vzr/yGzy5fsRx0JV93A=
X-Received: by 2002:a05:600c:8b27:b0:480:69ae:f0e9 with SMTP id 5b1f17b1804b1-483a95eb3bamr263521525e9.16.1771956017521;
        Tue, 24 Feb 2026 10:00:17 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:87da:e3e9:a9bf:6f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm13064095e9.11.2026.02.24.10.00.16
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
Subject: [PATCH v4 3/7] irqchip/renesas-rzv2h: Switch to using dev_err_probe()
Date: Tue, 24 Feb 2026 17:56:14 +0000
Message-ID: <20260224175618.3160270-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28439-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A0F5F18B35D
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of dev_err_probe() to simplify rzv2h_icu_probe_common().

Keep dev_err() for -ENOMEM paths, as dev_err_probe() does not print for
allocation failures, ensuring they remain visible in logs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change.

v2->v3:
- No change.

v1->v2:
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


