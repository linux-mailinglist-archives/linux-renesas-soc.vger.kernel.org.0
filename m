Return-Path: <linux-renesas-soc+bounces-11288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC99F0E44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691BB28173B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 14:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869741E04A1;
	Fri, 13 Dec 2024 14:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f5kOHp7U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F31CDFDC;
	Fri, 13 Dec 2024 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098601; cv=none; b=JEfxJCjlrUZcPUgMBTgajDZa7ths6cye1+kCyJHERviAeavd4SvCjrCM81bnxT0dQwwMhfqyh9XSCPc295WrVH5+7QwwsoyTp0lK/HxSdAc4biG57wzx7BZdPdAq0Zv+rMX7eObj4YzTPiyWU2pcl9yOG7MUhwPBh5ciLKQw7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098601; c=relaxed/simple;
	bh=j/k77OUtY9dmOvMhi5OhiMJXLSCWp2c3W/lcveUxkXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KBGwPDnZGxtJg718bsGq3uGIJJAwdbqsi69r6Erh4PxuuVNcoqTUAi2HW4PmFd+7mUNqIvOHtNEPeOHbWXVAgTW0YDwW9BUG6qusvTNv7cW396qvd7DksB+7XpYXw5jCHoHFm4N9XaYD5neT+nVp0CddZor28qSdnVICGRv+owg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f5kOHp7U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3930D752;
	Fri, 13 Dec 2024 15:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734098561;
	bh=j/k77OUtY9dmOvMhi5OhiMJXLSCWp2c3W/lcveUxkXY=;
	h=From:Subject:Date:To:Cc:From;
	b=f5kOHp7U4Ht4foUvtVdet4HfC50rWf0sdmjvNt68ffQdI51MkdS1qR2uZKKzdQ7zm
	 fRqsokYD+qUFbjTPhLMq5ZSeIBbqPEmZfie2byD7WNQU8IvgYW+/BhuaWTxs1Cr0qm
	 FvmfLn6iCfOy+Prf89z3FH0A6eIXyWHIAqKHxkMc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/7] drm: Add DSI/DP support for Renesas r8a779h0 V4M
 and grey-hawk board
Date: Fri, 13 Dec 2024 16:02:56 +0200
Message-Id: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJE+XGcC/3XMQQ6CMBCF4auQrq3plBaKK+9hXIztAF1ITWuIh
 nB3C24g0eX/kvdNLFH0lNipmFik0ScfhhzqUDDb49AR9y43k0IqEMLwaDHyrucued5YAa12RGg
 Ny49HpNa/Vu1yzd379AzxveIjLOvXkaLcOSNwwevSIAE22kk8e0eYwnALGN3RhjtbuFFuCb0nZ
 CaUVDUYDa411R+i3BLVnigz4WplJVRVi6B/EPM8fwAN2KtWMwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=j/k77OUtY9dmOvMhi5OhiMJXLSCWp2c3W/lcveUxkXY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6ck8SEP/xxyX2AvNoR/xyT6pkJqOS+vcc+w
 6BiWaD57F+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+nAAKCRD6PaqMvJYe
 9RMFEACan9Y3fKvr+iPAgDvmXPF75P7RZoPR8NlLbEmat89KC+kbbqM5IEURvfrqKUZjwvK/NPG
 ANlqRNuDEK0uMEi1mz4ajWVjxEYb2o21hdfezjxmpVMCbYPokpfR6hojsb7thuW8c1oUJuaVXwY
 1OvJr3y42hznHuss8MvrwuF6dieocnRLMhvJaAqs5Zl12Pe14C+/AcIQwApUTfjtnl8f0GISjbc
 KgcXP3WXzxT9Xj1DeSqSnQ7A62+rQa/URmJOmAxOSHoUgg0+wyXHnwx5BbHnjM/Y9RBIM0zdmFq
 G85m97TV4/aw3Cw01Jrcgh/kupgCJ/sEjGJ/GEYc+p9+nk8y73o9pUm5j8Q4ANqV2k77Gc/ninf
 y4w5tlGZ6dVklABJMR2rwmG6aWSWnT/lgPUVxX0QtZ8Ht9dmuEfE/nJAhM9afihrdnCNsICEPU2
 b1hQ5v3dydJsMgHJNm+V+Cj4hql28tszKi9w0q8vsrI4hdC3unuf2gDFb5F1wGTiYlHUTO6jf9N
 CmIaoyDqyzjB62iKrwvxLTuX63tVufqEJwYzh45qyqKLi7ZJTQd6gxHM3GPh8Ts03OOaj5S5eE1
 anBpezACSm9+F1QO+LU7vNeD77xsVxh1G0hcuA0WXjXjViQ1AdEgj5iil2vwC4GdTDZQxZ7DmMw
 NwRyhJEQvgzPyGg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add everything needed to support the DSI output on Renesas r8a779h0
(V4M) SoC, and the DP output (via sn65dsi86 DSI to DP bridge) on the
Renesas grey-hawk board.

Overall the DSI and the board design is almost identical to Renesas
r8a779g0 and white-hawk board.

Note: the v4 no longer has the dts and the clk patches, as those have
been merged to renesas-devel.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v4:
- Dropped patches merged to renesas-devel
- Added new patch "dt-bindings: display: renesas,du: Add missing
  maxItems" to fix the bindings
- Add the missing maxItems to "dt-bindings: display: renesas,du: Add
  r8a779h0"
- Link to v3: https://lore.kernel.org/r/20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com

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
Tomi Valkeinen (7):
      drm/rcar-du: dsi: Fix PHY lock bit check
      drm/rcar-du: Write DPTSR only if the second source exists
      dt-bindings: display: renesas,du: Add missing maxItems
      dt-bindings: display: renesas,du: Add r8a779h0
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779h0
      drm/rcar-du: dsi: Add r8a779h0 support
      drm/rcar-du: Add support for r8a779h0

 .../display/bridge/renesas,dsi-csi2-tx.yaml        |  1 +
 .../devicetree/bindings/display/renesas,du.yaml    | 63 ++++++++++++++++++++--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      | 18 +++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c    | 24 ++++++---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  4 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |  1 -
 6 files changed, 99 insertions(+), 12 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241008-rcar-gh-dsi-9c01f5deeac8

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


