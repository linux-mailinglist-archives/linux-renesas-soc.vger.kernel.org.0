Return-Path: <linux-renesas-soc+bounces-34242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WNCVH7gzNWqLogYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 14:19:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0806A5A66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 14:19:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WsYSsAWq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52CB8301588F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 12:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5D1380FFD;
	Fri, 19 Jun 2026 12:17:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD62379EEC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 12:17:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871470; cv=none; b=tI22w9zLMfu5R4WodbzU0yVfi4mjgNjB0+xErM+2btvHywFjOVyIWqwKoxVVU3OL8fTcAt2GwvLkrAytBaOt3w6Bt1M3PYRXTW60bu9PwLpZL9FHDFD2efaCp8Kf8V4MUHAR93IvFCzfBtqfKDEyRvjcblCDLA0M0KvNTI+0x7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871470; c=relaxed/simple;
	bh=GVSZyfqnVIB82/XtHTfnb6P2LwzIjzrV2CIDsXlQgyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BU8A5M4/ytMZ5DwbnVxoK+WyrjBEFTNKSySPGe9DgKlKQMX+5ZllsZqQOffkpeav856N14HEnQg1lXTI2bxZlPcpP72m7O60dJyIoBcq3f0gtIYKdHxm0PsCQJDHvbQim4KmmgLjKTdcoeYOjqlCtSn8RiSsN1/BUHqWuQmvkcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsYSsAWq; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-845438a46d4so978656b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781871463; x=1782476263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IytphARiJ/y1+fNZ/OOC7wIYzilTqKlQTXBX98RoHcQ=;
        b=WsYSsAWqYVynlWNlLBkjRJrBFbb7mctya1EURSu9krywdgwebGjrRQGNg9BLOTU3O/
         hkmcr+Bg5QtMO5MsXv6LTmuKpRIxE5GnPFe1hLBw24SC2VGhAHQP6i8AyIksc57bCaQD
         XzVpzE2qKUGY6IwuR/rfgMe69vK7xbdQZt2iOaX0864hSxZ+oypRSj/ubEJDECsM2Ur7
         3KOLwMrePh9L7qw7p5TlLU0kjZ8swn7q80zPTIxXUPomUerkXNpVRS7REg7vQVbndycE
         kKyVbiI9+xPM18G2Y4UvkCxJY8er5EtAQXWlft4O0hLCqQEnu/cRD43P3zyl3cFxm8YV
         xb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871463; x=1782476263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IytphARiJ/y1+fNZ/OOC7wIYzilTqKlQTXBX98RoHcQ=;
        b=HT/skHpn8ZnsLRfImFJAdsQKGUqZNYfC292hxDvhOEbp+em5xmjx46yFsUmBaI2NSC
         D4Xd2qRSoYbCN5vArG6xT2UsAj4EYilK6zbPx1HcaW0A1DT2+3wrRgLwqfGoDpyf/DeO
         KQOaclDFd7CGrgv8+ac0mdpuUJuMrg0Jb+QNZjH4DM0259hf00/gF32/Zr0B63V8HltR
         Xg2/dhq5WtL0XM2jX+zJXbfXmG11cyp6sCeRBEQEC4k56lGD95Q/msrnlhU0ANtTBSUq
         J7LLRHpnWGp6IeLS0NYbmcyc6o08bbvR1N6EoePmvjeCY0b4ZEZ4MOvf+sJZzySvzZkn
         YCdw==
X-Forwarded-Encrypted: i=1; AFNElJ9o/TR/8CqhexQED20RS+qOkL/wqeaRmIdAsxQTRE3ViflNcZ5UqMx8pSWxF197WoCJouWOxuTqohmwr160x8DVoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb9SHEu+BWpVDvHeLcE0V/JlrZTWkyl5/D49X3ZUMITI7xZYbd
	sBFhZDySwQ+5b1Q+67twF/efbnFH73EuP3gt691hPujMzyUm0kLxNxKyz7MZp+Tx
X-Gm-Gg: AfdE7clx0X0BH5O9amh1qTX6XF0uCJOYk0ICcgc8JDWYwiu5Esvz46n5Q+ScrnUCl+t
	RfjRKm5RxJPp0zv/S/JvF0HtRkWp18eiYinWlxX0PIAAnEl9mO2mv5UmvR9KrfTv8cEfYRZlxIF
	SxSIwHN7iMsytUCeWARn+JUxdW4XdCsPvgc2UF9u1ztr5U8+9wujVZ41TFAOQWmJCmK7tVKlMak
	oeHq3qetL+HsO7avTgaHRfXG4dwSV8vZxEYMvG09YkzsEGZwbRBhVDiz08rKQ3FCm17wSxDpf9v
	/9zJ4P9LKAd3L7VwluViz/F2IVxEVi4OiQGaQm3C8j8h6LuAXfeOdMUFJmTXUQF7/WmuK8LS3Qm
	gOp5uobx5W0tMjVuR01YuehrgLiKfd7HqHE/Kth/PO/mIhUHLgeNFJmGYLAMOT6kM0J5gW5Nl4i
	46Vhpwm015Qw+ZMMrsvyxfQLkmzKikyWiWX8Fc43EFNg==
X-Received: by 2002:a05:6a00:23c7:b0:845:377e:d42 with SMTP id d2e1a72fcca58-8455077c678mr3623333b3a.4.1781871462930;
        Fri, 19 Jun 2026 05:17:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382586fsm2296986b3a.43.2026.06.19.05.17.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 05:17:42 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 17:47:32 +0530
Message-ID: <20260619121729.24899-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619121729.24899-5-birenpandya@gmail.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
 <20260619121729.24899-5-birenpandya@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34242-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE0806A5A66

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them and introduce an err_entity label
to ensure teardown logic properly inverses initialization.

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


