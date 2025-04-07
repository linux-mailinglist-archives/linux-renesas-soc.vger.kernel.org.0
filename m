Return-Path: <linux-renesas-soc+bounces-15433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7CA7DB66
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 12:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5F30188F539
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 10:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964A622B5B8;
	Mon,  7 Apr 2025 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9+pJwEf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CCB155312
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022696; cv=none; b=bFVidCSs/jfFCeEXgRAXcX23pheXFuauAL6srke9JE5NcZT8XLb8NEWkutf6ufIGM0FbGVj2xS7p5lHxky1ZUYXu//TzBwVZkiceTTSCgoYTFK/ttSzvU2Q3XnhMYkAuyUa5gEV04Y0B4P8sH6OnsD3Gi0WASjrPMGLnZnFpi98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022696; c=relaxed/simple;
	bh=Xux7pCnvGPc3UHMSdw/krIimFexUyyzWj+ZeB7GQcrE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=fSVJx4aos6mZ4JfOtTtwYuSwvy/21cihgw1guBHMWFkSBs6QBHYIlKP1604JBdbESlG5dmpoB9Bp0CVHTOtiR4q5I3rMmOUPwLZxZ+DAr2jlEncWRNrSopTdYLUEgYMCNOjV62mUSJYb6TUTCiDA0p4e0rWS7HDDx2iaCH3vk+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9+pJwEf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B13C4CEDD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744022695;
	bh=Xux7pCnvGPc3UHMSdw/krIimFexUyyzWj+ZeB7GQcrE=;
	h=Subject:From:Date:To:From;
	b=O9+pJwEft5mnC12yO6jMm/QZeK0Fio7IBIa0qokN6ZvzH2Nd9KqimChUOKGDZpn+5
	 S9rbbW9kjgee0T/pM6ZoA65LUuR4AH7ZO9DvEgNSgdMMHLxzU44z6GyyfOQp9RcZkR
	 M3jqOPsVVSPjLexSx/LcGJv0O+VGOqxBRkA8ejY4Z1gHs3KLf1msOkeqsBmSVxCDcg
	 T35kHwUDxn9UZSGYWKwsGd/Fx+Q9QVSijWjUbDEAZmoPsh7JxV2YSsYj80O5Xfdq7d
	 e/ZDxF8+TEryZkriA0h7vhZKEUSHHp/qigRRO0SYJ4Y2FQrYw5yFP/Rss7dCwKxv0L
	 iWF4K702hOnyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 387F03804CAE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 10:45:34 +0000 (UTC)
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
 <174402273278.855509.16337499309171986117.git-patchwork-summary@kernel.org>
Date: Mon, 07 Apr 2025 10:45:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: gpio: more gpio_chip setter conversions
  Submitter: Bartosz Golaszewski <brgl@bgdev.pl>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=942255
  Lore link: https://lore.kernel.org/r/20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org
    Patches: [01/15] gpio: bcm-kona: use lock guards
             [02/15] gpio: bcm-kona: use new line value setter callbacks
             [03/15] gpio: bd71815: use new line value setter callbacks
             [04/15] gpio: bd71828: use new line value setter callbacks
             [05/15] gpio: bd9571mwv: use new line value setter callbacks
             [06/15] gpio: bt8xx: allow to build the module with COMPILE_TEST=y
             [07/15] gpio: bt8xx: use lock guards
             [08/15] gpio: bt8xx: use new line value setter callbacks
             [09/15] gpio: cgbc: use new line value setter callbacks
             [10/15] gpio: creg-snps: use new line value setter callbacks
             [11/15] gpio: cros-ec: use new line value setter callbacks
             [12/15] gpio: crystalcove: use new line value setter callbacks
             [13/15] gpio: cs5535: use new line value setter callbacks
             [14/15] gpio: da9052: use new line value setter callbacks
             [15/15] gpio: da9055: use new line value setter callbacks

