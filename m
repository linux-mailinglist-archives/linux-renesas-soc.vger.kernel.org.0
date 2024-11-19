Return-Path: <linux-renesas-soc+bounces-10580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF49D2685
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 14:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7338C1F22AA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 13:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB2F1CDFC7;
	Tue, 19 Nov 2024 13:10:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3561CCEE5;
	Tue, 19 Nov 2024 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021840; cv=none; b=NzBI0cko52VhB3qrokqj72/zJBLXqEBjE/d2+tgZOQJa7OElcAAgwjs9NAKRaANVNLd3dxXcyTnwvSi+Vmh/k42rZz1xv3ujnkviuwL06v5SrkIifUNJwDRvLm0qKZ7jbpZUV8EWNHRI/D8Ezo9kSZNTiUPjH2fMSyt1NdcrysY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021840; c=relaxed/simple;
	bh=Aii2wgbJtD/XFN8iIV2Qi/Xrjx91+45IMzC6gtETfDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rltsWzxlcfm83VryKP2nFxg+4Do6DgNPTkFSEN99noneBXvOMDrnUc6/BNIAiXgyu6VlZEITLBTyroN/oq6sQPdUVii6Poqvg+g2Ti//JRNtDYSPYQpnLVjdhXzeeclobMN8JzynfWuheppmdyJzicmWEh905yIuBeZ+i0iFIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: +b9gzVvjRniVWx6mK+8sRg==
X-CSE-MsgGUID: dueywVyjTM6jr8NArlk+hA==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; 
   d="scan'208";a="225317532"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Nov 2024 22:10:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1F98041D374A;
	Tue, 19 Nov 2024 22:10:24 +0900 (JST)
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
Subject: [PATCH v5 2/3] dt-bindings: display: adi,adv7533: Drop single lane support
Date: Tue, 19 Nov 2024 13:10:04 +0000
Message-ID: <20241119131011.105359-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119131011.105359-1-biju.das.jz@bp.renesas.com>
References: <20241119131011.105359-1-biju.das.jz@bp.renesas.com>
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


