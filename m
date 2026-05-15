Return-Path: <linux-renesas-soc+bounces-32648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Dj+K8PRBmqKoAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:56:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CA654AE11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF4AC301F4BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 07:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389163F9F34;
	Fri, 15 May 2026 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z/nYeh4y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501CB3EFD27;
	Fri, 15 May 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831807; cv=none; b=CPQOxrLViO4u21txkjFhO1KGP7usjVGqXhzp52ZcZoGCSo2mHg/GXD0fsu/ChgFMP8qBXBZia0rUQQ1PIIGNSOCK7N/ENd71FuEoEwYCitzvRfnoASjDET825LYmlQiUvweDua17YXjjaHuozEA97NzSuRFMi/tVAGGz9QcMzXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831807; c=relaxed/simple;
	bh=UV+kpOrZw60vdYwN8vaGUIsioZG6VeF10gIlh+vj06Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OBZWBFf8pRJ33Lh9el/+yWMzSOz1hVQTm+8ls7eVZAKObYTYyJbaPYM4roPKx0X6Flc2Y6SK/X0v9sSLN1gs213q5HCyPPQu6sFpr1KVcO1Kz60m41Nu6+Gv1GLnDwaXomJnDSw7o2IIKc/Nh//qkqttfKye/w9Dz1I3WwEZQ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z/nYeh4y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BDD2454;
	Fri, 15 May 2026 09:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778831792;
	bh=UV+kpOrZw60vdYwN8vaGUIsioZG6VeF10gIlh+vj06Y=;
	h=From:Subject:Date:To:Cc:From;
	b=Z/nYeh4yyjwTeBhLjmT2TfH/bVUsPqYnD3wi4k7YY97tcEJo9HEJm0P0u05nL4D4Z
	 30FvCZVfB+Ti5p8KUTReaYpuGVjWK8wD/js8mPXvlmj8GeJ50tMzcxs8/PRFp79q9q
	 ECwEoZ61QbRoRDkmDJZzjHl8MTvJikiTMMugdn18=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 0/5] drm/rcar-du: Add support for DSI pipelines with DSC
Date: Fri, 15 May 2026 10:56:13 +0300
Message-Id: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3RBmoC/23MQQ6CMBCF4auQWTumbQDBlfcwLEo7lVnYmqk2G
 sLdraxd/i953wqZhCnDuVlBqHDmFGuYQwNusfFGyL42GGV61ekWxVlB/0KfHbbd7IJyJtDQQ30
 8hAK/d+061V44P5N8drzo3/rfKRoV+r4LJzvSOLT6wp5sTnFOVvzRpTtM27Z9Acnqr7CtAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=UV+kpOrZw60vdYwN8vaGUIsioZG6VeF10gIlh+vj06Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBtGy/c1DwjNnyZr6n/UoXZsDlv7XDuGJjAzTl
 DJ+SP9wLP+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagbRsgAKCRD6PaqMvJYe
 9UfuD/9qgJmcAb531oyY9IAYrrpHpO3tEdmRNYMqAfm4BPi3je6kDgP8JOTTqRs4p8oukg99OlM
 cdFMdYRtB2Ke9djIoJOKOSCNaRZy3fnufLFXrWr2ms3mNmu8Js13eVjCW4OoDDtXs86bFTgRP45
 qjsxyuZdkViOrPog6Sf7yCt6gN6dRv4UQQ2PV6l3Xz/rA21B1/EoPXnF2NIeocnwu8Jsa3VwFT2
 3RAQN/qNStYDHHd0dHArp8GTmwQQLo5kcU6DKdlOUphDO2gjaJk2+ItljkCAnE8Ym6wd2IPTQM/
 dD/G5jvhyUGe+H2VW/wtdOHD2x5EqmquMy0r6TR95Uegxq7GcylG+6P5DG+pf7hT1tR63u3qdDR
 KjiuWKJ/tFFMpXR9mLI6Z/Dp6X2rqGiMwnu9pUo0zIuUIPaBUvfDFeupbPDYM19Nhe9CJk/wmfQ
 LO9ONh+88tYKohPBIKig5qi2tBj2gTEQzs8RgrEbl/6kNxwp5kEXS9Mu9tpcmU1amgT0nhgvMfK
 O/wO9wOvrJL2oqlnq8TVef5TRHFGERUHpmAXrRqLKdNG516jFlVRGieRASuiIhndpV8KaTzR45N
 qgS454w6X+jNdqYa1NT4LQ9latWE73JF+6cSxI7Fvby79heRGMg4WW4g3PUPsUEKVfeZ9QwGEsJ
 eX1NNgvvEo/iMWQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 54CA654AE11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32648-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Some DSI pipelines have DSC (Display Stream Compression) IP block
between the DU and the DSI. Even if DSC is not needed, the IP must be
enabled for the DSI output to work.

This series adds a basic DSC driver, so that the DSC IP gets enabled in
bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
the DP output comes from DSI and sn65dsi86 bridge.

Original series from Marek.

Note: I see that not every run of kms++'s kmstest gives me a picture on
my monitor. Sometimes the monitor seems to be trying to repeatedly sync,
but fails, and the screen stays black. However, I see this same issue on
WhiteHawk, which uses DSI0 pipeline, without DSC, so I think that is a
separate issue.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v2:
- Fixed the dts example in "dt-bindings: display: bridge: Document
  Renesas R-Car V4H DSC bindings"
- Link to v1: https://lore.kernel.org/r/20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com

---
Marek Vasut (4):
      clk: renesas: r8a779g0: Add DSC clock
      dt-bindings: display: bridge: Document Renesas R-Car V4H DSC bindings
      drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H DSC driver
      arm64: dts: renesas: Add Renesas R-Car V4H DSC

Tomi Valkeinen (1):
      drm/rcar-du: dsi: Support DSC in the pipeline

 .../bindings/display/bridge/renesas,dsc.yaml       |  96 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  31 +++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |   5 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |   1 +
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |  13 ++
 drivers/gpu/drm/renesas/rcar-du/Makefile           |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c         | 163 +++++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  36 ++++-
 8 files changed, 343 insertions(+), 3 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260514-rcar-du-dsc-45bcf0c2fe86

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


