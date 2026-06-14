Return-Path: <linux-renesas-soc+bounces-33975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AhocO3zeLmqg5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2026 19:01:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DC681A86
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2026 19:01:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DZ3pHXv4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D1303007C95
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2026 16:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3695A3ACF18;
	Sun, 14 Jun 2026 16:57:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD74937C0EB
	for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jun 2026 16:57:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456245; cv=none; b=qoHsY3ulG15gw8FKKi0SmKBqi2NmzAFUTzBIiLlcI5Ps/0XVR30J4VDP3LFjqSaZqQOlXxVHLhVcCTFbQSVT2R7x2iAfchUxnKxi+IsoEKVGXAAPh0ZFnfdxT5rbHVdaHYUwL3GK9DKeeHC77J3XZC58qKQFH1mTnIHDme5/pY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456245; c=relaxed/simple;
	bh=+ac1mYHN8edhb8mHSSOjCFrWiSHfEhSixJe7tHd3l5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCRgxIFsbG03lNONeRBhenkqERjOrdvT2/rbDIji3Aver3kFSszIZlLyXpCD5Wjb5hp0Ai5c4wh/Qr5WBRgg4eE0cWmXUDsCNU/4vizg3SE5GHveQUPKlNpPdW2T7UZpAntD22z5li34sruA3V4wLo3kpMM2fS/lJkShWL1S7OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZ3pHXv4; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c3315c5dso27407605ad.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jun 2026 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456243; x=1782061043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJF0LWnFFWDFVPFPP5uHXrlcwiyNNjMXAyKrVbw6lNQ=;
        b=DZ3pHXv4mRlrOXgZEDlcGIBi+fncLR5ZzKd7sVbsz5ZYikeecY+2wwtoJBfkI6bhN9
         vFeUfbVp5JlOhlsQuDcFVA8Ds4quw4KOZLE1Ys7zRUZiNqIdgFS41wfOvZRODMlPd4xc
         +VhSNXKXh54YH9jCj7ZgZUthZFrd9dzj7LVx3WaSwbgInr95WK1yB6mVhVJfTvy1KNgz
         HJNH2IKkhtdBVu5AHbZBecslYbfAoqa3khi9xlbLgh3UxJmLoU3D/Ekad7PtxmooZ5Ph
         lUqLaunZhEVRXOaS8ihl1JczZT28NRnWNsa1h3a65qTV4bsteo2AthlkS3PZdtgyCx5c
         BrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456243; x=1782061043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJF0LWnFFWDFVPFPP5uHXrlcwiyNNjMXAyKrVbw6lNQ=;
        b=gSnJCSyfhPnsxsstRFg9wFbMHYwW1eIga9MCOJLX2h8rVxAqxFy7oaqJllbUsTcd/w
         vHURWXmJHJ/UNJZpIM5zASSIwzxngG2mQRj4uSLeRET8uQNIYOu4zOHPwq0G7QjH973f
         7nv3Z2T0VJ3jn4o2VNgif82VyXFrkfoPVUKv8fjY8X1FUPLdXIlSMj/cmbrh+je0jTaG
         UjUH+uj7uINq2AgYD8FzHqJKnuRLKoMwqlNzwAQAu5hLdQbQJEUvcak2YG01RzqtxY90
         dg2jLmZZfwyOf9u4DA8K9PHztXdNLJKyPHLPxryw5WARkXyqfzmPApWJi0ZfEcwzzDo4
         5i/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/vZohbWmMALLPl6H2naW4V+fWbORSWLu9wd7ZOynQzmymehGmoVrW97Nl9SDhl/JjxkCtE26Jq8kPENoxs/vDy2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL3t92OYvSexLrtRGNx0LQ5oTpp31GOmXZ44MzS6M1yVDFxKYv
	M4dQYJZWZcl/M1MzcgFZwnqigUrir+ojdjLTWGOAfN/ft28Y9n1RLhI1
X-Gm-Gg: Acq92OE8dQtnEWmu7/E/Z165B8W53z/b/bFDacdLmzFp9gyg+Zf3ngWocngGTpqHKLe
	yncwm3466cB97BzGAQTsl0Rk8wxV6t9fnBvfMrDpm10UYG72Ebl0yiLNuXcGd3AigQ/O7UeJTWs
	QECaZYeordmaxR+n9qaXHFOkY0sAYD0mshxSkEJmgbbkWBZ7bRG+fKEn9WxSX2/qbr/ldnU+Ey6
	3KVgYFeEWH/CkmqAi/maABW5mTH+XwbSxf4YrCF+yHxN7XwOQKUe+SaZZmri693MtSdlFf1WB4a
	djER8KgWgEZ+X+3xTRTxVXTUhOLRyt8jqdTQYZySKAkkQmBpPHGzfdrhwuXv3PTMRdKJWIXvzxC
	t0g+jf0KywwJhvhLEBKnCtBNTfEbeWlIgySWEo2MDelc2gtUsyWwqTvJ9csxoJ/5COuSTKMZWq4
	IE3HeVmIabxYo3YGTMZpKrO1v2FbuRkl22QTL8YGnNOPdtFECPXAKaL4lVUkqRszQ=
X-Received: by 2002:a17:903:2ec8:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2c411d7b13dmr127349825ad.21.1781456243350;
        Sun, 14 Jun 2026 09:57:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:23 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/22] media: platform: rcar-csi2: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:47 +0530
Message-ID: <20260614165630.3896-11-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ragnatech.se,glider.be,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33975-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 513DC681A86

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..c4e35cac97f4 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2634,6 +2634,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	return ret;
 }
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


