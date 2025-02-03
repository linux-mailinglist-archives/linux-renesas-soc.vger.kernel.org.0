Return-Path: <linux-renesas-soc+bounces-12816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6AAA2583A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2025 12:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6029D3A95D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2025 11:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83A6202C43;
	Mon,  3 Feb 2025 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfaGjjUO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FFC20101A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Feb 2025 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738582408; cv=none; b=J36w3qs6O4WAnCwNzjugxlXXFFlUmGDmu7s1rVnimnSw+/hp6OiLDCDKbfOG+611IZ+PlsvxFI8/aEN7HG79iMKwMjp6awRPcJCRrBfIOrKqxovdjEOgsVC1IoSpRowg6G6hedBZuk8AwpvLwYIq2btvAgj1oBvVFKRfCHw7pnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738582408; c=relaxed/simple;
	bh=c3y6A8OL8KIVfaPebGX1NU3/Tv2EsPCCiJZdSDyKkJg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=julBvwBE03Jg+wxO7YMeDeFsuU1Pyy7qPNlRdr5l9y8/kBmlgJ3k9Plhde6+cUvaXpXsEASvq8ex+VSid37xmkxkZrrZ943iGp4IHEg3oIOJZorPjUDqKbMpWdnBjpIw1jTRJ/4GMl/CI1OFLFfU3xJUhQMEfpMSxcm8H/xgs0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfaGjjUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2BDC4CED2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Feb 2025 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738582408;
	bh=c3y6A8OL8KIVfaPebGX1NU3/Tv2EsPCCiJZdSDyKkJg=;
	h=Subject:From:Date:To:From;
	b=HfaGjjUO9zJljUWi2pLtirYVsUHFLe7sIOMiZ5zh/Zj9V3GiiNgyrvwjMdJGupNaw
	 tqp8pnsxjEa/PiCb8t2dHBX1N4bVJeotZcy4BVVPlcOVOSVKAfP8unUVPZzcntXd+W
	 FcsLcJhr8G0UW1XE7tNb0UOIPHzUyCsMhCwaMGr1DdHsP+Q0U9HLHj1xW/dkIhhzgq
	 yYarOaRda2/YpUP44PGecXBMeYBInPcKD+UvlUQnyH/2pc9Q4ZLW0idwp0fRA85Fyp
	 +CsHTZh1lrKFXV92rGJ88324GAAMlkNe7fF7zDitvdC9Q0dzltOyqIRLwhlcH8a+jg
	 ZHHJpy/tRb03Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A541380AA76
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Feb 2025 11:33:56 +0000 (UTC)
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
 <173858243486.3100304.15498969009994341800.git-patchwork-summary@kernel.org>
Date: Mon, 03 Feb 2025 11:33:54 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: i3c: introduce and use generic parity helper
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=922817
  Lore link: https://lore.kernel.org/r/20250107090204.6593-1-wsa+renesas@sang-engineering.com
    Patches: [v4,1/5] bitops: add generic parity calculation for u8
             [v4,2/5] hwmon: (spd5118) Use generic parity calculation
             [v4,3/5] i3c: dw: use parity8 helper instead of open coding it
             [v4,4/5] i3c: mipi-i3c-hci: use parity8 helper instead of open coding it
             [v4,5/5] i3c: cdns: use parity8 helper instead of open coding it

Patch: dt-bindings: display: Correct indentation and style in DTS example
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=922918
  Lore link: https://lore.kernel.org/r/20250107125854.227233-1-krzysztof.kozlowski@linaro.org

Series: hwmon: (lm75) add I3C support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=919686
  Lore link: https://lore.kernel.org/r/20241219225522.3490-7-wsa+renesas@sang-engineering.com
    Patches: [RFC,1/5] hwmon: (lm75) simplify lm75_write_config()
             [RFC,2/5] hwmon: (lm75) simplify regulator handling
             [RFC,3/5] hwmon: (lm75) Remove superfluous 'client' member from private struct
             [RFC,4/5] hwmon: (lm75) separate probe into common and I2C parts

Series: drm: Add DSI/DP support for Renesas r8a779h0 V4M and grey-hawk board
  Submitter: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=918500
  Lore link: https://lore.kernel.org/r/20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com
    Patches: [v5,1/7] drm/rcar-du: dsi: Fix PHY lock bit check
             [v5,2/7] drm/rcar-du: Write DPTSR only if the second source exists
             [v5,3/7] dt-bindings: display: renesas,du: Add missing constraints
             [v5,4/7] dt-bindings: display: renesas,du: Add r8a779h0
             [v5,5/7] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779h0
             [v5,6/7] drm/rcar-du: dsi: Add r8a779h0 support
             [v5,7/7] drm/rcar-du: Add support for r8a779h0

Patch: rtc: use boolean values with device_init_wakeup()
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=918531
  Lore link: https://lore.kernel.org/r/20241217071331.3607-2-wsa+renesas@sang-engineering.com

