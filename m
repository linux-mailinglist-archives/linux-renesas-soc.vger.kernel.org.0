Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0077F4A44B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Jan 2022 12:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350668AbiAaLcN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jan 2022 06:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379414AbiAaLaR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 06:30:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0862C0617B9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 03:20:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8D68760ED0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 11:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01E77C340E8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643628035;
        bh=rYP9TuuqAssxqRNUXo+chr9OuCsUjsyC/9ZZ84SDt+g=;
        h=Subject:From:Date:To:From;
        b=g9N0Tv2OvVsY06inbnXq1XnTbBEzchvh2yi+sO9e4n7lJjGX8+LiS7WyYKfnVQWA0
         eG0J6u+HzfomeZxUcSi3/qSYA4BVtmmp0KrxETAV0LgduhQy0STfYfjFzJ5Zf9VW9W
         egYV70Et0MgWrXP1q49IzA/oqN3bX8q4wrEVSRA9wMzMjcFooubHjcG67Xvt3DEs2l
         iMplCum1amsvDdKN847ow1S4M9VTpEbh6YPjkYEpx3gIHCQ1muZN0TjqZB94wmoBI0
         jmEyy4kGL+QVF3lCcZBQmf8ch4UecCM6mTjDeIz6puN46eIPZfXlX4LTeTL3qHq6sz
         tX4GN7Mz2CTtg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DCC27E5D098
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 11:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164362803483.29436.6797499307506123560.git-patchwork-summary@kernel.org>
Date:   Mon, 31 Jan 2022 11:20:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: r8a779a0: Add INTC-EX support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Marc Zyngier <maz@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=505865
  Lore link: https://lore.kernel.org/r/cover.1624460378.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: irqchip: renesas-irqc: Add R-Car V3U support

Patch: [v2] dt-bindings: irqchip: renesas-irqc: Add R-Car V3U support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Marc Zyngier <maz@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=608641
  Lore link: https://lore.kernel.org/r/85b246cc0792663c72c1bb12a8576bd23d2299d3.1643200256.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


