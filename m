Return-Path: <linux-renesas-soc+bounces-28386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN7nHdM0nGkKAgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 12:06:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C67331754A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 12:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E10423007AFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 11:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A71335BDDC;
	Mon, 23 Feb 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8jLx2MT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F3F357A43
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771844803; cv=none; b=utwKFMvvX6Pmv0SVsWR/y2VipXyfLKWP+aHO/7gyZB5ZKm2aNFUyiTBPqQcrm6QyRhUMfESNBNNhmU7UoFH/rjq75fLgLXxMWKO8n8giO1FgzPes3w4p9jckoBHg2s7xuLkKpHi0pVinndh9QAc2FoCzPNVFO6HsMZ/NZ1ogsrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771844803; c=relaxed/simple;
	bh=gm5LRVSdBtuxv3o3wm+fniGcA0xM9Bm/DKgGjOWj6b4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=i5/YMXH4hKHozbCOr7ilhK2jFn4w8LgR17VSmcCm5gtgoIfCXzS0Mlw2He2YoD1RKyYbd6W785eehQHuQ1q7JsW7qGWPo5TBTOBOkw6WbRSGmyKibBTuTG3n4m43LDXAsJnvfrlS2PbX3I8olCt6cKXIhp7AQOIMSsg09CGvgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8jLx2MT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3290DC116C6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 11:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771844803;
	bh=gm5LRVSdBtuxv3o3wm+fniGcA0xM9Bm/DKgGjOWj6b4=;
	h=Subject:From:Date:To:From;
	b=m8jLx2MTFUSuCnY/XS0cvz4q6wc6Z+G57DKo7mUniEYQY9CQ+oOXD+Xh0AVYEJoCS
	 gsJF9mdclHaVNif1gyI+LkNNwNYRtEuL/ShZP7dEus1S7/6E4nreelsRh7tas8b2TJ
	 4+q4+BnTkc5dvt1lGWpZ7Ox1mEPa/+EhRADUvh1pR4RgiYHRnrovyd3fa+6xelponu
	 2Zvz/CNH/KdQeHGOEPaf7N46fNav+sk2X7ayVSzm6aThc5tT0AMpJDv1axcq2lhySm
	 Pv49XqD2paBv7Ol3xtj0EA5ERHm2jeim9S1QX/nwzT8SVLHks0NABcBWzxCovqsR4d
	 i9HPeqiKRQ4Jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCCE33808200
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 11:06:50 +0000 (UTC)
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
 <177184480931.2234441.15894858720972984671.git-patchwork-summary@kernel.org>
Date: Mon, 23 Feb 2026 11:06:49 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-28386-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C67331754A0
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: usb: phy: generic: Miscellaneous improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1045190
  Lore link: https://lore.kernel.org/r/cover.1769004444.git.geert+renesas@glider.be
    Patches: [1/4] usb: phy: generic: Always use dev in usb_phy_generic_probe()
             [2/4] usb: phy: generic: Convert to devm_clk_get_optional()
             [3/4] usb: phy: generic: Convert to dev_err_probe()
             [4/4] usb: phy: generic: Convert to device property API

Patch: mfd: core: Improve compile coverage of mfd_match_of_node_to_dev()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1028591
  Lore link: https://lore.kernel.org/r/7b9a4a355c5da3fe812ead663285d05b64b84857.1764320964.git.geert+renesas@glider.be

Patch: arm64: topology: Do not warn on missing AMU in cpuhp_topology_online()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Will Deacon <will@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1042692
  Lore link: https://lore.kernel.org/r/a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be

Patch: drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Adrian Larumbe <adrianml@alumnos.upm.es>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1030100
  Lore link: https://lore.kernel.org/r/20251203125104.67596-1-biju.das.jz@bp.renesas.com

Patch: clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=980646
  Lore link: https://lore.kernel.org/r/a7bc0f16c3592e5e0e8e6393bd4d06eb2e2487e4.1752086505.git.geert+renesas@glider.be

Patch: [resend] clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1045105
  Lore link: https://lore.kernel.org/r/15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be

Patch: media: dt-bindings: media: renesas,fcp: Allow three clocks for RZ/V2N SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1019091
  Lore link: https://lore.kernel.org/r/20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [v3] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1045387
  Lore link: https://lore.kernel.org/r/20260121232657.155281-1-marek.vasut+renesas@mailbox.org

