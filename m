Return-Path: <linux-renesas-soc+bounces-34905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KqHoNfuFTmohOgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:16:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F2072916E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:16:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IgQx+tTh;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD1FA30B7857
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 17:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73E94C041B;
	Wed,  8 Jul 2026 17:09:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED844C77CA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 17:09:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530553; cv=none; b=eMaoJGsQ1QQYp6eR2JyOWPLrQKHKvagZ2NZvorLEL1+/OsEAlijARIxybVpnu/e1Lyk8BwRgTVjDcxH2jGMUC4umkaKkULDXpUSVdP6XGe8dHXK6KKFt2QHfQv9/uHXq8kOmibWahiVghDG9KNXqGzKYfyxF1orSF/SNQSi/uOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530553; c=relaxed/simple;
	bh=T3ZTA7fR/TwX7WfcW3K4j+ejRMOK8kk9j+oysKLms4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTl65RpNeal8/blCjbPTUTh3vNoYce260/tBwTiM0x+gFsuFH8FeosjcnZCmkoFb6S+cHl3LC8C0lvFV0L+faoNJ4nB+XdswnYami7HfWMa4U4EIzbTAL1xYrz5+slIbTv9kSpmKkTmLlHtf70hp/1mW37zmIXp61LEzxTQ3Rxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgQx+tTh; arc=none smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848479c9bd5so684179b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530550; x=1784135350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMKTs9AoISxOG0YX2UQ2sDdc8Iwlv60LsnZngRJBpHM=;
        b=IgQx+tThgQppgVu7qDCV11/RlM/utE9JYeYlYlAp6NdeKROBVBT4D7cDlvejpOtPvO
         wHJrd8UCaGrOKij31Qej0gMnY+14GSYhkCQUWPKov2BNQFaDB/MsUJ1Z9z13C+V6GiQ9
         IdXBelCHloooL6t2DrEwQzW/Irsa/f9vFmAOH0PMz7A145LqwJ8iHGTIGU1xvWle87pU
         chwIGVrzgCHY2xYFhmldVa2rdcXAyIWr7Bc3mb3cWHcx4r9drmi8Rm3j+h3Spy7YknJc
         zz774K0YZPPw9e8s/DYNE1P+HE60k2zAfHN35CJkdt9HWaCfFZwqkPZnypFp8MbdXZtS
         3hSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530550; x=1784135350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMKTs9AoISxOG0YX2UQ2sDdc8Iwlv60LsnZngRJBpHM=;
        b=Oiq7I0GFh5pQ2etFLCq14CwGggo/rhhkJb70kEtRD3iw1uc3AMgRd32AwkCW3GtDaZ
         ykhFbR9bMhckow4EI2XP0MX48FJ/TACY+QeNO9JZ97Nck9bQeTZleWC1bZxQJobvA08e
         1Nv0GsLL/Vu1BLCaL6nlpYSwOvLE7lgErRaccMfzooXDxFEiH2HBL1Y+66mGUMdX23kp
         d4PYKjbomgqOcSdUmJFIr+TZH+9lFH+bvnX/4w1jOgn7UWQfJFurD17CZ496wsW5UqSZ
         Ak5Rx/Oz+ibz0q+jRce583ctSMBC8v1ezKNeqayKa/kjcqXrNpqkj+JfEKcs9TQybiyg
         hu8w==
X-Forwarded-Encrypted: i=1; AHgh+Ront5JwV2XRUBtNEVyc+C8ilM1vSSOUZmmv5nobaDnVYuSl2nsaedZsayL/xbOJcuFuYuaqCrl2ccYmueVV7QzM4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Hn5Hz5F4m2CbqFp0ELDO8Dy4ozb3aqsdFWM3stHhIRny1Ldm
	JAwJLX0cgbefYQeMRWglJwsN6Bkmv++n6k+Yy2ldh63NYlLUL48adCW/
X-Gm-Gg: AfdE7cleTkVkrZVifd9CzEppYAwAGmOtmg3Sm5KvgV9y57qJax6FbKs6pFwWA9sVg/H
	A2idPKia9xXEcFO406FwJBnyXguzC5eirt7i4kxiIznnemJUY5DwQraUgbEaW6CTG4VwTLATS9T
	AjH3AbZpCdgIGRL4knj7VcIIWVkzT7OiggqfuNxAmcAKHyrkFrXKP5V8I0l2KoTEKG0QJDaxd/Q
	T2subV+UjWKZH6FhiLW4kvgN6jxHGpzd9AYYJRKG+Gj3aJDZhwc7+vAUJ5U8OUzlK8kJ0eLSzjC
	ivtNnyFpd4smltJigfvgTqSXJVosPBwwV5NSNXglF4H8ZFCRiQIZh91xM/o0pZER0HB9s4muyko
	z3RKKX94UHxDM8JwXS5+AVuhE8fvnMC9g3+aZrPBS+xbUbe5H5M80sLIBezsLnqqJNash8Q2JBS
	4x/mGijn8immdXL4HROdCUZ18iXdYVlct7yWLUKMMyLBo=
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:3306:acdb with SMTP id adf61e73a8af0-3c0bceb3208mr3992329637.13.1783530550506;
        Wed, 08 Jul 2026 10:09:10 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.09.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:09:10 -0700 (PDT)
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
Subject: [PATCH v5 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:48 +0530
Message-ID: <20260708170843.55076-10-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34905-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23F2072916E

The probe error paths and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls.

Additionally, patch the error path in rzg2l_cru_media_init() to ensure
that media_device_cleanup(), media_entity_cleanup(), and mutex_destroy()
are invoked and the error code is correctly returned if
rzg2l_cru_mc_parse_of_graph() fails, rather than silently returning 0
and leaving the initialized structures lingering.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371c..77b17bcf7aeb7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -234,6 +234,10 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 		mutex_lock(&cru->mdev_lock);
 		cru->v4l2_dev.mdev = NULL;
 		mutex_unlock(&cru->mdev_lock);
+		media_device_cleanup(mdev);
+		media_entity_cleanup(&cru->vdev.entity);
+		mutex_destroy(&cru->mdev_lock);
+		return ret;
 	}
 
 	return 0;
@@ -312,6 +316,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)


