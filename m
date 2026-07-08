Return-Path: <linux-renesas-soc+bounces-34903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /3sxMjuETmpfOQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:09:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 75440729077
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:09:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="pg/+X1vK";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56B7B300898A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 17:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F884BCAAA;
	Wed,  8 Jul 2026 17:09:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED669416CF9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 17:09:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530546; cv=none; b=Tyvi3gKMSicUTCvgWQvZLjAJ7y2lNO8LbFD3WVkUrwgzNH5EOR6ib+SBx7SQKV1WI+TEFUFPdu+F6b9lKFQCjabwFUFG/ZpJICAaDTN5iYnJJHpF23QQ0hI9TbafjLZoEcYYRr2rqQT2WwZ7yD0D8mDUCTRUMxukAEYnmkeB8so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530546; c=relaxed/simple;
	bh=rXJvQMnSWQxobBun6vz3L+Ik111O0wnn/SkTaHJJElM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWNZYKy2VcigUZFhPGa2+HRpxXkjKUMfcCg6gLYvt56vd8dRIUnj5yezTrvY62CJgBzLtU8LJyFPHiW5PSQgqlwlEkovlem77NNbdr9aVMK5BjJnTf6ngDdiDw8kIKb5MVi4s1JmoCUTI0EhmzqjEGIxGxTEiqzbIUSx/5BtLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pg/+X1vK; arc=none smtp.client-ip=209.85.215.173
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso525784a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530542; x=1784135342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULPGWoabWt4C2dncnPEuY9DeqKuYkLPNtOiVYZB2zC4=;
        b=pg/+X1vK9QR0/4cvaNV/ZR2SUID5uDcuK7sgrUFOTFfTYCpHRYhR8l3Fa00sp2qFqk
         WrHm1FLFIRFNpPWxXXP6KVz2AWk4iYjDUZ8rE7HfhekILYYF2xrbhaJL6PlK5znYkKX4
         thU6TspORuMXcCMxJF4OG8UwVaQmN+NcaV9X27HgoZoRR3Z60pXtc2AbVWiBUYc7PCQl
         On/GWe78LSMPUyyGmvkZDDTGjni7L69P4mZy0/RUbDW5iaQksxVa9USHjSljnCnPKBy4
         QLQqBPDGRPbr1kE7nWE+DeFZgiKfztt6l3IJmRB9t2tiTHa/QPC2vE8pV/1zpu9QH0h0
         /D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530542; x=1784135342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULPGWoabWt4C2dncnPEuY9DeqKuYkLPNtOiVYZB2zC4=;
        b=TuE4aD5Dr9M1z3VyFcLbiDt91T6ma4I0yfzwfu8VUa6CyMY6FBhIDH5nk+0NJD1shw
         JkJhks6n5WukLizncoQjCNAn2XxZNf/qxYpWSVupLnS18Tf4RVsUtEYtCR7MlG0pMR2g
         WCfr+s6HMtBz/YavszT/3BJL1almP9pyUc0+icNx0zrlDOvmOAYGN+3gaGWbEpGtb5/3
         4eM22NRwzeD1BjKSIMXHbtFb0ubFp6kIJi/RATV9Qa0nw9095LBwfVKa2giPbA4sFWUS
         nDxBIqVoAAX682pSxadCTUcNx2E0Furr7xVYohSDNFgXIxwRW5tU0kfjUXUc0zrbsKx/
         xTOw==
X-Forwarded-Encrypted: i=1; AHgh+RrXOUeXR9WcqVeMEpqY5/EFIqt7ZRQ7Zm2vD/QFnyGzgTV8DkNayIDbXcbWK57pW101Hbs9MWh8BglBpbPXwbD5CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnfZAvd00TJqqWn55I09JA6KGaiR1284oc4hoNXHv2d+21WHWv
	6cqieaHOimeM7KhXpy0PI9aT0GAGcdD4bNRWcs7cZVoRzhgwyNfe9Odj
X-Gm-Gg: AfdE7clt9B9VPnk05KzYNUUFUgh+YSzvAj/6wS6XIY9WV1PkM/4AltqmxQiCQbFMIiq
	f0mgyipJfA0n7Wjxjy/fJpbqlQ/YNhBf+cGxs7RqatVb4FAFBd2v7USM7fvnHmu9pN7h4iUxdVP
	OCYSQqp0tjKjP1JnvU2157FGxDslk1yd45891tsHecjJ+2CSz9UqipnyiHgci0cIMiBSRg/ret0
	zD6NyEf+IQfJeeBcu0+YvIHpQyUrxKJM4FxFqgn7KVvtotck9blljJHr59dPd3O+XT0xh5AucAm
	9ZAg3/QrJ3OiEeUnG/CCLONaNKB4DKQD+iCdrG78/5RnGPbJ4Bwry1bpqBFsfMX3lZjCFp5eKAM
	ZfmvDGSipwFMSshVYtvKzMdLwe/73RuB8uJtvmSaVv+Ip15i8ORgdCx7SRSZHZI+0qui4bwkpqT
	1EIm1SqTZIK6hZkcaxZDpSBlyg4IO38kABzl7z7oi6AzM=
X-Received: by 2002:a05:6a21:4e02:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3c0bd0f8fdemr3778858637.47.1783530541999;
        Wed, 08 Jul 2026 10:09:01 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.08.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:09:01 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v5 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:46 +0530
Message-ID: <20260708170843.55076-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708170843.55076-6-birenpandya@gmail.com>
References: <20260708170843.55076-6-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34903-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75440729077

The probe error path and remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init()
to prevent memory leaks.

Add a dedicated error_entity label so the cleanup is only invoked when
media_entity_pads_init() has actually succeeded. This ensures that the
teardown logic properly mirrors initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b56503..199b70ea841d9 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,9 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
+
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +572,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


