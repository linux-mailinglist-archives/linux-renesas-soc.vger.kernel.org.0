Return-Path: <linux-renesas-soc+bounces-28437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNaTKyXpnWlDSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:08:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93218AFDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75B5930E5425
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 18:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264302C0F7F;
	Tue, 24 Feb 2026 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTC5yVQP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D042BDC1B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 18:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956020; cv=none; b=iJ9H2LvlMc87BF7JNxRdjdnyhlus07cmChL6v/3rHoR4RdyGooiYhQTeFpUYtVKTxoEh84nXtmKP8YcBa+734AYm1762hZrZ/umvKETD2dVNO/5mRoIfwNEJBiMjwnPQhP3LuZNoWC3entsV939Ai/j7GmJvjZgXZQkFbHnTzns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956020; c=relaxed/simple;
	bh=X8hkRaeVzP67rTNbQ9JivrPs8yIc9gUhUejj4fUO9VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReCbw4zTiHHkq2TFJYQ7nZQrxL+wU271Tzw1nA+9b6lvYTE32n9kAExzZIGyqsafcZfIOpKBwkgSmHw84tSE3jeCSgRMnuW5tJE6mvXdeIzrjXbnXQGnwmkr+cgEh7T4ECD3pPRGc/1WTkLo3AadDynd3LsqESavZyKQusZsmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTC5yVQP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso47268075e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 10:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956016; x=1772560816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBRMewBpkSMo+0SexkQMILcLg2uMAhumMyjYMYu2NZg=;
        b=CTC5yVQPK+nPBN3pXTeZSfqYHAqho+MwDNBgQhtl0la+BisXMzkuQOvkzHzpr4mLvp
         r08oViX5oW+zKKq2jl04V/oByl3QZUpTvLsZwde37eAfMMvw6jsfq6H3vk673TNOhAqd
         sh+tWAmIGiAlwLOzTd1LJovr5Ty3afZC1UWTj2vv+kX9j2b7iVGSS7ARtc3ROkDEUJY5
         vHod98+1Y5+a+qXZbQSYYHVDlx0Q/mM6GHIrzkHvxyCTUbo6Co2EIisn1GEMRkW+cDqv
         TBOz1rI5lrbt4CzUGUnK9nqJM+ia54P/Kz2/ctnEjJ78D+WMG5vTogjoW+RJCA3cGCyp
         /sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956016; x=1772560816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kBRMewBpkSMo+0SexkQMILcLg2uMAhumMyjYMYu2NZg=;
        b=j3aV+d8RGbIzWCdqLa+8buX492rSISLj/4gBRONvmx9xgjb2inwORNi5+M2tMKaiJR
         JqFKUTgDI90G2viTfpRrcSkZvCmS61T91r9mnwrUmGz1W+xO5o+tzFtdxIzSSdzOBxl4
         lTDRZijmkcXXBrVNy7CJ1/XsFNfwBhloX99a8xp1rxDz9roQiVDFtixEdqms7MPqQuME
         noaTu/CVBadyqcne9CT9xlHt/gvK1dX+GqLJeaxwX7z6OpUIGpKkj4coSqMwMPdqz/lP
         U6W7dW0vm4wv3XHjCPR4UqL1mD2Vocl5kIQTmkADU+FQtCq36vcMBYBlTJJEZn6vhomJ
         4sjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSoReAiCZ5IDAnRIbtkLSqHjkMqpURiaEpalsCiCsokCK+R8U/PMjAadw3Uu9N7KK4Ph4BU37e4q20xDVCXbU5yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUIIxUcimqfdyvgpxj+4Q4QRaLOjOxK7Yb6FHhsoP0D4owXjJ4
	Wx4iXqTtNbYpTFfDgUwSzgLa/jQMR0f6YDvLtWfY9AMoUjc+Ovbvftnq
X-Gm-Gg: AZuq6aIwNmxoX57jVmpWVeX3FAdJZCc4QXQB8AeP3HRJo66SX8luWWl7SeRPXVyHnBC
	cyYI8x1vx26+trFewF3s6SED8SjHpjDD6ojUy+GO+hNRU+PqJN0n1jluWm8cGdW7eEGTa7sqkg0
	bt9YbhF6wkWL9TYaiTBwOnPxdsTz7Sbargx4ZsnJ31oga+jb0Itv1DY12l0vQ5SyJosJ2BtuBfM
	cLXOGR07h8rdBRoS0HmGsHB0upcv3klhi0EBzGn2Ui1p0uZ7Hnd4he/McW3su956VEjaDTeGci1
	awAbI+pS2CxfAR+zlRecq9Naojyn+VWn9zhl6bn5/GtKZ31H46rOcHCXffwAtqFVzw4FUSPGw/u
	4w1K9Pc+fSTwSyCtprzilQpQAsZKjDQSJ564vz/6QU3h8f58p66D11nCt4Hxu2mGESyjqwfqELe
	zAoDS6SL7bRY1mQ/D7TVq74GVPEJiMiKT+3+pBnj8qmaOJGTgDGHjeIvp6BmL+ygGzjJYXqcKSM
	52ZJjVzlNLcA3Oz58rU3SPWhG9OTEHZtaFdFCg08Xu8Fl4=
X-Received: by 2002:a05:600c:4589:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-483a95dea3emr276584975e9.16.1771956015675;
        Tue, 24 Feb 2026 10:00:15 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:87da:e3e9:a9bf:6f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm13064095e9.11.2026.02.24.10.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:00:15 -0800 (PST)
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
Subject: [PATCH v4 1/7] irqchip/renesas-rzv2h: Use local node pointer
Date: Tue, 24 Feb 2026 17:56:12 +0000
Message-ID: <20260224175618.3160270-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-28437-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 5C93218AFDB
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Avoid dereferencing pdev->dev.of_node again in rzv2h_icu_probe_common().
Reuse the already available local node pointer when mapping the ICU
register space.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change.

v2->v3:
- No change.

v1->v2:
- No change.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index da2bc43a0e12..20c0cd11ef25 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -570,7 +570,7 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
 	platform_set_drvdata(pdev, rzv2h_icu_data);
 
-	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
+	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, node, 0, NULL);
 	if (IS_ERR(rzv2h_icu_data->base))
 		return PTR_ERR(rzv2h_icu_data->base);
 
-- 
2.53.0


