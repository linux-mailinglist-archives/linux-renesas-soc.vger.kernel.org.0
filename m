Return-Path: <linux-renesas-soc+bounces-29161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDXEHWqNsGkukgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:30:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E74E2584E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D22D63053BC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 21:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B213EE1CE;
	Tue, 10 Mar 2026 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msKtcptS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325C3ED131
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 21:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178192; cv=none; b=tjYhxQmz1Q2MW20bmnravP0JbqyPd2Jw2z5Oin+mwVIboXMJ2KMVik7xgU3hOnt3VzeAVgvXxUyBJw1XK9lKrEpuT3VR+arzj0IxNxuVitp7OcKJarWU2pw0ogpN4ZAnb43lYOCC8uDZF5DwSOYVeznUQWdG30ZWDlQtY4XZD9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178192; c=relaxed/simple;
	bh=DzpIfCbwM6vKhLFzRzo9xoVVQJBktFpsxzl4DK7l6eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HvY6zXu9tEk8BLpJJsg6YHmMvpKHg1s2udESMUBUNAsGra8E/fv+2UZdGei25cdDBvXsFYGNrUzdEbngCj52Zi02QZTPNRsKGKRafetEAs1tmhKyDsst/jvN3pYiYYyiDdC4rZm3GO5DHd8S7R9TgtIK7gHq8ggObUr+wwy4f90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msKtcptS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b611274bso6532803f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773178187; x=1773782987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NgqHv/g3elLCqPvt60P5KwNeI0nXk/rRJivDr29tuA=;
        b=msKtcptSHt1rIa/eEITehzKqQO14GY9wxdtchpLiJ1CFcD9IXA87rRIu8ZG9OXr3kp
         2UQgyU3V+0HNYsP10xkQSHpJ+6RIKGtxzcIZ2iv9K3U6QDZu45KwdYlL6bE7XBiGIdm6
         geHFiyweAIW/1M3V1fTbo5MVP+AIEYIdc6KYQY1Jb7xNjXwz/o/AnrRPYspgUhzTtMW7
         kxtD8oxk0EXX7SeM00WXekPK3/mEx0PEzMFWupwEF8ANbK28CAvzI01Gam2O0tIo2MCc
         eQQ54/Ia6weS37KsZINmLTIN5mczWYp7HFi5FKW5M7eg9Zk7JbbfV8sDn69eLryrBLc/
         otzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773178187; x=1773782987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5NgqHv/g3elLCqPvt60P5KwNeI0nXk/rRJivDr29tuA=;
        b=bxVw2dDO6f8HpnzAaJvHKIX+GH2RekwtbkiNAviax1SEyzFPaaDN9YsE4WzfUjxigW
         HOsNSv1onq/bmYC9istG9Q5tqj3bIDU1W0Edh8rP7dDcMxzBk4m7J39QHlTIG5cra3m1
         iKs6+ob2jtttAgJ86tv3T09bADZ3+nOQK+11+KQ5AvmhGd6IuHcQnrs1qqQ00eMD8rgd
         vfSGdYKAljTQyKhYDjDSEyOcKqwUjgOwYvGNFdDqd6SbMygHZlG/EWmKfhShMc+STxvT
         n+aa7Alvoe1pWbSsBRlUP7+D8+J8U/QY4WpVCj9++JbLOwwwNnB30M6jjXEP5pyB1MQF
         /GUg==
X-Forwarded-Encrypted: i=1; AJvYcCX9KpiE2mXG/tkZ5xN1TFoZtwzGwn1k9ybLfw/7866JPQzk6j4rlp3y0V97f21k6j2eWA/Vk0vIkhtsrOguawYBTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tjB5WrNgQc4ctzqDrghJFsJIzEWGjthPKnS8r9dm747NyAgf
	/mrXMiJvMwCg83zUaUDxdVvnopvoCnOrOq2pA/f403u5ZQmm5g6/gHOE
X-Gm-Gg: ATEYQzx+DRsjPOa1sCx7zgy3lCMXmiuY7RTuhiJyOgypUH3316VuuHt8jC7vJv1dVip
	21OqrBf3G8rsFxgkL7iisow5SGc7kUE90UTCvDUEJGlJZ4glU4NwEKoGRz5MQZA9kynCx/iyDrL
	VDpEclrs6qRgEAV7MalhQao2zMmHGeuHLN2O19R+6FTqfKOQBNQFWn79A/5f5ZjPmya8RaYqHeE
	TwlFPAqXvi83F2/T7oSiUsy+8wgOw9ZN7/h+gSiR4ND3R6FGLYfvyGHV6Y1qrGK/6uX6LPscq9S
	GjewUY7UlOwMNEet1mUeoT44Oz4+ZDOt8CH5BWxbkh3cR4eNd4bwKYevWritm3NOI2GN/p08ZTb
	14I1fdYugmNlrQ4VSG99QK5BezEIeR8BfKE9gcLYAXXXUZbxCl+ufslLJ3zhP6/d1rgsQQ3oZS7
	4v1yTQGMMqS/oyyq1Urph9IFNyruQGqDoDMW6AUp8LmMd9wERxXJHxLtvUWtC1kuehuZXklSXHi
	iY9mVXwdeCQFU39eroq8wlPOcaIkE4Bjx23pQ==
X-Received: by 2002:a05:6000:2c04:b0:439:8bee:b986 with SMTP id ffacd0b85a97d-439f8222ea7mr743968f8f.32.1773178187469;
        Tue, 10 Mar 2026 14:29:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:82df:eef6:d0c5:70a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d37fsm1247104f8f.6.2026.03.10.14.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 14:29:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
Date: Tue, 10 Mar 2026 21:29:26 +0000
Message-ID: <20260310212927.3372410-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2E74E2584E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29161-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
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
2.53.0


