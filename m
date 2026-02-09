Return-Path: <linux-renesas-soc+bounces-28052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKllOlS6iWlmBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:43:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F8D10E3D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1A52302E401
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08FF368290;
	Mon,  9 Feb 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC62rWA1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE85368282
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633729; cv=none; b=Hc/AKi2j0Z1/tGwyc05WjVCQFe26dzs3zU1i6FrIx8WkhpR4ATtDjz0vOWm2mR2etlG9vlIhW2Itz97Vfy5nGIOVuE7/KbcrAQnxUrcf79LHx0Eaj48bZqEMb8hSramE+6UwHtUAd4YRDZeD5BFN9mB9xcAA6nD+tDIKQBfPabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633729; c=relaxed/simple;
	bh=X8VRsDJSUKbzQeLVYD69jLukOlhuzFACaxjGzj9VlIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LecAHYUDf6Kcogq2he25HAIw/WB34F3PD6/Fam3j13C9fXheWAHl3PgLEWWD8TEwH5Tu28Cl7O8MFUpqMXXgbEcgUa1TX4pmtJMxNwtKfNCjUhdjEaHRvBxBhuKOTD6eDM84qvDG5MnO7Fsm7ZPq54c8LnWtdUJaIKYLJxi3N/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC62rWA1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4362507f0bcso2527663f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 02:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633728; x=1771238528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjZGwoGLvpD/x60R9yhO9bbOT/PRB//ibosQk+nz2+I=;
        b=LC62rWA1K7KciWYqJnfuHL7CJZCN+gg4p5StCucztjfd67sJmod+wEn6Nain+aRNjI
         dRPG0kBaOeKu9Y59+PMsJvF1GVMTbweCCc9ty5ZaRUoKlnDsbocZpR3zXcbQDLdz7PaX
         Rg5UJO07EneZdV3LwEHuhjYfc0yqyqQuACqHOxo9AFQdCbr0fvu4gtYC0FlAVgyVRbIG
         IMl3Cdzf87rsbMUZdRSg96VQEBDuTWNyp1kdIqP0VF+l2BW8m0mtude2UyWL/AqR/JP8
         iHXqeIBTQBZciEDzfb7RnKBxwJCcVi0T5ivFX611F2Inh1Es7FzPH6ilB/U5CleB7LeJ
         n9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633728; x=1771238528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rjZGwoGLvpD/x60R9yhO9bbOT/PRB//ibosQk+nz2+I=;
        b=nqsKBboK79LR8GdGP6YPfR3Td9IhBwwXuAKjjRjDqLlDQ/hug31tR/kv0hyXzLI9dl
         jnFrtstcM7VwICrMbb5DR1ujgSRAbYosPHWo1MyGu7WdOz5rzV18Ioz4UtA2HB7NCP8c
         f0nGOqTUb1wpAD8JnEY3ZkZNyHCkgHtnMR4slf7+2dEEi/33c7VE9KqqDrKwg8dPdMiJ
         hD5z4XA6LZnl3cSfXuScr+H+b8FPjI3NhdAO0h9jV6hvQoX0LmavP1Sw/wxyFunkOjDs
         ayevxRFeg/OCbktkHUi+Wj6TJaKPDYSs0i2UZMI+VuGcArbmbAP2kEqtx8LNrOUazPg3
         9B8w==
X-Forwarded-Encrypted: i=1; AJvYcCVdEaR7VLX+wtav8U3Vxrz48jGgRG7vePwIKqZjAfKygTrNvmjyYui6b+YcNTWQBTgWifQ6Aojk7kI2RIivGfQ6EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzukTtT+1ibh3l9L0aXeKouvKbtT242Iaae6vJZuDkkSk5P3QLW
	9g6sj4BIbWjfkjsOqKkjEUvF2faivg6ncJiCuzyG8JJOOwBBFadykdN8
X-Gm-Gg: AZuq6aKhuXlvDSwwrLSunHo5fCTFhimLe0qZX4TOfWCER+jM1iMDeaTKcp7GAdTsb4I
	XiU/HKSpwMZ730MU/9p0pcOmFGPsybjcrrOkfJ2PPnlvUzXjCpqVWFmBlkrEh++6ICv5Do1tTSC
	kh4b5frpIOv1PKT7MacotoYYCy1nHX0OvzlN0f83jFko3oRRhC94UWWiwWcdS9+KiO3MVY88mbS
	s04lXCokC844iXnEugDWE3c78b/VyZqKTz5jCXPuAf1QpwpCHVYX2NsQpH03lUNInp59CCXnv+p
	WCbhqjuyFtM+2/Yh1myWOg7p8USzlpVJY9eyhLo9uJZpsuIXhI13U2mVFG/k723ZbWA04O6OTpP
	/KEqi63TuKQbeKsMdlFgARclFVOt+RZEVNYH3q33MDiRnpybByk/OG65yoCIszhVah91BDn9Sjd
	37sBtS/BKa+ctpj/m/pxrXB1QAGvSMRV/UQ9CkxeUpg7y0gIIwpfy2mDZFOqo09rvPkJOGiThIe
	awhX1EV8AxAWQppyFhH4OOlewiDkt4/ATM=
X-Received: by 2002:a05:6000:2210:b0:435:92c6:d556 with SMTP id ffacd0b85a97d-4362933ec62mr18293299f8f.16.1770633727746;
        Mon, 09 Feb 2026 02:42:07 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:436e:8b6:a7da:63b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm25962211f8f.6.2026.02.09.02.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:42:07 -0800 (PST)
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
Subject: [PATCH v3 2/6] irqchip/renesas-rzv2h: Use local device pointer in ICU probe
Date: Mon,  9 Feb 2026 10:41:16 +0000
Message-ID: <20260209104121.26172-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28052-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 50F8D10E3D3
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local struct device pointer in rzv2h_icu_probe_common() to avoid
repeated dereferencing of pdev->dev.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
2.52.0


