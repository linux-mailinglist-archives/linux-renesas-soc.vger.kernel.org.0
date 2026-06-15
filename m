Return-Path: <linux-renesas-soc+bounces-34025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5CdxIkT6L2rkKwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:12:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37F686943
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:12:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=uFKfuJpP;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 973773008D5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08423F1669;
	Mon, 15 Jun 2026 13:12:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0553EB0F2;
	Mon, 15 Jun 2026 13:12:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529153; cv=none; b=AdNSWAdDG3iTdOG1XBpqVPJe95Fo7a6FwqjaZJ+H5fm2s3EEEOT0pFGpsW3/JH54p93yCRU6XdGGUE4igNImSq2ZaT36XML1/GStH/a/v+83l/nY2dexGcmEIhtJaMDegUrBxsSb3BSfZW6ss0emdfTpFNATpq0NPpTkvIfhIYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529153; c=relaxed/simple;
	bh=32Shx7TCKv3Qlm21pR+zetQqXjWhiye5TRnx0tFj7W4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D0mcX25pELlkgHKNrabDfGXbLQi663sVxqCUjXY7hTyWku2bs4G2VEiq2uC4VL76wO2Z+Rzt3ARrTlb5h7VebfoFEtkuYc546pVghdfyCs/xojYcfzs+0bZSMcI0sMy+rBFKoBlgXJZ+qQtHdT1BNAik2prLhpE24VwvZ2tjrfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uFKfuJpP; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE39A241;
	Mon, 15 Jun 2026 15:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781529114;
	bh=32Shx7TCKv3Qlm21pR+zetQqXjWhiye5TRnx0tFj7W4=;
	h=From:Subject:Date:To:Cc:From;
	b=uFKfuJpPGa1AL48Q70CA4sC1JIwS0/x8NistfrsvAccaZ67PW5YNEjVcC136jexnU
	 J5XprOLSZ4XakJK+MUyKIpW6w4c9DzUQaO9TD+U21pus3E0kfNnjIYt/iPytxNWubB
	 ROyxwC27L/HFy3ycQBJphWUqVXEtJQAUb6bkRVPg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v5 0/7] drm/rcar-du: Add support for DSI pipelines with DSC
Date: Mon, 15 Jun 2026 16:11:53 +0300
Message-Id: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABr6L2oC/33MyQrCMBSF4VeRrI1kbuPK9xAXGW0WNpJoUErf3
 bQbB1o3F/4L5xtAdim4DPabASRXQg6xr8G3G2A61Z8dDLY2IIgIxDGDyagE7R3abCDj2nhkiHe
 tAHVxTc6Hx6wdT7W7kG8xPWe84Om77BQMEbSC+0ZJJ1uGD8E6lWOvo0p2Z+IFTFwhnwT/Jkglv
 NCSMKRwPSsE/UPQSmDBMG9agphsVwj2JsQvwSohKZJCYc2FogvEOI4vhxmV03YBAAA=
X-Change-ID: 20260514-rcar-du-dsc-45bcf0c2fe86
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4239;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=32Shx7TCKv3Qlm21pR+zetQqXjWhiye5TRnx0tFj7W4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL/ozdFtcRAnNYsXWYwB7iQ65JS05bhMdNu276
 YtVJloqFpyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai/6MwAKCRD6PaqMvJYe
 9WYCD/9yr9V2UlynqXbHRGP0j8LIDZK7WVtZzg1BZ1OK2eCRu0N2D7gpiVA1GbRdrPxF2PEmhy/
 XTumN/UC9bVin9ndxGDYczPMzH0y3ysG28DRQVTeRu8bLG5+7SVt4JTDDVix7EZZrv6EvD66BCy
 nOsRjan6i4DWJPqBk+Shp+ssPgzo0o3Zm5mkzvqDap6GDAOY7izkNVdVdbaJipWnJ3gdeAc/+G1
 jvwDNf2xUoYpc1m2NpN4VzKCxQCVXmJOI6VpfY3vGpYZuuFOzyoM3SV06D700TguDof4Qj6Altd
 RBWz3stKsOIyMP5URHxz2szij4NFfhWTmJCQFUZl0fcyBS9bx1hlCghDdoNPzBA/kL2TwWFbiHN
 5xWc8oU9XzXLkNAs9aPnxwEuy+jm0Oe+ftHfBObNsbAsPq+FjZrfs0WHZTSALFaFVOJwzFpBdWg
 P2yPaWOEvBTDkPsRGY8PFUdv8U+iudFD76lyukpRdoaBqzymB5gq00TNfp7Fa98I1DykwfEuRWY
 8DTroy+1Jeun+A2KcwT9BGS4qcKX8EWH8TK/pzLdJLTY3DFzFS9EWQ2n5YVa3M7Vio2KPOxk1fk
 Nm4fpVGCV8kSJAIruyC40MTxbOPNkQoO3CxFHuWJaqmY9q0Tm9Hoe0C/G7gceLWQ9o2CnVOM52+
 Ru3nNhDVMhcDBqA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34025-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:conor.dooley@microchip.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m:kier
 an.bingham@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E37F686943

