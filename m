Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8690B3049E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 21:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbhAZFVo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:21:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:41442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727038AbhAYJlF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 04:41:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6632C22472
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611567623;
        bh=ixY3qSF9yPWv0T3ZLO+8U/8nQROTxD2og8EIQ4FWwo0=;
        h=Subject:From:Date:To:From;
        b=WHw8Px+P3M8Ut4HXzU55scGwQzWVTDe69vjDJqxMz/LdHv7y/gvKPuE2q2ZBv6Jy5
         Xgkzi91Ixm3//WP3uLaTE2JVO5EBaAQ1sPxzI1EYBHaHF8FY6eDCqlmMiya1cMkGTE
         SpHEb0+ldiQZVoT5SjAt99lcUDTFc8pxPXSqZQDCQmEwjjWMwXRWHFKUoMwi5TBaea
         Ve+3r886HHeeJB2aKNSiYnQGo5UuRwe8q+rxCKov5CbZGEYoXdn7Q/S8D+tXekRcBv
         Ssf0TCKOAxwl8fxhdlFjdc/21MHe2+Hglelp7h4WlUmxaQthN6/6FxlC1+uMceVAV+
         xIQKGtp+MruNw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 51566652F7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 09:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161156762325.8623.2280098974247093809.git-patchwork-summary@kernel.org>
Date:   Mon, 25 Jan 2021 09:40:23 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: renesas: disable SD functions for plain eMMC
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=417473
  Lore link: https://lore.kernel.org/r/20210119133322.87289-1-wsa+renesas@sang-engineering.com
Patch: sh_eth: Fix power down vs. is_opened flag ordering
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=416843
  Lore link: https://lore.kernel.org/r/20210118150812.796791-1-geert+renesas@glider.be

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


