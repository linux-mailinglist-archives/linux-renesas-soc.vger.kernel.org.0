Return-Path: <linux-renesas-soc+bounces-31056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAIJMalr12myNggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:04:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5FF3C8284
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 947E8300EF82
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E7D3A8738;
	Thu,  9 Apr 2026 09:03:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59A02BE02C;
	Thu,  9 Apr 2026 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725437; cv=none; b=WJr/7kAzsQg9pRtCOKcuMZAKgffo7i9r0gwrRhw4xfiyWkrObtSACBO6L7b4Let38Qxa2T53t+FF+5QysqHMFQViWF8jjj4M3e39jlALPGh2+JCMsbZh/186h4DXbQp4tUkMRqxvK4M3iTqqY7TpIEnAscLWRzI77LM+LB3LZq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725437; c=relaxed/simple;
	bh=pxy+r02hojkhE6vj185t872y1xJaPPLkzuI0hoEAjf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S8o0bkANxvdnaAVeVLQQJgp+jAam2cKPRJ+f3PceYaIxO3xVog+1CbfNTWNCm0IZW8buv/MaPEgMRc2A31jtpNJZPDhveS08W6M8nOE3ehVqs9WSswN6x6GiTop7vMfXyriDiXlstevaGXp96l7S4fkMZ7d4XM7k+ll/fsVKsiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: yRcTHWnkSGyZF8nD3NoWVg==
X-CSE-MsgGUID: p+c85UgCQISOuxfcyRnQTg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Apr 2026 18:03:48 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.218])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0F5774015D82;
	Thu,  9 Apr 2026 18:03:41 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 00/12] ASoC: rsnd: Add RZ/G3E audio driver support
Date: Thu,  9 Apr 2026 11:02:49 +0200
Message-ID: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31056-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.331];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A5FF3C8284
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add audio support for the Renesas RZ/G3E SoC to the R-Car Sound
driver. The RZ/G3E audio subsystem is based on R-Car Sound IP but
has several differences requiring dedicated handling:

  - SSI operates exclusively in BUSIF mode (no PIO)
  - 2-4 BUSIF channels per SSI (layout differs from R-Car)
  - Separate register regions for SCU, ADG, SSIU, SSI accessed by name
  - Per-SSI ADG and SSIF supply clocks
  - Dedicated audmacpp clock/reset for Audio DMAC peri-peri
  - Per-SSI and per-module reset controllers via CPG

Changes:
 
v4:
 - Add reset_control_assert() in rsnd_mod_quit() for symmetry with
   deassert in rsnd_mod_init() (Mark Brown)
 - Fix RSND_SOC_MASK to (0xF << 4) to avoid overlap with RSND_RZ_MASK.
   Add nibble layout comment documenting the flag bit  allocation
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv
   into struct rsnd_dma_ctrl
 - Replace raw [3][2][3] DMA address array with named
   structs (rsnd_dma_addr_dir, rsnd_dma_addr_map) for self-documenting
   table initializers
 - Move busif_status_count from file-static into new
   struct rsnd_ssiu_ctrl, following the rsnd_dma_ctrl pattern.
   Remove duplicate priv variable. Properly propagate reset errors
   via dev_err_probe()
 - Clarify commit message regarding PIO mode still being available on
   R-Car
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single lines
 - Move per-SSI ADG and SSIF supply clock prepare/unprepare
   into rsnd_adg_clk_control() instead of separate functions, eliminating
   hw_params prepare leak concern. Return proper errors on clk_enable()
   failure
 - Move shared SCU clocks from file-statics into new
   struct rsnd_src_ctrl, following the rsnd_dma_ctrl pattern. Keep
   original declaration order for struct device_node *node
 - Merge rsnd_adg_mod_get() helper directly into this
   patch instead of a separate preparatory patch. Distribute
   suspend/resume declarations into their respective IP sections in rsnd.h
 - Drop former patch 12/14 "Add rsnd_adg_mod_get() for PM support":
   merged into patch 12/12
 - Drop former patch 13/14 "Export rsnd_ssiu_mod_get() for PM support":
   function was unused

v3:
 - Split out from v2 series [1] to ASoC-specific patchset.

v2:
 - Split of rsnd.yaml into common and R-Car-specific schemas
 - Introduce RZ/G3E sound binding as a standalone schema
 - Addressed Kuninori'comments, details are in individual patches

[1] https://lore.kernel.org/all/20260402090524.9137-1-john.madieu.xa@bp.renesas.com/

John Madieu (12):
  ASoC: dt-bindings: renesas,rsnd: Split into generic and SoC-specific
    parts
  ASoC: dt-bindings: Add RZ/G3E (R9A09G047) sound binding
  ASoC: rsnd: Add reset controller support to rsnd_mod
  ASoC: rsnd: Add RZ/G3E SoC probing and register map
  ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
  ASoC: rsnd: Add RZ/G3E DMA address calculation support
  ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
  ASoC: rsnd: Add SSI reset support for RZ/G3E platforms
  ASoC: rsnd: Add ADG reset support for RZ/G3E
  ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
  ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
  ASoC: rsnd: Add system suspend/resume support

 .../sound/renesas,r9a09g047-sound.yaml        | 371 ++++++++++++++++++
 .../bindings/sound/renesas,rsnd-common.yaml   | 196 +++++++++
 .../bindings/sound/renesas,rsnd.yaml          | 319 ++++-----------
 sound/soc/renesas/rcar/adg.c                  | 125 +++++-
 sound/soc/renesas/rcar/cmd.c                  |   2 +-
 sound/soc/renesas/rcar/core.c                 |  61 ++-
 sound/soc/renesas/rcar/ctu.c                  |  22 +-
 sound/soc/renesas/rcar/dma.c                  | 274 ++++++++++---
 sound/soc/renesas/rcar/dvc.c                  |  22 +-
 sound/soc/renesas/rcar/gen.c                  | 180 +++++++++
 sound/soc/renesas/rcar/mix.c                  |  22 +-
 sound/soc/renesas/rcar/rsnd.h                 |  51 ++-
 sound/soc/renesas/rcar/src.c                  |  85 +++-
 sound/soc/renesas/rcar/ssi.c                  |  33 +-
 sound/soc/renesas/rcar/ssiu.c                 |  83 +++-
 15 files changed, 1518 insertions(+), 328 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd-common.yaml

-- 
2.25.1


