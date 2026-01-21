Return-Path: <linux-renesas-soc+bounces-27210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FgiALIFcWmgbAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:58:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6701F5A382
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B2B676F5BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5CE4ADD8C;
	Wed, 21 Jan 2026 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYTf7pOq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41C44A5B0A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007717; cv=none; b=pAhlkEs7+eUnvCeUDb1M3MiH+MoP+THJxgXodclAtBUI9o+KGWsay7yaM+WR0+/JkwRIClbr756aG7RIiG1vTNdmsujXcOSduQLU2wwfli0ICWEFNaPLNOiH1JFZeyl46QHrVbNzwkT7J83KorNsRmiwJttTeBXTQDRON6hxXws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007717; c=relaxed/simple;
	bh=Uv/AGRuhXvq3F9DY+5eCJmGmm21g50CP40fZHe9h8kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZoffXsyj/iKVy1x0w5P1d7usIwmktUUmf4B4RSnJZi0SFoASbFeMFccaOi+WSLc/9GMgNTAIsTtyT7u+f2qSsr+b3hCqWwXv6e/gC0vAGj3Xq3y4avwC2oBi/pzi3K9gX4+eKoyG6QUc94i7df0bazyY9JNUKW5fEtzb7K5RiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYTf7pOq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so50573395e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 07:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769007714; x=1769612514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVOkMNI/Fpx1qxHV4Yo6OdiJq8KEdcXkySh96FrgdkQ=;
        b=AYTf7pOqKW0HwC5fw8pHUYAn26Wo4BS6lZVi7oeq5urwvEMQ+dQLiVCS4Jj3ZVLU94
         YnUaIx2DlSlYkx8mTxhOvb1CLbR41uIFfUbmjvJb6+MvfZwOqBix4b4gv3BUcQt3hrNu
         PhmUvBLB1l/S4KZAXEsHxpKctySMogxPQssvQOjCrqjU+lMqsECd0rK5tAuba+s9V0Ll
         NLN4dLwpav7q8zUt4On2WWtirx0M5SuW7bZ7THLGww2uuwgoMovjcAlt/Vm0h22jlZlS
         ZQb6skTllaXQWEPR6LItHHnW1mNIkcgrIqXq5PxTfaHftR6dgifYy7TLLksse9SKEJhG
         R/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007714; x=1769612514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVOkMNI/Fpx1qxHV4Yo6OdiJq8KEdcXkySh96FrgdkQ=;
        b=ACXzNsWr6Ta5ZT8gLrjFBM5x/ZAEGe+f3h5ESrPeOLnE0tVEKqFw2NQLYazM07xjOL
         pXvJUdGB7mAQ0D59ttB5DMnpQEt1WiwzFy3tDajE2N05fPzyuKs/9FDkIRu3NpUd/hfx
         x7bCmAA0t4jAew+lvu71wc5v1rAIXciO6Db8/c6/mAZNQ+gvZ9y02ZL3SnfGbX4XRwhT
         C3DomdXa0E8ZgIMBsfWugxwPmkUthyvwkrHkONAS2hPXXg0w+Wt6Zcir9hV0Zr/62NTj
         L9BUIqb2rD+p4qmIIm0MtW+aVybiqw+B1sHcEC4IUqXwBsBRpF8pypVVF1OKOU9T4HCt
         ScHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgA2ewW2cDcnQe6lxf+f3m4dYCFl0qw3ZisKSMPkd3GDO/WvzsCntDmInqwtSnux89w5CRrUyZz2TovmxBYKvr7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrKyocrV761niWUdDsBkWZX7tRwMpgl9o/IPSEa/BGXiNzbeV+
	xEfYzCCSHlM0MmOr88zPJPN1Iz7BG3/0QVaQS46cO6NlqXmvN1Ef7vKm
X-Gm-Gg: AZuq6aJd9p5EzUeVdErf+rdzluR5/T6jMA1DzPonJe/GkCDj3BfACyLOwtFlCnjUWoM
	dNBpR0Obz8Zy7Zk7Uz/9TDx+6p2O2nL+OIEQ/bk0f0UyDUzYFrbBmmmcIM94UUswte6YL9yuxq3
	VkSk3KZJ67J4prTNC6jx7yq/LcNwQUMd6CqcPCf8l+0CxqnPZ0USubz8RwYq7fxbvQMV7LH0yWT
	qBKLdw01215KyAnL3xn0FcTwNykiw+gvudU7hUgF4YmWMes8S4N0BJL2Lt+zz/olz51yDnMoglO
	yu/2Dv29iZtDhJ7fX5GoSGLPghYtBine0ADEIsI5f/GKL/lr9wzwtvLvD2ndEmIFjzZw9A9tskA
	cH2c9Jo7e4RxrQ0nhJ2S8pAcRQx/KlULalGafdcmD5ttcAy/JWMIrzBUky3TONQnxRnyOwk4G72
	lU8JerC1WLwOg9In6uyECmWrT6KOr+p4Vac7WBETpcAQup/yflEivr5R0Fs93rDI1Y1ZGLvQxj2
	QOxYrILumTJLju2KNLnh3KT5Zvn6nza
X-Received: by 2002:a05:600d:644f:10b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-4801e2fef40mr219703485e9.16.1769007713835;
        Wed, 21 Jan 2026 07:01:53 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:3190:c653:bb13:4ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042b6a3e2sm24787585e9.1.2026.01.21.07.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:01:53 -0800 (PST)
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
Subject: [PATCH 3/6] irqchip/renesas-rzv2h: Switch to using dev_err_probe()
Date: Wed, 21 Jan 2026 15:01:34 +0000
Message-ID: <20260121150137.3364865-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27210-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 6701F5A382
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of dev_err_probe() to simplify rzv2h_icu_probe_common().

Keep dev_err() for -ENOMEM paths, as dev_err_probe() does not print for
allocation failures, ensuring they remain visible in logs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


