Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCAE663CE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 10:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237824AbjAJJbH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 04:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238182AbjAJJaW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 04:30:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAE53FA1D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 01:30:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1549961563
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 09:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75F99C433EF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673343019;
        bh=uOB270iJYQmBlxx/49LebvLjqZOgVlDQsdQa8eogEtE=;
        h=Subject:From:Date:To:From;
        b=cd5QgDLmX4e6RUx/v7VcOrHeZg1EcRgYmAIXOom3Hft6NLtQJA9ozUCoJ4Mpz+ItF
         nKFuMGkRLE+uMwjS2SPL2201Y4hbyaVK9q+TKS+7MnY7idEMay3XM/inQQSwJsZ4i6
         zAx5Ev5+lPo5G95Hre6XcXUtk4Ow/kvuOGFvihaOaFmr9+K0Ktn7urOpDmAOoU6wxW
         ssPrFWe5QH92vLeTWfSoINbunctsrkHthusjCced1Pi89KjafBewn/4Z2LdcEjKoRk
         R4v0KTQHrPtOTI4yKH9cz9BcZyGD+zeOGFB0+FQGySgkiw5BSgG3g67eeoQN/2xt4S
         YZ8cVRvy8chGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53C97E21EE9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 09:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167334301925.30821.9231161898233495130.git-patchwork-summary@kernel.org>
Date:   Tue, 10 Jan 2023 09:30:19 +0000
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

Patch: [LOCAL] arm64: renesas: defconfig: Enable ARMv8.1 atomic instructions
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=708458
  Lore link: https://lore.kernel.org/r/3a4cb7d3ab06b87a22750dc006eff0a21f3872a0.1672747463.git.geert+renesas@glider.be

Patch: arm64: defconfig: Enable RZ/G2L MIPI CSI-2 and CRU support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=708456
  Lore link: https://lore.kernel.org/r/32098bf6a5e78a4bcc6398ccb5db0b01f1afc9b9.1672747428.git.geert+renesas@glider.be

Patch: [LOCAL] arm64: renesas: defconfig: Refresh for v6.2-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=708457
  Lore link: https://lore.kernel.org/r/d396219b7e1dae9dd9e687488e7a3bf7efa61593.1672747489.git.geert+renesas@glider.be

Series: SDHI/MMC SoC support for the RZ/V2M
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=704311
  Lore link: https://lore.kernel.org/r/20221213230129.549968-1-fabrizio.castro.jz@renesas.com
    Patches: [1/4] clk: renesas: r9a09g011: Add SDHI/eMMC clock and reset entries
             [4/4] arm64: dts: renesas: r9a09g011: Add eMMC and SDHI support

Patch: ARM: shmobile: defconfig: Refresh for v6.1-rc5
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=708444
  Lore link: https://lore.kernel.org/r/4f7757bd700edff487df387ca40ffb1524d688a4.1672744302.git.geert+renesas@glider.be


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


