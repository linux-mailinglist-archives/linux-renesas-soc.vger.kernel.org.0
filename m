Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF5E6BD565
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 17:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjCPQUr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 12:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjCPQUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 12:20:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3ACDC0B4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 09:20:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05496B8226E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 16:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7770C4339E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678983622;
        bh=ofFMhA9D9HpOlUo0nwL2P6b36pDqZIjzpk85ePji4Tk=;
        h=Subject:From:Date:To:From;
        b=qU6cVD9v/Gl+dq/SAwuhxKcauxLKgNkAIh8hYtF96gCeGnwrwihlHb4jukSxaF2xD
         hQi8e4/4X+wqAX8jjmeGEGgJRpCHHEe0cqn0xuG9QoeFrhu+WM5dJRtqsJDl38SNVN
         W2SQYCL6F6EJfqQK18iegDiPpiACwyCCY6Vz7mK6/WIR/WSleE+DICuzpFTnq7TsPH
         nMMzX7E5+rwD3BV0rLj+WZ4uJIjfS20qAbqgC2pMysZUVY+3GHpLi2SaYSs9QTtV2/
         vvzQYVrtyrGz5eIcHCg0iUPVcp127LfGu+HfHtQqMxvK15cQp4SdBQUImgsGLRxVkA
         jBx3F5RX+dP5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0398E66CBB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 16:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167898362246.18620.1083246664839638466.git-patchwork-summary@kernel.org>
Date:   Thu, 16 Mar 2023 16:20:22 +0000
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

Series: [1/2] soc: renesas: mark OF related data as maybe unused
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=729184
  Lore link: https://lore.kernel.org/r/20230312132650.352796-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] soc: renesas: mark OF related data as maybe unused
             [2/2] soc: renesas: pwc-rzv2m: drop of_match_ptr for ID table

Patch: arm64: dts: renesas: r8a779a0: Update CAN-FD to R-Car Gen4 compatible value
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=729399
  Lore link: https://lore.kernel.org/r/9823058fa57156e88a084a4a99fc8525af1686ff.1678705389.git.geert+renesas@glider.be

Series: renesas: dts: Add remaining I2C EEPROMs
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=728321
  Lore link: https://lore.kernel.org/r/cover.1678375464.git.geert+renesas@glider.be
    Patches: [1/3] ARM: dts: armadillo800eva: Add I2C EEPROM for MAC address
             [2/3] arm64: dts: renesas: condor: Add I2C EEPROM for PMIC
             [3/3] arm64: dts: renesas: ulcb: Add I2C EEPROM for PMIC

Patch: soc: renesas: Use "#ifdef" for single-symbol definition checks
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=729396
  Lore link: https://lore.kernel.org/r/6026a3fe36735f0e6a0ecb037bf7c45f42aa3daf.1678705241.git.geert+renesas@glider.be


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


