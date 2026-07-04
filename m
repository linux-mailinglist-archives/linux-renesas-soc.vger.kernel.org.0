Return-Path: <linux-renesas-soc+bounces-34713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 53YFDeFpSWpS1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:15:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCED708678
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:15:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YZb0hjvv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 181C13003824
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 20:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC67283FCE;
	Sat,  4 Jul 2026 20:15:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4A4288C30
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 20:15:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196126; cv=none; b=elt5V9OwVsEcVaHRaX+F5rNNnQaIuKtVwAv/XsA0U5iwxj2Y5a9nqiTW1L+r1emsyJbIn9pr+j+u30oU4ySgZ2fToLCy/biiCCCGvmfBfhJ1ODLq/OJim1VVb9WNd/S52gk2gNrvnSgNO3uHsClkcrVRhueln/Z4fp725mvhE+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196126; c=relaxed/simple;
	bh=q7/gntLY9fvlAGsuKuXVIOM7kRF/4gu70b4aKjQIsN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awVAN6X4S/vzh9ABItBEJ2wsjdWOSNh5m/J5xx+HZSzdxf2oK0CTGu431vNupk7oKpB578osYCKyU+MQVWairxIFjgMa5EtlHAZmgVf0WhRNg1/pQbIwq75X+ffwsAef/KVzo14rssY/EaPLH+fbDl9FfwBQVcUJjt8t1rCQpeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZb0hjvv; arc=none smtp.client-ip=209.85.215.169
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8fee9f63d5so851965a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196124; x=1783800924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaaoSkHvJdv9eatCdqTi68MzaogKvZcfcaq7QX+kzVA=;
        b=YZb0hjvvWiYvth6N21ZazRBr8Nw6ElzI1q/h/u/abp1bEvXLRJQIGQ1vocm4n4hg0Z
         UElSIfvnYPJQ6RmxV0zqvp5uoa0BeQIgOokhcafPf9/dDkzCqEj9JnpIuiRW57GxY5xX
         D2Q40v80JwRznXxPSahfFe2dRu9Zzo8JapnFyEbalfElBjgR18xjwSEcYgGwcVPmiwwz
         VzYae1JrfqtUKef1th20dm7hz1Fvl5/9qoqmaDoPG3KkAZntWd61TsxJxlApX25nF6H3
         pxVuJVaoP49oZQFeESnEi2QE7f67zfHRyOvjdOP1DuOAkm+/5WIyJYkyifZtm9v6acPG
         Px7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196124; x=1783800924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaaoSkHvJdv9eatCdqTi68MzaogKvZcfcaq7QX+kzVA=;
        b=KIhq3RIVk4a+HvAJJjaUT+73gXt5uv4srYeLfxnK1ndoYjgeaeX9NCqJb40+8DvGm3
         qZBL3OQq9V892lU4Y1G5/8YqUa6XWqJxuxja+PgG328w10GuQbIG/h6Ew9qVTX+FxxgL
         z5c0Kak1b3glJr2AFS1RigpMf9mIQi1IOY31o/76GJsa7xmWr+PDuEASfpkjkfKc5PK8
         iEu4Ij2XM0355pIlDfVIrncBBBtPhBb830Hcfbu5FoJT0KyFlJeU4rSWCpWTHjMV7fc6
         jC3zfS2eNDAqCn7kKXelLrIjLMo7kD5mVaMavpe60bs4yDdktSBd0esrrvQnG+w90iNT
         qJyw==
X-Forwarded-Encrypted: i=1; AFNElJ8tZHQ4DQ+XM9QHTlhxpS5GYBGZqkWONtY+hvyGQb/NidMP48tUiBvbAt/IkStWb1aqb0ZsQxn+KCMac9AeajWeuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdBczFPUsDW4kdmL7yTAjwxqw8GO6hJZ5FtoJ/+Q+2jKp09sF8
	gECneQ7KepsiF6oy5gvgzwZ4p0nuWTVtX6OmPdaX2gnaUCoJc/jaa4jC
X-Gm-Gg: AfdE7cno77AruKcncbw5uuvFUC32e/nfZs/xqt5UQTZJunYkcM+Weyt91zfFwbD8pcu
	aroNVQu5XiGwMP8MQUzg/zurD1HlPu0mRj3+P+HQVnaP6fjcj5RU0ZVCv2QCj7V/iQS8eKhVHk4
	kczd2r/eQ9YxDHFB3FmkBhxZED3fkRSlDGH7sqTtkESQxkf0wWj95XMk6IqfnRq7JSqCZNGJIZu
	ouGEK3kmYCSt0vsCReSldh728brraCR6YERW/t0CXWGNhlnAxru9lY9pIaZp7xqJTE6GwP2IF70
	jkD+HiRMm2DhqexFUQmDIticdN2ESEwV+Xnk3Ejhyzi6svEp05YcwRod+XKSU6y6VLa6PxUSG48
	EUHwi+iL5EGC2kJ4rUV2F4rtD4oUA1qA6fKc6rQCKddpCwurY2f3j+ZpBKJjuQ6bRTplYpQx3GL
	YyKurM3M7bJK+vyIzD9I1IZWkFcE5+t46JoQrHo1mG0Cc=
X-Received: by 2002:a05:6a21:7d04:b0:3bf:49c8:f77 with SMTP id adf61e73a8af0-3c03e1ff1e3mr4503213637.9.1783196124363;
        Sat, 04 Jul 2026 13:15:24 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm6341930eec.2.2026.07.04.13.15.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:15:24 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v4 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Sun,  5 Jul 2026 01:45:09 +0530
Message-ID: <20260704201506.82524-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704201506.82524-6-birenpandya@gmail.com>
References: <20260704201506.82524-6-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,jmondi.org,ragnatech.se,linux.intel.com,bp.renesas.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34713-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:jacopo+renesas@jmondi.org,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:biju.das.jz@bp.renesas.com,m:hverkuil+cisco@kernel.org,m:tommaso.merciai.xr@bp.renesas.com,m:birenpandya@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo@jmondi.org,m:niklas.soderlund@ragnatech.se,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBCED708678

The probe error path and remove function are missing calls to
media_entity_cleanup(). Add a dedicated error_entity label so the
cleanup is only invoked when media_entity_pads_init() has actually
succeeded. This ensures that the teardown logic properly mirrors
initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b56503..61558a71ee358 100644
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


