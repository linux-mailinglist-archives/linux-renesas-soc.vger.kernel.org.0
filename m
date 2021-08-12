Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299113EA336
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235757AbhHLLAc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:00:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235696AbhHLLAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:00:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A74C460EE2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628766005;
        bh=/oHiYdEnlEphS0bAK4Hx4OQ5Xkb6R7ES6vf0lbiYW1Y=;
        h=Subject:From:Date:To:From;
        b=S/oM+CrnZr4a+pPRVlILZ+/LiSzbIufRP42VNUmGVQrkyfFkculXGDDuglisEACWZ
         QkZE53nFJ+Z4foUKyLW7mioGwhlVlLV5f6PgfOD2P78dfYotBpeH4Ynn13ncHCckQx
         wlsvlv51pXZNx8MYOLhHlCCVHijngTlQ+HTPsPrpR9ZflPQwEpEa2d25pedfDLzPVS
         q+W6r4S2pOK7HAqo1VQXvP31P//9Ep+EoYJSMzkLkxCdEbQkwHgd2gzs/TnzcsivQM
         bpoots5KOvIkWkIMxX4mkERRNN2X99n72HRR9j2Zqx3w41na/PYdigzMBtYVk1gIpo
         15tP3Q1G9OvIw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 91FA8608FA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 11:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162876600553.2278.1752397037008725126.git-patchwork-summary@kernel.org>
Date:   Thu, 12 Aug 2021 11:00:05 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: dt-bindings: i2c: renesas,riic: Add interrupt-names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=515483
  Lore link: https://lore.kernel.org/r/cover.1626267422.git.geert+renesas@glider.be
    Patches: [PATCH/RFC,1/4] dt-bindings: i2c: renesas,riic: Add interrupt-names
             [PATCH/RFC,2/4] ARM: dts: rza: Add I2C interrupt-names
             [PATCH/RFC,3/4] arm64: dts: renesas: r9a07g044: Add I2C interrupt-names
             [PATCH/RFC,4/4] dt-bindings: i2c: renesas,riic: Make interrupt-names required

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


