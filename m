Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DDE20E55C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 00:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgF2VgI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 17:36:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728477AbgF2Sko (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:44 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593422497;
        bh=MFreIyTwFQsTFuBi087yyVnEvCVPFTr8prtF0ShWZgU=;
        h=Subject:From:Date:To:From;
        b=Gy1tlNfK9O50fyd2TUPdgVuxGd98K/ju6o7ssoHRFqF0JGqRObhmbuuLqy3orvbH8
         mZF5t9b6Nm1NIR0Ns1syDIOEF7h4GxOWzg96MYRLLEOveF0+gW7IMDvF/mtoU2PnAp
         F3gqM2K8EbTRLLCRGhJyyLnr6i7nD16hM+GMKppI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159342249749.14778.10887096823332826693.git-patchwork-summary@kernel.org>
Date:   Mon, 29 Jun 2020 09:21:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Series: arm64: renesas: defconfig: Update for v5.8-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=307899
  Link: <20200624133057.5860-1-geert+renesas@glider.be>
    Patches: [PATCH/LOCAL,1/7] arm64: renesas: defconfig: Refresh for v5.8-rc1
             [PATCH/LOCAL,2/7] arm64: renesas: defconfig: Enable WL1837 support
             [PATCH/LOCAL,3/7] arm64: renesas: defconfig: Enable GETHER support
             [PATCH/LOCAL,4/7] arm64: renesas: defconfig: Enable ADV7180 and ADV7604 support
             [PATCH/LOCAL,5/7] arm64: renesas: defconfig: Enable IMX219 and OV5645 support
             [PATCH/LOCAL,6/7] arm64: renesas: defconfig: Enable ADV7511 support
             [PATCH/LOCAL,7/7] arm64: renesas: defconfig: Enable HD3SS3220 support

Patch: drm: rcar-du: Fix build error
  Submitter: Daniel G <dagmcr@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=289747
  Link: <20200518201646.48312-1-dagmcr@gmail.com>

Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
