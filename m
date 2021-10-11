Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F93429076
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 16:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243200AbhJKOJn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 10:09:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:57344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240430AbhJKOGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 10:06:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F1AA61108
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633960828;
        bh=v99+RQfWpRPk+fz9NGeSDOnqdiI8CajMRTqpcYYzwc8=;
        h=Subject:From:Date:To:From;
        b=NdJvVdQG+ZvHUMIASocRWfS+4+YYeB8+LL5uL9gFk4qgFi1uoi7PlgPWfg4DUy3tw
         8Mi093W3KYvsyRELeZP0ZG0JlA+auWSeczjWmh6NW8XVomX1ILr3jktAwyrHfK0oVr
         lOOaJ458LJMNx7wjovDLjS/gn3TjinzxjFyEWn/PKnnSvKPZcfAGm5rMC5GguiQh+V
         ahORaOWCwJxyFnJHrZoGwdVFuQr2oGpF0CkXnxjyb5Pw4D1LVn7KEzVXUQzC0Q3a+n
         ZL3oC98EpxVxjNCzy9PyyXq/u8kq/wypyTfKijsxJkXrOm/sUmG0tj+IXUtq7Wcqda
         ftAMPXRxEaP7w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 00E3160173
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 14:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163396082794.13737.8023267651284990671.git-patchwork-summary@kernel.org>
Date:   Mon, 11 Oct 2021 14:00:27 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add eMMC/Micro SD support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=560675
  Lore link: https://lore.kernel.org/r/20211010142520.21976-1-biju.das.jz@bp.renesas.com
    Patches: [v4,1/2] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on SMARC platform
             [v4,2/2] arm64: dts: renesas: rzg2l-smarc: Enable microSD on SMARC platform

Patch: dt-bindings: drm/bridge: ti-sn65dsi86: Fix reg value
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=552297
  Lore link: https://lore.kernel.org/r/08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be


Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


