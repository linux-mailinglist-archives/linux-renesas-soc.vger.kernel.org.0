Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CCB3D70BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 10:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235740AbhG0IAH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 04:00:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:51148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235675AbhG0IAG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 04:00:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5F444610D0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627372807;
        bh=NPaEhOcYeUVuUfWRpO+I3hKsw4ItcGy3+MxneRGTOfk=;
        h=Subject:From:Date:To:From;
        b=tz0HguseyzPXX3a8pTrOoh4ps58AKjYLmpN7J4ntq4Z6zYNEjCo5LnG7sag7KNA/L
         0h53805ZIAoUNfWqh+ra42xfFbBW9YGGzjB/uL1ixckz5/bUj+b4X54TUzPQcjEgk/
         ub4kVo3ioWDLkP/E/faT4yx4ryqCHq46gGuIc2TNCcAM9UT4gnDtXhfTU/yUz8oXzj
         5Jaz5GOOHK5WpSQN5ME6uYUAOyQDhAhuOYuTpsGjtTlMPD1ii7UcePpQBBcOgDHbL9
         4UyOZbvx6BSJsKBDE1bBFsfwT+Afg+QU1tM/rpGiwU4qERZ7ShqezqYkqrmNLNALlD
         wweMVtJiVUs6A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5131C609CC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 08:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162737280727.15259.11310213289120174014.git-patchwork-summary@kernel.org>
Date:   Tue, 27 Jul 2021 08:00:07 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [v2] arm64: dts: renesas: r8a77961: Add iommus to ipmmu_ds[01] related nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=518863
  Lore link: https://lore.kernel.org/r/20210721111247.849825-1-yoshihiro.shimoda.uh@renesas.com
Series: arm64: renesas: Add support for R Car H3e 2G-and M3e-2G
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=517739
  Lore link: https://lore.kernel.org/r/cover.1626708063.git.geert+renesas@glider.be
    Patches: [v2,01/10] dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and boards
             [v2,02/10] soc: renesas: Identify R-Car H3e-2G and M3e-2G
             [v2,03/10] arm64: dts: renesas: Add Renesas R8A779M1 SoC support
             [v2,04/10] arm64: dts: renesas: Add Renesas R8A779M3 SoC support
             [v2,05/10] arm64: dts: renesas: Add support for Salvator-XS with R-Car H3e-2G
             [v2,06/10] arm64: dts: renesas: Add support for H3ULCB with R-Car H3e-2G
             [v2,07/10] arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car H3e-2G
             [v2,08/10] arm64: dts: renesas: Add support for Salvator-XS with R-Car M3e-2G
             [v2,09/10] arm64: dts: renesas: Add support for M3ULCB with R-Car M3e-2G
             [v2,10/10] arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car M3e-2G

Total patches: 11

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


