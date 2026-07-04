Return-Path: <linux-renesas-soc+bounces-34708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ZPEHwRJSWoa0AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 19:55:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E2D70822C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 19:55:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OhKr1X54;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9A2330305D4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 17:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB340375F67;
	Sat,  4 Jul 2026 17:54:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D18C27AC45
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 17:53:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187641; cv=none; b=kOsjxOjlAk2s8LkCscFMujbUWT3Qx+y4VF5T1OUcfZDOP/Z1fO4nLBGgrrLOtLiLFhIjfmwjXm4o2HFFuhE7DIfRUxiQ3gnTMAv/Mt7atEmUhiA6lRvNwO+BhD0t4pV5y05203b9OZJbsrADF3BgiVGrgp4jqeB/VG0s/GOtfZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187641; c=relaxed/simple;
	bh=9qmog2n5b0kAnBBF60IWPrMQr/t9YzSmnsx8p6G1sFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfAwTPJR7Mynu19eit0sduiaEW81ESZmKtzuFH/iF8P3sikTXn6xw6H6I1NeWoIsu5JkWWCG/SIR9e0FbFeQWVP/xlSFgBsuvkoi6YmK6qKPn3HbZa+WYNQH793qTUTWAujjY/TwlOzBE92lUYt7+5wJDDkresE6KtPRKSNqjiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhKr1X54; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caea3f742bso17577025ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187639; x=1783792439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3npAVWjav7GMHxuMuHgdC6XUpyNeQBqQ4x3PSl9Xjcs=;
        b=OhKr1X5411Narl3bPGM01P5mhfwhl/nl5VOoXQJAcsmFmzWAUV/DLfdm/LUj52ANua
         526qoSFaF5f3D1FTpz8PAj4suiUFWzICuwn8ceMermik0jjjMsrGCnFVk3c2Ul/7SM+n
         imks+OBKOzB6nG7d5O9w8ys+P3gMjBaeccnTDV20o11rXz94jmOLSxqoyUR1uT7EmZCQ
         yJC1wxmzX2BduEIKWcg/JUgt4g4a/aIQdMzT6+UOR7ZhMv3nmoItNwpy5n5D5EJ9p+wu
         Cv1nDo7nbgL8ffL9r1d03OG1aR9yWf+JVflaP0QfrbFvyrG+6x3aC1PxEqhUMgAmF02t
         IfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187639; x=1783792439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3npAVWjav7GMHxuMuHgdC6XUpyNeQBqQ4x3PSl9Xjcs=;
        b=kk+nYBVE6BqHJeayg8nbwjkbfOLzQSHtnRo04xA9GKl+6669mNWlYLrXBreM1Nj+xy
         WBOc0t0T8Rq0LmUJKWX0DUcUCNKRCt+l4LUh5eBzV8j4Na2gOIDVTxrD/W6LgUI23tXL
         jUwQd0upHYz9jyEFHhowLD6QzCd18Rj22UyjJd9in0F6vlctrbyuze78vzsAWfmnxOEq
         UMZK0PbSQAkALuzUbA3FW5DAJFD8vE+sVBe+f/sUO/ekbld4nCTxNTrRmHEAx8Y0OOY0
         mzYVo9Fe0udzlgtLYUPZ8l1oGsPkvtuY/RJXqGL8zfOz1Syji2s9kMmzBgPHts7I8UaJ
         eq9A==
X-Gm-Message-State: AOJu0YwCVr9H8cF3Wl9IbmfbjOzc+J+dMUraaCZyiyR141bIelr5ZW22
	+QCHIh5cefAfjfb1rG+9wqkbhWDsIb3lPD+i5/r4mdR3Foo0CtW0IicB
X-Gm-Gg: AfdE7cl4xqrZSfmEOAmgk/hAsoQ5UizbMuOvomHqVPbxnAI9IeXt1dgWe9EblfM6Tzi
	IGDFgswqpuwmFjrcmVgG2bwxiPjs78pHLgroo2i4Yur+0DHwvpHTZP7YlYfy7uhcQqRiuPbjMBc
	KFb+msNWI8qInlvIdBG1eWTLjkKjyHoWPciFw7MQ32vbj83ENOgn1eXpTcEK0G24bzuNgGyzEmI
	v7BEWk/BTRnU4jMWSRq2pGLVcnVMOeuPTIzAI4a49v8/c/e+O8ymFXCVT3yciZ8ow4Sgw8/9jHp
	v4fupBqXum6nfdWF2NJt+xaAdKPaBreVrBgNWZa8oDEMK4Dl+ittJh41Wg3039J+y7s0+6/iUw1
	iWpkbh4hnSi73zmeBuhmW5bsTon/hIf6FiQGjdyYp2blCOySAHekmIamdEdmMjYvzShvN7Nurbs
	5eU7xT08EnIFF8GoKH1RwZzDxIyz35XG/J0i7aVTb56Wo=
X-Received: by 2002:a17:90b:48c6:b0:37f:9ce3:ca93 with SMTP id 98e67ed59e1d1-3829f8e55d2mr4357875a91.28.1783187638891;
        Sat, 04 Jul 2026 10:53:58 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.53.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:53:58 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:41 +0530
Message-ID: <20260704174638.66302-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704174638.66302-6-birenpandya@gmail.com>
References: <20260704174638.66302-6-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-34708-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27E2D70822C

The probe error path and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op in most cases, calling media_entity_cleanup()
is an API requirement for entities initialized with media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls. Furthermore, introduce a
dedicated error_entity label in the probe error path to ensure the cleanup
is only invoked if media_entity_pads_init() has successfully completed.
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..61558a71ee35 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,8 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +571,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


