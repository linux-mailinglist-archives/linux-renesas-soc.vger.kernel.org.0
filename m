Return-Path: <linux-renesas-soc+bounces-34240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id idqPM2czNWpjogYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 14:17:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465B6A5A25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 14:17:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KmROfao6;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43AC13011792
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 12:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24307331A41;
	Fri, 19 Jun 2026 12:17:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761A37B00E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 12:17:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871461; cv=none; b=NycQckVxZpzXbjrRE8UbRrAg3KBkfW8aMNLytEqVHBhu+RZl4lRH3VGkEP/pqReEmmtGwpR/f2lo1HnW/fPuJjdrpUtgOULxfYxP2M139GB8RO9BfQEhhKUJlCl4s8M4cCyLW3JTnb1Wig/v/UREPTeS72Geee/LbN/TE/I3OK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871461; c=relaxed/simple;
	bh=+8vbcddwfcCWc7G5vVmoTGo3YctcKLtIzOE3zW3ERqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuTqtC8RzAXryAwznZDcNhRwecwiBH/n22bF7AhM5dajC97m5YB8/hF5wfxm1X8mHCytTrhJ5EkPsvkPHtZ6AfV84H2N7PjVgIywe/rOwXlOBQfpBJlvLtCGVs/YNgZw1APlXCG4Uj8A5tVFr+g5CHf/A5Sy06q8WoahjTvmGSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmROfao6; arc=none smtp.client-ip=209.85.210.182
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8424b00710aso1410678b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781871457; x=1782476257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=496VcoG5GxlvkbnrshvnJye/VR2rp+fUki/r0Tu3x9s=;
        b=KmROfao6EpNwKzmtJwKee1I+SsPJUA0GCIK9houEHfZQ39AKXppXhZz00E+/dE8Hxc
         B2nsoVM/0fUpQrye1RkvGBWBlIqYFHO6U8lm7reR3KmJax2LM6G6S+9vZ7SnYCNCacpT
         pWrGhx9TI7fXitLzZHLTWSyJ8BJVb6PUHqila01UH3aM22HlTNjAWeQOSZNDEwHl2yB8
         4wQ0dv15ec3P0OXEoRnATKnNo7Gtf7P+u2g0Bohu5L+uWZN2UtiHGmd1CNEbPqpZA2EY
         SWpKABIwYDiOBOwtYiqbKggoO9Wa1y06ML3hLOJjTmbJ5Uc0L/VmjUT/qWNuTcJNH61F
         wVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871457; x=1782476257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=496VcoG5GxlvkbnrshvnJye/VR2rp+fUki/r0Tu3x9s=;
        b=INAretV2TY47G7bMUadBwFVLwMk9Lv/TA7PjIn7TXdjtDYh0aGSLBAMSruFPLBZvAo
         is5UaGCqGa4iSWPf9imlyhpb9cZrY0LGxTz7FQWmrFxx7Uj8uUVHNlIpNUz7B62OznOu
         t/30+TRZx3JWcCMPjBbR4gd1o6ZbyibSUf61svKLpqe+jZVvegJtWiVwoeC40qTm5iMy
         DTzH8m88hNN3NsDmrON/+4XFhz5LiVH9eu3HZ5XboxS6Wn1PLeDUrIAj5j9l3t4/oeL/
         fS1QGTZYCkSy1xrn8E4EDAd39Kz110tq9XgVKWylK/3aIGR/+boke570XWyLBFm0dpvK
         gN3g==
X-Forwarded-Encrypted: i=1; AFNElJ9inBUqDvKqUv1JSIAnC4zTnQPjCa5WAkjWJ0PQALLQZcf8V6reooG8lEoo1VjUCuvYpxJHCHmfR+KyeBFjz6YuaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2B0CVyObYXhekfx/R6Orp985TRMkyqlGoeebBM+VS7zkgJbnM
	V7Doeg1GGBcHpGvqhdPvUa4uypXcwf+gJJFQzbpVBCfQVjNAZtq1OGgG
X-Gm-Gg: AfdE7cl2fX/OS5mwIfe1NwxkxVDkNwP05eybIk2gt9mk+6pD7UQp1klnQVCwCCXhu/I
	8qhg7xOQuG7ikpH2d9GeO/n/1hz8vGmTKoJNz8WuBgYTm+AeDhf++9+h1YwiES9gK2nGY/hKw9U
	F1szIOl4T5PMVnnWTKCFCohktmTQC8WqzAJny3H/fuNXfR2567gzE3yRpq3+7XDpLPupI/+BvK1
	cBW1ujzfSXmMHvD39sHTdycrLSqmdWRdIFxOc2PjeWqtReThp5YY5hNp4yOugY8WqcHVSzqbnDR
	/cvse9QkhV4blyOm9pZR+z364xdY/PHRL2RmsM/7wxvA5033KyBexkbf1e7wu6Nolte/Up01St6
	+7LNxN2tJO02Z3XNk0u0MaRGm64ohw3Ra/HRBpKb5oOccIJyOZqzrxMjtvyLGelYaJcLYvzThwh
	nN2GkBatUB+NiOzQ97sczgv+BCI+ZkDlK3RUvCXKfviUK3yVaYGPPV
X-Received: by 2002:a05:6a00:9084:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-8455078c202mr3854690b3a.6.1781871457298;
        Fri, 19 Jun 2026 05:17:37 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382586fsm2296986b3a.43.2026.06.19.05.17.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 05:17:36 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 17:47:30 +0530
Message-ID: <20260619121729.24899-5-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619102241.22887-6-birenpandya@gmail.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34240-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4465B6A5A25

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them and introduce an err_entity label
to ensure teardown logic properly inverses initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..61d7dfe14688 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2631,6 +2631,8 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+error_entity:
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2648,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


