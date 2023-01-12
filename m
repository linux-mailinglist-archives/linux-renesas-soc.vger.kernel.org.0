Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC54667C06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 17:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240985AbjALQz7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 11:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240779AbjALQye (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 11:54:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F3732E97
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 08:40:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CDB1620A6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4875C433F0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673541617;
        bh=xJh3l2ntg6FkVOGQora7sJbB8QXMNcceSeByYhA43Zw=;
        h=Subject:From:Date:To:From;
        b=r8wpZq+kDkmeC458E7ZdHJYYSkEvbyqj+J2RnR61UYDzVvJn2soNvI/0mdZItpptg
         cGh990UUfIkeJbJy2jcNPfH1WCJutxj7uzm/cGpz6R8jpbPiB2wSIBWNRaniFT1tyB
         V0YIadycZOZYQ7a3s4WEjTLFRgsSyMEe22ihoiDSSnOxS8GarwZz4Qj9ZEZHcldX+v
         RM/CrAX/PH09exXAPCYdKleMfxBjWda7LJu6YkRxjZrn7Xc7sodicQ7o1RrQrAllWV
         6y4jnMSCNXi2AcBpmtI2vRbHFnYOEJMurfuMcQWBsgHMTSghrvx/abeaNouqJlDsai
         5UPnAxgFBjvuw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8054FC395C8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167354161746.8922.3388769619619573523.git-patchwork-summary@kernel.org>
Date:   Thu, 12 Jan 2023 16:40:17 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Fix pca954x i2c-mux node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=701303
  Lore link: https://lore.kernel.org/r/cover.1669999298.git.geert+renesas@glider.be
    Patches: [01/11] ARM: dts: ti: Fix pca954x i2c-mux node names
             [09/11] arm64: dts: renesas: ulcb-kf: Fix pca9548 i2c-mux node names

Patch: [v2] riscv: dts: renesas: rzfive-smarc-som: Enable OSTM nodes
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=708321
  Lore link: https://lore.kernel.org/r/20230102222233.274021-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: [1/4] arm64: dts: beacon-renesom: Fix gpio expander reference
  Submitter: Adam Ford <aford173@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=708813
  Lore link: https://lore.kernel.org/r/20230104141245.8407-1-aford173@gmail.com
    Patches: [1/4] arm64: dts: beacon-renesom: Fix gpio expander reference
             [4/4] arm64: boot: dts: r8a774[a/b/e]1-beacon: Consolidate sound clocks

Patch: arm64: dts: renesas: condor-i: add HS400 support for eMMC
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=710868
  Lore link: https://lore.kernel.org/r/20230111094944.5996-1-wsa+renesas@sang-engineering.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


