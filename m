Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5989E53E853
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jun 2022 19:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbiFFJXo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jun 2022 05:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbiFFJXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 05:23:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1D060D86
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 02:23:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 794B361302
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 09:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCDB0C385A9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654507417;
        bh=UbfDYDwjCG3iWLE3jqE6+tXcVsg80dS3WUBDWQid4fU=;
        h=Subject:From:Date:To:From;
        b=eSVBwi255Qnfe+Eg01TTSlg8xl5+2ScYhA12NrFkQyWDecZhZ6DP3i752BU9tBsT/
         wYltQ47vgg8G/BTTfpNvOiuzFQfOjfKhSQLZmlZ6Au+lqnkJBtYVWiEdIyrYpmsp9Y
         gnDVRegjhYkisrU2HAeeLD+m82RsrivNM34AqIzVrEP5uV7DMSzwI+XHm8mxsAqGDB
         fwn+AGubBiIk1GSdSLwQvD/0WvTLCg95xwiLY1HCOMm2IbG9IAtLQ2K/gUXIWrsqtf
         KSVqSYQiLGqf4QCh4ououG2qhePH1BEgaO8/iSc6X/1+GHfsZkzr8iwaldmdVsiMGO
         +Vx7bE+ecaSig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BCAC2E737EA
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 09:23:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165450741766.22849.11447133598594671297.git-patchwork-summary@kernel.org>
Date:   Mon, 06 Jun 2022 09:23:37 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [1/6] pwm: renesas-tpu: Make use of dev_err_probe()
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=631792
  Lore link: https://lore.kernel.org/r/20220413085050.61144-1-u.kleine-koenig@pengutronix.de
    Patches: [1/6] pwm: renesas-tpu: Make use of dev_err_probe()
             [2/6] pwm: renesas-tpu: Make use of devm functions
             [4/6] pwm: renesas-tpu: Rename variables to match the usual naming

Patch: [v2] gpio: pcf857x: Make the irqchip immutable
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Bartosz Golaszewski <brgl@bgdev.pl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=643546
  Lore link: https://lore.kernel.org/r/53a48d4c26252160f090371e24352975a7ea7add.1653042025.git.geert+renesas@glider.be

Patch: None
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=639075
  Lore link: https://lore.kernel.org/r/20220506101252.28770-1-laurent.pinchart+renesas@ideasonboard.com

Series: media: Centralize MIPI CSI-2 data types in shared header
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=607589
  Lore link: https://lore.kernel.org/r/20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/6] media: Define MIPI CSI-2 data types in a shared header file
             [2/6] media: cadence: cdns-csi2tx: Use mipi-csi2.h
             [5/6] media: rockchip: rkisp1: Use mipi-csi2.h

Patch: [v2] Input: gpio-keys - Cancel delayed work only in case of GPIO
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=644667
  Lore link: https://lore.kernel.org/r/20220524135822.14764-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [v2] gpio: rcar: Make the irqchip immutable
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Bartosz Golaszewski <brgl@bgdev.pl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=643545
  Lore link: https://lore.kernel.org/r/7b57347151a452286cc88358bfc839de30937089.1653041878.git.geert+renesas@glider.be

Patch: media: platform: renesas-ceu: Fix unused variable warning
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=624386
  Lore link: https://lore.kernel.org/r/20220317204903.28163-1-laurent.pinchart@ideasonboard.com

Series: RZ/N1 RTC support
  Submitter: Miquel Raynal <miquel.raynal@bootlin.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=641864
  Lore link: https://lore.kernel.org/r/20220516082504.33913-1-miquel.raynal@bootlin.com
    Patches: [v7,1/5] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
             [v7,2/5] rtc: rzn1: Add new RTC driver
             [v7,3/5] rtc: rzn1: Add alarm support
             [v7,4/5] rtc: rzn1: Add oscillator offset support
             [v7,5/5] MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver

Patch: rtc: rzn1: Fix error code in probe
  Submitter: Dan Carpenter <dan.carpenter@oracle.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=643175
  Lore link: https://lore.kernel.org/r/YoZMg1dmHHSJEfE9@kili

Patch: rtc: rzn1: fix inconsistent IS_ERR and PTR_ERR
  Submitter: Ziyang Xuan <william.xuanziyang@huawei.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=644134
  Lore link: https://lore.kernel.org/r/20220523015725.198244-1-william.xuanziyang@huawei.com

Patch: rtc: rzn1: Fix inconsistent IS_ERR and PTR_ERR
  Submitter: baihaowen <baihaowen@meizu.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=644533
  Lore link: https://lore.kernel.org/r/1653372586-24736-1-git-send-email-baihaowen@meizu.com

Patch: [v2] gpio: pca953x: Make the irqchip immutable
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Bartosz Golaszewski <brgl@bgdev.pl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=643547
  Lore link: https://lore.kernel.org/r/658f37ac17921a4770853635153fd6173dc4ef69.1653042074.git.geert+renesas@glider.be

Series: media: videobuf2: Expose vb2_queue_is_busy() to drivers
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=624769
  Lore link: https://lore.kernel.org/r/20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/3] media: videobuf2-v4l2: Expose vb2_queue_is_busy() to drivers
             [3/3] media: vsp1: Use vb2_queue_is_busy()

Series: RZN1 RTC support
  Submitter: Miquel Raynal <miquel.raynal@bootlin.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=636902
  Lore link: https://lore.kernel.org/r/20220429104602.368055-1-miquel.raynal@bootlin.com
    Patches: [v3,1/6] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
             [v3,5/6] MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver

Patch: [v2] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb ili2xxx bindings
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=589937
  Lore link: https://lore.kernel.org/r/0c5f06c9d262c1720b40d068b6eefe58ca406601.1638539806.git.geert+renesas@glider.be

Patch: drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on HPD interrupt
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Robert Foss <robert.foss@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=633409
  Lore link: https://lore.kernel.org/r/20220419142453.48839-1-biju.das.jz@bp.renesas.com

Patch: [-next] rtc: rzn1: fix platform_no_drv_owner.cocci warning
  Submitter: Yang Li <yang.lee@linux.alibaba.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=642913
  Lore link: https://lore.kernel.org/r/20220518232445.79156-1-yang.lee@linux.alibaba.com

Patch: ASoC: sh: Make SND_SOC_RZ depend on ARCH_RZG2L
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=634937
  Lore link: https://lore.kernel.org/r/20220423164443.146299-1-biju.das.jz@bp.renesas.com


Total patches: 28

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


