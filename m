Return-Path: <linux-renesas-soc+bounces-32680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AuQFiUNB2p0rAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:10:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C99BA54F304
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADEA630DEFCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20276481FAF;
	Fri, 15 May 2026 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEP04Sbb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF19480334
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845931; cv=none; b=AramchuVyEA3836YXs+lkEk/norlU2/ZscdxKJddD959cazKTSQH2J4Z9h9B9F4BsrxFtwpeTDcoVXAMLOJodpiJhsDpEWlAkSY6Z5EmM1/gxzvgvh2qb4yxK+GKZYiv5exXyux8gt4hqI04+B+EUk9rro3303nj4EGS349uibo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845931; c=relaxed/simple;
	bh=db1UysockGOOdN/jD+3r0kklFbD/5UZUqI3qs3dKzM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Js+olwAxrrBl3gAK8N2quXrhFx5ls5zRyAR2CW72X/Srwm3AIuPeI5x3P/hF135fP582QuhGMbCRvHpGRSJ/5aylIgmMuZsrXF8RrNS2D7Q5bP10ZlAXmoMSJN8T/8buriPuTPX+3Ts+DzN5r4KC09eTpc9akxMW3axatiDpypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEP04Sbb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a5174670eso5109036f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 04:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778845928; x=1779450728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6EhYJYljIpOTcXgWAOcvJXHIq/zZQeBLSK1ZR8tzzo=;
        b=sEP04Sbbjsu99K/P+JQRNYm9EWNvTZSeswcX556dBgLaSEAweQaOuSLU9lA+4zsDxL
         9JLTfL1joIxeLNoJavbOg6TbdvNr2kO9U+CMEwLiUT91LXpMQUreB2mCXTcxvuZaksnc
         m/586nsqcYj0F/GsHR0qQhRgtMuPwlhPk4TsHKMEVoxzYL8+OWi20xOdWDgCiyYegwCO
         xf/p10W89HVNEgUK+MR9bn7FQP9ul0IKWk8NRl7hylg9GVlEvYvt7QGCfmLdpl/Rpmsv
         Yb3+Mym90IJbg1rq4Yc2iWPNUWXo4YHcaPTaYcPp7LAAnNn9DG416jAOPkUOSpdZXrrs
         OmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845928; x=1779450728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6EhYJYljIpOTcXgWAOcvJXHIq/zZQeBLSK1ZR8tzzo=;
        b=B1hGgCdOk/JLrTg39JtvwcC/LAxUROWhre6VJegrBDcK+ytmLVliC+PvMrIOiaYjdI
         VGi2SD/DcSUr9dL23L3Skp6EtLBqSAo/y659VA1N+PZwnPn6ikWaf+W9C5x0x/D2x+sV
         W/s2UBJpxqA92AQbJQGgyNodppT/c6nuUBOrXfGcRfseyKsJZQqxB07ytZRlfhdMaB9f
         KhOoG7JiFuD4nqAThydf1mCTjSHCwMmddfKfmrraxklrHnSlBa/IDH8hmg7PH4HyCx2P
         vOKAfDe637q8iqCTqqnKQL7iveDzCRereWmxmiJgEMb03FShtWs4yBYoJ7PLRZkT6tNj
         I8RA==
X-Forwarded-Encrypted: i=1; AFNElJ8b/16e1ly2HRkoQiOXt3TWmivgIN7sMVS5QIQ0Un7OnZxs1tLoXPn2Ry6LJBRcBSAZtn88/Kns8Gfh83h8r13X7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+lD1Or8Ox6q7fA5/5nCgC1MKbmCrSpLfpMEyWgBtEBI70NzG
	TCyDsdPqYQs5PO0o22+TV1O72xTUVsuzQ8WWlT2wd2RuvGIKVosEVgeK
X-Gm-Gg: Acq92OH/KLjOsovCBFodEAtw4hN0+eAYLT5dJgrmqdhZj2jfxkXb9+ga4LCVAbJw4SR
	AEa22HrgAR+2UIN0GMuX7jqfW+74L0uhYfcrEY3FCTG4Ywyr/pcw97Ltfp+vMLBLGcnqj1mscV7
	cMAfEoKR3C4lBBxihfhTf0KjfilgdMRsTsqez7jKI04uDjxQkUX4NG0yBsD+wB9mYSMw3DS59YB
	3Q9MTVwtq7PwMPMTBxosXSEw6DfqHjdDHr7L/lXzFEIjdWml9+sz+hUN6Z9TH7eo59VgQhpVpwE
	FkMQicJZpE/fBQDB7I6yyESKI0vlNSh7Ld4IzeDRjPFLKcZ8NwSrG4Eo9X5jBahOXYyFm7z5l9O
	/uUT0e62w/I5c40MJU4hhSvhkPLOxVpSUHCf9utVaTX1ktHiilD/eO0RQ/4abIGAqoYVUywcgUZ
	uW6D7Tu4yiO2AE41J4iN9ugty1gAcZGB9tQlPTbqD6/8U3Xn2FG0dYqGDl8bnlolcJWWA5873ar
	9J6mpzJg6nDuVvXlIbXxT67an/g7eDXsgDqFry7UhvK3RM=
X-Received: by 2002:a05:600c:858d:b0:48e:82b4:b54 with SMTP id 5b1f17b1804b1-48fe6514873mr39770125e9.23.1778845927690;
        Fri, 15 May 2026 04:52:07 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c85a:b53f:fa7f:6b1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm58376215e9.14.2026.05.15.04.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:52:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v4 2/2] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
Date: Fri, 15 May 2026 12:52:02 +0100
Message-ID: <20260515115202.1515577-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C99BA54F304
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-32680-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On platforms with multiple xSPI instances, the driver fails to probe
additional instances due to duplicate sysfs entries:

  [   86.878242] sysfs: cannot create duplicate filename '/bus/platform/devices/rpc-if-spi'

This occurs because platform_device_alloc() uses pdev->id for the device
ID, which may be PLATFORM_DEVID_NONE (-1) for multiple instances, causing
all instances to attempt registration with the same name.

Fix this by using PLATFORM_DEVID_AUTO instead, which automatically assigns
unique IDs to each device instance, allowing multiple xSPI controllers to
coexist without naming conflicts.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v4:
- No change

v1->v2:
- Add RB tag from Wolfram.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 0fb568456164..3755956ae906 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1034,7 +1034,7 @@ static int rpcif_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
 				     "cannot get enabled spi clk\n");
 
-	vdev = platform_device_alloc(name, pdev->id);
+	vdev = platform_device_alloc(name, PLATFORM_DEVID_AUTO);
 	if (!vdev)
 		return -ENOMEM;
 	vdev->dev.parent = dev;
-- 
2.54.0