Patch: selftests: timers: clocksource-switch: Adapt progress to kselftest framework
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Shuah Khan <skhan@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=807962
  Lore link: https://lore.kernel.org/r/6d7a665392e75c0af8fd4ad5b95bd3f0489236ee.1701973869.git.geert+renesas@glider.be

Patch: media: rcar-csi2: Update D-PHY startup on V4M
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=916414
  Lore link: https://lore.kernel.org/r/20241210155400.3137792-1-niklas.soderlund+renesas@ragnatech.se

Series: Add NXP P3T1755 and fix LM75B docs
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=919009
  Lore link: https://lore.kernel.org/r/20241218074131.4351-5-wsa+renesas@sang-engineering.com
    Patches: [v2,1/3] dt-bindings: hwmon: lm75: Add NXP P3T1755
             [v2,2/3] hwmon: (lm75) Add NXP P3T1755 support
             [v2,3/3] hwmon: (lm75) Fix LM75B document link

Series: Improvements/fixes on the DPI interface
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=901727
  Lore link: https://lore.kernel.org/r/20241022082433.32513-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
             [v2,2/2] drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot clock for DPI

Series: Fix missing rtnl lock in suspend path
  Submitter: Kory Maincent <kory.maincent@bootlin.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=929021
  Lore link: https://lore.kernel.org/r/20250129-fix_missing_rtnl_lock_phy_disconnect-v3-0-24c4ba185a92@bootlin.com
    Patches: [net,v3,1/2] net: ravb: Fix missing rtnl lock in suspend/resume path
             [net,v3,2/2] net: sh_eth: Fix missing rtnl lock in suspend/resume path

Patch: media: platform: rzg2l-cru: rzg2l-video: Fix the comment in rzg2l_cru_start_streaming_vq()
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=887197
  Lore link: https://lore.kernel.org/r/20240905112508.160560-1-biju.das.jz@bp.renesas.com

Patch: i3c: fix kdoc parameter description for module_i3c_i2c_driver()
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=919674
  Lore link: https://lore.kernel.org/r/20241219220338.10315-1-wsa+renesas@sang-engineering.com

Patch: drm: renesas: rz-du: Increase supported resolutions
  Submitter: Chris Brandt <chris.brandt@renesas.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=911305
  Lore link: https://lore.kernel.org/r/20241120150328.4131525-1-chris.brandt@renesas.com

Patch: ASoC: renesas: rz-ssi: Add a check for negative sample_space
  Submitter: Dan Carpenter <dan.carpenter@linaro.org>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=923290
  Lore link: https://lore.kernel.org/r/e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain

Patch: dt-bindings: usb: Correct indentation and style in DTS example
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=922933
  Lore link: https://lore.kernel.org/r/20250107131015.246461-1-krzysztof.kozlowski@linaro.org

Patch: dt-bindings: ufs: Correct indentation and style in DTS example
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=922934
  Lore link: https://lore.kernel.org/r/20250107131019.246517-1-krzysztof.kozlowski@linaro.org

Series: media: v4l: fwnode: Add support for CSI-2 C-PHY line orders
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=911525
  Lore link: https://lore.kernel.org/r/20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/4] media: dt-bindings: Add property to describe CSI-2 C-PHY line orders
             [v2,4/4] media: rcar-csi2: Allow specifying C-PHY line order

Series: hwmon: (isl28022) doc fixes and minor code cleanup
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=911187
  Lore link: https://lore.kernel.org/r/20241120083349.22226-5-wsa+renesas@sang-engineering.com
    Patches: [1/3] hwmon: (isl28022) use proper path for DT bindings
             [2/3] hwmon: (isl28022) document shunt voltage channel
             [3/3] hwmon: (isl28022) apply coding style to module init/exit

Patch: [v2] drm/bridge: ite-it6263: Support VESA-24 input format
  Submitter: Tommaso Merciai <tomm.merciai@gmail.com>
  Committer: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914807
  Lore link: https://lore.kernel.org/r/20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com

Patch: watchdog: rzv2h_wdt: Use local `dev` pointer in probe
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Wim Van Sebroeck <wim@linux-watchdog.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=917705
  Lore link: https://lore.kernel.org/r/20241213171157.898934-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [v3] ASoC: dt-bindings: renesas,rsnd: remove post-init-providers property
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=918888
  Lore link: https://lore.kernel.org/r/87ikrhrfws.wl-kuninori.morimoto.gx@renesas.com

Patch: [RFC,v2] hwmon: (lm75) add I3C support for P3T1755
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=919800
  Lore link: https://lore.kernel.org/r/20241220093635.11218-1-wsa+renesas@sang-engineering.com

Patch: ASoC: da7213: Initialize the mutex
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=927799
  Lore link: https://lore.kernel.org/r/20250123121036.70406-1-claudiu.beznea.uj@bp.renesas.com

Patch: i2c: add kdoc for the new debugfs entry of clients
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=925586
  Lore link: https://lore.kernel.org/r/20250115073918.8297-1-wsa+renesas@sang-engineering.com


Total patches: 44

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



