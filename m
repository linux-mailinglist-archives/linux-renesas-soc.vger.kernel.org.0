Return-Path: <linux-renesas-soc+bounces-34243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aTeOOrkzNWqMogYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 14:19:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF686A5A69
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 14:19:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WqRTT37S;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FFCF30182A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 12:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07538331A41;
	Fri, 19 Jun 2026 12:17:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1137B00E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 12:17:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871470; cv=none; b=PObe2AzjqW3UI57+W+95ZMnXuUHW2CUj099vwRuX4g+SDXwC8ZiqQbBoGwlsh37tVIXWnKP6LvNEh5q7TX6E/wyP624bEKTQwQjeFewGXUxCvvTrMKlSYgtq6N0dG1xGZHoInbmtPTg9kKDmJuxtSE/wC3GXvw5mhM02D0BpIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871470; c=relaxed/simple;
	bh=8kgNGg2BjVre8/bahBgbgCYsOBrRSClntsD3Q+v6kCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1WjXc1lQxeDBDyvH8JFJ1S+C40jNP2gx6ZNoCrLRdgZ7wDWSFrGdBxPNAqcfRCN4/w7bZEvtUR1oQ5qBoEgpYWZdSyFAla9Ws0Z2Y/cQXsBb6pw6ht+rGXtapGKaUxGMcxSvGDCHrbcijQlbcPnSYYoDaja+G+T0FtHgcGeKaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqRTT37S; arc=none smtp.client-ip=209.85.210.172
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84540eb70b2so1113332b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781871466; x=1782476266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOK/pDK0ppzf76+A3kfllKRbu7IV027uhUgyzteLmmA=;
        b=WqRTT37SpO62gZyHdhC1NmvZW6qdl+9FPa7yd38JhKg+X28F7f09Q3ojNIM7KA1TPR
         eNvG7WB45RvSA5mWHQu3ppCQiIiY2lVi6ZhmA9ayeO6gmHC6WhHxjVlVrzBo9wqxAX10
         +yyVZEOoULW4n7Q3UHqW4w8WXB38Mm1w7ClFAxcvjRQbA+KFcAWk5SZ7MKRu3cj37Vc+
         wIPS+o5fdBTzxU5mWxWVb6ziV+d4NyIbR/o33Yabd85zzIV+rdv4nja4K2obUQfY4hKS
         E5HO3U+/gAWsszPJSM33NFcqdUQrIU4dxqe5T09vcMDOapXAJmTBYb/E26UBb2qMDjIW
         IxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871466; x=1782476266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oOK/pDK0ppzf76+A3kfllKRbu7IV027uhUgyzteLmmA=;
        b=L0Pxpz0cXS37q4WWQdoQqSGsujZxRDQI1IXURf5t9wnREW8bzC6smN+DK2mMVeQhUF
         Q3NgDNBFHcX00W88oE3sKRrCNtJu9lQrbRmcWC2kQnuIsXfkNQ4pqIcOwys5F1tFlQCK
         ZTh444v26Jm+PYDHhr33aOyxKh7fc0njgBKbvTmbC/mv3iuDSkGhttHzU3GqjoEJdn7r
         OaGQJR6ZjguQ5bcR+qVl7gl0F5+zs28QQhsUls+slxGtNhljRGtphKPGb/HHumuEsH7D
         TyWG/EN/MSm4oAHv6rKxUB4Zmihc1/PbOKKgSxBfsH+Ch5FUsn8CF73qBoMrDnuWCoGH
         ctFw==
X-Forwarded-Encrypted: i=1; AFNElJ9V+5gCLa0VV2WFy0f+SgUh/r18Rs9fLsaZlE335VeJ5uByBvHLp2oUy9HOOXaFbNe/HdnrfIWVQBFF3fY9dfyT/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyku7BEBg0PfQcDAIATpJIcLFin8Xv2PIY3xacHkt34saqbb6mX
	cJAu/ctxbuedo4mhBBKc0sZhRYPU3a9gWxkZ27hj3wSNj8ZyB9HOB3+b
X-Gm-Gg: AfdE7clcSdX9z7I0as7d325l+oeDPw2eVVNXFRh9rO+EpOgiB8FN84TJo8LKDcZm5Qo
	S14CcH8jC3xYaXI20lwoqrF5sKkO19YUY3li4VcCDhjRbD5e9DRrT4EogjB+LHtCzsgPdfMiX73
	yfb9azc5nAm0+50+f4ijQKhYrrM3lG32zJfJltITcK3v0lsaAjf26Dpy7YfK/IOh0LamViWMfFB
	X2zg2VqioffVpsgpkX+UznJ2jErj9809V7hkIaQ9fl3i43CQmKzZ6nE0KPx4B9Xf4KOpgKDJiBa
	kdrLjY99yPGIlTnpBGvUp8SWmbm3rnkRI1HbRSdhz6Tl6FVvOLMW61btjed3GdggkesBed3iQgH
	/evyXxhKeLthFUB3UFW755zWMrqzrrcAbmDTJONttX3Cm7Y6TTaEv/KfOpEzUfvHArTnIa7kqn7
	evWxtokBkhNqxT2d0BIrI+8dq8aH81EY0NtuodaYHaHg==
X-Received: by 2002:a05:6a00:1ad2:b0:842:614e:cc97 with SMTP id d2e1a72fcca58-8455087753bmr3697074b3a.23.1781871465949;
        Fri, 19 Jun 2026 05:17:45 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382586fsm2296986b3a.43.2026.06.19.05.17.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 05:17:45 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 17:47:33 +0530
Message-ID: <20260619121729.24899-8-birenpandya@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34243-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 8EF686A5A69

The remove function is missing a call to media_entity_cleanup().
Add it to prevent memory leaks if pads are dynamically allocated.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..84d4883e2fe7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -312,6 +312,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)