Series: media: rcar: Minor cleanups and improvements
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=926934
  Lore link: https://lore.kernel.org/r/20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com
    Patches: [01/10] media: rcar-csi2: Move Y8 entry to a better place
             [02/10] media: rcar-csi2: Add RAW10 and RAW12 formats
             [03/10] media: rcar-isp: Add RAW8, RAW10 and RAW12 formats
             [04/10] media: rcar-csi2: Use v4l2_get_link_freq()
             [05/10] media: rcar-vin: Use v4l2_subdev_{enable|disable}_streams()
             [06/10] media: rcar-isp: Use v4l2_subdev_{enable|disable}_streams()
             [07/10] media: rcar-csi2: Use v4l2_subdev_{enable|disable}_streams()
             [08/10] media: rcar-isp: Convert to subdev state
             [09/10] media: rcar-isp: Convert to .{enable|disable}_streams
             [10/10] media: rcar-csi2: Convert to .{enable|disable}_streams

Patch: [v2] rtc: rzn1: implement one-second accuracy for alarms
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=940461
  Lore link: https://lore.kernel.org/r/20250305101038.9933-2-wsa+renesas@sang-engineering.com

Patch: ARM: smp: Fix IPI alignment in /proc/interrupts
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=911212
  Lore link: https://lore.kernel.org/r/96f61cafee969c59796ac06c1410195fa0f1ba0b.1732096154.git.geert+renesas@glider.be

Patch: media: adv7180: Disable test-pattern control on adv7180
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=936639
  Lore link: https://lore.kernel.org/r/20250221230907.1230076-1-niklas.soderlund+renesas@ragnatech.se

Patch: ASoC: soc-core: Stop using of_property_read_bool() for non-boolean properties
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=927454
  Lore link: https://lore.kernel.org/r/db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be

Series: hwmon: Use per-client debugfs entry
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=928318
  Lore link: https://lore.kernel.org/r/20250125123941.36729-8-wsa+renesas@sang-engineering.com
    Patches: [RFT,1/6] hwmon: (ina3221) Use per-client debugfs entry
             [RFT,2/6] hwmon: (ltc4282) Use per-client debugfs entry
             [RFT,4/6] hwmon: (sg2042) Use per-client debugfs entry
             [RFT,6/6] hwmon: (tps23861) Use per-client debugfs entry

Patch: dt-bindings: timer: Correct indentation and style in DTS example
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Daniel Lezcano <daniel.lezcano@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=922935
  Lore link: https://lore.kernel.org/r/20250107131024.246561-1-krzysztof.kozlowski@linaro.org

Series: Support ROHM BD79124 ADC
  Submitter: Matti Vaittinen <mazziesaccount@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=937210
  Lore link: https://lore.kernel.org/r/cover.1740421248.git.mazziesaccount@gmail.com
    Patches: [v4,01/10] dt-bindings: ROHM BD79124 ADC/GPO
             [v4,06/10] iio: adc: ti-ads7924 Drop unnecessary function parameters

Patch: [net-next] net: phy: marvell-88q2xxx: Init PHY private structure for mv88q211x
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=934138
  Lore link: https://lore.kernel.org/r/20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se

Patch: [v2] of: base: Add of_get_available_child_by_name()
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=929675
  Lore link: https://lore.kernel.org/r/20250201093126.7322-1-biju.das.jz@bp.renesas.com

Series: Add of_get_available_child_by_name()
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=930800
  Lore link: https://lore.kernel.org/r/20250205124235.53285-1-biju.das.jz@bp.renesas.com
    Patches: [net-next,v2,1/7] of: base: Add of_get_available_child_by_name()
             [net-next,v2,2/7] net: dsa: rzn1_a5psw: Use of_get_available_child_by_name()

Patch: media: i2c: adv748x: Fix test pattern selection mask
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=927318
  Lore link: https://lore.kernel.org/r/20250121204400.4184438-1-niklas.soderlund+renesas@ragnatech.se

Series: Add support for Mali-G31 GPU on RZ/V2H(P) SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=935079
  Lore link: https://lore.kernel.org/r/20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2H(P) SoC

