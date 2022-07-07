Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85F99569E77
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 11:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbiGGJUT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jul 2022 05:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbiGGJUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 05:20:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B43232EC1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 02:20:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D2E3662200
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D9ACC341C8
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657185614;
        bh=VntvXG7f8uA1Sv4A9UFHedJvzglt0jPX38E1tWwCv3s=;
        h=Subject:From:Date:To:From;
        b=Q1Bi6H5erOR1UfV89muswMCq8jeCONYQZ8NC8snbCgIYRM4XQcC02eCkP4INr6UxH
         +8Z02N36nlTiUwCwctJ3Lm2cQcJCcWVpNDXM+aNB8OK4two0R0z9+wTUj/XfodN66T
         f9TAdIfcU9265lQuvtlgn2q4leaegKv94kjoTVWq44oP+h0nv7uWKzg8xFgBMcXMgz
         VtgpIOQELboN33UazeO1thYJAv1bjSMSUHSWmlIMrokMhyXgIUS2O1OLuKYqIgf+bW
         yXwPKeXiOhi8K9KVW+Tylrr4yNJpFpu+W8bDMQd51/8J7tvH+jhDHMg5aWbQ86hPlP
         7dEheOPHg6IoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 21007E45BDA
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 09:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165718561408.12354.12280207990971716543.git-patchwork-summary@kernel.org>
Date:   Thu, 07 Jul 2022 09:20:14 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay support
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=601910
  Lore link: https://lore.kernel.org/r/20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,1/3] arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay support
             [v2,2/3] arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
             [v2,3/3] arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards

Patch: dt-bindings: hwinfo: renesas,prr: move from soc directory
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=656724
  Lore link: https://lore.kernel.org/r/20220705155038.454251-1-krzysztof.kozlowski@linaro.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


