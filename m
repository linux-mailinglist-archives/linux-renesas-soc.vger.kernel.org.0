Return-Path: <linux-renesas-soc+bounces-15587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D353DA81679
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFAE23AA72A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D602550C5;
	Tue,  8 Apr 2025 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2kqS/oz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7654254868;
	Tue,  8 Apr 2025 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142976; cv=none; b=jL0nZLtP2VUAzOixwwJzsyHEYM94yB19dH+hBjHReoTYg7M+LBIRvpk3Qx4XUAQvKS0lYh+ic63I8ymuutJV5IT4LlXd+QVuBH9jsezd1yaFYNrwOhcjRTUSAEEymmh5RaGQJxhNykBnvXHYW/9KI1uUPC+kqEcy3EI5U+b23dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142976; c=relaxed/simple;
	bh=U6YHpryf34ORYa6kCEzlSMpsMp+HlGqDj9Vsn68TPAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9cHzuj9y2f0HJq5tdqtURPmFC7bcBolpchk6Bug0fZyPWdBQ+e1t48ganYnPh2VKmeis6D7anNeMQ/6KV7PPPpG3ZbN0wO43K5ZIvPvVclsbTNii8qUnIZRew7zamXOMygzHdfN/OfPvgSnt9K6iRV+rUu1hJvBSTh4PAHfT90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2kqS/oz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so56917345e9.2;
        Tue, 08 Apr 2025 13:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142973; x=1744747773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Oeax+taIOF2LaXOQfu9lrknbbu6k66PRaU7k7RYMA0=;
        b=M2kqS/oza1ZpTaisKSZMXdtWs4jTUQDpv2+921cqgokIwlE1/AEFyV1m5ZwaNEshcG
         JbV3E9x93jsgnyHKLGAx4yJ3Q2a6YiB7tbQZf4GgSIGgFVFardu+HGKCYVSbaZPNfaMF
         L5rHNWuWiMs+oe2MIECEKvv7BE3zCekQ/BQJZPO40+5YORQFoGj/jnbCxBB6TkLmrHsI
         bCIp995TlBPP0PeMfojK/ed35g02Zaq4HoMDv52L3rC7pZRtlXA35wveoXcm2XbD4BSj
         8s6S3vbjf4uhQgseqdlYupqzi2mPvos2B1ABSA+pYx+CFUQumU0lZnO/nC3SiTwrW2Qh
         giTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142973; x=1744747773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Oeax+taIOF2LaXOQfu9lrknbbu6k66PRaU7k7RYMA0=;
        b=SJ97qVF2UjfdYufWXE9Qb+diAgD180kuXjHfoVwTEGwfth3Lt7r+XdzQAO2rH9dB2C
         Q7BBI9l3NLcQwgOrYgNgKviqNu4E8273rYgRlaOayTo9vALT+upw5r5kI4JHRpIKUxlT
         w+OYB8GPcXqrYiP2VMz0OP30yXP18b8mGY2aYPpZ/iXzKlGprTeV/jEKLu10ISLwo/88
         /A5AVmjMAFstDs6DgbEiugTygohvWOZdG4AXaG1ccCRd4YAXTd05cTp2933Aji4496Q1
         fCDBLzXqKPdqWQ6bLe1yDzCXdkcB3DfmgnmRmV9d14YMnVRMNWE/lHCwKQUy+3zga8mQ
         Vvxg==
X-Forwarded-Encrypted: i=1; AJvYcCUUSy8QqaucVqm2rNGXw5iH5+ywULa+wZARtVN+CCHFa8CRgmBd3Jw8x6y9dseWNkn7m8c7KdqFm87E9i5Z@vger.kernel.org, AJvYcCWJPtWoABrf0jdP+InmK4WD+E8Wa8VMUEwHD80eiH3Gcn7Woo3kBweJuwPBzDNs59oF4SljFSsSaUup@vger.kernel.org, AJvYcCXLKiC5y3L/s2SDa/FSA0uhZobHKYOgVOebFS9Dt/c2FMbH1YfCac/4Aaor32Q6t59S23aUHAKBAdeY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3sGZiyiIz5GOM2+XtQi/hSDJWgfQTaQxYc3SJPxUtPACIdViu
	DZWphYNYQlJ0jNcN0HdXi3F9q33vu0sq503pFJgcO4Lx+9L8EgXR
X-Gm-Gg: ASbGnctuaniSemXm0MBIJMt+F7o+pj8T/OUT/2lE/+IzA2AjysIhC9HzRaJvIjw0/tY
	Cs7hZsVA8bbGOskSsM6GGe6LB0OrjMFUvvac0uZ9oIHmOa153ldrpHal8KTK1ByvCI3KDx86Wqz
	ELKGfoRMnHE3jUiBGx1dDjgiRSbcNLOqQmgCoQko6V7DJM2rhwU9UKF20+v3w1QHACi2NsVnAbL
	r+3u5/tDp/u/j+v2+aq+NyQA0UuEOv8/LWdUxmFWzXYYRUkVbfrYl3KyR3ppiVbGYriMSBxGCaF
	ZcytVjKcdv7hdFrMWZ45qX/Imjwd3t5qTwO/rvjXmWHOZ/gur+uXhbUJKYilRjjro4Me
X-Google-Smtp-Source: AGHT+IH7Ae6ykmbXIDuFpKuw/QhBa6DXfXQa+S5ke53WnVI5MFIztSs0KTGEiv0645m3mQX74QyYGQ==
X-Received: by 2002:a05:600c:3b0d:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43f1ec0cbc0mr3666045e9.6.1744142972816;
        Tue, 08 Apr 2025 13:09:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 06/15] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
Date: Tue,  8 Apr 2025 21:09:03 +0100
Message-ID: <20250408200916.93793-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- Added Reviewed-by tag from Biju
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


