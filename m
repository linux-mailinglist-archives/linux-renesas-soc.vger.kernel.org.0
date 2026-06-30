Return-Path: <linux-renesas-soc+bounces-34573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iI6eFZf5Q2ozmgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 19:15:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE9B6E6CFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 19:15:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KgBaN4hq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 622553011780
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 17:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DB23DB632;
	Tue, 30 Jun 2026 17:13:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364533F5A2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 17:13:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839637; cv=none; b=FZMQXaCSWwbpVWrXP2gH6K5quneWcIYssAwng0319zId1JxfFjYTyNYGgp8mv2Oi0t9VxwFlfmXe9zLdhW6hVZVIJ7V5d0ZhgpLhioTEU5K1pAi3zdZ4IpXYvqmTAUbBqOPNFqQPmalsTIucYUu48Dd9L42N24wPjqFnShURBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839637; c=relaxed/simple;
	bh=yIX1bqDOZJMk4FAwTaBF9FTRFIItyzhNRj3qdfFr7GM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZjVRUJdPV7KPGQqC9k9izIooPGE92cKnn6601bYppEz+21awVRwAAuRmuOJC2rFz8kdT8XmrMSN0VxknRIjLGSA5waFwNO/HiSaMc+/e+yzLGS4PjH/jSlmxcUHBGs0JXQxz2cZ60DFAzXkcDnXB5Tz5ohVAvSH3bsi24R2dTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgBaN4hq; arc=none smtp.client-ip=74.125.82.174
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30edfd9cff9so1863213eec.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782839635; x=1783444435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAEwzM4GUMJjKZDLNdDkTnGBKY8hW57ikhpmi3nBjbI=;
        b=KgBaN4hq8AXl/2Tw8UygKtGrj9ErqtvCXOaKXk5xLtTPbza8Dc9mRiZGWyfmDMXjS+
         l1Xrncroy7k8CI8mQzMShu8b8F8qrIdyObg/neJhyYWAb9pEaLX3/lEju0b7GVoqiXHf
         nN93jNSfahGGL2//7tYSunaAmiQciS8AyrVUElvDP4TaJV1TLbRfPA6YyUrlRNVPIiuy
         QQQaa5DeekFdxr5qesUCeFKSmzDgFGsIvQiXh1UBAYNhKGl/TY+gcOdfkACMMBMBurYB
         hgd2XL8qJkIQOmLFSqyX+yyOsS3a9IyqMQPySOtiTfVYJV24f7ek9ITCLUzDH1uLXO0d
         LKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839635; x=1783444435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAEwzM4GUMJjKZDLNdDkTnGBKY8hW57ikhpmi3nBjbI=;
        b=EPa1Qm3yJzwTJlcjHPod9anbHqIcDvKTiI5XQyiY0cZxGV3uowrm2mLFq55AvSIYXk
         p47ndx16lqhp5hwr8hZQPYqbGVSn6Vs5s4iMSB+cVhq8/ypC1dKm6sHmzXr8zkofvhMr
         DB/yn3JSkoDAtpcZ+/irxIq9CyQH+uNhG8NyoQCq93zThFkvkvEAUi/4kuX0ZyfQwGT8
         7+PTon/QlfDUJS3x/rbZFH5Fgp/v/kgsEEbhBz7xB9VQycEpSPPrPWxlJbOpWwIBlqsw
         c2jU+faZ041kz8HuNXXnx6Fj4zf5qVOAm9DuKMY0wLct+fmsCYn1trhQ0McCLpXsalzm
         4V1A==
X-Forwarded-Encrypted: i=1; AHgh+Rqbc3uDjw+J8BKcO2Xn/wKZEntSb6bIUP1id/b8T3gKd9wwRdu/TdUF7lmNTUp/Tk1XMoUjwadtlZ6c/TAHbiAMDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxefjn+gBdQO+5wIp/Etc8KNEHkVMEcmIrCrp2Hl+KnexxmTXWt
	5gmslTsFpGEPTI/z2GzM4vJLTLnjJzGIBtZGuEd8dB+GKaa4hiRbnvuG
X-Gm-Gg: AfdE7ckbNMsgAE0P9jkkM4CuZ/GpKq+Ze34SRJcHW7sbw6uVisV/P1R/5BiZg7X9d/b
	pfdzNT3yYv0yKmchCCQwbDQRjGxLHfTmNJSgFl+3ImdEAb5eWLdSS+YZSIlMTCHmQLqRX1GRMWl
	6FIqXRBuKvC3zXRJEIFhbnjz5jytgFgDRYavXtVlWh75ZH/DF3hhTPrq28aP//uYqlQnPwPOLbT
	6I/+mBqQSJZjVK/XnqXfTfMVVRNUP0wdvZ6IpuKb5AdrVMNuKAqxfiaooLfzcVQYiVwpXqi1EoW
	duowIUvAUyxc/+Xf7c5+WvqcXWpa6pnNRVy4lQnBxiKgBUbDO2GJi9cXZH6E0bMheWDlY6gJMxQ
	nMeZnRjXXsD69cd9RzdKgTJSG1UZtsf3MpxDGLfky8LIfAF4Addls3JAm0e49hVz3qDzFA6zyO0
	Jgd4VlXprlBeJUNqYwpTLHug==
X-Received: by 2002:a05:7300:f68d:b0:30c:63fb:ebfd with SMTP id 5a478bee46e88-30ee134194emr3279885eec.19.1782839635185;
        Tue, 30 Jun 2026 10:13:55 -0700 (PDT)
Received: from ahmi-PC.. ([2406:b400:28:6260:79c2:f49:197:de9e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm19639864eec.0.2026.06.30.10.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:13:54 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH v2] ASoC: renesas: fsi: Propagate platform_get_irq() errors
Date: Tue, 30 Jun 2026 22:43:33 +0530
Message-ID: <20260630171333.36396-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,glider.be,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34573-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ahmisaranrao@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ahmisaranrao@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmisaranrao@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDE9B6E6CFF

platform_get_irq() returns a positive IRQ number on success and a
negative error code on failure. It no longer returns zero. The driver
currently stores the return value in an unsigned int and returns -ENODEV
for all failures, which loses useful errors such as -EPROBE_DEFER.

Store the IRQ in an int and return the error from platform_get_irq()
directly.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
Changes in v2:
- Mention that platform_get_irq() no longer returns zero.
- Add Acked-by tag from Kuninori Morimoto.
- Add Reviewed-by tag from Geert Uytterhoeven.

 sound/soc/renesas/fsi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index ae86014c3819..6be6587e1095 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1992,7 +1992,7 @@ static int fsi_probe(struct platform_device *pdev)
 	const struct fsi_core *core;
 	struct fsi_priv *fsi;
 	struct resource *res;
-	unsigned int irq;
+	int irq;
 	int ret;
 
 	memset(&info, 0, sizeof(info));
@@ -2007,12 +2007,15 @@ static int fsi_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	irq = platform_get_irq(pdev, 0);
-	if (!res || (int)irq <= 0) {
+	if (!res) {
 		dev_err(&pdev->dev, "Not enough FSI platform resources.\n");
 		return -ENODEV;
 	}
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
-- 
2.43.0