Some DSI pipelines have DSC (Display Stream Compression) IP block
between the DU and the DSI. Even if DSC is not needed, the IP must be
enabled for the DSI output to work.

This series adds a basic DSC driver, so that the DSC IP gets enabled in
bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
the DP output comes from DSI and sn65dsi86 bridge, and also White Hawk
board's second mini-DP output.

Original series from Marek.

Note: I see that not every run of kms++'s kmstest gives me a picture on
my monitor. Sometimes the monitor seems to be trying to repeatedly sync,
but fails, and the screen stays black. However, I see this same issue on
WhiteHawk, which uses DSI0 pipeline, without DSC, so I think that is a
separate issue.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v5:
- Drop the "renesas,rcar-dsc" compatible, and rename the binding file to renesas,r8a779g0-dsc.yaml
- Check pm_runtime_get_sync() < 0 for error, instead of
  pm_runtime_get_sync() != 0
- Move pm_runtime_enable() before drm_bridge_add(), so that runtime PM
  is ready when we publish the bridge
- Fix "DCS" typo in commit desc
- Rewrite "drm/rcar-du: dsi: Support DSC in the pipeline" again, this
  time solving the DSI/DSC question in rcar_du_encoder_init()
- Link to v4: https://patch.msgid.link/20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com

Changes in v4:
- Add 'renesas,rcar-dsc' compatible, in addition to the SoC specific
  compatible
- Use 'bridge' as the name of the DT node
- Arrange Kconfig and Makefile entries alphabetically
- Rebase on drm-misc-next, and fix the drm_atomic_state rename issue
- Use pm_runtime_get_sync() in .atomic_enable() instead of
  pm_runtime_resume_and_get() to fix the possible runtime PM get/put
  discrepancy
- Drop ioremap and mmio field, as the driver does not touch the
  registers
- Use of_drm_get_bridge_by_endpoint() to get the next bridge
- Rewrite "drm/rcar-du: dsi: Support DSC in the pipeline" to use
  bridge->type to detect the DSI and the DSC
- And some cosmetic fixes pointed out in the review comments
- Link to v3: https://patch.msgid.link/20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com

Changes in v3:
- Simplify DSC driver: drop reset control, drop clk handling, use runtime PM
- Split dts changes for r8a779g0 and sparrow-hawk to separate patches
- Add "arm64: dts: renesas: white-hawk: Add second mini-DP output
  support"
- Link to v2: https://patch.msgid.link/20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com

Changes in v2:
- Fixed the dts example in "dt-bindings: display: bridge: Document
  Renesas R-Car V4H DSC bindings"
- Link to v1: https://lore.kernel.org/r/20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com

---
Geert Uytterhoeven (1):
      arm64: dts: renesas: white-hawk: Add second mini-DP output support

Marek Vasut (5):
      clk: renesas: r8a779g0: Add DSC clock
      dt-bindings: display: bridge: Document Renesas R-Car V4H DSC bindings
      drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H DSC driver
      arm64: dts: renesas: r8a779g0: Add DSC
      arm64: dts: renesas: sparrow-hawk: Enable DisplayPort by adding DSC

Tomi Valkeinen (1):
      drm/rcar-du: dsi: Support DSC in the pipeline

 .../display/bridge/renesas,r8a779g0-dsc.yaml       |  96 +++++++++++++
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts |  94 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  31 ++++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |   5 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |   1 +
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |  12 ++
 drivers/gpu/drm/renesas/rcar-du/Makefile           |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c         | 154 +++++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c  |  18 ++-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   1 +
 10 files changed, 410 insertions(+), 3 deletions(-)
---
base-commit: a56a73ec85c81c7e533bc249ff0fd996256053fd
change-id: 20260514-rcar-du-dsc-45bcf0c2fe86

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


