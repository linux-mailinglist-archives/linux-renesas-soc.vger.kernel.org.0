Return-Path: <linux-renesas-soc+bounces-33483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wK2AKh/SH2qoqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:05:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A98634F80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:05:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mX62Xevt;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA1583121F95
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21473FCB2F;
	Wed,  3 Jun 2026 06:57:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3783FC5DF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469870; cv=none; b=OAY6dH7TjLh801qi4KJQ9XXOtCEY4BNIT9BmTqggrhN+zEg19CUQAsJ6/rQab8NLp/WaGbqT+i7KXw1LXL8bjNgS+Gi4Yww90MWJ6uOjusf8d1dWlkwb22yPG6SUKE5G31Y4/4vcZ/ntRSQEdYFNIcApS5jhGJ196D8MQtufC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469870; c=relaxed/simple;
	bh=DOE7EJT3PfheNZHlIo1/Ata11iEDQupyGoxl7JVJu8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evtv4xtBPMwvdTd7yQSRcoZ4U8b4/jEeWz/c0X4i4LM2qXz5i1MaODaYU673N+v6gzKOSnDDcrpWb3PTBZc7P2bkuYN7prREDSOedd7usO5WcYw6bhikgOmDWSoJfBwvXXpMxqf2W9vw3342vkG3xAXwpshNi7jZY9jrhqgxwgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX62Xevt; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso121451805e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469866; x=1781074666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHOOsGIBznMP5bc1sOgQ6EqGFGggMqQedHi1JZubx9Q=;
        b=mX62XevtsxJHXR+osCoeRkrZ3AL2C5El19aHbhLampFVNSi6vuFhFQ0BNqIzQDQNSE
         r5M9lkYAZldaCRz6yyqb5+ZgzVHSF5O524qp/8Y6z4tbbXxSLfPHTXygdGHY+4wS09Vq
         Wby1rqU8dZBljrTOCkadLMDPCYy94IqjNSkOEoVpVgacYiz1IF2I+g0hLYxPHtAk+AvC
         vmiv61QSx/Fvc706zNoPL8p55rvT7PJEbMilHoPo3HMl3GcNM3XGD6EU77zHsoJziVP2
         4ynPwDdt2IxUA4FiJRbbnyQ7uDsIDZNchQHrELbGfF0jh6wcGAqiXhU/KG95iMiL9Ik6
         mIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469866; x=1781074666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SHOOsGIBznMP5bc1sOgQ6EqGFGggMqQedHi1JZubx9Q=;
        b=SUlLe8/N5HIRlt9/y38Fe4f24HmoaBc6OZgsN1tLTaikHhRujxGYSimTqJTWjg4Qie
         lisIooKN6qUTwiiHAuTcEBW3B7QCn9hF4SPqv4CHqbkAgX/V564JycNpsPUkqSd0WT1F
         j7k3tT2weYoZWVCO+m7gXQmrGxupeHOfygg91vDcFP+tktZkVWW2a5DD0byRfY28zM7g
         y03gmR4lMwcTj3nhpn2H4AZCj5xFa+9nVmyyFP13NF/9dHaf3Nn79zZw2/SFJ002OJk7
         FUOsP9Z/wVIw3Q50fps1NoVngZYEruQaU0CKPK7VTH2NenVXOl6s5jlhq0SRsadXnRqN
         NMbw==
X-Forwarded-Encrypted: i=1; AFNElJ9oBiC8Ewt8hOcN3XVvbAYvlW4FOkxuITq2sFXyWPFDkJD8EcsHH9EU+HYZTbxDXuGvp3e6zXoY88kzCx1ZHXlMeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywtaAQTkAzytIkD0VUpnYygITG3YkG1jUkCobcqaSeM+m/pvUr
	TMHEduKEqmAUn3rCTfBlVaCFJrC7Am1YXqh2PSG0YI9cVN/ZOVq8z2je
X-Gm-Gg: Acq92OFy6PCIzvWL5BrMysZZl7KNPgA2L2/V7gmwH4M1ipnScuMzFT0bzYt7bzcn2rY
	RKWR2VSUiZ9YfQwWx4B3d2ONfYhlhynx0Zm3bolUoP/bqnth74suBBSLVJEBsc6HkvR53h0BLLJ
	T5xwGUsXDS7OYDLi7fk8nBLHFgYN/QBGf39+7Ict8Smt9OkCED0EjWAabvZX4rha+v3kaB/rGfQ
	GJMSeLazoziaxdvVUEeC09OQGOehlUu1C1lSEXn5j+vhDWOmzCT4+MgCJVpc7/1QAyRInTuYfUy
	jnD90I8GDUQ1CyC6//3yFX1gWdR9IQuiNuCs+xP8EYe5W2wKsty7ymrUByvpdjajLNt+xy57PJk
	aGeVryhP57bTAnMFrchNDlD4AZjfdO79gJ3FxVe8UofZxnMZja749G46qQyWbqgmNZsS2mMcryX
	gtjb/y3SpWO3Z/m5MM2M0aLcpt/BqakLyOuWvaqAi3qoe0BnDQrylRQVnDrcIMpywNHju01Q==
X-Received: by 2002:a05:600c:3e0a:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-490b5d2fa47mr37487355e9.9.1780469865639;
        Tue, 02 Jun 2026 23:57:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:45 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v17 10/17] mmc: renesas_sdhi: Add optional axis/axim reset controls
Date: Wed,  3 Jun 2026 07:57:10 +0100
Message-ID: <20260603065731.93243-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33483-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45A98634F80

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has axis/axim resets compared to other SoCs.

Add two optional reset controls, rstc_axis and rstc_axim, to the
renesas_sdhi struct. Both are acquired at probe time using
devm_reset_control_get_optional_exclusive_deasserted() with the
"axis" and "axim" reset names respectively.

Include them alongside the existing rstc in bulk reset/assert/deassert
operations: triggered together in renesas_sdhi_reset(), and managed
via reset_control_bulk_assert/deassert() in the suspend and resume
paths, replacing the previous single-control calls.

Being optional, these resets are a no-op on platforms that do not
provide them, so existing behaviour is preserved.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 0ca8ec27c320..6c024e7f69e1 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -111,6 +111,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 8e2fb19b994b..699872766f88 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -615,6 +615,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
 
 			reset_control_reset(priv->rstc);
+			reset_control_reset(priv->rstc_axis);
+			reset_control_reset(priv->rstc_axim);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
@@ -1128,6 +1130,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
+	priv->rstc_axim = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axim");
+	if (IS_ERR(priv->rstc_axim))
+		return PTR_ERR(priv->rstc_axim);
+
+	priv->rstc_axis = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axis");
+	if (IS_ERR(priv->rstc_axis))
+		return PTR_ERR(priv->rstc_axis);
+
 	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (!IS_ERR(priv->pinctrl)) {
 		priv->pins_default = pinctrl_lookup_state(priv->pinctrl,
@@ -1351,13 +1361,18 @@ int renesas_sdhi_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc_axis },
+	};
 	int ret;
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_assert(priv->rstc);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		pm_runtime_force_resume(dev);
 
@@ -1369,15 +1384,20 @@ int renesas_sdhi_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc_axis },
+	};
 	int ret;
 
-	ret = reset_control_deassert(priv->rstc);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_assert(priv->rstc);
+		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
 	return ret;
 }
-- 
2.43.0


