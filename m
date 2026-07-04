Return-Path: <linux-renesas-soc+bounces-34707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ZUOL9JISWoN0AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 19:54:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AB5708212
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 19:54:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=erba5iI9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB48730131C9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 17:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05CC208D0;
	Sat,  4 Jul 2026 17:53:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B923815B
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 17:53:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187636; cv=none; b=ZRPVshMOlWEYnUBMHzeDT0w+bucVHaYiby8Rtss5xJgYENgn50AshkeyayKlwEDP8WtlzA68/BQfhXixlOrSn+Vkdp0a4paYqXlwoMyB3ypIjtZU7TpYlFCt2n+eL4IMeUh6rhq4B3/KTFjIbB6x1U/pIDH5N8+BxdU2+jJtiY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187636; c=relaxed/simple;
	bh=nqVTW6DH4ASUkqta93gyc9UKrqMdUX7EO+mifFx2woo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoGVKFaRePWLF6gkUX5dXieDeFyeO2/3JpJIz7Kim25Q/kxTgy4GgDWktHl7iac/eXNgmKWrhzJlaQwjk723kt/GSSma2F/ajtSyffctziEjuauUH5+6w9keaU4B2oDBXta9XrzhMiRR5Z4Uxr0riGr1QB6TQTFpX2HgJdq44RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erba5iI9; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37de8008910so1534035a91.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187635; x=1783792435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KZPajTGZcSmUhFo1x8c8s6SejNqBr3EonFM7GD4NfQ=;
        b=erba5iI90Ihw06gOb4xgFcV22XBzSClfyDXy+RyEDHQcGE4gLQsUunK/RhSH1LLTsh
         ZfNhAi/VWi/z379ql3LDs4tSGgxbfo2/obOHsHl9MRAmn3nw/Pqn9bWpKtdSt4zVikxy
         j6wCdxxp1nd+Md1zlnHNRLV0IRv57wZXFA5/2O0CbGXg6ZWDeKs8S8gSg5n5pV9EIYVC
         0VEML8wcbmsqvWtNZXZhELGYX0HsXbqN53pXi3tezD4cq+yUei321aao47Rr+B1L4/XF
         HCWYlrK9CdX55djaqrdIpn4pKMd1+BQnW71o9QJIQB3cxvvCcNjlHqxuwmRhROw1Pl0A
         bwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187635; x=1783792435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KZPajTGZcSmUhFo1x8c8s6SejNqBr3EonFM7GD4NfQ=;
        b=l+rD6heMhgMVdqYwMxOQKpt4FXo/K1Gi+AsvIP4GJ8hMEnBcvvwJSzQdgJlOcLELEd
         Y5BoWP0xA3V05ZzVfUhWLStcQCBaDY2TJsqo5VvW2dec9I1FpNzTFcs4HPmRfsKT8IwL
         JKT6ucgmYja209LJ5Cw4M7R0O0FwILXI8uCrKwisfOGTrgIctfzgBoHJ/h8S+qDMPsEH
         aXIrsaTq5jpw9TmKa5jaFvqpNrwXaFFSEbsYNp7P6BqLMEm5LN51iTdFgUrbk1kp63t0
         BYfW3hpph/yp2DkDW+UiQgXmcurMAUsr7nkc2bnsf6aL8s+taWzf66B6sJcMYjFpqgLz
         86qw==
X-Gm-Message-State: AOJu0YwPPoY/BxvZ3pdq7Qmks8e8wZo5G+w80OH3PSJCCavCmI3Nh2Mi
	nWmVvsK/Io36f5SPJbrBc/rFuORSEEoY4yUmNH4/P0/TWiXwdKkrjQsj
X-Gm-Gg: AfdE7ckDI42mY2b/WBJg7LsMGUmokRC7yNIHzAQb0f+BuhOq8vq4NS/kecufQyrVnie
	R/g2tEfe2hQ4GVJvuCgOpdtrjyohxm6Ru1j/vepr3T9E2AtBSrdfOU5hr9B9uDGjmyR4AfOYk/w
	3AvRBtgubvVMC6VE2R3T8TZ8cBZ/RiXjaDQt+Fybn/OyrBJkp6btm7hNZbEIjDSvSSajTA2rkWa
	X9emwH7wZYf05XKjoc7xbIlZ/eFgqqLqYxQ5Q3Vax3y29aBMRSdwtkOkVjjY2XI5qEc0DghNaBu
	+m7bXmcW3HF1GJFuWbSoOSDlMHMhYvrrbVLPcYmO1j2mVMkGEs94R6br5wcYDJ1XPsy43oY5GhF
	sdiriUd/2bmxC7vYUmb1UNWyS7JqsVyauL5PfuFJBL46XFtbgeKMv8RTs2vX44kfjx7ulIQm5ww
	bu/0cvCe3ScjcmGw9rlqpPjwxYeAWSpbUoj7BpvK90Rr73uOoOPidE+g==
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr3908482a91.21.1783187634777;
        Sat, 04 Jul 2026 10:53:54 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.53.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:53:54 -0700 (PDT)
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
Subject: [PATCH v3 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:40 +0530
Message-ID: <20260704174638.66302-7-birenpandya@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34707-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 57AB5708212

The probe error paths and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op in most cases, calling media_entity_cleanup()
is an API requirement for entities initialized with media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls.
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..f9c818b0faf7 100644
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


