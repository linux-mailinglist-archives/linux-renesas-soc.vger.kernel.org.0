Return-Path: <linux-renesas-soc+bounces-34362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kc6iKrk6OmqD4QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 09:50:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8986B4FCF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 09:50:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CyCKRtR5;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56D9A30097FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 07:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4653C661A;
	Tue, 23 Jun 2026 07:49:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908CB311C38
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 07:49:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200975; cv=none; b=ubFxlrl7GDbEUDj9/6uHS9yLqIi90BpOB3hrwSPHD22yCe1zJJLYShtaFSdWXSRFswNOu+vMDFbXEapVOGc0cVyCLhhrVDQwLnszrDW5GRPPOmm6rVXRuVBUlmpaPRe49WTUAvBwk4IQ/nea2wgdlfogSO0m2dkodIkkD3r7/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200975; c=relaxed/simple;
	bh=X0z8lUjRFMAm31SvVn3XAHG6MCbc1NvvPfUwObFN9nU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crIfx+mtxiqXX5+Z8NYsUl+PrqpbekNCiBVwTo5GdzLKyaOiLFvha3O4YpCIGTQTyCYE1y57Q+NbpYQX149UMRYStZDCUaqLEHqGiNYWqC08plfQhD1x+j3vWMNFOS18cqrkG8m0kzW/NBQXK+V9o6jOiS/v7Xm+K433BXRf1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyCKRtR5; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6978f1eeb87so4045389a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200973; x=1782805773; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrCfxhTAecILkVCugcEHsa3TmnRhxKjXZll8FagDxjc=;
        b=CyCKRtR5WPjpGWv9Te0IUKhl9RPy6F3svSTAmM2bai6Z1zL3wFltvsmGot3IkU3WZ1
         T4AI7gzEGG1Fbd0MD7R3ilAI9UN74CNB5CLmJlSo4X8I1H8llLC9u5bWKHuwDxWBoDK9
         e6xgsKJ+cBckk9E+SUEm+KyGQGQe2nm5AX2Wzp1GIXemiKNgAi7R27NNuR8IHDq5SBCa
         YoB7/jn7sJQxxZ35lYo7/tJbYdbai0W9eYo5cw+PBIYI+YCpcVrtVFsbc5yjB45udOnQ
         feeXa8Ti8TD0fJxeHlQSrUC1AsXssJdBgRCK8yXgT3ESBZZ0gFOCV6moSCBMP0pj7uBw
         A2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200973; x=1782805773;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrCfxhTAecILkVCugcEHsa3TmnRhxKjXZll8FagDxjc=;
        b=onXDCWBLz2g3+N4ubANIQt+21dBeB4DoGoP0Mu5km3Cm/oyHEV+IqbNGUNorvQb3NA
         ZtPbsU+MoSSTQv6a3h+xDbAUJsZMjEygCVPDDU1UDwxEvBjca9DT81BdiksGX5YVAdeG
         SxcXUoei2dsHLSmuR/6LPc9D7IzQNz5dts5//TpyMa8w+BqaMEY5PjPNAKdM6pUvsO6s
         aWedL1I/3x2yYPmdU0BqUebTV0c/ZkNXK25BabfCrX5286xUlPI30BgViCj87qQjQub3
         drratjL8o2LlC3v1hIApVYJIo59INu5ymDyBeuRAvwfJS23FCVvHA7P14410H3unHFeq
         9TLA==
X-Forwarded-Encrypted: i=1; AFNElJ9qDcdQkZ8F0VuruDNJ+M5Gikd8Ac4JqJrLx/sY6CeX3DxHAqcYkEZby7KzEx5HvFnNwlHlkdiTlwcbAABBiC3DVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKBYW377nVf7BHGb5Nz4vFZ8QZ12d7hSC5zareirXAefyPAgD
	U1v6nlJGyGiBhcOuFzjpO6rLun+bgFB5rqLDaytBddg0tAj+AJVzJSpe
X-Gm-Gg: AfdE7cmyApWJ4ZSIq3X+r59JwcAJ0n6XZy3EjquxV982O3ShGFrmIRsvsyQIKRZATge
	AO4TekBZ7QPvwwCtBFeTxo+ti3rqQF+v1j9kVTyzDH2IP7i8MrWP7wPRm5T0cLbyOHXCiaBcdjK
	z2IZYIUCpyEiP8QyIZv8mZZKQdkWgN74Ur6KMPKb/OAMLySX/LPjP+B7+hXc4qmb3hbZcg7b5MI
	6zmPilbKep+BKL6nmG5LjCfTzyXzvgZdt/mGMHqfxm5d2Acz97up4LRqXLnyBJ9nBOOWPzjnTsT
	XvJM+EV0ErVjyWPQZixj+5zHJYifzS0EdfKOm+trHrmCJdkXtWuye6ca9k2PYuT+DTtbqjpPZRS
	szY5e0epPBI55aLKl5nHbUJ52IleP8KxVeufVs1kTlGz1lE774cYgXuqWxmur4vuxKOsb2/Ns6S
	dFCikzLywR
X-Received: by 2002:a17:907:724f:b0:c0c:3b13:5249 with SMTP id a640c23a62f3a-c10908bc4aemr64165166b.52.1782200972913;
        Tue, 23 Jun 2026 00:49:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cf8sm457914066b.13.2026.06.23.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:49:32 -0700 (PDT)
Date: Tue, 23 Jun 2026 10:49:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] thermal/drivers/rcar: add error checking in probe()
Message-ID: <ajo6iQ3VWvcxedA9@stanley.mountain>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34362-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:niklas.soderlund@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[ragnatech.se,kernel.org,intel.com,arm.com,glider.be,gmail.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED8986B4FCF

The thermal_zone_device_register_with_trips() can fail for a number of
reasons, including allocation failures.  Check for error pointers to
avoid an error pointer dereference.

Fixes: 9d617949d490 ("thermal/drivers/renesas: Group all renesas thermal drivers together")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/thermal/renesas/rcar_thermal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 6e5dcac5d47a..71f836fbc698 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -492,6 +492,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
 						&rcar_thermal_zone_ops, NULL, 0,
 						idle);
+			if (IS_ERR(priv->zone)) {
+				ret = PTR_ERR(priv->zone);
+				priv->zone = NULL;
+				goto error_unregister;
+			}
 
 			ret = thermal_zone_device_enable(priv->zone);
 			if (ret) {
-- 
2.53.0