Patch: [net-next] net: renesas: rswitch: Convert to for_each_available_child_of_node()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=930890
  Lore link: https://lore.kernel.org/r/54f544d573a64b96e01fd00d3481b10806f4d110.1738771798.git.geert+renesas@glider.be

Series: [v2,1/2] dt-bindings: display: renesas,du: narrow interrupts and resets per variants
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=928771
  Lore link: https://lore.kernel.org/r/20250128094719.63776-1-krzysztof.kozlowski@linaro.org
    Patches: [v2,1/2] dt-bindings: display: renesas,du: narrow interrupts and resets per variants
             [v2,2/2] dt-bindings: display: renesas,du: add top-level constraints

Patch: dt-bindings: serial: snps-dw-apb-uart: document RZ/N1 binding without DMA
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=945025
  Lore link: https://lore.kernel.org/r/20250318085353.18990-2-wsa+renesas@sang-engineering.com

Patch: [net-next] net: pcs: rzn1-miic: fill in PCS supported_interfaces
  Submitter: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=930876
  Lore link: https://lore.kernel.org/r/E1tfhYq-003aTm-Nx@rmk-PC.armlinux.org.uk

Patch: [RESEND] hwmon: (isl28022) Use per-client debugfs entry
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=927864
  Lore link: https://lore.kernel.org/r/20250123160347.44635-1-wsa+renesas@sang-engineering.com

Patch: [v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Douglas Anderson <dianders@chromium.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=916387
  Lore link: https://lore.kernel.org/r/7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be

Patch: [RFT,v3] hwmon: (pt5161l) Use per-client debugfs entry
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=940541
  Lore link: https://lore.kernel.org/r/20250305123149.16990-2-wsa+renesas@sang-engineering.com

Patch: [v2] riscv: defconfig: Disable Renesas SoC support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Alexandre Ghiti <alexghiti@rivosinc.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=930835
  Lore link: https://lore.kernel.org/r/e8a2fb273c8c68bd6d526b924b4212f397195b28.1738764211.git.geert+renesas@glider.be

Patch: [v2] MAINTAINERS: Update drm/rcar-du maintainers
  Submitter: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=928820
  Lore link: https://lore.kernel.org/r/20250128-rcar-du-maintainers-v2-1-4a3860a3e1ef@ideasonboard.com

Patch: [-next,v3] net: ethernet: Simplify bool conversion
  Submitter: Yang Li <yang.lee@linux.alibaba.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=691957
  Lore link: https://lore.kernel.org/r/20221104063731.84008-1-yang.lee@linux.alibaba.com

Patch: [net-next] net: stmmac: allow platforms to use PHY tx clock stop capability
  Submitter: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=941914
  Lore link: https://lore.kernel.org/r/E1trCPy-005jZf-Ou@rmk-PC.armlinux.org.uk

Patch: [RFC] rtc: remove 'setdate' test program
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=945869
  Lore link: https://lore.kernel.org/r/20250320103433.11673-1-wsa+renesas@sang-engineering.com

Patch: [v2] hwmon: (sht3x) Use per-client debugfs entry
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=929456
  Lore link: https://lore.kernel.org/r/20250131095148.11973-2-wsa+renesas@sang-engineering.com

Patch: net: dsa: rzn1_a5psw: Use of_get_available_child_by_name()
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=929722
  Lore link: https://lore.kernel.org/r/20250201163345.49779-1-biju.das.jz@bp.renesas.com

Patch: [net-next,v2] net: remove phylink_pcs .neg_mode boolean
  Submitter: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=933713
  Lore link: https://lore.kernel.org/r/E1tidPn-0040hd-2R@rmk-PC.armlinux.org.uk

Patch: selftest: rtc: skip some tests if the alarm only supports minutes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=935032
  Lore link: https://lore.kernel.org/r/20250218101548.6514-1-wsa+renesas@sang-engineering.com

Patch: [net-next] net: pcs: rzn1-miic: Convert to for_each_available_child_of_node() helper
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=930889
  Lore link: https://lore.kernel.org/r/3e394d4cf8204bcf17b184bfda474085aa8ed0dd.1738771631.git.geert+renesas@glider.be


Total patches: 60

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



