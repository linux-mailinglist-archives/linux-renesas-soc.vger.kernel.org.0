Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772AA36AE7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Apr 2021 09:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhDZHp1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Apr 2021 03:45:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233276AbhDZHni (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 03:43:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 97FD4613CB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619422810;
        bh=qwdLX3T8AIcDKN0h0jejb1M68wFmkiQGlnLPKvfpLv8=;
        h=Subject:From:Date:To:From;
        b=gg3rE5jxQDigPx40gw4/3yIGhwE0AxDxF85Ft86spc7btMoGmadoGRD2SZRYi0pFN
         YXnXf3bDwmxvZEIB/N3B5Ot4a4shULN1n9DHEmXQ62Df88R8vOg0qbJIAuQVgRyVmg
         x5cJj7n6X0dbJKGN0opESxhAjU+cELZ+x78rjbmQ6KFvqo7clwJ0P9lGGgzFtRJBKt
         mZPSpzYylwDMHrKzYgPhAgZKaD1kUaEOi0yE3qjpeuZGodmM6Ulhe/2zuf9ilZXKW1
         ev23XNz/lx/qJ57YrAQntSGshtc39yFO5ZKv+HYvVGWLsWYayltEKU42zmfc197gMS
         PUBVO6lcYhkQg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8A7DF60965
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 07:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161942281050.31580.12762500939874589445.git-patchwork-summary@kernel.org>
Date:   Mon, 26 Apr 2021 07:40:10 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: arm64: dts: renesas: Fix CSI-2 validation errors
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=470985
  Lore link: https://lore.kernel.org/r/20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/2] arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Fix CSI40 ports
             [2/2] arm64: dts: renesas: Add port@0 node for all CSI-2 nodes to dtsi
Patch: arm64: dts: renesas: condor: switch eMMC bus to 1V8
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=469709
  Lore link: https://lore.kernel.org/r/20210419143858.39401-1-wsa+renesas@sang-engineering.com

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


