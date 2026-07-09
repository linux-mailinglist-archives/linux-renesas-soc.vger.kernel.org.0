Return-Path: <linux-renesas-soc+bounces-34934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id msTiEG5nT2pKgAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 11:18:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E136172ED06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 11:18:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CgozJNug;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 542133008D7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 09:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CC5401A08;
	Thu,  9 Jul 2026 09:18:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8316240149C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 09:18:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588712; cv=none; b=om321EdVn09nJq8QosnB6wFtVvxJ3t97WsWYUwPqSBGR6091UdaGOC7pez5iqy8lXAMgYcveKx10xUMkb/vVF5dxMHXNg8Gb1Fp+oqbg2/yn+2Em2JU6op2mojbW++xaEyUG1b4eHk9jLurbEWNnLHcfx8N1baQstZn/wddk1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588712; c=relaxed/simple;
	bh=2oYX8Ngqt8P13rm04Gkrm4P8lT9wrX8RtglJxUz8wZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRkG5cnMSkGz7KTfSSepytfQ0diMOA3Zi0OGiUHHzp8/IGirISIJvI9g/X0CfoUxhdiszbxwMsjH37XFsrOff5R0K2BMoySUxQOURgE0XhJHAmdZMbxSvyf/KoTtxZwR4pID66wYRqA/fIHSLYcjTWhc5/z8MOQ7Rlq/9jUASZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgozJNug; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacb8416a1so14689375ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 02:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783588707; x=1784193507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VIdnZJ14k+mj5oiEmsN8IAS641M6dsRWUzvfQqf2tY=;
        b=CgozJNug53yfzLAY/uUI0Y3MqXzLCEFZh/xxNxVpxNNi0uf5MuxD/7kzkxX6TIsViw
         63HNWL3r1ieovo80zfXJLQM1NKl+STij0VB5KUi3P1cb0akH4eyK9hFC8zSfpNoElyfR
         lBh9OY4TQnunLLXJAciij7zaDXPxO0z1O3EsvS46I2SbrESJMdBkYvNWpQs7FTY787Cz
         Plf2L8yhlQz4mw3ZmT6uJnJ/WyU3cp4ccyoDfESswVhuwSLHijiEMIGbaeAHsDHJjiqv
         vyfwTI969oZfyCeUeLAPxMCkapjOc1QDdrDPf2NuV9gTUepEhgISkZ//MfWGtkfVzOdM
         Cf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783588707; x=1784193507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VIdnZJ14k+mj5oiEmsN8IAS641M6dsRWUzvfQqf2tY=;
        b=iB46OBKWSzp3eqnf673zve+5ineoNLtVcQ5VuFNw8D5xB5aSHo06RiMp/nlpCLj98r
         Paysm7MVv3wA4SFwUaAv2qdzvrB51Hj0yRlCqkRysXLqdpNDgSfz0jr0MLBwcyuDnwpF
         L4n+eOFov5g9GoyNdWMoSFmX6+RcQ/mdTtjSenPbAoLG8d23JHikQG25uu70BvsHT7jx
         1ZzdhfTv5NhGzoq9cNSCIyqK7UW7FLz9JzYfSgWmMD3P2k/vDNpi1c06cnaI9Gh03WUA
         +zYcAv4lRLeSeAA1uUQ+Qv4wihfV2U0bUWYYWoMliGf2NzMVTCN2v7Zco6LAA1+Sfl+M
         KkFw==
X-Forwarded-Encrypted: i=1; AHgh+Roq9tuHFbKCg9KnnU4d04azPjbT0H2zxnx0vbOJSb+OUDLjl3Fhp8SBgGlyMd2Vbg2i3kx4WFAGfh7cZiYq5SSh9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtk3oRrb81FnBmBe0OfbXpAx3BxXq9uKjdTJHMXm/PxF8PNCJ
	n3JL31dx91/l5kui6Yw9lqtkyVn6mKnJKST1KmshbMTAJgn/VOE7qrXs
X-Gm-Gg: AfdE7cmO00oERhVTjaHbjn0CJWhFj3y8x7jQFYTY2K4zHm7Ns1REUp/WCcjH4kEs+N9
	NtaMH9v/R/92itnFP/+mSBk39VwVQBUzJXnU6S+U54Wq3rbtupIZXH1ZTIE2JGQfdjFztVeSRo8
	Xw36USiShFXuyQgKfvCiZ7Flenjnh0aBQix3ejUNkkap62cvvvXyEBvlyewZtXt1PCmDfiKjeGZ
	Lvfnggag30TJ0AuHPVNsmaghNF+h1O9dQPvY/Jr+zRfrzAKE1QmwteGEnGhbu4YcosThaqBCWGq
	11YXIHf3Vg1wReZD1hmndyR6sDQKMmvzgYcni/ZYDWslYjsbR9m/b7r7tGOFWEeOa4G4tQO2hFO
	rdRh4quEG1u1MpBKQV1m8dV2zLmx5vBS5XSC8NjZh6STZaNbUJAodRv8nPpUAMWzyK51OW07yzZ
	v/6sk25DR6tXTnXazsy5BkoQl1Tv+q90bHVBaz3kGqgIQ=
X-Received: by 2002:a05:6a21:490d:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c0bd1ed9cbmr7288188637.53.1783588706771;
        Thu, 09 Jul 2026 02:18:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm29682728c88.5.2026.07.09.02.18.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Jul 2026 02:18:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jacopo.mondi+renesas@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v6 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Thu,  9 Jul 2026 14:48:15 +0530
Message-ID: <20260709091813.67081-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709091813.67081-6-birenpandya@gmail.com>
References: <20260709091813.67081-6-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34934-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E136172ED06

The probe error paths and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init() to prevent memory leaks.

Add the missing media_entity_cleanup() calls.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb1..f9c818b0faf7e 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2631,6 +2631,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


