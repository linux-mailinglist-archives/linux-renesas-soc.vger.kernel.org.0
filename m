Return-Path: <linux-renesas-soc+bounces-34554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MRW8FsZ9Q2oaZQoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 10:26:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEE6E1A52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 10:26:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gjdsX54Q;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 774DA301CA6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 08:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C032D0C82;
	Tue, 30 Jun 2026 08:26:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5580A2BEFF5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 08:26:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808004; cv=none; b=TWG0al5mlnv0NK7JBYScev+vbP3F/0kiyL0E1ljXlchRnPfEQh3VOnJz71MMqVwpbWE16VomzCcCGkhCH8Ii3a8CyTuidO9MWTEoRVBIAlNuPFRddzAqoeH9P3KKhWQFeIFjgvmvNGjznFIWW2LaSJcYKKvu5wtnJByZU4yHfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808004; c=relaxed/simple;
	bh=m2VhC4Epr6Rq1XEvKVpwkOrVdyb/LzqG2+I+OZmLaSQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=lZL3rRtMs365iIqjtzZWaEuR7s6J4/cJUMuYsczfP7Fdo03bMTAluq+XWQsC4bm6lEUiQR9OlO0FX7y5nf2xaj8e8mVDVU4bYVi4+PiIxSnqiKY7Ofd68gG+3w6x7+qm1Lj9MUEGLatlN6ZReZbF+o4jORbt98QXEhqsShQjO+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjdsX54Q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9031F000E9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782808002;
	bh=sA4rgILEABFY7Cq1WrDqnV3elqg1EOP/so90mjEyfR8=;
	h=Subject:From:Date:To;
	b=gjdsX54Q9MZK1Ihlwsn0DhMs1kXyvtJghQ335nnIayvW9FvdUEErsEaabBTFMqSnu
	 eC+5lv4LAdVwutyJ/l2iAWbke9Nh21mmyE/1STSXukf29TNwIkAp/ZLtJ/vcrq6qis
	 LFYx60LRGsCsLPxWL2K5l0NmDRl+71S0VFkZe3u4LzPk+vbbAvbc3HEnOSZJ5eYxDh
	 on5VhWjL+1UzB4JtKSP9wa2RWCnYgDDM8sEh8Wf+6yHvPU6hgZ3ITq8d7JxRziubH1
	 D3h32df81BXqo/mSxiRCIYCpyapIpqT5MCz1qs5l1QbyUFIG6W5qP1IxSWN1HNS5ad
	 /yCfjDCzHa8pQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 595E6393A57F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 08:26:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <178280798591.2432871.15029222362204140632.git-patchwork-summary@kernel.org>
