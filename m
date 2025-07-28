Return-Path: <linux-renesas-soc+bounces-19715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C99B142C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 22:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 472843AC2A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 20:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07879279359;
	Mon, 28 Jul 2025 20:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em7c94c9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466A6253B42;
	Mon, 28 Jul 2025 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753733683; cv=none; b=G9u+oG6H06xAbwO4/qdKhUUyVBLR3XidrVVtt/A0TPwoM175h8nr1HZHlR+z//bIY8YXijJ+/bnsNhbIPGHYC/17Vu++REgoCd/xMcjVxQsp6upDxeBhHw3VqNB3yCDjGB1aEqxdkGTMAoqIlm9jd8XYBhmrNh9egClpbviP91c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753733683; c=relaxed/simple;
	bh=Xrb1i7MSE7FAk/A5GShKxAcPH/fBCaKJfypqdS/b5i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dou8Pz72bNoNVio9DBVAIybexm/gXFNVp+ThzJaAu8uLxN7pYie7duJ4w81w8oKUdxJCy6LQC0ORiIFdTkx1oh5j+WLlf6F4ZtBdI+Q7c+v4FdoXIpjh4e6EUlyETa5nMF55ZlzYTPfkVaj/9vHBG3TTU7vEFdLZczbQY0uPMds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em7c94c9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4561607166aso33961295e9.2;
        Mon, 28 Jul 2025 13:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753733680; x=1754338480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMuXGDptpudzRDqlzxY9BCXwivqwkH1BJdjiQYZbTBQ=;
        b=Em7c94c9GD1XOSB6AymaEc4/xxvVS5hpxzMKCKRGnp/aL1kBaPEi5jZfiXmoHJH9KC
         A1V0SQDVRBV7sUfiOiLja1UVfLtAQFdEZIYWw1KMJ0K4Udfh5dJkFQJOdEE+74wW1XOi
         wESyQnI9lHSGA/0xXGF3YX6gYeaWWWIv2uacJb2sw3szmEX7rqXYzAff36zr5UQScwq3
         Rqv/bSmMmyDKA7hMcrX4F53dm85CqEK/NLcHmxK+N7rm5pC8EqJarENkOFv4GkrH6KwT
         XB8/4LhcX+dl1DqLmUa5aV/k2dd7gnWPshQ9nWE9FEjFC+xUjyid8vyE9O/9/M0YqNMi
         XNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733680; x=1754338480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMuXGDptpudzRDqlzxY9BCXwivqwkH1BJdjiQYZbTBQ=;
        b=CeVuhP0OuB/IASB4ZUlIqQgsLjCCVSDc7oD5HNLdqEpHsOr32rIgmpa6yT6Hs9lu6/
         ESUaZ9Q9dlBV5twDnknNLe/gvZoxEd51oehb2cfPHJamDoBGUZguCNkuvkmU4IEMtr8X
         W6XxM/Z6uUwwJ0sr7plsRHAey2fODiYLLDRBCHsW1rSxsAVCtYWqdeAAXuF53lVkMjbC
         /lG8wsq5YauuhK3VGdzNAoyPfFt8IXJ6ugMGOT7slYgMO/MsCOW732hPZARj9wq9lZlX
         6Lz6Re9fzaRxg7/Q/G2pl23c2WMOTnpaowR1ywqG6pA1vpLs8yHlRc8WmZZ9AVXVoNTF
         b/yA==
X-Forwarded-Encrypted: i=1; AJvYcCUFGp6UWa2jpmx1FXO+xP84LdsWkkbdL+0oV5r//p4qBmsSpoLldtbeCvSv0JM81lMXlf1QkBGmf8ht5klo@vger.kernel.org, AJvYcCUI+7zncsblOmJBaPRLM9FVpAYO7/OTzTSBfaxRqeAoZy09z9uegkie4vDdst193+9BsBdQhEwIkCb1@vger.kernel.org, AJvYcCXYoDLQkcdTfYvCM3f7NO3xIdwv3XkTjCBA+07o/Jt6i+nwqFLqfEZ/7R7P0aAQBXq7TCrNnFkBZWIQ@vger.kernel.org, AJvYcCXg2A5LydT5nVEoQLHkhBg8n9yBJEbGXXZsNnAJQ2g0TIqbvkkamZ6XwKneTNQWHRyfWmOKrps65VIfE7IpcP9tk9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwelnLoNeDUzpKicJVmt5KwQxFpMv+rwYU9HW3JXMGqUIm3agLg
	G1r+3KnRxsohH/3kM6MgOQmgv3J6CGesAvFlN8zPrLnCb4lGXLnk21LP
X-Gm-Gg: ASbGncvO/PbxbbZKv8ihWAm1hLXU2kE+d8ayJ/Eh/26LvgCm/RC8M3GJ7b95Nv/97ge
	l36DptpI01O+xn/yt/zfvXX7ucCMxeSRX8vr8ydC2ew9wlhdE9dJzNxjwQkyWHvd1uugf77ASKM
	nq4gSXxypB0vNfsLtcnTRerlavdemZ58/OGp5BfGNI5dhVqbJG/7RcMJlUyDBVCAEfBxD3FIwuC
	1j64GzNViAEdSeWdgs/oOyWi5lXxrqRW4B8nM+5rIzfq4XE4vHJ/1Kj0LFnzQXy5OPzk7FKj1PS
	dm5iZsYEIjCVNoklRHMagY2crRtL44UoL7Rb2b8d1Q0EVi2lULgyawJJ56xIgRXQfsRFdIyATRA
	LWZXEH0ya5t58pNZJHZqiTTPQrNzgYXqtgFJmi6HOnv8bcxzTHzkAcDWIWzPW5PD3OSl0MNR/Ot
	DdMetqwfQ=
X-Google-Smtp-Source: AGHT+IEnC8IoXVKoS4VI4Nn2RYIdFiuDczHhoY1pfwevf3WxCTPWE3ejH5RaK7+c9B064MgVYFHXvA==
X-Received: by 2002:a05:600c:1e2a:b0:456:2832:f98d with SMTP id 5b1f17b1804b1-45876556361mr107218895e9.27.1753733680306;
        Mon, 28 Jul 2025 13:14:40 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:14:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 1/6] clk: renesas: rzv2h-cpg: Add instance field to struct pll
Date: Mon, 28 Jul 2025 21:14:30 +0100
Message-ID: <20250728201435.3505594-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
macro to accept an instance parameter.  Initialize all existing PLL
definitions with instance 0 to preserve legacy behavior. This change
enables support for SoCs with multiple PLL instances (for example,
RZ/G3E we have two PLL DSIs).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda..e2053049c299 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -16,20 +16,23 @@
  *
  * @offset: STBY register offset
  * @has_clkn: Flag to indicate if CLK1/2 are accessible or not
+ * @instance: PLL instance number
  */
 struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
+	unsigned int instance:2;
 };
 
-#define PLL_PACK(_offset, _has_clkn) \
+#define PLL_PACK(_offset, _has_clkn, _instance) \
 	((struct pll){ \
 		.offset = _offset, \
-		.has_clkn = _has_clkn \
+		.has_clkn = _has_clkn, \
+		.instance = _instance \
 	})
 
-#define PLLCA55		PLL_PACK(0x60, 1)
-#define PLLGPU		PLL_PACK(0x120, 1)
+#define PLLCA55		PLL_PACK(0x60, 1, 0)
+#define PLLGPU		PLL_PACK(0x120, 1, 0)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
-- 
2.50.1


