Return-Path: <linux-renesas-soc+bounces-34396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n7hAAPnWO2obeAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:09:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 172486BE709
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:09:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TPenzY8G;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A507302B764
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 13:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB093624C2;
	Wed, 24 Jun 2026 13:03:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F72D6E5A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 13:03:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306196; cv=none; b=kagZpSj5hhiJMqpJNFrIwk3o9+TpvH2jCE2KgkZSbALLISdLnMt2HJB1uw5J7BaYE4gmW0DdcOl4rdSjUVyhU/zrX+rqxGXgKYo1KxatKBGEQYQJKgpxWIuPswVE18xTcUiuFtk2aCdii1h9y4zL1ppQdQBMg90Gk7dL8OSA8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306196; c=relaxed/simple;
	bh=4wmUG9+jETW1+KM0ZXFsMsDz7lw3gBvAJtfCC3yXuug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tXaRpKa5H+PeGcEXS31Qhs+XQiV//PCiQHG0187oGjQpLfKHgqC0XAfGScJHLuh9a0ReYs+H1f4VHONjGXFcFdT1xh+p/mVkasAK6E5wwDOOXZICZ/z5z5gFf95yXkgbbBekk7qfnAVJjo83IdTkl+S7ppZIPmcwJ749TkulPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPenzY8G; arc=none smtp.client-ip=209.85.208.44
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so1728419a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782306194; x=1782910994; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IqbffuHROsrMfivcmxl/a0WRNEEypXicIfc5X1ORIW4=;
        b=TPenzY8G603F2SfksgutFmXYP8R0NY6G/BLUwo5OsLTTpwrkAnUD5pFaGsGcH5cy6p
         kh2lanK3JMuqDY5qK8Lg9K/Iccff7GNX2kKqGMC8onUe0KR3yrv+S506z0eur199+9ZN
         tU4xcJXuQVakabMkXAEd9F30kAZ7QsXBojikXUi+aFQSdqlfjoVCygPbk/sKXNPCoaOU
         fgKbS/BUbOs0itTRvXBnPIlaNkWQUB5Gp2KPb6fzKtX522bzT2mzd5a80BOmhiHQ3asO
         KlYgLtjN8QUeAEqYuFjWu+rSbhoE4sqJxkx3uxYeLZmNJyx0eeFBLLbZSSbRxigQXLPf
         sW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306194; x=1782910994;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqbffuHROsrMfivcmxl/a0WRNEEypXicIfc5X1ORIW4=;
        b=r4HdwLV/j2Ym572m0GzaBl9RoTEwP3YMcrdihBsIZgLHkOyF1rALv5JX7SrgypQv8n
         PQ4Sr9f63kZCWNCYr+9iVQa9EoHgCZMuS/qx+UO7xQtnTVxTTVXUp2+iVrmC2hj4t93p
         9riSxXI3kcMAwZokzysxUcFQ5KjTweW3Hvk5UMnOCD6hFEkaxhpDGnvGFG9JNCjlrAuJ
         hgji4Qc+wrHzeom9M6qFoizyIetbfy9G8HA3dxrjdUL6xY9UE9rp+9ouTPMXVe1KwNra
         v6JS++FZxAIQgP5kKZU8JkYn0Pv+tx9Gl9WsMNWiC2WPiY5xQVmgma6oCi4RR0t6PceT
         U8Aw==
X-Forwarded-Encrypted: i=1; AFNElJ/EuJXOS4m1++r6DVlUIl10F2D7chns22vaX5+htlschNzTtLn61kiLs4VozErjn1edX5KkKnxjNPfdKy+KEN7+Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk1ml4ik5+MPm4f3QPFz7eVJTOncuJjqE759m5qjQWDSF1X00a
	aI14E7gVp2dGgukKRxbIaL3myjpta70/Ip0pAmNmNa+EhUIsQB559Pc8
X-Gm-Gg: AfdE7cnVk+fTmrXiyz2vcHLavPIig+A6wv/JGjbWFAENKNcfddqgXla6Eo6DyJRUwSf
	5QzcgLTy7LbwTmaQPn2bFzCummeumuVWfv06MY4npN60h2+UQhfY4yRI4P7NQIrWiAbWpq5gID6
	elIFBcauHfuzZ6an0LlVnIVTgmzNiXBDkAJuE4DfaKSB5ZbgnNFbxUCLI1dI8A5eSVTw+O5D1+V
	Dzeb0BtToRBs7LhADddGgvKnrX5raD6u1oiq+vQqp+Q18UxX3MQWnT9yEiK0Pkx81uhfenXj3h0
	o3gXAJIrqhQzokB9+12HfA+QGkzsBpOmd20jTGRchBDU3UacRZBiS4PgmAyjj9dXgUtKEOjwODB
	25arcmIqcZKUfHM68RkasIqW+r3x3XEdcyfKkkm5HeHNx402cHI/tAl9wTDi3O8n3FJUixLdV+6
	Koh2T+wNbB
X-Received: by 2002:a17:906:2081:b0:c11:f023:8414 with SMTP id a640c23a62f3a-c11f0238ac8mr89463366b.22.1782306193376;
        Wed, 24 Jun 2026 06:03:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e497e7dsm651298766b.5.2026.06.24.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:03:12 -0700 (PDT)
Date: Wed, 24 Jun 2026 16:02:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] thermal/drivers/rcar: fix error checking in probe()
Message-ID: <ajvVfSusxZfjNxVN@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34396-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.p@collabora.com,m:niklas.soderlund@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:b.zolnierkie@samsung.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[ragnatech.se,kernel.org,intel.com,arm.com,glider.be,gmail.com,samsung.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 172486BE709

This code accidentally calls thermal_zone_device_enable() before checking
whether thermal_zone_device_register_with_trips() failed.  Move the call
until later to avoid an error pointer dereference of "priv->zone".

The driver works differently depending on if we are using OF thermal or
not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
call thermal_zone_device_enable() if not.

Moving the thermal_zone_device_enable() call is a bit cleaner as well.
The original code used a three step process to cleanup:
1. Call thermal_zone_device_unregister() to cleanup.
2. Set priv->zone to an error pointer to preserve the error code.
3. Set priv->zone to NULL to avoid a second call to
   thermal_zone_device_unregister() in the rcar_thermal_remove()
   function.

Now we can just do a direct goto error_unregister and rcar_thermal_remove()
handles the cleanup properly.

Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: Use the correct fixes tag and re-write the check in a cleaner way.

 drivers/thermal/renesas/rcar_thermal.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 6e5dcac5d47a..f8865b03ed23 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -492,12 +492,6 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
 						&rcar_thermal_zone_ops, NULL, 0,
 						idle);
-
-			ret = thermal_zone_device_enable(priv->zone);
-			if (ret) {
-				thermal_zone_device_unregister(priv->zone);
-				priv->zone = ERR_PTR(ret);
-			}
 		}
 		if (IS_ERR(priv->zone)) {
 			dev_err(dev, "can't register thermal zone\n");
@@ -510,6 +504,10 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			ret = thermal_add_hwmon_sysfs(priv->zone);
 			if (ret)
 				goto error_unregister;
+		} else {
+			ret = thermal_zone_device_enable(priv->zone);
+			if (ret)
+				goto error_unregister;
 		}
 
 		rcar_thermal_irq_enable(priv);
-- 
2.53.0