Series: drm/bridge: convert users of of_drm_find_bridge(), part 3
  Submitter: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Committer: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1040379
  Lore link: https://lore.kernel.org/r/20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com
    Patches: [v2,1/6] drm/bridge: dw-hdmi: convert to of_drm_find_and_get_bridge()
             [v2,2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
             [v2,3/6] drm/imx/dw-hdmi: convert to of_drm_find_and_get_bridge()
             [v2,4/6] drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
             [v2,5/6] drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()
             [v2,6/6] drm: rcar-du: lvds: convert to of_drm_find_and_get_bridge()

Patch: dt-bindings: display: bridge: nxp,tda998x: Add missing clocks
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1041289
  Lore link: https://lore.kernel.org/r/2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be

Series: [1/3] phy: rockchip: usb: Simplify with scoped for each OF child loop
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1036397
  Lore link: https://lore.kernel.org/r/20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com
    Patches: [1/3] phy: rockchip: usb: Simplify with scoped for each OF child loop
             [2/3] phy: core: Simplify with scoped for each OF child loop
             [3/3] phy: renesas: rcar-gen2: Simplify with scoped for each OF child loop

Series: spi: Make SPI core to take care of fwnode assignment
  Submitter: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1041413
  Lore link: https://lore.kernel.org/r/20260112203534.4186261-1-andriy.shevchenko@linux.intel.com
    Patches: [v2,1/4] spi: Propagate default fwnode to the SPI controller device
             [v2,2/4] spi: Drop duplicate of_node assignment
             [v2,3/4] spi: Drop duplicate fwnode assignment
             [v2,4/4] spi: Drop duplicate device_set_node() call

Series: PCI: endpoint: BAR subrange mapping support
  Submitter: Koichiro Den <den@valinux.co.jp>
  Committer: Manivannan Sadhasivam <mani@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1046610
  Lore link: https://lore.kernel.org/r/20260124145012.2794108-1-den@valinux.co.jp
    Patches: [v10,1/8] PCI: endpoint: Add dynamic_inbound_mapping EPC feature
             [v10,2/8] PCI: endpoint: Add BAR subrange mapping support
             [v10,3/8] PCI: dwc: Advertise dynamic inbound mapping support
             [v10,4/8] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
             [v10,5/8] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
             [v10,6/8] PCI: endpoint: pci-epf-test: Add BAR subrange mapping test support
             [v10,7/8] misc: pci_endpoint_test: Add BAR subrange mapping test case
             [v10,8/8] selftests: pci_endpoint: Add BAR subrange mapping test case

Patch: [v2] dt-bindings: phy: ti,tcan104x-can: Document TI TCAN1046
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1031769
  Lore link: https://lore.kernel.org/r/20251209162119.2038313-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: Documentation: mailbox: mbox_chan_ops.flush() is optional
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jonathan Corbet <corbet@lwn.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1030502
  Lore link: https://lore.kernel.org/r/6a50a5d4f0d0da26e5cccf348550879e53792e6e.1764861174.git.geert+renesas@glider.be

Series: ASoC: renesas: rz-ssi: Cleanups
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1044337
  Lore link: https://lore.kernel.org/r/20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [1/4] ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()
             [2/4] ASoC: renesas: rz-ssi: Drop unnecessary if condition
             [3/4] ASoC: renesas: rz-ssi: Drop the & operator in front of function name
             [4/4] ASoC: renesas: rz-ssi: Drop goto label

Patch: regcache: Demote defaults readback from HW to debug print
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1045391
  Lore link: https://lore.kernel.org/r/20260121234309.178391-1-marek.vasut+renesas@mailbox.org

Series: Describe PCIe/USB3.0 clock generator on R-Car Gen3
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1043791
  Lore link: https://lore.kernel.org/r/20260118135038.8033-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/9] arm64: dts: renesas: r8a77951: Describe PCIe root ports
             [v2,7/9] arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock generator
             [v2,8/9] arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock generator
             [v2,9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

Series: [v5,1/2] dt-bindings: touchscreen: trivial-touch: Drop 'interrupts' requirement for old Ilitek
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1045378
  Lore link: https://lore.kernel.org/r/20260121230736.114623-1-marek.vasut+renesas@mailbox.org
    Patches: [v5,1/2] dt-bindings: touchscreen: trivial-touch: Drop 'interrupts' requirement for old Ilitek
             [v5,2/2] Input: ili210x - add support for polling mode

Patch: dt-bindings: clk: rs9: Fix DIF pattern match
  Submitter: Marek Vasut <marek.vasut@mailbox.org>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1011210
  Lore link: https://lore.kernel.org/r/20251014104626.10682-1-marek.vasut@mailbox.org

Series: mailbox: renesas: Support MFIS mailbox driver
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Jassi Brar <jassisinghbrar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016543
  Lore link: https://lore.kernel.org/r/87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com
    Patches: [v2,1/3] mailbox: remove unneeded double quotation

Patch: [v3,resend] mailbox: remove unneeded double quotation
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Jassi Brar <jassisinghbrar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1040191
  Lore link: https://lore.kernel.org/r/87qzrz1s65.wl-kuninori.morimoto.gx@renesas.com

Patch: drm: renesas: rz-du: mipi_dsi: fix kernel panic when rebooting for some panels
  Submitter: Hugo Villeneuve <hugo@hugovil.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1041281
  Lore link: https://lore.kernel.org/r/20260112154333.655352-1-hugo@hugovil.com

Patch: [net,v3] net: renesas: rswitch: fix forwarding offload statemachine
  Submitter: Michael Dege <michael.dege@renesas.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1051588
  Lore link: https://lore.kernel.org/r/20260206-fix-offloading-statemachine-v3-1-07bfba07d03e@renesas.com

Series: Add support for DU/DSI clocks and DSI driver support for the Renesas RZ/V2H(P) SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1012044
  Lore link: https://lore.kernel.org/r/20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v11,1/7] clk: renesas: rzv2h-cpg: Add instance field to struct pll
             [v11,5/7] dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and RZ/V2N
             [v11,6/7] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
             [v11,7/7] drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

Series: Non-const bitfield helpers
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1020443
  Lore link: https://lore.kernel.org/r/cover.1762435376.git.geert+renesas@glider.be
    Patches: [v6,01/26] clk: at91: pmc: #undef field_{get,prep}() before definition
             [-next,v6,24/26] mtd: rawnand: sunxi: Convert to common field_{get,prep}() helpers


Total patches: 57

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