Date: Tue, 30 Jun 2026 08:26:25 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	URL_OBFUSCATED_TEXT(9.00)[type=word_dot,url=http://or.in,orig= to rsnd_mod [v7,04/18] ASoC: rsnd: ];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34554-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AADEE6E1A52

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: drm/display: bridge-connector: attach encoder to the connector
  Submitter: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Committer: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1084601
  Lore link: https://lore.kernel.org/r/20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com
    Patches: [v2,01/41] drm/display: bridge-connector: attach the encoder to the created connector
             [v2,02/41] drm: adp: remove now-redundant call to drm_connector_attach_encoder()
             [v2,03/41] drm/bridge: adv7511: remove now-redundant call to drm_connector_attach_encoder()
             [v2,04/41] drm/bridge: ite-it6263: remove now-redundant call to drm_connector_attach_encoder()
             [v2,05/41] drm/bridge: ti-sn65dsi86: remove now-redundant call to drm_connector_attach_encoder()
             [v2,06/41] drm/imx/dcss: remove now-redundant call to drm_connector_attach_encoder()
             [v2,07/41] drm/imx: ldb: remove now-redundant call to drm_connector_attach_encoder()
             [v2,08/41] drm/imx: parallel-display: remove now-redundant call to drm_connector_attach_encoder()
             [v2,09/41] drm/imx/lcdc: remove now-redundant call to drm_connector_attach_encoder()
             [v2,10/41] drm/ingenic: remove now-redundant call to drm_connector_attach_encoder()
             [v2,11/41] drm/kmb/dsi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,12/41] drm/mediatek: mtk_dpi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,13/41] drm/mediatek: mtk_dsi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,14/41] drm/meson: encoder_cvbs: remove now-redundant call to drm_connector_attach_encoder()
             [v2,15/41] drm/meson: encoder_hdmi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,16/41] drm/msm/dp: remove now-redundant call to drm_connector_attach_encoder()
             [v2,17/41] drm/msm/hdmi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,18/41] drm/omapdrm: remove now-redundant call to drm_connector_attach_encoder()
             [v2,19/41] rm/rockchip: cdn-dp: remove now-redundant call to drm_connector_attach_encoder()
             [v2,20/41] drm/rockchip: rk3066_hdmi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,21/41] drm/tegra: hdmi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,22/41] drm/tegra: rgb: remove now-redundant call to drm_connector_attach_encoder()
             [v2,23/41] drm/tests: bridge: remove now-redundant call to drm_connector_attach_encoder()
             [v2,24/41] drm: verisilicon: remove now-redundant call to drm_connector_attach_encoder()
             [v2,25/41] drm/exynos: exynos_dp: remove now-redundant call to drm_connector_attach_encoder()
             [v2,26/41] drm: rcar-du: encoder: remove now-redundant call to drm_connector_attach_encoder()
             [v2,27/41] drm: renesas: rz-du: rzg2l_du_encoder: remove now-redundant call to drm_connector_attach_encoder()
             [v2,28/41] drm/rockchip: analogix_dp: remove now-redundant call to drm_connector_attach_encoder()
             [v2,29/41] drm/rockchip: dw_dp: remove now-redundant call to drm_connector_attach_encoder()
             [v2,30/41] drm/rockchip: dw_hdmi_qp: remove now-redundant call to drm_connector_attach_encoder()
             [v2,31/41] drm/rockchip: inno-hdmi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,32/41] drm/msm/mdp4: remove now-redundant call to drm_connector_attach_encoder()
             [v2,33/41] drm/msm/dsi: remove now-redundant call to drm_connector_attach_encoder()
             [v2,34/41] drm/mxsfb/lcdif: remove now-redundant call to drm_connector_attach_encoder()
             [35/41] drm/rockchip: lvds: remove now-redundant call to drm_connector_attach_encoder()
             [v2,36/41] drm/tidss: remove now-redundant call to drm_connector_attach_encoder()
             [v2,37/41] drm/tilcdc: remove now-redundant call to drm_connector_attach_encoder()
             [v2,38/41] drm: zynqmp_kms: remove now-redundant call to drm_connector_attach_encoder()
             [v2,39/41] drm/imx: remove now-redundant call to drm_connector_attach_encoder()
             [v2,40/41] drm/rockchip: rgb: remove now-redundant call to drm_connector_attach_encoder()
             [v2,41/41] drm: renesas: shmobile: remove now-redundant call to drm_connector_attach_encoder()

