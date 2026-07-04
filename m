Return-Path: <linux-renesas-soc+bounces-34709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RWzPLBZJSWob0AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 19:55:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1393B70822F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 19:55:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mskwjMrL;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B3D83034BE3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 17:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A335374169;
	Sat,  4 Jul 2026 17:54:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9350E35F5E3
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 17:54:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187644; cv=none; b=lKOVyup+AqFLKK2pvbUGWxcqOAz2h34Ou0H1YEJs8URP2rjVOMvZFQnDKJ61ivlfO6EiXm0+QxquTxElL8EoFgX5MHAGGdplWfiqK16rI9vyvCsjrHKqqr2Oj4zpB0nD7Ctr1KmAkmtcmI6LhOyO5vrTag8mmLktNNCMIfmnvDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187644; c=relaxed/simple;
	bh=Z9N6pEsigWAk2UWIWHJBzftcZEwVRuN0TCZwIeyDEcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3q9cSTLBMt8g1dZDnYHRMEzrXwv9X8sPKLIi00mUMOsYFZygMYBqH858o7HIdiGZckbtWJI6KVm83SreDoYSnWmOwqjy6Omu937MFfkcmjg7CbZYJx4FNDwAxFAUtbnaWmhtIjLAFckoEH3pNIjPdVUzzIYKS2wvmdmE/bDAls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mskwjMrL; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso1917783a91.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187643; x=1783792443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BtSYlQaJpsM/z+8viYvtsDhnMR5+tk/oB714i1BVbU=;
        b=mskwjMrLePnHjiFK6ADgVOxM8F+UMdGCSlfwCB62u1OOF+NxJmoh8hJluwGZGXkDnZ
         uApmlaPnNmiuluxaNZXg1AesEX4IGf5o26v67edgNmeA830Tz74AE7XS3KkH3fpF3pRs
         wSblRu0HmTC4OEe0QekgJOkrKkku8HlHMhVFIJmBJVPJAWlprrtcZb/1meozVL3UCM80
         dA7Ak4Jx7ql0BnQbv9uUsoh6ae4Kfmdglk70d/ajITGhT7Z7G4KOexWtiXO1ScIqpjD3
         YzNFRCwincScoQJs64b03379crBsWT4EA8ddhudHqrSZCiQs/VLqvG6Soj9V70cUWpe8
         SPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187643; x=1783792443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BtSYlQaJpsM/z+8viYvtsDhnMR5+tk/oB714i1BVbU=;
        b=c4RX4HRR18vONLOjqi6kAKxD3EMuH5nGAla23bDQ2jz68fg+92BZX2R3I8OFpSIKb+
         5srxAPOEB4HdgIxHrxD9i6STa9ru5kEmHh3zHv8QwnO634e346QCwj5QtxBQMRelCF+r
         4e5rrwGz3CFqcy5IiJkwszLbe+ja+iX6JHs/AwaOBS00v1NmrI1GVLEQ/T0w7Mco7PMl
         9PQuI6mee59UXE0df3idVvl39IQO96zl2vBL2S4W34pgOk5myfbdIgmrP+69oS72895o
         jXRoBGkgMoq/N0+rKOkou74Jd2c122c568EqGwDxLIUH1Zvwx24O1BxCL77iaWzZiv89
         6/AQ==
X-Gm-Message-State: AOJu0YxizNrlpLc1HZn1Yf4BP71NK38kuSFtVs7mMzh7IvkDeUCPpQK7
	UqI7e0+LAbEp/iSn7Y9UhJGR97Y4qE3XHY4aNUDTLSv8D+iIPDNyw6oJ
X-Gm-Gg: AfdE7cnD7R52MOZVIK+HRlLolxeO6B5WXPRL/bM73I7VcHXy4A3JumYruOi+NaGWZrQ
	OCxLxVqBfCfdBVyb7k2VALiH3lfUGqkmgy2DUBstqbQizZYEXJUutxDKy8xlT3ZS1HBruTBJMp3
	LmNHd+e9VjaxibXyJiwhSNaZQu0aZ+L0+VnrDcOVeFxSLBw8+peZju1wVpMmZaR/nMI/EJ2vY0v
	PoPIUPVfLoFh78TswTTTU9HRBjYNdtlmMkPsxZEZm3ce3MTZAN68aI7gHkJmcD53r1INPqSTg8I
	naKuCsb4JHl/v/xhWWCyLhuDRLDf+kCOdCYmcTLXnci6h1lWkLx9IvkWtDZ037nXP6euX0uJfvE
	t4Z7AL7e6Yg8yYxwvl/BFzZmRZbMTqe9Xhd4q6UKQPR8VnN2niYiNbvyK7L83dfYTY/QzMRSmuF
	VuyU0mpJKRr8LlDCmmAPP7gUM/9/5WAuQOjB4+sJhLFho=
X-Received: by 2002:a17:90b:2d07:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-382808b2089mr4165513a91.10.1783187642936;
        Sat, 04 Jul 2026 10:54:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.53.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:54:02 -0700 (PDT)
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
Subject: [PATCH v3 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:42 +0530
Message-ID: <20260704174638.66302-9-birenpandya@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34709-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 1393B70822F

The probe error path and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op in most cases, calling media_entity_cleanup()
is an API requirement for entities initialized with media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls. Furthermore, introduce a
dedicated err_entity label in the probe error path to ensure the cleanup
is only invoked if media_entity_pads_init() has successfully completed.
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..5bae8eb0ee19 100644
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


