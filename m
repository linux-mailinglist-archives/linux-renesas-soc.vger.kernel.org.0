Return-Path: <linux-renesas-soc+bounces-10984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD89E6A35
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 10:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E717C16A442
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 09:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D0E1EF0A9;
	Fri,  6 Dec 2024 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EoRQVrwV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B72C1BD9E4;
	Fri,  6 Dec 2024 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477611; cv=none; b=hdYHCLhB22ODVF/SLkeGhh76QOwbVBwpmYtveNN7nKLdq9J5CXqsB1BeGGA2j8TswEyAMZmhme2t0IA4/eLz2Pk43gND5Ag585a8WGO4N/w23YEKqxv2VS3AeEBgJqbdPRRrmaSSQ9WhfEYxiRlQj7wF9qj6Lvim1SQXRv26zh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477611; c=relaxed/simple;
	bh=kJ+kCSC3s5A9h0v99LF+tl5qDYYIgHG+gOREB+KG41U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W/U1sWid3PpnULn7ASUnnE1Qny1cfb50UyRRXHHZDj/NvbGJJryMgWJgn4/cX24VhTyLpY24/dUj5QLORHlUcBjuIMEBohRflsuLm2iMeBWbtUhxDCkC2ap2A2bgSrIvy29vEP9tslRBgZMY3gS0AHbNxW4u7r0aZ4td2LqM3GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EoRQVrwV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C793641;
	Fri,  6 Dec 2024 10:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733477569;
	bh=kJ+kCSC3s5A9h0v99LF+tl5qDYYIgHG+gOREB+KG41U=;
	h=From:Subject:Date:To:Cc:From;
	b=EoRQVrwVQKYsmaG/gQPfrXgdXhVyAokW6dDn7GKIXlRTKrWwiexLMVPDQLDhTCe1I
	 rI8QzlNuOwVQzjL7/H2FxJVb6MkCj8RUp+de5Ca6EZL1XjmdPekl2XV15NNd3w9SVv
	 e9Wb5Cdqhs9gKgLQRWN4brGrjxXzLiWyuGWoLdOI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 00/10] drm: Add DSI/DP support for Renesas r8a779h0 V4M
 and grey-hawk board
Date: Fri, 06 Dec 2024 11:32:33 +0200
Message-Id: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHEUmcC/23MQQ7CIBCF4asY1mKAFktdeQ/jYoRpOwuLGQzRN
 L27tG5s4vJ/yfsmkZAJkzjtJsGYKVEcS1T7nfADjD1KCqWFUabWSjnJHlj2gwyJZOuV7mxABO9
 EeTwYO3qt2uVaeqD0jPxe8ayX9esYVW2crKWSTeUANbQ2GDhTQEhxvEXgcPDxLhYum1/CbglTi
 NrUjXZWh84d/xDzPH8AYzTF6/AAAAA=
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
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=kJ+kCSC3s5A9h0v99LF+tl5qDYYIgHG+gOREB+KG41U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTVfwGNZGG7KG9JClvLjKj6lIgTWnNApNAaX
 Zm92rResoKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE1QAKCRD6PaqMvJYe
 9TMdEACJRYIkG5zi1lN2zs4kEskoSapB1bxCIYUhHspPtILgF1QJ0dm903CBYz7n9Koz9quhQ+o
 W/cma3U8xdm9x6oOKAoy0jHMVm1Io5p8NxsxzSKhKeTOfMCdxux8gOPoHwKt8362gNIvoJGf6YK
 1RijWu27ucJB66MuLbrEGRp/96cJBfdCrRr60YhChFzhMFDr8UBdP9N3lG+VLG+2227UWo41nBi
 C4whHHmvHaRsLbJu7dhducmGmxMb5ZLcKdTBCFTGrdQSJzqgrwtwTheia75Fe2+/EKua/rgdLAU
 krAmR/cheAh/JoWLeb8BPUG/uY+CjvvaGMJGfbevDmzIFHvvEoLubQcyVx0u1GCTIzydY5RjWeg
 CoauUFwGF6x5rEBZnXAtu1POdigQ/BIy1iJGSvQj9y8+RxSQqJe+YKFn4jkLJt/Q0+F7EEjDXTu
 cA4iqItUl8cvC9Ee4qYC9n8dZ4yi7rgfPJwfCjC+CaTxqeG6aLm5S1UOnfRD3DEAM81n++qZmd8
 Z1kUwSVwGa9Y5ybx4krsg7OOmg0+QE0DqEuu0VZ96SeZNQ0H43h49sv3FCQapFCrwSBZTVaC6wx
 20TA7Gd+FekPfRr3chCm+mlo60QfRaYUS9aIQ7c2Gz/AaMJFBqJjl5hEhmpRYbOKHMJ557O8hS2
 AwwvLkwniNNkwdw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add everything needed to support the DSI output on Renesas r8a779h0
(V4M) SoC, and the DP output (via sn65dsi86 DSI to DP bridge) on the
Renesas grey-hawk board.

Overall the DSI and the board design is almost identical to Renesas
r8a779g0 and white-hawk board.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v3:
- Update "Write DPTSR only if there are more than one crtc" patch to
  "Write DPTSR only if the second source exists"
- Add Laurent's Rb
- Link to v2: https://lore.kernel.org/r/20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com

Changes in v2:
- Add the DT binding with a new conditional block, so that we can set
  only the port@0 as required
- Drop port@1 from r8a779h0.dtsi (there's no port@1)
- Add a new patch to write DPTSR only if num_crtcs > 1
- Drop RCAR_DU_FEATURE_NO_DPTSR (not needed anymore)
- Add Cc: stable to the fix, and move it as first patch
- Added the tags from reviews
- Link to v1: https://lore.kernel.org/r/20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com

---
Tomi Valkeinen (10):
      drm/rcar-du: dsi: Fix PHY lock bit check
      drm/rcar-du: Write DPTSR only if the second source exists
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779h0
      dt-bindings: display: renesas,du: Add r8a779h0
      clk: renesas: r8a779h0: Add display clocks
      drm/rcar-du: dsi: Add r8a779h0 support
      drm/rcar-du: Add support for r8a779h0
      arm64: dts: renesas: gray-hawk-single: Fix indentation
      arm64: dts: renesas: r8a779h0: Add display support
      arm64: dts: renesas: gray-hawk-single: Add DisplayPort support

 .../display/bridge/renesas,dsi-csi2-tx.yaml        |   1 +
 .../devicetree/bindings/display/renesas,du.yaml    |  52 ++++++++-
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 119 ++++++++++++++++++---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  73 +++++++++++++
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |   4 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |  18 ++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c    |  24 +++--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   4 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |   1 -
 9 files changed, 272 insertions(+), 24 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241008-rcar-gh-dsi-9c01f5deeac8

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


