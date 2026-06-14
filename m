Return-Path: <linux-renesas-soc+bounces-33977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a055IZHdLmoA5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2026 18:57:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D66819C0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2026 18:57:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=M8tGUaKJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D2723003808
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2026 16:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F2B3C65FD;
	Sun, 14 Jun 2026 16:57:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8442EEE88
	for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jun 2026 16:57:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456252; cv=none; b=FBBOIqXkEhEWGplyaRXeZjOhXv8lQj/eWDmcGR07GDlXnJnrtEqS9wEfyt2xkkbQk1wah6jpzklfneZvFpnoZUeOwFsk/Kr7Z5FnUMu+0kob9PfjJuNEDXXcapkw+UKtvYB4KocXwK0cRt+LWtOPCgFY2MA9xArjc4G9LAiXlsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456252; c=relaxed/simple;
	bh=BNGN1bV2nN7rnMkdTKtIKT6IixZTEuyFuCKxYicGbhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQ1leQ7AWbUR7wtioA7tnAMrVkKtzY/Jxa/qUObnSqxy1UphPLpvqkWFw8RDi4jnq/QllX8BTj6rGUwTdLpnE7v8p7icPQX+1b75LOWmdXg2uld5Z+oxEbdSzBKtCTktl8eLjXpQ8W/APMSP95e+bcNj9pTT1E5FU/mm36xz4TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8tGUaKJ; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1540308a91.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jun 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456251; x=1782061051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L99sVtNytpFRVB1bghhyyea1pubOB/MzWaAimiWcNk=;
        b=M8tGUaKJAjp0wtCMJggOjcw6B2eogFbU1JNonjo5q0U2vznvqw1TVDOXvznXH3C8iG
         qB9mzFmdt1faT2+eibuUcK2vV6D9HGiNDpr20xR+F3WC5Nkg904DaCLbHCo2mL9WY4DL
         ekJBSqo0VC/NN9qQ+W0qtzuZmCSEzk3hxGBA04wGCv2Kjp2DrFA1VCTGIjHSOmu+d68d
         xldYBLl0nRj9RF9NJqdQ2Yoe1vfu9KcnEhaUcwBy9U38cWoqHrn0xt6CJ4H4L//5b0uF
         a4D/1v+6KMp3Q4QpIKlFXRmNPxhn7dtr4+zsemPzI4M37v3aZkePFbLBzlZPIbCnRLgK
         iQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456251; x=1782061051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+L99sVtNytpFRVB1bghhyyea1pubOB/MzWaAimiWcNk=;
        b=nKfFD0i6mTdlCUGoTSCtSgkDqqep1j8H46djLvWisphYO4HqWsQmUz1utUGL7F2RdS
         5QyPUhZaaMvQjQ3LaI43pKc5FSecax+Y5uNxVJErGciWEqWzeQmO6M0b5w6odBpw5dK7
         vH4cVltU1X52SL3mOC3Qzht36kFp6qBJYOTlBTsQAD6I2/tgZT3hbVBtSiWrfPvCRrde
         mnXO7L/NYS2FmjVIIKoIyxQtUlpGa/11alcKLNUd2IxrNVxO4JbwqcFt8BDgb7QomPLH
         vWgg408CacWD6UUxSQ18eweHsl9hTqrr74OcB4zC9x1hfdBmBL+BjNxRfHXdPIk3wpEu
         jZ3w==
X-Forwarded-Encrypted: i=1; AFNElJ+7VPSIsPZWX+cN+QyHnY6P9NsbfhF7K17/QDanxMfkfBAeqFJ3p2IXA7MdFr6DhS9QUc4Dhtrnd1YzRTqtft9hOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5050PKKESV3qmjxK9Vo8o+WUugbsrOsPJ916HwFGBRgmfTh/D
	1fuVaHSckTPkSul5nQp1MQKdhNaYhbC0+eAGCRe8MBAKCdKZS2lY2SzX
X-Gm-Gg: Acq92OGeMI+B+mIh9y69ExTjD0/td2yZCk1e5kh0tu+dh4jyVoGBZLXQT9cvJkHYSYH
	thMW25OvoIyzMiUN4j/EgqDrZoYPEQc4KZEJ+LRfpewrBJ8sqjtvMP9f99VmOOAatNTFWYDsMrW
	yFqBOydqklV9jKJ2IVBdEHRO3ytHchLb9N5gnMUw3WmUiilSFyS3L2BpMSHOWqs06GtqDVPyf2h
	Y4+fjZRwNxRrRQHusj9ifMiZl2a0If4c7//G9ifO1oRJiSE8YqzySX+BWcvaYZLpUj5uexxU1G9
	mOlucVZx5uGQtpQO+Ru7+Cl99WRW7Ud/lZrqka1K+AHkdmzUnyyuSj46K3zgI9e7nT97fckjFQj
	UO5rboWBCZiXqb7JkHWYLgdkousvA8WLpr0w3AFrN7Z21kUZw3bio+WBesyJsIj04EWwuzs7t63
	bJSwYozM7owxWhxEGg7hn+Z+T5WzHTUPj7L83L+DRL8Gvf+i+6TY6i
X-Received: by 2002:a17:902:c942:b0:2c1:ef9:450e with SMTP id d9443c01a7336-2c41216d3f6mr123255135ad.27.1781456251045;
        Sun, 14 Jun 2026 09:57:31 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:30 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/22] media: platform: rcar-core: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:49 +0530
Message-ID: <20260614165630.3896-13-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ragnatech.se,glider.be,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33977-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 948D66819C0

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..a3952bcbcc60 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1250,6 +1250,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	rvin_id_put(vin);
 err_dma:
 	rvin_dma_unregister(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	return ret;
 }
@@ -1274,6 +1275,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_id_put(vin);
 
 	rvin_dma_unregister(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
-- 
2.50.1 (Apple Git-155)


