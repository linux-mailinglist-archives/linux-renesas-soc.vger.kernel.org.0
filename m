Return-Path: <linux-renesas-soc+bounces-10596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97209D2EBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 20:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41AD9284406
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 19:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CEF1D1E73;
	Tue, 19 Nov 2024 19:21:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF761448F2;
	Tue, 19 Nov 2024 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044063; cv=none; b=oa2nGQ80aqMUpXh+v7ip44e3mePAR49AMRcIJiMAQ1jHVyu8TS4s8/YLwje9W6nG4SuGK1dMvzak2VGAdw9gf7q1cvkGYke67G8CXTktK629aUDQcL8+1qERWs3Q4JwVMgFHHtQxOO/n+Uvm9u4lGsgWwurlPRuSoG29MNMzk4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044063; c=relaxed/simple;
	bh=osL67OKgpVFC1KcD9mIsgUMQ668ZcU/Gn2IjG0FfsNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAYJPXfBtV6BlSuFUJ6qTlLLAGiyg4uODjHS5KVG4hxnDCkh1XkKLyB3EXlNrHGcK0O+KTsVQSwpNyzEZI+gWeF0T43VKbaCc+D9L79BK29Ikm6vHFTWA+Xz5e+oRDrkt0PftDr7hiyaqlgC6Xzx79F5cps+mUCgWBpNVobE/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 39AOOys6SbSVqfz3XjmslQ==
X-CSE-MsgGUID: BKUOczUtRT2/MDX0/Krgbw==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; 
   d="scan'208";a="225336219"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Nov 2024 04:20:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 66DCF40503A1;
	Wed, 20 Nov 2024 04:20:53 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v7 2/3] dt-bindings: display: adi,adv7533: Drop single lane support
Date: Tue, 19 Nov 2024 19:20:30 +0000
Message-ID: <20241119192040.152657-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
References: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per [1] and [2], ADV7535/7533 supports only 2-, 3-, or 4-lane. Drop
unsupported 1-lane from bindings.

[1] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf
[2] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7533.pdf

Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
Cc: stable@vger.kernel.org
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Added link to ADV7533 data sheet.
 * Collected tags.
v3:
 * New patch.
---
 .../devicetree/bindings/display/bridge/adi,adv7533.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
index df20a3c9c744..ec89115c74e4 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
@@ -90,7 +90,7 @@ properties:
   adi,dsi-lanes:
     description: Number of DSI data lanes connected to the DSI host.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [ 1, 2, 3, 4 ]
+    enum: [ 2, 3, 4 ]
 
   "#sound-dai-cells":
     const: 0
-- 
2.43.0


