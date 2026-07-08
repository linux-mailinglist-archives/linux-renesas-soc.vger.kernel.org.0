Return-Path: <linux-renesas-soc+bounces-34904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xsWRG2GGTmpJOgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:18:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE127291A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:18:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=C+yVW0+r;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4078B309B000
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 17:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175A64C77C1;
	Wed,  8 Jul 2026 17:09:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226B4C6EEF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 17:09:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530550; cv=none; b=IDdDXCNqEIHK7CJrABp+g6ogWQ3whGKKwmi2AudKuiwbQMHYwLDMBqSyQK2K957D3OLfprrzSluRl9fQch3N4Yq7BFip+Y/sxj2q5Frz+NS2LbYnNH30Z93vCJtZKMaBFjXLXQfEHh+uTFHc73x5i7FBYMn6vjjP6Y0AU4w2dYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530550; c=relaxed/simple;
	bh=XvaR4zQkJbPVsPM6S3CFh1bYu/lHd9yVEwd/EDiiGlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3ztrwjvb1uNX/y1dzNe4uX+jXakufDrudw9C5+mbgXLjxgVZ1CsSD78QDBf1JqkXEz3XdErKsxfW6JZgu2lJZr8QED/YuLpYP9yf9Jy91Z/NE2aGDmFR9f+RcwDVgv5WWmDv+SMDKKNy3/LG4ZjuBKJOksucs71b5B5YzSgWlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+yVW0+r; arc=none smtp.client-ip=209.85.215.173
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7c1176317so433599a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530546; x=1784135346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvsR049SJ/U5yXRq6BtVkf3/azE0HgRjOrdKEiw2JL4=;
        b=C+yVW0+rEIyUW4VtKRCplFI2W8SoIRwnp187OEuh/sCtUZEvxaq2kcYTvDpMSyp4q/
         5KUHgen5OLiCg8/JrTMJTbijUTVVU9Fr9Wu4/85zoOx0KpFzFt5uvMmWevlzhH7aKX6L
         8FPdhxXo8/zj8NjD3C7bCUqc1C9ZrexBaq49GfuughFsB5QKU4+G3SKhe1T6M8tCJ1Vx
         1FaSjeM0yIiiAxgJBEuU/trhl+jCFFN8O/mAbEpqRNW4T5/Csj+h4KdtFdj87lt8JGRI
         P8I9KEnxyhNAyLShqJvpBNHEPzYh2OuZI/o4PBvymuYSpxbnA8/SQOXuh9hs/oPgZS22
         bgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530546; x=1784135346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvsR049SJ/U5yXRq6BtVkf3/azE0HgRjOrdKEiw2JL4=;
        b=br+gqCDh+FcKOVLhGJH6qKVupa+FEQq3kfNd3e+v8wCiLEYzJLMGBr66oK450p7dUD
         HK2TMCH7lAdfCuF2xm7Ux/xnpbHgaJuZqdW0zJmOBxqVutCR/CjeOQWHZueug6Z/Yx4l
         tjKKq4/7Z4CLFxTjDBTwdvRVYhZfMtYKddIrrYBWLlMCFmDl8V7QyRKWsxAfk6VJazKw
         rlMgO1MqLXjFM6gBgaPkI4r0lXBpx/qY7R7yWfVUx8caNfQzUVPuY7tXIesPtiI+Qo+t
         LXKR8FUvbqEB+FmpyiqbZDJJ19ze7CuF4GxNvUTKszwXwvxl/vSWn+qB3qBepQ7EUBuv
         guFA==
X-Forwarded-Encrypted: i=1; AHgh+RpC6/UWabzPyJyGS721cFgowqjoA+XpKLHFT13nT3zhOONXZv8qKsO39QG8LttU/TFia2+88I/wdhpPgFDIZv8A1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyipdLUILQhD7DXZB6aSHxeB04It4bQaPBpt7qo95VoggVcMDXj
	qPMUYSGDbdkZ9CUxckxDscX/mN+LvqUZoY0KZXQl5VF5HMA11rcX8SWF
X-Gm-Gg: AfdE7cl8GR8En3Pm47o8iZbbHp2HP2/GIk8wz4Ujut6Wn3iDEmiehuFSjCEN2Qg85iU
	ftMePSXPEt3EIlkva5xugF/HlfolI8JQiNzEB924r1TDB7fn4mZXb+qu9weGglNvpxXqFLo7NOb
	2AvkpdcQE1FrcEG6zOWLS+XtbglTy028VhOajnGHctOzAPRBY8WUXT9cUvN9aMsuGZzlSGXOdbE
	SPlbEeAl5FDTDOBeXFH0L/IMoxSnkoZ/omAAYtIyjhHwvq+e8c209e02yCZDtjPGVRHlgMdX2ja
	cyKvNRM4ZXcfF0W1nOnj0cOWqLHdvXVe4NKHRbJK+t2FITUZV7VLo5teraE+1MCfr2i73Ucj2Un
	MR91jixTRFBCEk3Tl2X/KQRjw10212vh/RqBgcWxatmwDe8V/ncaSTIadY6aeCZhTlwY7FQVUYs
	A8+Cxb/XIvu2ukP8+CmqNUJCb9uxWtLFqH8Lve5E8W1ss80ytgQwHkSQ==
X-Received: by 2002:a05:6a20:7490:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3c0bc903417mr3943651637.15.1783530546451;
        Wed, 08 Jul 2026 10:09:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.09.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:09:06 -0700 (PDT)
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
Subject: [PATCH v5 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:47 +0530
Message-ID: <20260708170843.55076-9-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34904-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEE127291A9

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
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba8..5bae8eb0ee19b 100644
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


