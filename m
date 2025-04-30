Return-Path: <linux-renesas-soc+bounces-16540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FECAA55D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 707CC9C73BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891512D0AD9;
	Wed, 30 Apr 2025 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5QfSty4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D202D0282;
	Wed, 30 Apr 2025 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045687; cv=none; b=bbIhwPmHfhdGxoT3NoCo6FfppHayh8uXI1viH0fARPRy3IwcDzd1WQ6pGV353wk85dAKLLlc9MrARC3SXCrluNGbmxu14m9EewG7a7YlO/zSWcioHTgCM7MQeQen81Np1CJW73ZeJ72UrbA8TdM4HVw0Im8/bQgjkLhn4UE1oAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045687; c=relaxed/simple;
	bh=WEusjA7ReB2cxBCMHievkibW54OsTj3FYSQez5NwNOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBDc/sUsWQzpEmyJk51npZkN4wPhkzKAMFxq+xCtE0BrjhPB3ngQx/9EcSu3Y/MusLzR9h/MjWf0BdKKGLnJcd7aAHIauuyLQ9FKVpZYdBkye0lVukGHwvDi8wqZ/PxJBx612XwBjdwA6IjVEWquMnat5neTRVfWCKG30QFW/QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5QfSty4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso165019f8f.0;
        Wed, 30 Apr 2025 13:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045684; x=1746650484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J6f44qXU4d+QYXzioKtQndqvRly6E758jI0u/hrS88=;
        b=U5QfSty4BzSEAY+OpZM3brcPXdq7DK36am9DuJaBWypKspLDSCAVXmpQiDQfR9rI8t
         CqVaq/lguscRCO4vy5e51tDM3D5W6Jf1ceuY0cGvHPNUu70KUWqpQhUriloqE2yMVOeV
         M3Jx7iUbWH9LJKfrn/jRce7qldtOBIa2GhA60+HMi4ULkXM0ZRcibuQPi3h5VLSVibAr
         go0wVPLx6GFiqoujz1QvMC75U1JZzwnJ7Zdbr0XxpOQ3ENIAciUtfAESTrz/Ld1i71FR
         /aLWEUlPDVUN3jUA0SNvEYGoLWR1Rjsai0MtFt2bdeYIM2WKsKroKbKB4oAQq2PZd3Mx
         VxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045684; x=1746650484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J6f44qXU4d+QYXzioKtQndqvRly6E758jI0u/hrS88=;
        b=n7n9nJEt8vqXgvB6EhO2fui0Vxkm9wDq6hPxxnCRGTCzmkju8OAkOStV8j3EnRkTom
         1A+Jp6zt2DPUfRkbE8/r8QRJjf/e0Lvz6D8JztTKN17Mg6sraw7Crsrj87Zzg3hPo0Xr
         IZb6xvkXJzeud8cAwTxtdeS5i5kzyLyaLREr2oraSzJt/6PTK66Qd9yMyj7Czk9l4ZZF
         sQm3GbGoBnVBtyPqJ7g0cYo3wcDwLLkqbUJXYO9Ew1ik+5cSOnv7YGS+Cp+7oHeheaCS
         +Ri9/wQrfbg+2JDAOxfWmL7bMQuw5aOQ0o9dQ5D9SO0x1WEtN9hkX6AAaHdawTW1oSA8
         z2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCULbG2Yf2diIu0QV7ZXH/N7CoETf6x6F1yW2LztknnyEaiGciv3j5Qn5oZahgaQoM4tmGJhs9d5BtHb@vger.kernel.org, AJvYcCVF0xm80jtrfZERs6dH/qh5KaSqpHS9z8QQ4P8oxOrJ0v5Os83BOAGHpFuIrOTrcQEc+Vazrx3Rv9gf@vger.kernel.org, AJvYcCWwInyRt2BBqZwGqGqdctY73PieErhvKOxX4fNCF8aGpbsUYzN/htzH2VOVOFKjP1a1LWxJV36DagUTj3V/@vger.kernel.org, AJvYcCXKO1eWApXdOjBRwq6wwBTUuj1sq7PNY/qRLySqpUNBsOjK48Sd9dHAfinVu484inl3izQlWIhSr1G4MsIVne6QtpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRmqZ7uYTE7IjY2M6w0hpCGKKifiIZdy9A0C35AyCYaFfhaUml
	VJwtRy39zePKcobWD5ZcQl6sVc8650FEnLdpdLls8+4G1AOaJnE3
X-Gm-Gg: ASbGncuTQ8OjC9PiBWVDPOJ4Zwz7jgmkfzS58GykgsZe3702r0YSRaMtjzMdVTWGFQU
	2CvNS5kCbIR18mytTW7P4L0eM/Ylv4ZTBbjmeUu46jfYIP6cKGwzNEzEdViMO1CIik2wnVPSmqT
	a3xvfmZdPjYvCSEIlnx4u1nlV67md2Uk+tN567ckEwiyblCz7ov/Xf9aOtZOdZ3iIpa4n+K3S/4
	SbeKgCgWWKNj9EWFK7QyoQFJBwjCVSTw8eLxWJYbrRNTpHIaO9cqeDt2L7aB9NfePTv5N8uX/J8
	XAmCi+O+g7l4/W/fzNmB8awH4EXDM+bC4AzNkP3SqUf+0nz7XC4UkDD+5nGFOSj3s6aKTMWMbge
	/Wq7wXEPXSA==
X-Google-Smtp-Source: AGHT+IGihVH6SKs3W13DbVj6p5AfcNt/R8LnX1oxZatYwR5jlHBRYRJRXn55KS6WCOqZEYzxUTvVqQ==
X-Received: by 2002:a05:6000:2dc3:b0:39e:e588:6721 with SMTP id ffacd0b85a97d-3a08ff34cd8mr3628651f8f.3.1746045683894;
        Wed, 30 Apr 2025 13:41:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 06/15] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
Date: Wed, 30 Apr 2025 21:41:03 +0100
Message-ID: <20250430204112.342123-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d84796..ec8baecb9ba5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0


