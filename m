Return-Path: <linux-renesas-soc+bounces-10793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92C9E1511
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A292E16493D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E5E1DE3AC;
	Tue,  3 Dec 2024 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ltH9PsDj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D519259E;
	Tue,  3 Dec 2024 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212968; cv=none; b=ZlIa9ekT0Ic2koS0EqTnhEVqsX7EhYFblzy8FrR7fS4Oa92Ffr5vekPWoI7zYk3JaXwocxEiXNjly7I/PB5LVFYkQthutvxbdocX2iEk7igoG/k2JtWbA7ukqF3zsvd45vTYWy9WPtLRUMlRFHBvZ/pO8CCw+q9y1dwyx6wuYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212968; c=relaxed/simple;
	bh=2TFDLtiJ4hb6STWGz3swnMyQWEhR/dMEt/9LcY5CwGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MJ9mIlQ+qKvzxs/XTTnwlj1AwlyPjI3AdWoKNLX1EiGLiwnVhjxjvr0IFjzABtwrW4VIe8JnSi1ykljbW9NQkkDFqJtw8C3eFZWpBod6E0gNFsEo07Oe+gthG4dQReM57v172+cH8Er13y1CgP5XWa6jtnU/jQzLZJPdzd/pI/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ltH9PsDj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233F58DB;
	Tue,  3 Dec 2024 09:02:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733212934;
	bh=2TFDLtiJ4hb6STWGz3swnMyQWEhR/dMEt/9LcY5CwGg=;
	h=From:Subject:Date:To:Cc:From;
	b=ltH9PsDjxi/U3Z9FuCbpPicUA4UnFEIR9tKi/IostMWm7GaC9GUd8NCo3Xdalz63z
	 rsg4Cxf5HecWV+B1lJGaP2rMlu4+EXgzjyLWumQcgRy+CFLjh8lOxDgoN93hVlilWh
	 gg+Shkpi4A0mnc1PC1it4Ukb2j6v3q3TsS9IRCl0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/9] drm: Add DSI/DP support for Renesas r8a779h0 V4M and
 grey-hawk board
Date: Tue, 03 Dec 2024 10:01:34 +0200
Message-Id: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN+6TmcC/x3MQQqAIBBA0avErBtQKbCuEi1ER52NxQgRiHdPW
 r7F/w0qCVOFfWog9HDlqwzoeQKfXUmEHIbBKLNopSyKd4IpY6iMm1c6roHIeQujuIUiv//tOHv
 /AI68YgpdAAAA
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2TFDLtiJ4hb6STWGz3swnMyQWEhR/dMEt/9LcY5CwGg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsZsJFsSZ2bMQz3u7xv61IffeVxcmu+570Uu
 L0vlHfSVoiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067GQAKCRD6PaqMvJYe
 9YjZD/0er445JS4GlFu3tZ77ccTjHZddPJ4N9MKYx0zSoK+a3GQPJnbPcF0fU54R2jOah5UY1su
 T0NNXVkoRwHgXcuEetU5f03pPSX78wfXspJEgbBFvmuVGdt9NAtM4vYUJHbamZdHoJtdzD0gPJv
 H+muHkdmF4bUQYd7C1dUsJjJomZ+t9AFIVIzG59hdS32yJ57aeVdo0m9LxDz4rLnUj2KHhSEje4
 ZoOt4x57rZTN3FmVjyFBN7jc1HVUc3tpsFvQM1iJLhBKEoqandNrI7NnpC+DwBpVKOKkIfu4s1D
 ho6SNhcOzrDAOydQSloaOLIP/kYorpRX64fzo8Keplg1ZBXIRse3j9R6qFPJsgk4Hq4uhP2atKQ
 ec6s0AN+9ICJ7/5Ke4ZBUbo1Wb4DdMxZ5KQTJ9nYZeFfIhCjEYFN/JJTH/Fmi+JcCb5VvNqemEp
 37dY3S/IIk2eAdXrfgvc3+HC+SDcS7mYMbXvTgoU/PK43e86Pb5MzGr+COCIY9Fvcdsmpow6+Jp
 rHRAlbFofmJjbbgUP7xsKVX9uPSVDwKl8c12fyWGdHwECDyPumYq5Pu8VRHo+bvY3n7WTL0rqr7
 BJpRu4MmErhX73H/hwqhU34n5fGDfgpbWSSN2RhmdMpP/2FqciPrJJEnKQj8mS58laK8Q4rYMs+
 5KVWq033AHp6GEQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add everything needed to support the DSI output on Renesas r8a779h0
(V4M) SoC, and the DP output (via sn65dsi86 DSI to DP bridge) on the
Renesas grey-hawk board.

Overall the DSI and the board design is almost identical to Renesas
r8a779g0 and white-hawk board.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (9):
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779h0
      dt-bindings: display: renesas,du: Add r8a779h0
      clk: renesas: r8a779h0: Add display clocks
      drm/rcar-du: dsi: Fix PHY lock bit check
      drm/rcar-du: dsi: Add r8a779h0 support
      drm/rcar-du: Add support for r8a779h0
      arm64: dts: renesas: gray-hawk-single: Fix indentation
      arm64: dts: renesas: r8a779h0: Add display support
      arm64: dts: renesas: gray-hawk-single: Add DisplayPort support

 .../display/bridge/renesas,dsi-csi2-tx.yaml        |   1 +
 .../devicetree/bindings/display/renesas,du.yaml    |   1 +
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 119 ++++++++++++++++++---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  77 +++++++++++++
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |   4 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |  19 ++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h      |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c    |  16 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   4 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |   1 -
 10 files changed, 223 insertions(+), 20 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241008-rcar-gh-dsi-9c01f5deeac8

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


