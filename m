Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D26328160
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 15:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236588AbhCAOwS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 09:52:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:34512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236622AbhCAOwM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 09:52:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 22E3F64DBD
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614610290;
        bh=SbwVaNhEmLSz8qcXZB9i+uqXQ+e4aDR6nS9tcrF/G+M=;
        h=Subject:From:Date:To:From;
        b=g5Kweglqi/0rl/XoX12TjiQdhzo/pf3w0wD5FT2LId92ulyQTGmBmUtMb/NXrCcfm
         tkQCH6i2BhhVW5P0ylo+//oUK6nySiBw9n2ZOsNq4N6ugNft6i6WLJYjhG0weVHfZ/
         oODub6zD5jqKlb+8t+C1AX7bzr2ErBCBTo517ByEsMhGJXYZFkaedOsiEQmzHWWvZQ
         VSaGO2XO2K9vrz0xsQJgBl1Kv11S/ceX77wk+yGOCThU11Jv+QjC7A91JGGHM6wb9u
         71gufY1sN1I30CrwUp6GhvZeghGDBXNYu0VhXGcWEcHEp+x9kZMWlezJ9n43QUSYGw
         gyLk3xLXq/AJA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 180B26094F
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 14:51:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161461029005.15822.15028823978217143184.git-patchwork-summary@kernel.org>
Date:   Mon, 01 Mar 2021 14:51:30 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm: smp: remove unused variable
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=406759
  Lore link: https://lore.kernel.org/r/20201228120147.59387-1-wsa+renesas@sang-engineering.com
Patch: media: vsp1: Use BIT macro for feature identification
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=402855
  Lore link: https://lore.kernel.org/r/20201216114548.818985-1-kieran.bingham+renesas@ideasonboard.com
Patch: drm: rcar-du: fix reference leak in rcar_cmm_enable
  Submitter: Qinglang Miao <miaoqinglang@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=392015
  Lore link: https://lore.kernel.org/r/20201127094444.121186-1-miaoqinglang@huawei.com
Patch: media: vsp1: Fix an error handling path in the probe function
  Submitter: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=401027
  Lore link: https://lore.kernel.org/r/20201212174119.120027-1-christophe.jaillet@wanadoo.fr
Series: drm: rcar-du: Fix LVDS-related crash
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=401807
  Lore link: https://lore.kernel.org/r/20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,1/9] drm: rcar-du: Fix crash when using LVDS1 clock for CRTC
             [v2,2/9] drm: rcar-du: Release vsp device reference in all error paths
             [v2,3/9] drm: rcar-du: Drop unneeded encoder cleanup in error path
             [v2,4/9] drm: rcar-du: Use DRM-managed allocation for VSP planes
             [v2,5/9] drm: rcar-du: Use DRM-managed allocation for encoders
             [v2,6/9] drm: rcar-du: Embed drm_device in rcar_du_device
             [v2,7/9] drm: rcar-du: Replace dev_private with container_of
             [v2,8/9] drm: rcar-du: Skip encoder allocation for LVDS1 in dual-link mode
             [v2,9/9] drm: rcar-du: Drop local encoder variable
Patch: [v2] drm: rcar-du: Fix leak of CMM platform device reference
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=403031
  Lore link: https://lore.kernel.org/r/20201216140836.31328-1-laurent.pinchart+renesas@ideasonboard.com
Patch: [v2] soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=434019
  Lore link: https://lore.kernel.org/r/20210216123958.3180014-1-geert+renesas@glider.be
Patch: dt-bindings: display: bridge: renesas,lvds: RZ/G2E needs renesas,companion too
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=402575
  Lore link: https://lore.kernel.org/r/20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com
Patch: ARM: dts: renesas: Add mmc aliases into R-Car Gen2 board dts files
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=432675
  Lore link: https://lore.kernel.org/r/1613131316-30994-1-git-send-email-yoshihiro.shimoda.uh@renesas.com
Series: ARM: dts: r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=419853
  Lore link: https://lore.kernel.org/r/20210122113424.2833127-1-geert+renesas@glider.be
    Patches: [v5,1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
             [v5,2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725 sensors
Patch: soc: renesas: rmobile-sysc: Remove unneeded platform includes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=428753
  Lore link: https://lore.kernel.org/r/20210205132141.1920137-1-geert+renesas@glider.be

Total patches: 20

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


