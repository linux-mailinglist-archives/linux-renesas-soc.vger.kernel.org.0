Return-Path: <linux-renesas-soc+bounces-32660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB+TD9nmBmo9owIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:26:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941954C649
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F01F306A54A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039C342EEAC;
	Fri, 15 May 2026 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f+Cvtnuh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C442B72C;
	Fri, 15 May 2026 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836202; cv=none; b=YP6qMdyr4SxUJQij9Wh8Ae7KaMemtxOkXI3PdlaJ8aC1DvXTDxOg79bfnEmP/sUGvVCWNMab/tWkMip6K21LY45T+LRweWcpB9vHNC54BFYTYje9lZb3HqDAYpDQtiTum8DUm/IXaIP/pmVmVxknN7YpWHwJLqenDiAHgULnnHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836202; c=relaxed/simple;
	bh=QkQuKbs3kTlKxTsbVSwlqIa7UFeA+IsMXFr+8EVhxAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R4dbGzn9LUTNirJVYDh9SiPZTv7f/3ivBZI8MeKeCF4IiqiqRAD+dbRUGUUaf11Vwl2w0EGAUxPWQMM+FuD2R5dOW9LYNjV5bV2wRMZ+6IJhSxXdVsWU+aOQwpc+yOU1wkiBXoy/tesJeBTqzFJvIX1YQVrqMvJo+QYwEQJ1xTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f+Cvtnuh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC7E5454;
	Fri, 15 May 2026 11:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778836187;
	bh=QkQuKbs3kTlKxTsbVSwlqIa7UFeA+IsMXFr+8EVhxAE=;
	h=From:Subject:Date:To:Cc:From;
	b=f+Cvtnuh71qA0h6CzDyqevEiD6nTrFk9j051b3ugyzRB4/5hwTNB+X8E2CT7zXsvv
	 O/B8SHaYYxxcjpxlaCwYAS3wBiPQ4jMQy0LpDxR598b8oZq7iMOvXB1N/7TID0hZqa
	 q2qdOLzDJga4/dR2q3urk+FQ32VCqNoo6da3FYSI=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v3 0/7] drm/rcar-du: Add support for DSI pipelines with DSC
Date: Fri, 15 May 2026 12:09:25 +0300
Message-Id: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXiBmoC/23MQQ7CIBCF4as0s3YMIGDrynsYFxQGy8JiQImm6
 d2lXWnSzST/JO+bIFMKlOHUTJCohBziWOOwa8AOZrwRBlcbBBOaKS4xWZPQvdBli1L11jMrPLU
 a6uKRyIf3ql2utYeQnzF9Vrzw5bvtFI4MnVb+aDrqWsnPwZHJceyjSW5v4x0WrohfQv0TohJe9
 52QzPB6Noh5nr+YfB8/8AAAAA==
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2773;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=QkQuKbs3kTlKxTsbVSwlqIa7UFeA+IsMXFr+8EVhxAE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBuLdhC3aBbT/EdqjeJDPhr9tj5KzWAv2gt+/i
 GP3lJ5khB+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagbi3QAKCRD6PaqMvJYe
 9Z9JEACtCZTvQ1lSbUNYwSqLND/x6gQdwNiGTo3wRXSCIGcEvBv9WiWHOL11tDcZnZgJNfEcsm+
 bLzsuBdXKC7FpSFn+B4klgaXSwMgM13jG1dFamx4dsxnqG8s5A5mxoVs1ckF3OV3uDMsodTb2Sf
 pNLoEw2jj9gclLwf/ocrBluP8C9EZuM+PuGG7WaQbiGYg8Fl3uR1RnBI2f8clyKwYI4f4pp61SH
 b1ELeGUrC+l5Ps3wn9jk6gS4WDP78Awh2ECCjRJbAQ6UbnAQpGrOG0LzkbgPMh34DR61dDWpb1a
 DEAv17XKd/V1v0xTEu7QTiGC1mtHJMR4DC4+OdPxUXGJb/XIhNQtMEHA80mRZuaCouOZE7gODq9
 VwjhWwFWP/YTg0h4MEiUoelAkAFklwsQ3wUoQxgmtcONtRkEDXAy5NoOAarm8+tCEFlGRzlBWM4
 PDuDdKYx2Eri3WuAwMz9z983fYIP9xwdF22Q2gNAPe6SXgBsjFigJ3yeFArvpYfRaa7nUysEyGf
 ZZaIq7k4Dl+CIuaDsKZOeDQt/m+HWQS5hPo+wp6Yd9W00FTAgzGBIythRx7mCs3mriKt4l3jXed
 PwF0NhboA1BTwtA5IGSr/BkYabyeIdgVAreLUaXwQBRBVKcgZ7o50LwfNsqKFgg0xa2HMHKHE+a
 JylOjCWyDQQMIMA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 4941954C649
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32660-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

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

 .../bindings/display/bridge/renesas,dsc.yaml       |  96 +++++++++++++
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts |  94 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  31 +++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |   5 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |   1 +
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |  12 ++
 drivers/gpu/drm/renesas/rcar-du/Makefile           |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c         | 160 +++++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  36 ++++-
 9 files changed, 433 insertions(+), 3 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260514-rcar-du-dsc-45bcf0c2fe86

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


