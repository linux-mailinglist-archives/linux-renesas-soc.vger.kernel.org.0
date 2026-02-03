Return-Path: <linux-renesas-soc+bounces-27860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMYjAlKCgmneVgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:18:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F7DFA72
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5775530B0526
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 23:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C8431A812;
	Tue,  3 Feb 2026 23:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQTjeBWc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F8331D362
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160712; cv=none; b=vGcRiXY+oC8jel2jwJouYbfH2bv1ou4BHCCZBFD8sZNqzZiSXIYd5qgIjZEctxQN4d9FAleKcucn7gmzkLkWeog3o+iL+JTNDOGlTbN+H9kLu3nN17J26XW6Ka0AndG0Feh4USgHPWE77UR0ctEFTM813rEyY7n6HPMmxZb9v+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160712; c=relaxed/simple;
	bh=Yw1CvyzkH+FPw285yDEXihARjsHXEfYJtM/N4/sl9Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cl96WrSAvSSCj6+adcVc1M4qIHoJ6Lc3EhhXPUbwoU3Z5ljaS7jK3FKuudzLzZaXq1frcl1USFhfjkbFto3sBlGGBDdK8feQVmRdhaZ6HIXORdFPB7ns6X0SAtTw6ZVNHXkGPGmhlgrax0+OxWNR3pXlYMBsE55PL/TpsOfbhHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQTjeBWc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-481188b7760so1123035e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 15:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160708; x=1770765508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXpA/VTDvHzRO9xU14YwumW5QB6sAtjndCGdsJjR57o=;
        b=fQTjeBWceGl6glk7UodYb6gdEfQkwk5mOF5ybwa8740dKhBXCQxmPQNiuD6X37+Le2
         /HDzclLkiFI2YP63WLHfv2FEj5qa1CPvaE2NiqElF3wfijIXqqthpdBDiJDsmmiWm5JG
         q4c6f8osuQwJ7ssdn8KVCOJ5EmD6wLcUdhfssNlfw973ioYZB4ptj5qIS30rOX5bISjb
         KmW7sE9nTcQtdm2x2ol4UxurFTSgZNHH7t1yJSV40BLsqLOqbd4f4NlmUHwtkVfQ0qJt
         nUp5BA4lL1dr5/JW5g44DOJqtBqd4oTo6+k03GY9Ayje/e5JD26cvaJWv5DgqX/MYTCd
         WOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160708; x=1770765508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qXpA/VTDvHzRO9xU14YwumW5QB6sAtjndCGdsJjR57o=;
        b=uramOGIwln364McZQ+cPsP4k0aky7rwaf0MAJNyttG1+ONoID9Y2kE+ijovNPKS2f5
         zzprw5VrN+bBOdLMMXke51Dzhhqt7we5yzsziMxpJvWkmwr1VlaQaJ2qGJN+CAYSco9S
         cqFnxNE/oKMYsiS7keqO3nTvuu8IprUv+XOzz4tPS80itEhD6oDa3NBYFFiDXqV3QfRn
         FOxhLRGNTz/6Pfr1l6L97o85fhF9EyzX8n/O80Yfm0tusadyYzeXKq6zy7DzvF4irhxt
         w4MsnFpIRQ6sRuPTifdRfG7PIqbVB6Od97fhLNUogAPFDf5fHGEBd/vvqqV37EBmfw0s
         CkVA==
X-Forwarded-Encrypted: i=1; AJvYcCUQOdqZl4hn5cTVcC0+zRXQJagnfS3UPdsLu6EPMpNhQK6A7gIuS8RvZkzJ7g8x3bNu6SYXuZ3XUFjcRu7m6IFLAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsNFg139VPJCKRUJbFSZAQXih5+Py4dkVBYT91tDUaIbZIeAW
	IVMGFbm/r68YBx0BltEdQL/GcAu4LaVdonwledtXbiEcx86gff01fYIv
X-Gm-Gg: AZuq6aKxf/UkrKyGsYECmMTWKlThbNn3V72IQqDIYvNVCalRVpLOzZ6LosH6eZhgZSZ
	hlM/0Zku8JCkIgOOvneChU7W+fMjE7whrO0mQNf1RYmi1FArymDcBXpKvodm4kN7nPTQyJqwPss
	PPhra+UWeHi7ozqFjCH6ydEgdrWtNUWA3ArQlZS2JlN7WGnf70z7Kknp58/kxdKjs/NNrzMGocs
	OYWgNqMt0mdsnSUh3Rybb07NB3D0HDIi/FUQfJnDcEnVU3CnFqQGGC6lsyAyVEMnX2oxCwE8kRs
	pFnRbOVdaQyIIwjOzkN6iPtWf5LCaCVzpS0jkksH5oZ0/M+TLQgwI97LjZ6pvxNWU6GQgPoh0Ns
	UnAL3R0izANooRZdpSjiaGa4TzA26psuPdrNygZSljOVbY0RoR5yOykMTTjUpe3OlzWQvg0hq+i
	LGCzI0Y2Qi1FRRHe2S32OX4m9E5JSWJLgtCqxmulcjKKb255btACXIYEz6BVO5DMxdHf9j6g3z+
	4Ybd3aeCn7XdSeYO5wHb5sWOvsEhllrWYg=
X-Received: by 2002:a05:600c:354f:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-4830e92457fmr16025705e9.5.1770160708396;
        Tue, 03 Feb 2026 15:18:28 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:2e50:5c7f:afca:5f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180647aasm1739832f8f.41.2026.02.03.15.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:18:27 -0800 (PST)
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
Subject: [PATCH v2 1/6] irqchip/renesas-rzv2h: Use local node pointer
Date: Tue,  3 Feb 2026 23:18:18 +0000
Message-ID: <20260203231823.208661-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27860-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF7F7DFA72
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Avoid dereferencing pdev->dev.of_node again in rzv2h_icu_probe_common().
Reuse the already available local node pointer when mapping the ICU
register space.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
2.52.0