Series: clk: renesas: rzg2l: Unify SAM PLL configuration macros
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1097424
  Lore link: https://lore.kernel.org/r/20260519141518.389670-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/3] clk: renesas: rzg2l: Simplify SAM PLL configuration macro
             [v3,2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
             [v3,3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones

Series: Split Generic PHY consumer and provider
  Submitter: Vladimir Oltean <vladimir.oltean@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1088058
  Lore link: https://lore.kernel.org/r/20260430110652.558622-1-vladimir.oltean@nxp.com
    Patches: [v7,phy-next,01/27] ata: add <linux/pm_runtime.h> where missing
             [v7,phy-next,12/27] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
             [v7,phy-next,23/27] power: supply: cpcap-charger: include missing <linux/property.h>

Series: Split Generic PHY consumer and provider API
  Submitter: Vladimir Oltean <vladimir.oltean@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089777
  Lore link: https://lore.kernel.org/r/20260505100523.1922388-1-vladimir.oltean@nxp.com
    Patches: [v8,phy-next,01/31] PCI: cadence: Preserve all error codes in cdns_plat_pcie_probe()
             [v8,phy-next,15/31] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
             [v8,phy-next,26/31] power: supply: cpcap-charger: include missing <linux/property.h>

Series: SCMI Clock rates discovery rework
  Submitter: Cristian Marussi <cristian.marussi@arm.com>
  Committer: Sudeep Holla <sudeep.holla@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1091709
  Lore link: https://lore.kernel.org/r/20260508153300.2224715-1-cristian.marussi@arm.com
    Patches: [v4,01/15] clk: scmi: Fix clock rate rounding
             [v4,02/15] firmware: arm_scmi: Add clock determine_rate operation
             [v4,03/15] clk: scmi: Use new determine_rate clock operation
             [v4,04/15] firmware: arm_scmi: Simplify clock rates exposed interface
             [v4,05/15] clk: scmi: Use new simplified per-clock rate properties
             [v4,06/15] firmware: arm_scmi: Drop unused clock rate interfaces
             [v4,07/15] firmware: arm_scmi: Make clock rates allocation dynamic
             [v4,08/15] firmware: arm_scmi: Harden clock parents discovery
             [v4,09/15] firmware: arm_scmi: Refactor iterators internal allocation
             [v4,10/15] firmware: arm_scmi: Add bound iterators support
             [v4,11/15] firmware: arm_scmi: Fix bound iterators returning too many items
             [v4,12/15] firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
             [v4,13/15] firmware: arm_scmi: Use bound iterators to minimize discovered rates
             [v4,14/15] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
             [v4,15/15] firmware: arm_scmi: Introduce all_rates_get clock operation

Series: media: renesas: vsp1: Modernize the driver
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1093156
  Lore link: https://lore.kernel.org/r/20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [01/11] media: renesas: vsp1: Avoid forward function declaration
             [02/11] media: renesas: vsp1: Split vsp1_du_setup_lif()
             [03/11] drm: renesas: rcar-du: Switch to new VSP API
             [04/11] drm: renesas: rz-du: Switch to new VSP API
             [05/11] media: renesas: vsp1: Use mutex guards
             [06/11] media: renesas: vsp1: Use mutex scoped guards
             [07/11] media: renesas: vsp1: Use spinlock guards
             [08/11] media: renesas: vsp1: Use spinlock scoped guards
             [09/11] media: renesas: vsp1: Simplify iteration over format arrays
             [11/11] media: renesas: vsp1: Drop deprecated vsp1_du_setup_lif() function

Series: ASoC: rsnd: Add RZ/G3E audio driver support
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1100415
  Lore link: https://lore.kernel.org/r/20260525110230.4014435-1-john.madieu.xa@bp.renesas.com
    Patches: [v7,01/18] ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
             [v7,02/18] ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
             [v7,03/18] ASoC: rsnd: Add reset controller support to rsnd_mod
             [v7,04/18] ASoC: rsnd: Support hyphen or dot in indexed clock and reset names
             [v7,05/18] ASoC: rsnd: Add RZ/G3E SoC probing and register map
             [v7,06/18] ASoC: rsnd: Add audmapp clock and reset support for RZ/G3E
             [v7,07/18] ASoC: rsnd: Refactor DMA address tables with named structs
             [v7,08/18] ASoC: rsnd: Add RZ/G3E DMA address calculation support
             [v7,09/18] ASoC: rsnd: ssiu: Add shared SSI reset controller support
             [v7,10/18] ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support
             [v7,11/18] ASoC: rsnd: Add SSI reset support for RZ/G3E platform
             [v7,12/18] ASoC: rsnd: Add ADG reset support for RZ/G3E
             [v7,13/18] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
             [v7,14/18] ASoC: rsnd: adg: Look up RZ/G3E clkin under audio-clk{a,b,c,i}
             [v7,15/18] ASoC: rsnd: src: Acquire shared SCU clocks for RZ/G3E
             [v7,16/18] ASoC: rsnd: src: Add SRC reset support for RZ/G3E
             [v7,17/18] ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
             [v7,18/18] ASoC: rsnd: Add system suspend/resume support

Series: dyndbg: enable 0-off-cost for all of __drm_debug
  Submitter: Jim Cromie <jim.cromie@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1084893
  Lore link: https://lore.kernel.org/r/20260423-submit-dyndbg-classmap-foundation-v14-0-2b809a8019d0@gmail.com
    Patches: [v14,01/92] dyndbg: fix NULL ptr on i386 due to section mis-alignment
             [v14,07/92] docs/dyndbg: update examples \012 to \n
             [v14,08/92] docs/dyndbg: explain flags parse 1st

Series: Add RZ/G3L GFX support
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Adrián Larumbe <adrian.larumbe@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1070017
  Lore link: https://lore.kernel.org/r/20260320164158.487406-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/4] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L SoC
             [v2,2/4] drm/panfrost: Drop redundant optional clock checks in runtime PM
             [v2,3/4] drm/panfrost: Add bus_ace optional clock support for RZ/G2L
             [v2,4/4] drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC

Series: ASoC: renesas: fsi: Fix system hang by adding SPU clock
  Submitter: Bui Duc Phuc <phucduc.bui@gmail.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1108533
  Lore link: https://lore.kernel.org/r/20260609113836.45079-1-phucduc.bui@gmail.com
    Patches: [v6,01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
             [v6,03/11] ASoC: renesas: fsi: Fix trigger stop ordering
             [v6,04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
             [v6,05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
             [v6,06/11] ASoC: renesas: fsi: Move fsi_clk_init()
             [v6,07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
             [v6,08/11] ASoC: renesas: fsi: refactor clock initialization
             [v6,09/11] ASoC: renesas: fsi: Add SPU clock support
             [v6,10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
             [v6,11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

Patch: None
  Submitter: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1101570
  Lore link: https://lore.kernel.org/r/d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com

Series: PCI: Add common helper for 100 ms delay after link training
  Submitter: Hans Zhang <18255117159@163.com>
  Committer: Manivannan Sadhasivam <mani@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1096215
  Lore link: https://lore.kernel.org/r/20260518004246.1384532-1-18255117159@163.com
    Patches: [v4,1/7] PCI: Add pci_host_common_link_train_delay() helper
             [v4,2/7] PCI: cadence: Add post-link delay for LGA and j721e glue driver
             [v4,3/7] PCI: cadence: HPA: Add post-link delay
             [v4,4/7] PCI: dwc: Use common pci_host_common_link_train_delay() helper
             [v4,5/7] PCI: aardvark: Add 100 ms delay after link training
             [v4,6/7] PCI: mediatek-gen3: Add 100 ms delay after link up

Patch: [net] dt-bindings: net: renesas,ether: Drop example "ethernet-phy-ieee802.3-c22" fallback
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1115994
  Lore link: https://lore.kernel.org/r/20260624150250.131966-2-robh@kernel.org

Series: ASoC: rsnd: Add RZ/G3E audio driver support
  Submitter: John Madieu <john.madieu@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1081572
  Lore link: https://lore.kernel.org/r/20260415124731.3684773-1-john.madieu.xa@bp.renesas.com
    Patches: [v5,01/14] ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
             [v5,02/14] ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
             [v5,04/14] ASoC: rsnd: Add RZ/G3E SoC probing and register map
             [v5,06/14] ASoC: rsnd: Refactor DMA address tables with named structs
             [v5,10/14] ASoC: rsnd: Add ADG reset support for RZ/G3E

Series: drm/bridge: convert users of of_drm_find_bridge(), part 4
  Submitter: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Committer: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1079198
  Lore link: https://lore.kernel.org/r/20260409-drm-bridge-alloc-getput-drm_of_find_bridge-4-v5-0-d7381c07788a@bootlin.com
    Patches: [v5,1/2] drm: renesas: rz-du: rzg2l_du_encoder: convert to of_drm_find_and_get_bridge()
             [v5,2/2] drm: rcar-du: encoder: convert to of_drm_find_and_get_bridge()

Series: Add DU support for RZ/T2H and RZ/N2H SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1097495
  Lore link: https://lore.kernel.org/r/20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v4,1/5] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
             [v4,2/5] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
             [v4,3/5] drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
             [v4,4/5] drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
             [v4,5/5] drm: renesas: rz-du: Add support for RZ/T2H SoC

Patch: media: rcar-vin: Drop min_queued_buffers
  Submitter: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089260
  Lore link: https://lore.kernel.org/r/20260504-rcar-vin-min-queued-buffs-v1-1-59d20ad5cd2d@ideasonboard.com

Patch: gpio: Use named initializers for platform_device_id arrays
  Submitter: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1101710
  Lore link: https://lore.kernel.org/r/cover.1779893336.git.u.kleine-koenig@baylibre.com

Patch: [RFC] firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Sudeep Holla <sudeep.holla@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1077711
  Lore link: https://lore.kernel.org/r/20260406155343.72087-1-marek.vasut+renesas@mailbox.org

Series: Add support for DU and DSI on the Renesas RZ/G3E SoC
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1078608
  Lore link: https://lore.kernel.org/r/cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com
    Patches: [v6,01/21] clk: renesas: rzv2h: Add PLLDSI clk mux support
             [v6,09/21] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
             [v6,16/21] media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
             [v6,17/21] media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC

Patch: [v4] drm/bridge: ite-it6263: Move chip initialization code from probe to atomic_enable
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Liu Ying <victor.liu@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1088429
  Lore link: https://lore.kernel.org/r/20260501061200.20129-1-biju.das.jz@bp.renesas.com

Patch: clk: renesas: r9a08g045-cpg: Drop unused pm_domain header file
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1099944
  Lore link: https://lore.kernel.org/r/20260524082657.19335-1-biju.das.jz@bp.renesas.com

Series: Add MTU3 for RZ/T2H and RZ/N2H
  Submitter: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1079849
  Lore link: https://lore.kernel.org/r/20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com
    Patches: [v2,01/10] clk: renesas: r9a09g077: add MTU3 module clock
             [v2,06/10] dt-bindings: timer: renesas,rz-mtu3: remove TCIU8 interrupt

Patch: [v3] drm: renesas: rz-du: mipi_dsi: Fix return path on error
  Submitter: Chris Brandt <chris.brandt@renesas.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1088525
  Lore link: https://lore.kernel.org/r/20260501132135.196701-1-chris.brandt@renesas.com

Patch: None
  Submitter: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Committer: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1084673
  Lore link: https://lore.kernel.org/r/20260423115550.444930-1-luca.ceresoli@bootlin.com

Series: drm: renesas: rz-du: Add RZ/G3E support
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1090912
  Lore link: https://lore.kernel.org/r/cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com
    Patches: [v7,01/13] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL

Patch: [v2] drm: rz-du: Ensure correct suspend/resume ordering with VSP
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1074665
  Lore link: https://lore.kernel.org/r/20260330144651.817338-1-tommaso.merciai.xr@bp.renesas.com

Patch: drm/bridge: ite-it6263: Drop unnecessary blank line
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Liu Ying <victor.liu@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089350
  Lore link: https://lore.kernel.org/r/20260504145906.155198-1-biju.das.jz@bp.renesas.com


Total patches: 146

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



