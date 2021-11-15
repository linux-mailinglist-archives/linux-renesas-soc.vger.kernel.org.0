Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E2C4502A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 11:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbhKOKnA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 05:43:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:57212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230419AbhKOKm7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 05:42:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B122A6320D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Nov 2021 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636972804;
        bh=WJYwtYADbMEzt46i+g/JjgXX2te0Pkdz8isNNkGgFgc=;
        h=Subject:From:Date:To:From;
        b=oNUvlIi973/Xrpo6Tm8QYTG24tOe+wIuRUws/Je+lyEUH4RiWBll/1il9LOd/Zg1o
         hnWpEadHErPWttdU+xdP5zXnhTw6ijuM+152pC++0naQcrs3rKpMTP+IsWkQe4MNWA
         f9dCzWGNWH2T4Aiwnw0YGRbTYDuP69vfI6Eq0uXGGq4B5MTzplrkLlCPZZRWsTFVMF
         p16Kvi2K9VZi8xaYPUZpk57dRUkSNiWnaNRJiqEC72HvHzmlqblJoiRjo713xNOxIC
         gy37HD1g1rEPmjMiZBRbz9ipNeh9u26Mn3ld3A5dlOMS/1Gqm6fAAJETkbziXmzjtr
         D+Fzw17D0ih+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9C5B7609E2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Nov 2021 10:40:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163697280457.5104.12478163841281850169.git-patchwork-summary@kernel.org>
Date:   Mon, 15 Nov 2021 10:40:04 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [GIT,PULL,FOR,v5.16] R-Car DU & other misc enhancements
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=558859
  Lore link: https://lore.kernel.org/r/YV5jfi+/qjTJKeb3@pendragon.ideasonboard.com

Patch: [v2] media: rcar-csi2: Add checking to rcsi2_start_receiver()
  Submitter: Nadezda Lutovinova <lutovinova@ispras.ru>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=530043
  Lore link: https://lore.kernel.org/r/20210811171816.12012-1-lutovinova@ispras.ru

Patch: drm: property: Replace strncpy() with strscpy_pad()
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=524283
  Lore link: https://lore.kernel.org/r/20210731013241.11656-1-laurent.pinchart+renesas@ideasonboard.com

Patch: [v3.1] dt-bindings: display: renesas,du: Provide bindings for r8a779a0
  Submitter: Kieran Bingham <kieran.bingham@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=551667
  Lore link: https://lore.kernel.org/r/20210923130138.67552-1-kieran.bingham@ideasonboard.com

Patch: drm/shmobile: Make use of the helper function devm_platform_ioremap_resource()
  Submitter: Cai Huoqing <caihuoqing@baidu.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=539873
  Lore link: https://lore.kernel.org/r/20210831135731.4776-1-caihuoqing@baidu.com

Patch: media: vsp1: Fix WPF macro names
  Submitter: Kieran Bingham <kieran.bingham@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=503421
  Lore link: https://lore.kernel.org/r/20210618161041.444987-1-kieran.bingham@ideasonboard.com

Patch: [v2] media: rcar_drif: Make use of the helper function devm_platform_ioremap_resource()
  Submitter: Cai Huoqing <caihuoqing@baidu.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=540509
  Lore link: https://lore.kernel.org/r/20210901112955.31372-1-caihuoqing@baidu.com

Patch: [v4] media: rcar_drif: Make use of the helper function devm_platform_get_and_ioremap_resource()
  Submitter: Cai Huoqing <caihuoqing@baidu.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=540525
  Lore link: https://lore.kernel.org/r/20210901114459.31493-1-caihuoqing@baidu.com

Patch: media: rcar_fdp1: Make use of the helper function devm_platform_ioremap_resource()
  Submitter: Cai Huoqing <caihuoqing@baidu.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=540221
  Lore link: https://lore.kernel.org/r/20210901055525.7379-1-caihuoqing@baidu.com

Patch: media: vsp1: Make use of the helper function devm_platform_ioremap_resource()
  Submitter: Cai Huoqing <caihuoqing@baidu.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=540225
  Lore link: https://lore.kernel.org/r/20210901055709.8079-1-caihuoqing@baidu.com

Patch: media: vsp1: Simplify DRM UIF handling
  Submitter: Kieran Bingham <kieran.bingham@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=503509
  Lore link: https://lore.kernel.org/r/20210618190905.580258-1-kieran.bingham@ideasonboard.com

Patch: [v2] dt-bindings: media: renesas,imr: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=509593
  Lore link: https://lore.kernel.org/r/eb0f8a890450d0cf155c7595c5e514c8f877c4c0.1625140547.git.geert+renesas@glider.be

Patch: [RFC] memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=550813
  Lore link: https://lore.kernel.org/r/20210922091007.5516-1-wsa+renesas@sang-engineering.com

Patch: [v3] media: vsp1: Add support for the V3U VSPD
  Submitter: Kieran Bingham <kieran.bingham@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=505377
  Lore link: https://lore.kernel.org/r/20210622230950.3207047-1-kieran.bingham@ideasonboard.com

Patch: [v6] media: rcar-isp: Add Renesas R-Car Image Signal Processor driver
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=557933
  Lore link: https://lore.kernel.org/r/20211005190427.3777971-1-niklas.soderlund+renesas@ragnatech.se

Patch: media: renesas-ceu: Make use of the helper function devm_platform_ioremap_resource()
  Submitter: Cai Huoqing <caihuoqing@baidu.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=540223
  Lore link: https://lore.kernel.org/r/20210901055540.7479-1-caihuoqing@baidu.com

Patch: [v3] drm: rcar-du: Allow importing non-contiguous dma-buf with VSP
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=551281
  Lore link: https://lore.kernel.org/r/20210922222605.22281-1-laurent.pinchart+renesas@ideasonboard.com

Patch: media: rcar-csi2: Make use of the helper function devm_platform_ioremap_resource()
  Submitter: Cai Huoqing <caihuoqing@baidu.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=540217
  Lore link: https://lore.kernel.org/r/20210901055510.7279-1-caihuoqing@baidu.com

Patch: [v2] media: rcar-vin: add GREY format
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=552301
  Lore link: https://lore.kernel.org/r/20210924124315.26164-1-nikita.yoush@cogentembedded.com

Patch: [v3] dt-bindings: pci: rcar-pci-ep: Document r8a7795
  Submitter: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=456005
  Lore link: https://lore.kernel.org/r/20210326080013.31773-1-yuya.hamamachi.sx@renesas.com

Patch: dt-bindings: pci: rcar-pci-ep: Document r8a7795
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=571133
  Lore link: https://lore.kernel.org/r/e4acfe90021e45658e82ed042746707ace208a93.1635337518.git.geert+renesas@glider.be

Patch: [v2] media: rcar-vin: add G/S_PARM ioctls
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=552419
  Lore link: https://lore.kernel.org/r/20210924135138.29950-1-nikita.yoush@cogentembedded.com

Patch: drm: rcar-du: Improve kernel log messages when initializing encoders
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=535349
  Lore link: https://lore.kernel.org/r/20210822003948.11684-1-laurent.pinchart+renesas@ideasonboard.com


Total patches: 23

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


