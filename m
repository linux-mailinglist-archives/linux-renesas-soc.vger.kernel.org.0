Return-Path: <linux-renesas-soc+bounces-32908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ML2NN4KD2omEgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 15:38:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 773895A60A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 15:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9B7830FEB0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 13:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5243DA5A8;
	Thu, 21 May 2026 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5eJpyte"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434283D6CC7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369559; cv=none; b=hTRlMDUmBhyfkpuXF3g4F9B1VPdK4ZQFOlO8sSbzUe+gle4avPzC34rI2Gz7yzVqwonqJ9oVWW5PHickiPZan02SDhnkfrAmtZtcy9wFVeV3R6G2BnBHZwIeNJglx2HgXjqYyJ0bwrRExQypzzUATeeC75alZ2b9o13P1nFCDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369559; c=relaxed/simple;
	bh=16QY/QJzWEjPqahS/pj9spMomkd8qYLLznAV2zSSiSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4hiffg+x/6OG2PyH3ZUDzNxCQCccKjGXkbQ41Pv9k5cT150I9FLg4g6MWCq52g52v3g7gXM14k1jmb10Slc56mxpTZ367wxMXQYEQntZckFhl0x7tcfe9wAS+4yvCdvk5ITUF4rf/Ei/6+Vbqgr0Bn1Eeed5B2Im8Ow/gefkX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5eJpyte; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-441209fb77eso3932221f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779369556; x=1779974356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7bRKatPZuRsf9MzYE7O4zt6PuUBozxZsH88W9EeXPk=;
        b=V5eJpyte1mwszBLZZ74Ux18+mqm1XAXJ61llhNvN5HV67dz4N1J8Rq8S8LsnSwLQQr
         UwsoxkHpbMmgYUPP2ZCMqRcQ5vBQEv3qj6JKr0B5DlS4lXkoChayw6zxzQtjJzT5yGTM
         ZF1REhVP5lypUHpjz7j1RIqnIPyUSIhJ5uSxocOL3PGgcv5K4grx3ZEflts6smOLNvcV
         jFuictEfOWlD9CSMF6/vWp2DB33u4KMgVxQ44qNOs8oZR23Q1rHasqXQqRmyL/rf3itz
         uYWdGExSN+lCSZbh3q7ZVcwcxxuBL40aw15V1dxx9/Fv3DxHMBJ26ATaohfDMyjbUPiR
         EzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369556; x=1779974356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7bRKatPZuRsf9MzYE7O4zt6PuUBozxZsH88W9EeXPk=;
        b=TnShPwvK9LIJE/DfKlJq3jJ1nwhlmjyDSugBKhi0JfzYKeJXX0CGW8+u1aCsGPw2mr
         QmnFG+A5LuoYC1Shjq3bAZMhEki8r0Vp9f72JizBkSnDIUCECejmilYCC7wQ93HhMxMe
         /1B6tAIaVA6lFQf6PI0nPC1tsFbJ2InVZbUcEtOUSwS0R4lIyWC4mBEBd39IcfQKyv5M
         74t8uONadjVdytMMJj/U0tRu82RFWA5NaRxlP5C/VwgEDcrww5ezQ+aQ01/eo4ixbbeL
         TMZpd3pKonNK7DqC9R3P5xqzJsEk0HL8ycPqHUoV6lYBqmuTLVVJs6+3/bjHKYRcmdvE
         nyXw==
X-Gm-Message-State: AOJu0YxoBRPGhWZLgvto23i+HmuEruChJpob67aPMfH1Uwe09I9wD4B5
	6fhAqEKALsMzb5U+k3wfSWPvvrwoyUjfp9FxXxCIuEyB4kSFFjHo7o8Ke6xXWKzr
X-Gm-Gg: Acq92OE2D6LVgxavFDkAp0m/9xbVviJw7o7EnQE0WxwIn/2yevKNHZmxIUZ5SoOczB0
	MQW8/6vKX1lZ9I/QsQqNAlHka07A1H1vuD5Kll/3aC1KiwuiY2/ThJwMs+3oWVaCmWRwlMBl3+6
	s5za5Q7m8lYq1JfWj1Gp0daNsxVlG+9yEUR6gq59xVekKfa7rQPRUydyEnRYvTbc2H6bDHy6hS1
	PT4RuTuPbIflAiXNNhrIxewlLNtGnNP66tlOcnCuN9NWYZ+2Bp5xe8EKg6/p0V/dR6ZqOEQ3mO2
	dMD+au5lsp9nz76QEfiPOcKwtL9qOwsO2M9YcPStUlwXb6wekISXO9CtsFlCSAV/9xNquMPmrNZ
	lpzfOuQ5Uhlv+Bvd1AjDmODDbNVZJVqnEWFOFKZ30la+xexDUZH6HMp1/tdrkhKebUX8YqdRpuy
	HnSktfH9aHFXfi2Uul1/djJXDnmw3+Fq6fSn2TldAcN2MbGAJFuf+r6Dzj/bx2aOdxqnvJ/A+fA
	V2zn1f48dm7b/g37WR7nVBoXBAgaFGXMUk4KA==
X-Received: by 2002:a05:6000:26c5:b0:45e:739b:2750 with SMTP id ffacd0b85a97d-45ea34955famr4690762f8f.9.1779369556319;
        Thu, 21 May 2026 06:19:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e184:549b:e5bf:ab7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm4163164f8f.6.2026.05.21.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:19:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH] media: rzg2l-cru: Remove height alignment restriction
Date: Thu, 21 May 2026 14:19:11 +0100
Message-ID: <20260521131911.92845-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-32908-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 773895A60A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CRU hardware found on RZ/G2L and RZ/G3E SoCs does not impose any
height alignment requirement, so enforcing power-of-two alignment on
the frame height is unnecessary.

Remove the power-of-two height alignment restriction in the call to
v4l_bound_align_image() by changing the height alignment argument
from 2 to 0.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 1ab4b4c1745e..8d8103c51f29 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -843,7 +843,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 
 	/* Limit to CRU capabilities */
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
-			      &pix->height, 240, info->max_height, 2, 0);
+			      &pix->height, 240, info->max_height, 0, 0);
 
 	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
 
-- 
2.54.0


