Return-Path: <linux-renesas-soc+bounces-28053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMYzLge6iWlmBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:42:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1E10E391
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9263330067AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD373369210;
	Mon,  9 Feb 2026 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEi6Lsw0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC41369209
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633730; cv=none; b=Dl3ir7qpWJIBVkUsCWislqSNEU8GVlNhhbFI8YAgK484EuayQOPEKEKFBmfl3FfaCrvtaVq3T+/Z6OsLmtr+1hF1ilbA+0InjY4rL0NVhGV3wPNP/q4m6gbONHupIWmZe4GN+ocJEOGfvKrECclWU+4fef8ucvjdqqWcpFvCnQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633730; c=relaxed/simple;
	bh=fxt3A+tirf3Wg8wHczFX4y/PTivJ+DfuE55aboPK3Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXZBiRa/4KN0jbRktHBo2Ga3a8TDHvBedgzC67xL69cLSVqHvxw2vQxhIwlGOiryaLQkG+10T13F++0+46qtpclA85NqO+MHpj3sI2GuepKximnrJY6vou8Cexk9XbctDeTsScb6X8c1UjsgXxqNtNmhwx9n2Z6j6xaYJcSY04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEi6Lsw0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43767807cf3so826628f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 02:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633729; x=1771238529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQGNT8v1FwtWiEhdds68iZnn1sJN93rwtii+mIzcGis=;
        b=OEi6Lsw0GpGG0HGErnAvWtF0HOOvvAAmnCra9UCOGc40XFv88deSRxEwiGJPD/H581
         YrpfqTNwUz/5f0Z2CJ57QuimBQUi3ZFnhJOUoe5eIa6pAzuV8A3+aqAXMkLH6nF6gjK+
         mJ7KZDx8i1p/2Uw4b1J78zG5C0mdxjRWpzp1G3TfuTv/p9rQVOlmfBVT2f2cO3mOOvtg
         dyvZN/s1HctFX9OuVRlm/ExlGaMH7yri+Ev08torsjhb+HhGO7+CJvxAl5JKZhIGib7K
         FEqAYM3pv8CAEQN6I5i8lgqIKyZMjauVD9VHG75y8QAXXKXD6xvfhN2jvv/YED8tHrFN
         nYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633729; x=1771238529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQGNT8v1FwtWiEhdds68iZnn1sJN93rwtii+mIzcGis=;
        b=qJRXICDpcBA72o2I1EucCjsOU4YjOQFLfJAnMOxWXg/F4VqRrifPmzO5dMbI4wrmGe
         ADQD8UL0qVgM8GlOJYip4U1ZVEjMstBUizQsnk3fRJmDkvwhDxVLW/EkmafRRqkuj6Nk
         MvUogB+p5LdBr87kXSV9HdIlPzWDGew6DrJ07ebHcRDJp7ZEMdgEfhTudvklqtqLdfpe
         IFjtih9bpx/YOVOMZd8fDNQErwgxbJ0EavwCGE9eOupKuweaFSd3pwDDOW/wINsIM+Q9
         Lxq9PlKsj45DfdM8gyQOZxP2/tBUjGtaxJ5hpWjMZEoEgWX/EslRXLKCn4Wg4qK3LBX4
         s1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCU85Vwt+HB5JRgv1EaxAfqQ+vzFSx0k61imJOmlxW395wZb59ep27bq1pHrkaawyAfd7CEldjd7ijlpXZfOtSvaqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iWOqWcfmHtCa9odpiLBNnRX5qlHLEiVbJPnz4qKkGl5CgLUx
	MLhaeUyzFWmuUVzYaYF7jwgYdfuZfoUUewvKO+4IwqC1R9T4Od2KqU5h
X-Gm-Gg: AZuq6aJImAar9k+AHMvtxMjRvkHnSlswejl7W7UjfN8ws0xjlbq1KHi5ybK7An0C066
	bGlv3X4I8d9bda6vqVvV58N/XuqfV6v0S5RqE2wuG1vlPT80PsRqX6Q7Fa4pVVgAzNFHmIfRuJE
	2qqgP5i53aNhr7goIU/JgBOSptEjh429qE2Z/7LxhyChFABKMVzyx3eMGkQtUoiu2bzuVNQB1tm
	oyL9J6L2jLuckdY0RBbNuyVhEpu0iyPCXmFh7enHf4x/2bVmi9LiWmODz4OKfSlIhUwQbjUVJjK
	mftzVQZPzcJe36KgU/Z/4nA+jcEYX9CGT5mm3mGQ33h4VC7G97p0lFEXdr3lYSkE9uzTIT2Hlgc
	CIIxmxm9uThsUTrGu02+ELv4NyeviX0IpJfYdNwMWzByvHnbqO/D8eK5aQtJQ+0b92zltLj/af6
	9+XYv7Vz9OfN8c6hhhrmMQWYYppOx49HUc7T2YNIm0CI7RR5zhBdUU4a+FAUgNa5fkMg1DqVkSa
	edmQ5f928yai+YeC/KqJ8/T
X-Received: by 2002:a05:6000:1843:b0:437:711c:8750 with SMTP id ffacd0b85a97d-437711c8a40mr2918530f8f.46.1770633728802;
        Mon, 09 Feb 2026 02:42:08 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:436e:8b6:a7da:63b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm25962211f8f.6.2026.02.09.02.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:42:08 -0800 (PST)
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
Subject: [PATCH v3 3/6] irqchip/renesas-rzv2h: Switch to using dev_err_probe()
Date: Mon,  9 Feb 2026 10:41:17 +0000
Message-ID: <20260209104121.26172-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-28053-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 4DF1E10E391
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of dev_err_probe() to simplify rzv2h_icu_probe_common().

Keep dev_err() for -ENOMEM paths, as dev_err_probe() does not print for
allocation failures, ensuring they remain visible in logs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change.

v1->v2:
- No change.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 32 ++++++++++-------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 766b981cf3d8..4aa772ba1a1f 100644
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
@@ -576,29 +574,21 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
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
+		return dev_err_probe(dev, PTR_ERR(resetn),
+				     "failed to acquire deasserted reset\n");
 
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
2.52.0


