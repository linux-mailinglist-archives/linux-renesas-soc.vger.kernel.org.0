Return-Path: <linux-renesas-soc+bounces-34344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +B1/CoNyOWqgtAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 19:36:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4C6B1824
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 19:36:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o5rzdukn;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F19283055C17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8876E34028B;
	Mon, 22 Jun 2026 17:34:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C287D33DEE6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 17:34:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149646; cv=none; b=uJNKYPPZTto575QOn8zxTRxtaIes3OdMveJdCTIuklI85eekJ+u+I3sp2iI5UHFXH8KdYc/9WQ+2ZBOqNZrc9NrIL837XQ+mN82Uniz8IRI0HLGoexfxOuMYU6DzMrPO8nmlc65b46hJ5Tf9388xrJU2Tb81PH52o6QouWH7yOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149646; c=relaxed/simple;
	bh=UGtdfUu+IvCc/FTRQGqWK5e4uHvzgKdZIdr7QuD80uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDIbd83iMztWaWsTjVyfBD5UqMUlYvwD9ndJVBNr4uUZUErDXSUQ+9eKpK/Ez/cFzBW3Do1afe/5Xg+bOgL2jfRiDmKUjI9Qbmgp60e9z2z7rgiv1p+OSfICaQyabC3rut8Fsl7ulo4Z9876gOwAqJbbJwKjLw2mUoOjVrRKecc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5rzdukn; arc=none smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f236418so2411991b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149643; x=1782754443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjCDSDX5rdJBNz6pw3IrU3j4G9qavxrdCNiYTuZgJ2I=;
        b=o5rzduknYrxsB5iY7NM/RUSN54M0jmQWq6293sF8XCbKX6hy7xZ+8QOPFPIAoKoYCg
         e3UAjN93W9u+9XixCiTm/q3g4cSkl5kIZ5VtmUKORcDXnNMgg0j9NM0vGtPq3Fi8Knoe
         fBuKg82RIQqpCDnAs3XzhIxrMb2KKR//CgJP58Gb23BtdWGg6yCJhsiE/d1FgCAyb/uy
         8GdZeS0OsgH/YiQDuYjyDL6A50qR4ejjxQFlGDuPRtQYNGzfhCLLIvkbyKas1UfjU0kO
         LvKkIbDcLs5zZ5+ymZSRghA7r61hP6I9VRc/xJZ+dIP4wgqDbfwliD/lpUvnJDvfQf+E
         ky2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149643; x=1782754443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjCDSDX5rdJBNz6pw3IrU3j4G9qavxrdCNiYTuZgJ2I=;
        b=smtiyDJYiQjnbRiTx/JY4GWxMeKEyJXYj11bUyV1XJCY/ENWe8q9p+80rFosSRhkCV
         VCT/bCva3gdtjujrQhk6bEqyS19nn1RmLSRgsDLMs2p/awWwjHuV0jhbOGhd0uX7+gkp
         PqnLNzR/iqThAPCA1y6gXI9Yza4vAy+3ngaj2opAIbJN6VBORhgwmUaxiB7Yis47g9gt
         pS7SMZAUYv+sq0EFeiOuefeKiwCMcc6gYBSqB9VSBItoTd6A6GJjYvWsL9XMbGCHcoKe
         efz0iNBYEk/IVSlFyd/CEjUr3eWmViGu8zX50VIfTFVBAxngSTF7df/7Fu7h4+cWUwyI
         1R1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ILPNk0Zxoy8R772GWeHazNWumd2OdAW810PIhIMHNBtix90nS/31nrYbCGSCQzFOPbJ/CvdA0aQgPnFhximCsyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj4jDR2Ue1+uTfGaEaNYA57K9n6fVJOG4YgKzNyZlrgV0z2Pre
	2KKRZFpVm4kbvHkfoNLlCC5htiq+wbAPfxgYzMx1sBgjSi8Rs0JVIvtB2sA3ceCR
X-Gm-Gg: AfdE7cljZzA2X9M3a2rf3BZWgfajfmJEGm8KN++Btz3hr5GOLxjf6/3+Lv18+5XWNbR
	U8NQR+V0Hmf+3JzTfcEYaknhOAOKIwnOZUCbw+zIQ1qpDqPP+cOpohSQVifWptjnduvt/SLR4pW
	IonjVTonM5R9aiI7L+bLpydWHniW/r+N4u2HCrqdXi/NW14uLBzlHdYPkzbO6qLVSgPmiFYT1RA
	4SsDsLJcaGmdAGVirNLS5k8EnaHc7yC/SmEJXt5hTbw+dZDdDzTXVmQ27R04RT2gM8EfeVaTyyk
	tbOUF07hV6+MMFlIGPR7XBIxWmszICeMxeOuRGjguO+DKlUSjkx5MxpcI1In031G1VohsIGYd1g
	RpojLeFTnouA9Xt05o74sqBGMv4dJQT6sCM0wJB58rNdziFrLDDvnxFAYNTImIBukhJwLANt4tL
	35gH8qC1iAeWtxbLr2+0eLOO/ShbQp4QomRJNxOE+TEg==
X-Received: by 2002:a05:6a00:2d8b:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845508bb8camr17065797b3a.34.1782149642920;
        Mon, 22 Jun 2026 10:34:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.33.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:34:02 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:38 +0530
Message-ID: <20260622173334.60491-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622173334.60491-6-birenpandya@gmail.com>
References: <20260622173334.60491-6-birenpandya@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,vger.kernel.org,gmail.com,ragnatech.se,glider.be];
	TAGGED_FROM(0.00)[bounces-34344-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:mchehab@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AE4C6B1824

The probe error path and remove function are missing calls to
media_entity_cleanup(). Add a dedicated err_entity label so the
cleanup is only invoked when media_entity_pads_init() has actually
succeeded. This ensures that the teardown logic properly mirrors
initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..5bae8eb0ee19 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1211,7 +1211,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	ret = rvin_create_controls(vin);
 	if (ret < 0)
-		goto err_id;
+		goto err_entity;
 
 	switch (vin->info->model) {
 	case RCAR_GEN3:
@@ -1246,6 +1246,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 err_ctrl:
 	rvin_free_controls(vin);
+err_entity:
+	media_entity_cleanup(&vin->vdev.entity);
 err_id:
 	rvin_id_put(vin);
 err_dma:
@@ -1270,6 +1272,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_group_put(vin);
 
 	rvin_free_controls(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	rvin_id_put(vin);
 
-- 
2.50.1 (Apple Git-155)


