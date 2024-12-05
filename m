Return-Path: <linux-renesas-soc+bounces-10956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787609E579E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 706161883943
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F8421A457;
	Thu,  5 Dec 2024 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sf114J7i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FE521A42D;
	Thu,  5 Dec 2024 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406336; cv=none; b=Jsb3aSn011ENjOAOLXvOg9my7uyhUEsQ2ti/plbKHKgqaj4esZPIQ7RQAqTwvcdIPhTj/fGr+287mqkYioXfdcfDAtMZrn3k23zjbASS/xQeKkgMu+ffvZKcd9eGCFKbiYOvIt5lhh7iSGTEoUdcheaRN6ICHx5oEAseTJyDXqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406336; c=relaxed/simple;
	bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AlXy0DYAMst5/2b069PiBN6sTu5oNm6D70BMpFWBl5lIGFAmM4PZwgwXeKY3AmXP14vUXwJBa6g0VH9ptMk0VwVkUpqGOmDXzDr+c2B+ez1nUQWiTA8nXyGTmT0OfOjas6fdZ/yxY/1hmTVfsfy0C8V4JYHXyHSRkZZGVLUYaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sf114J7i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01F5AD01;
	Thu,  5 Dec 2024 14:45:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406303;
	bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sf114J7inwr/qgMflsHlg/9+4hUFvQQ3uBKlMjcAbX1rU5hR4tQshZ3rHST234mbt
	 jo0XKD4lLuPay4odo4UQx5aEFAFEXVkAS0LS4hAyLM2TCrq34pOsu1Ol7EhqlV7Tci
	 fSSOH/fHSH+Log862lEMdidF4BQqt9g93KbXdn1Q=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:44:58 +0200
Subject: [PATCH v2 03/10] dt-bindings: display: bridge:
 renesas,dsi-csi2-tx: Add r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-3-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dTprj9jjuLmoedubnDT5F4e9cHFBPmdT8w1PeMV2wF8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5yWRMiq+qr708cmz/km+OvSL/hXvfR2V7VK
 NEToNpajXmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucgAKCRD6PaqMvJYe
 9XbTD/9d8IWcl8EmJHjHJbJ7lo9Mdk4BRIcv1MpyOJrxiVpeZQtw5mLGyHSLIeUXAV52Ap+t7Y3
 cyJHf7W9q+5uw86hqU+yxRQF7SWRbbWlmxKIXdYjfks7onk92AH9bNqkdYdd3V1a5LoMPci4fQz
 BXVwbU2URPvytR07pZOoQlinjpe8rIgYCF8+9FHruzJfXmZST/EkQcPg9MeQnri3D4xrV2lgapi
 Swcpy6adhrsm7ZzqnaOr6CD2zFRWyKPSCeZVFat2nb/e2qpnzAc0rLJXMTgcJ0PZbFYPjVNiEqS
 RPAJ/EkdjsGOm370IQ8yapavj6PbfQcTK8TZQZT7qXT2gCgLhBL4Sj/cHwc6qnIygXByySltFwe
 bPzZ/8CZYn0/i3RsYmbDqy96o+Helio4eoUfB+w0InKjMZffNjORgs+hiwN2QnuZ43k+8Utf/CH
 Md+rBGdTtIx7mEjE8xT2+Jls5tUiDsFxUzjcGIe8bgYFjH08NsZ65OdZzKN95+epYdDGs0kZmNu
 TcYSGxpN82FzU7R8qIwWX5H1DmWa8pT1cen2/IWDQwE7uAF/b8TljujwrZdba9CJXYICKKvxWKL
 53JPzO8UXC5uCcWn8sP6VyMYb3qQgwLtGO7lY2zZLElTR7ti9NgnwnyCar6UgYExpAanPzIk2WP
 GD3wbMTWpjDsoyA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Extend the Renesas DSI display bindings to support the r8a779h0 V4M.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index d33026f85e19..c167795c63f6 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - renesas,r8a779a0-dsi-csi2-tx    # for V3U
       - renesas,r8a779g0-dsi-csi2-tx    # for V4H
+      - renesas,r8a779h0-dsi-csi2-tx    # for V4M
 
   reg:
     maxItems: 1

-- 
2.43.0


