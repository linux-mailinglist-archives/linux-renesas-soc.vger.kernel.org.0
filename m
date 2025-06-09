Return-Path: <linux-renesas-soc+bounces-18000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A308DAD2A15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58F861713E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43A9226D11;
	Mon,  9 Jun 2025 22:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xjyv7cPI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194A2253F9;
	Mon,  9 Jun 2025 22:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509811; cv=none; b=SDatUzgU0L9t9fnZL2xJNfaCywwwMP4rk1ryGiWc48GmIWeNFKHVQA+II+oY7HHlRd1Lnf01o1nTQkgUmWoBRrqQJ8ioQUQEh5aWjHUCBofLk7dhrK3Q8A7KzBZU65/T7o3VJJfzEuI19ToyD36nxy3KkKFuUtClwlmawmqu9QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509811; c=relaxed/simple;
	bh=TY+pjyLwTUPDf5ir2RaYdOuVLRgWyLIHGSinY0E+2Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdl02vmgYIlM40TZRcGUuw2NfMgZQ9Oa3l/exXFjFBR08EbCgStTe0YD52Vmb1ioBQSbIEnlY1StWLjyjtz4gQs5hQjtmwUWK4pYLAshq2aBNdwx5B2lRrdD2QWBVl3f+fgaHtckeB9qlly36sUIUBO7SDwpwkffoLte08nCBFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xjyv7cPI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so38275745e9.1;
        Mon, 09 Jun 2025 15:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509808; x=1750114608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZQW/XKkta3bmAbPorVL6FUoDrPjZvxMvODfSXJnGtg=;
        b=Xjyv7cPIMXXJlykpTA5yIpwM3yV0b1ObTB2R6P16fAUubDWVjlw1wm0KCUgKAFJSYD
         kVS+wdDgxgBtVoAnBi2nzfIj2bsE3llyBedsLtxVc97hta6a7n9Fapz/WoNwMBALkj7+
         5le0lqseeWouL9irQFVRSuWvEVmIDK0WEWdWJ2JlaNC8mm1xz8B1zrvGiEpSCM3nHF9C
         jAPwd9e3ZPLdtZcgDCTUaEtYxMuXbojVWbScZrpUhqBkXgLs4/cB8Wu/P4z02amDMs39
         52W7gh8CrDr3++zZvrZ5VlrTNDWemOC3VUss25seeOLxUQEnjWKZaDo70J5MJeP/F9PD
         c74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509808; x=1750114608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZQW/XKkta3bmAbPorVL6FUoDrPjZvxMvODfSXJnGtg=;
        b=C784TZMHvUdVXDPQg1yb4cIx9wJSYGYpxMJp206q5QIcON1dl1apAYGtvxihoEgjdv
         nbhr0wnbhlHb36KRyLHzCk6ghKyETdzpx/ITt4+laRj1B3pK1o0MNcmOSBZK4GSE3LKk
         8fYG382hh2bJ8KnIpK458IoCABL85gCwuwSDwrJLdv55ogr0rShLEqKZvtJYMeVpiokx
         FrZhkbFCPMwn67rTPKD6pcIITN9QLTFTkYgmMlQ38dCMUy9W5hUnezhFrYynXH7SYvHU
         9Db74zJqGlpRDB/wb5wzYDj0jgQvt9KRfWxFXnrtiSLnfjoyl44DwQ/INCDh+Vv8DlqD
         W5dA==
X-Forwarded-Encrypted: i=1; AJvYcCXzjj2lWtYGVngANHS3EZKsiMIQ0obrTJhGpWcxezYoX/rtlDi3vsczT1seFUORtaoviWje2Cg26IkVKsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywut0I5ERqwLkLD9RXQFK3N1geNuRnBtN9bmo9pk+FGi3Rx82ap
	DPvmhPhDs7I+O7OiejgGxjJ0VwNYHPQ8See3BFKLRjK85ZZmS9DdEA6P
X-Gm-Gg: ASbGncsgJfqp/43uTxf2ubhY/t9MGUsPc2UaIsrKAqxuVECJ3Y9G8O1vY3vAt2qeBTE
	UM+RHc2rqz9HkiJ0O826fSEsn5FUvVk8f+mOM7h84O/Ta4WSFLXWj9mrtziBgQM1/b9gY9Br0Rx
	lMlkzO1ZIeEV/kw6WAmrs+M3+v6wptN48J9n8etcf+4gwK9e+hN91YixkbKbZOc4XFJrBQk2TBC
	RpZv0ua7yZ8Qu4hwrzNUstVcsTD9rYsHXmY9D7Me8ejofsnvHlKAzVLj+ewUqNdTPS6kbP9fBGx
	Fc+hxegOChXOK/eAF7tB/wWTBwZdRtN1VzXPEGa+Bt/k4SuemC913XSrRJTpZSc2ivQcNBq8Pwx
	qdVuG9aUGm2ILS9d0nds=
X-Google-Smtp-Source: AGHT+IE5rBdcJzn29HX+ahTiwa9/e7buXyaINtikVbd58weuZQI2RLRHqqzyG8t/4l+Pwt5XB0hIwg==
X-Received: by 2002:a05:6000:40d9:b0:3a4:ed10:c14 with SMTP id ffacd0b85a97d-3a53189b44amr11940449f8f.14.1749509807998;
        Mon, 09 Jun 2025 15:56:47 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 2/9] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
Date: Mon,  9 Jun 2025 23:56:23 +0100
Message-ID: <20250609225630.502888-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = mode->clock * bpp / dsi->lanes;

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Updated commit message
- Dropped parentheses around the calculation
- Added reviewed tag from Laurent

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 70f36258db63..7fa5bb2a62b6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -288,10 +288,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = mode->clock * bpp / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0


