Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB4B3CD12A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 11:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235031AbhGSJJl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 05:09:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:34448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234913AbhGSJJj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 05:09:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 970C06108B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626688219;
        bh=n9K+ic8+/CG8P0X38Co3/prPJHg7x+SDQsopEXJd8g8=;
        h=Subject:From:Date:To:From;
        b=BXjOvm4KTnwpuA7hPGqsuNG1I5Jtuyf43T5LEZdJhd2Ry+C5fk44Y/73d2v1FIONi
         zBRJAuY+LJVtMY1b/9f0sEAWGTvP6IwK8tP10M7iDd0KlwZmPDvvS9k5D1fiQnJKoT
         8s1J2Ru3oAUQSjlWsjDSRqGB+vCFRrmBO2YE92Ryo7Z5tPRY60mhg3GddmiavnW7Tn
         J6cjf4Qyz4punSsvp0o/ynSgFP5bTAaGqCmnDLNALb4cVNTmwoQ00JKoRlG7F6xqGZ
         kjLcQrbUa82nLKmkKVrpq5e5mFBBfFQUx9KFEvFRr9Ru9k/b8qs7bgmycIns/mszdE
         mcgg9WRE4ZtHg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8371D60A4E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 09:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162668821947.10490.6870966690316268595.git-patchwork-summary@kernel.org>
Date:   Mon, 19 Jul 2021 09:50:19 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: [1/2,LOCAL] arm64: renesas: defconfig: Refresh for v5.13-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=516093
  Lore link: https://lore.kernel.org/r/71851aa820379c8f9d749fd7b1c9650af2e2e008.1626351064.git.geert+renesas@glider.be
    Patches: [1/2,LOCAL] arm64: renesas: defconfig: Refresh for v5.13-rc1
             [2/2,LOCAL] arm64: renesas: defconfig: Enable R9A07G044 SoC
Patch: [v2] dt-bindings: display: renesas,du: Make resets optional on R-Car H1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=515367
  Lore link: https://lore.kernel.org/r/98575791b154d80347d5b78132c1d53f5315ee62.1626257936.git.geert+renesas@glider.be
Patch: [v2] arm64: dts: renesas: rcar-gen3: Add SoC model to comment headers
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=515395
  Lore link: https://lore.kernel.org/r/251569665d7d4f4ed4bbab7267ce2ddccdef33e5.1626261816.git.geert+renesas@glider.be

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


