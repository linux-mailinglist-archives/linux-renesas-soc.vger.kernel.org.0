Return-Path: <linux-renesas-soc+bounces-17722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B4AC942F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D889A1C2181F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 17:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19E9238157;
	Fri, 30 May 2025 16:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnH+Sfj0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33721A2C11;
	Fri, 30 May 2025 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624361; cv=none; b=J+8Zt7+ZUXzXr/TpHl3gy10qCF27G23QwUZuJfwUCS0ntcA3vJSk5SCDjK3yo8b7Os4xCHzjlGpzPrQ28JyyV6dbqHi2fhreFLKxN0Jma6NK+PWzfCTjw42XqW7r9dtaeHAYecy460+GzpR4oDq2D+JMXs92Yr+drrvmzjnJb1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624361; c=relaxed/simple;
	bh=wuel0XQ0yfdkIvfG5ACFiCAoXe9eIR2eNDN0+edPnAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uN5g3E3SgTqnTnn5xZnwsBPa2ZfO+vG/Nod3MPZGgY6V/DeBZ2jAn0PexCtRDQsoLK6oUxoBTtn+VJ8LUFrIij1Z4rvnoa6gwjRbvlrqXCxdL1hDPTYKFJdk+arYxUT5i8U5+zNcO7b9S68a9kqkv5+VcdwCk2CrFmozPy9x330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnH+Sfj0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so1365727f8f.1;
        Fri, 30 May 2025 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624356; x=1749229156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep33XalneBbgJw013YVa3zWaUedAxlfWPYCFu9hRrHA=;
        b=AnH+Sfj0Uwk60o0J0yltpcRV+CGpCjYNM2kVPMf34wu2opuaxkzo7X1pBUBw97ybmU
         DqYEnTn/WowpBt1HqrM5cDOsYr1tkvpKRDjfE63RZUdIfCR31/neut9B7RqApPouzK+G
         fo1CP+QUxD6nePPRdkeLUMk8WjSAISlCOh1zdHf0I3Q+xInkUCQTH31TeKkSY4axRcLg
         52j3N6ViD7MpOPpraVyXirtWIZ8kFmTNja3IWuNHWcE77/F5Hg2bsIMsEEJvT+KZjBKl
         pdpuyPtRNsRKiyn60jCOR5L5d2fgMNzr8SLoDTLCSs4j1IFFKeYKvyCiMfuiit6tQ+UX
         qoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624356; x=1749229156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ep33XalneBbgJw013YVa3zWaUedAxlfWPYCFu9hRrHA=;
        b=B2hJqp9ciYCT/+BcJ+86SXA33u7xa6pY5W3A3NujLq3D+3OFp9v9FGn/ocmqFdgfiH
         Vob9Y19RcBF1ThIdXZMmuUk1WvG0tPThitGmQ5kUu197bzr5KCmhlLkAmwZ9s2u9MB3X
         zipQbdOp0bs4oxhcmH7UeC1o07HCGoLGmegFN1FiYOxI0KrsEuML30wx7u8m8uT7LnTr
         BUpi6k+OlZvM+7Yq2HPYqsWw7Ye9LR+W3QalJku2xd0Jxc8fXk3tH9TWFKL47k4jb4p4
         RUhp1sPAOLKsNbkr7hB8ZSmXUPyx7U08Uza+9a44K1rCWxM65UcLV454IVKj8VyIM7RH
         cyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH42i++6KzyXTmeaGjZMxwYfQ5r1lzIQHN1KB1PJRU0KXRW6KgSmXHKd61VK7A47/0FdXUKqvum0W5BBb9@vger.kernel.org, AJvYcCX+8aRaFHn8rS2N09lNYIxms0y5UjlaGGJDvk6euArADpOHfUAOhJyLyVJYI2NHFM/tFO8/w+jd0ojE3keDgtH4d58=@vger.kernel.org, AJvYcCXwaAF9Q2TZQp6rFrbk1KeG9czs301pFkpjpHTCPZDa3SXA0GdbMeVHSucLaP6W3xPbfiB8as+fqDhe@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDf7znkk2bdXeDEAbhCnl50QvcE59N3PSbJNXaW1z3Zu71gK4
	QtKY4uXJJgY6mEFBJmr3ykJ84VqRXw0t+smkbJMiV71EnXlEegySI/RC
X-Gm-Gg: ASbGncsxfPWO+fK1v6V8Kio1U8QB4LtB6s6FXHEx5YLVBMmmNKzVkge4NXMkMKAHYK0
	4ZmgF1eSWdxtehZD158DEfeXD3Lo/irGKPcIwwzAQxx+t8iwgGYERD9AUCGsEy+sTsL0+3rzB9q
	rOvOC8tZVG7Uo1gsSOaV2DHtE34y1TeYZ13X7QVzxid/tiYG15DSm4KO/VMYwlEuVrH9aU5RT+e
	J7mQ+u5Wr9KTTlaNENrnrngKM1v8pGcxwn2YiS2yt5M9hAXeOk0DLEzLimexMQFEKClcevT4Lj3
	OGGvbbCch3irP6BBGaWGv9fIvccOAkbZtBtiwya/9AhY8hKNZsDIFvO5FvutTBAbsuvu+DWO145
	YBX18opvRhQ==
X-Google-Smtp-Source: AGHT+IHYiH3AqyGyheocdIkswg46QDLFkDwqyzaJhubDoD5U6wTGpioEJ3rCPpOKyjYwDrObzAjy7g==
X-Received: by 2002:a05:6000:18aa:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3a4f7a4b434mr3253740f8f.22.1748624355998;
        Fri, 30 May 2025 09:59:15 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
Date: Fri, 30 May 2025 17:58:58 +0100
Message-ID: <20250530165906.411144-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 6aca10920c8e..e8ca6a521e0f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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


