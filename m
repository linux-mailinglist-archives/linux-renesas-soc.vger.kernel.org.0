Return-Path: <linux-renesas-soc+bounces-34500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sWrCFA1DQmry2wkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:03:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3636D89D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:03:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cCXdRHBL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687FC3037169
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 09:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7154374A02;
	Mon, 29 Jun 2026 09:53:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7B235F5FB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 09:53:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726827; cv=none; b=TupG97ao3XN6QcVNdq9AMiG53d48x+fzA7lezWOs+7Mnx/MeJIfXABVXu/BmzH5kVhQLlkN86CdZ8Q9ySWU7KyRdOpiEdTkiZRdCkCRzOIUqqG4T6UxBq5jPv4iJWVakRJgyhfSOv9mElyZcDoJJGuMRnJOcoVzKSuFTGV5SIu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726827; c=relaxed/simple;
	bh=eZXbYWd3+DHodzK/Nlp1aWVB4wmV32J/g2oDx39NSvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qii2rVCxFqYi9nUi571fPeRHMcFOPaCMtL8ir1RyvT/RVXeJ7rLcEM5Nbu15DTuDyvi1Fr1uu6JakN3d1bZiG91ccQka6r1oI8FlBAt+Us1GfE2x4xXMnPTaG83Tb7voZdDACf1svdfYULsyq0l1v+1SRSoF1z0n3uZ2WznNCLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCXdRHBL; arc=none smtp.client-ip=74.125.82.179
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c965eab27so5796296eec.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782726825; x=1783331625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmREBHA2uDvzogPUZ5pu6n0O9BRtVdNjBfYIRe4Dqqc=;
        b=cCXdRHBLLY07fLv9/XLk77wid48N7km1Tc4+5aUN+DoZ6OQeNCHj1qy4nDIM5eHD7s
         nwTDXJSPKP7RStyEykVtp6/DJKkQ9JmX+VkT0dSbl0KYaVW5DuV7N6MWnAlyhVV+86ni
         OEJB97LUcmrYWpksgE3BQfSgpkz0UfT2dT13LMmtIgx3iqD2p9NPH8/c4nIJwFt2GhMy
         rEDR7n0Esh1HDZcqqKFybG1kQSaWu1QB72DeGNWnF5bukvoj980HVo7aVmPuhFHvHwuQ
         bVVifJkUErzIAPlc7PAFWWdEV8Ri8+yXghfOH4yz5I0oJ+uBBSg8ZlqvUiFbRA/zxTIv
         qbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726825; x=1783331625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmREBHA2uDvzogPUZ5pu6n0O9BRtVdNjBfYIRe4Dqqc=;
        b=KMKrmbDcaRyoNwSgnuQ/ew/KZnxzyhfroVKvcOi6/IDdHIzlEV6u3m86KrNOzZA7V7
         ebNOGLgZDzto6KSmabIcCPUfBLQUGbaKZtqK+QIqw/zjRKMmuM7d2nn1zuAWqAlOyP++
         92SLK9dbvMHgCsYMqSKN0s6XEoRCSlsPLd5UviOWXQFSCSkePubf+nxdtDDHvudoAmJy
         qOHPc/3H3RpMpNsIApzgzwfxhqs/I8yMb8dG7URaGtYStrEDjw0okV8J9Gosu8TspzE8
         /D5g6+zCkE/gr4b6D6KrCoCsIfPYYsrVkPfpTRKNXqC8PzyPC4NXnjb6tAFRLQASAPLv
         3Xjg==
X-Forwarded-Encrypted: i=1; AHgh+RrTDh8hiLoqTmoXBDasIuOAtE8IAYJKL0FD/j4PPCF+PAGH7ti/7G1bhJbVqpReOjq9sG25A5efPl+Xl4HN3ea2hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaS/is6jm/J2oZ6x+kTmQYnaS/ORReIPnSCTRGipPgi55uIk8E
	obyVZpMIi7gVyMPNq0tMZ0bmH/jFI8tbRYRIqfEWJecB75RR6cOtgk3OtRweF231
X-Gm-Gg: AfdE7ckXuNT39vFzDNEuYX+B2/P0bm4u5ls6+8cTXnyqQ4B4bTfERStQLPMnOhieH91
	aivMsUifpYQASgFbj6Z+oF/EeQKmWa0pwRHyw88EU6Jw4D9haqpRi6caHH2ZGSna5NuMz3jmvcQ
	/ZSu3GygtMyK429s0agW2Ul8DN5gIC2BPYSDtOdIvr/JhmEyGM3EVxgv6L1EQz7M/gInVMALdU4
	LNl386JqKeLRSAiXY5nJkghX3xV3rB5hIHOw8WevJqnZ/7hB8w1tGCKz+9kgmACL0OHUSXOX1TY
	OcGqt9/9SjdYdoPgJTcu4M6SX/iusr/c0hOU2TqfH1b5OeWvb9yyJ3K9zQhyIzRbFSEJQiULmy4
	CYj6rk9f0/le76TbaGZ79Nn0q6WwRUxq/kDO6iBNz4+5stUDBTcnroltm/bzrYQJKCbS3BU0bA5
	30B3B+UiEeN/OiaeK1Ug==
X-Received: by 2002:a05:7300:6dac:b0:30c:9f31:b631 with SMTP id 5a478bee46e88-30c9f31c2f3mr11313039eec.33.1782726824665;
        Mon, 29 Jun 2026 02:53:44 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f7:9f6a:fa0d:2e9a:ebc8:7a93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30cf86deed5sm24767052eec.1.2026.06.29.02.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:53:44 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] ASoC: renesas: fsi: Propagate platform_get_irq() errors
Date: Mon, 29 Jun 2026 15:23:26 +0530
Message-ID: <20260629095326.37302-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34500-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ahmisaranrao@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ahmisaranrao@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmisaranrao@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB3636D89D6

platform_get_irq() returns a negative error code on failure. The
driver currently stores the return value in an unsigned int and returns
-ENODEV for all failures, which loses useful errors such as
-EPROBE_DEFER.

Store the IRQ in an int and return the error from platform_get_irq()
directly.

Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
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


