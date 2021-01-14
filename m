Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33922F5FBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 12:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbhANLUt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 06:20:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:41696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727207AbhANLUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 06:20:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 887D5238EC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610623208;
        bh=73TJ3fdrDu+PRW5jag+DkM/nGqL/d+5Tt9BuVARCY0Y=;
        h=Subject:From:Date:To:From;
        b=jTo2uaRBDCFCPqJ5yAcvuBm+zZRTf6OqqvfVIHBcncJbsT3lWE6Sa5QTocHOK1gnP
         eQIrIQ2aJoVZxlwAHNKIjAJ9q1eva+kQmZelq8bBin4t5AacYOy9Mm616suv2AdW6I
         B/Q4n0X03tLW/cj0P29td6lhVqPfueqpqiTdCw9hkG/jb/zsMIWEM/ghVxC3jsYTBh
         cXs8b3s2XudbXDMmGrIIYGHnpEMR1HDX+yuinrk8Ce0G3CUAiMiaBGsk3VOP0Or51e
         rPO6SagLGWCZv1gVIPsFkuGe6r5BpVR8WES+Pf4NxaMn4EqdslPLEP2TeLJQ6YBTVO
         IZKr1dPqsaiqQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 7057660593
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 11:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161062320838.16123.11682917223391438347.git-patchwork-summary@kernel.org>
Date:   Thu, 14 Jan 2021 11:20:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: renesas: r8a779a0: Add SYS-DMAC nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=410781
  Lore link: https://lore.kernel.org/r/20210107182045.1948037-1-geert+renesas@glider.be
Series: arm64: dts: renesas: r8a779a0: Add GPIO support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=411161
  Lore link: https://lore.kernel.org/r/20210108102854.2025261-1-geert+renesas@glider.be
    Patches: [PATCH/RFC,v2,1/2] arm64: dts: renesas: r8a779a0: Add PFC node
             [v2,2/2] arm64: dts: renesas: r8a779a0: Add GPIO nodes
Patch: arm64: dts: renesas: r8a779a0: Add pinctrl device node
  Submitter: Ulrich Hecht <uli+renesas@fpond.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=413259
  Lore link: https://lore.kernel.org/r/20210112165948.31162-1-uli+renesas@fpond.eu
Patch: [v3] arm64: dts: renesas: r8a779a0: Add GPIO nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=414527
  Lore link: https://lore.kernel.org/r/20210114111117.2214281-1-geert+renesas@glider.be

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


