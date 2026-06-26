Return-Path: <linux-renesas-soc+bounces-34432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O+gNMbFWPmpcEAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 12:38:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 245146CC22E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 12:38:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=abAoocNV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 813D93015463
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 10:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7B83EB816;
	Fri, 26 Jun 2026 10:38:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6743E832C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 10:38:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470315; cv=none; b=hmJyYFCpCU9UcnqR2fD3RW0R0CC1LOnlPbx/REh7KPwThSqrTpaRjb7Fv4VCJnzvH0iQuF7aJLEtIXlSMOpPqV8CbxDAmEE4RN+87F+2ZoUWxMYXw7SVNXn1nsS1ZxwmNAKcEuKlR43QIqZ8QUmspXLh4dfrBZFXrwwHHsbxHK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470315; c=relaxed/simple;
	bh=xki6Rg+f9VujDhsCScACR8JXl+gH6IVEyZSauehtbW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udIag/vxHqdhhg+5kz7yO+YqCtAgzu4lN1GBjvnP85RSeSsX+eXcxirVpHMbYRDc4uHyvsWG6oAilwF2f1UuI/1POhsQx54yQygeKnCVS8Bn+KHGEskybfSXMI9r1Ad7J1ZxdWK0U+jOQJ4wQEoje0l0fp8+SQS4gAMemRh5fy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abAoocNV; arc=none smtp.client-ip=209.85.210.41
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e93a984f79so561765a34.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782470311; x=1783075111; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEj0fPXIFdsm7jWY2EGFcG1jufuq5NId8KtSZrzl5fU=;
        b=abAoocNVKwtA7vtLNIUNNG2j6s+C8qkR6YpUekKUUyUx15kEbPlhdZPeybRas3t9tI
         uMmKDCN7K4BghVnjfd+0kiMtCXMjzFDemn5s2gX87QuEF/lJOD3VN1e06XbAPR1Aza/3
         N3SjHpcvB4OaH/EL3E6dmHP4nm+kaR9gD9xlPv60S90A9lm32M3gNDCy1EnfRalLHhW+
         yuZIxolpQCYbxaIL+laO0pa2PMbALUr2+bgFnXGFemdsmbLe4ZpNvyFUU9ghxEinsOxl
         ufTrUj8O1Jw1tkoKp9aFElLrBiv2xvkjeGPrjwPcyXjcLPu3doXWZ/UIX08uo2earXuU
         JwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782470311; x=1783075111;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEj0fPXIFdsm7jWY2EGFcG1jufuq5NId8KtSZrzl5fU=;
        b=E9VyWyAs9MEzW97/VskkIObPdcTpHRRH5o3TTxHl+DrI4cv8jt7MpYvo17gG47LNbW
         gl3XlSi/jnkYjc8cntNOW2+LBdTMz0mRo5niuesp5plq4dMgJlG8pydjgBKiUgjvscFg
         c0tKzzAsSzHto+wTsFCtgLe/I85ge5coFbbq55u7mMvYsUVnR6mH6QsRVjHTqvAW1pJs
         EiTxBw4dJSknteK31a7FffmvKaUX5XMhlNDHM/zCWfJH5jUv1EqyLbZrVfIQK60EUJxC
         D8sU4NCHLT6jiBV0a2bSbLy+czuU2o0oYm0C96rD2xc9ul7AXEpUsEbzNhnkT4zxd5mn
         2eHg==
X-Forwarded-Encrypted: i=1; AFNElJ8j+ES9ZS57AviAinjSMgesrqFEGeMEy/Rar+JPaLm5TFUs8WEgmTdaPwSXI+iwl0gPiSrqCfeZp2KZ6jC7FsayIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8+SR16vv3PCsJjoXz5RxG32EWiLm9pKkWPw8eEwX2DcBahgY
	JtcBZaC4b62oJaHNnveM8hVkaLqPbzEF3yczUK5tL1HzfaqJHmmKDl4u
X-Gm-Gg: AfdE7ckd2bcycbHCBVWSIRtY1G3qWp4wtWeqKcspoXr7iFAheqY39+OaDl5g9aK6hM+
	Y2Og2C9iLGglL9GfeRNO8g1rWgl10rMIlgxXWqN90xYNgAGze88g6PqCIHDBfUIZdW6H760Q8Gn
	7l2n1znK825Psoy2ho7uqLGydO/ka3vx1l46RXW8hGdDaJubmyzZuMk9ivLq/KDfslTl0u8VuAf
	SmLT4xkTBEBYXHJ53GtrkFar9vSiXRma4LDH7Pwe/nA2wKJGn3M63rB6HMyZD37n+vxf5g0K/AX
	lLQgpe0Tehn7IGZ7xggbrAm2xpWw6kx6I7n0T7eEgIsPIKSus9UeBOGe8lhDNjXOgweu7QcBKrw
	0Jjvlwg5NvdbFBiFftLwG5P6EW2TtvUnYUbYUQfiehwdJH7iCnYeMdA2XYjOokRdBuCkb0lmnJC
	fUE2s3
X-Received: by 2002:a05:6808:1b21:b0:492:9333:4375 with SMTP id 5614622812f47-4929333651dmr4269146b6e.27.1782470310785;
        Fri, 26 Jun 2026 03:38:30 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4935545dad9sm1080530b6e.16.2026.06.26.03.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:38:29 -0700 (PDT)
Date: Fri, 26 Jun 2026 13:38:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v3] thermal/drivers/rcar: fix error checking in probe()
Message-ID: <aj5WnseULiwgmlWv@stanley.mountain>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34432-lists,linux-renesas-soc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,glider.be,gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 245146CC22E

This code accidentally calls thermal_zone_device_enable() before checking
whether thermal_zone_device_register_with_trips() failed.  Move the call
until later to avoid an error pointer dereference of "priv->zone".

The driver works differently depending on if we are using OF thermal or
not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
call thermal_zone_device_enable() if not.  We can share same error check
for if either of these fail.

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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2: Use the correct fixes tag and re-write the check in a cleaner way.
v3: Share the same error checking as a further cleanup.  The
    thermal_add_hwmon_sysfs() and thermal_zone_device_enable() functions
    really do serve the same purpose even though their names are
    different.

 drivers/thermal/renesas/rcar_thermal.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 6e5dcac5d47a..fd686da9252e 100644
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
@@ -506,11 +500,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			goto error_unregister;
 		}
 
-		if (chip->use_of_thermal) {
+		if (chip->use_of_thermal)
 			ret = thermal_add_hwmon_sysfs(priv->zone);
-			if (ret)
-				goto error_unregister;
-		}
+		else
+			ret = thermal_zone_device_enable(priv->zone);
+		if (ret)
+			goto error_unregister;
 
 		rcar_thermal_irq_enable(priv);
 
-- 
2.53.0


