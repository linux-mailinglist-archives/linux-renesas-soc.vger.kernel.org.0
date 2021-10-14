Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E7442D5B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 11:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhJNJM1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 05:12:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:53144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229691AbhJNJM1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 05:12:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A164E6101D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634202622;
        bh=exTiO+8ShJiyO/h1RQQ0E/f/0MwSeVXw5+Hc5s/v4Hw=;
        h=Subject:From:Date:To:From;
        b=E6W5h5B1JpgIhNDMvS3i42LGiWj0qRbtGIaW1z7YQvWTbv1i3CjBG0zoHz0IzzG8g
         y5RxUALPkN7LvFbnJGDQE+QjZ6McgBNi04i7i7MR/8/PfNPmluVUg3RZn9b0Y9bHmR
         mTG/7DsruqrnjM1ziWT4WQoVjiUf74qRDBlIhYBesAGPkj/3vJlia7oousaErcwJxd
         boxEVYE/uxeTwMXZnqjBj7Ky3XmWi+rG+KHuKcePSXssOH7ilf/+S2L3J26rEfyGjk
         iCy1LeKs/OdoVVy5GlmrHmC5uFCYaNUl2fzZUwVy0LBlDg40spN0N24sOducOPbJop
         anNkVf2ohFAkw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 92C5D609ED
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 09:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163420262254.31336.9101237899754996650.git-patchwork-summary@kernel.org>
Date:   Thu, 14 Oct 2021 09:10:22 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [PATCH/LOCAL,1/4] arm64: renesas: defconfig: Disable CONFIG_SPMI
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=562559
  Lore link: https://lore.kernel.org/r/fa758f27d9153ae3d8d92d7452bce9aa881327c7.1634115568.git.geert+renesas@glider.be
    Patches: [PATCH/LOCAL,1/4] arm64: renesas: defconfig: Disable CONFIG_SPMI
             [PATCH/LOCAL,2/4] arm64: renesas: defconfig: Refresh for v5.15-rc5
             [PATCH/LOCAL,3/4] arm64: renesas: defconfig: Enable CONFIG_PWM_RENESAS_TPU
             [PATCH/LOCAL,4/4] arm64: renesas: defconfig: Enable more support for RZ/G2L

Series: Add Ethernet support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=562447
  Lore link: https://lore.kernel.org/r/20211013075647.32231-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
             [v2,2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable Ethernet

Patch: [v3] arm64: dts: renesas: r8a779a0: Add and connect all CSI-2, ISP and VIN nodes
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=561659
  Lore link: https://lore.kernel.org/r/20211012100038.375289-1-niklas.soderlund+renesas@ragnatech.se

Patch: [v2] arm64: dts: renesas: rcar-gen3e: Add Cortex-A57 2 GHz opps
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=563285
  Lore link: https://lore.kernel.org/r/08a0f27f50b8ad4a78c05186190bebcfb364fe8f.1634200489.git.geert+renesas@glider.be


Total patches: 8

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


