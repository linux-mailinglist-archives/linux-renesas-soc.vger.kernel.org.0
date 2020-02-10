Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB697157D15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 15:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgBJOKt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 09:10:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:48292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727581AbgBJOKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 09:10:49 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581343848;
        bh=Xi1KHGX99XbaKly9pIrSSmTnANVKxziyXdVO9MzxZ7k=;
        h=Subject:From:Date:References:To:From;
        b=R9VOLR1njwDCWdhLXjauqF2ZoxdfWrkuPenFCHlx/JPtqMRaYBJCiOWMQmtU/HUK6
         HfsRthwTYxdffMrC++rE4fX/PI3+NEDGD548db4+PUI258vUtCdb1t283LjDMhQqeg
         ZT0pgfRyLu0MS4Y1Zi34bo4V12Z5jNRpChLnWkmQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158134384863.7164.13470021525466711027.git-patchwork-summary@kernel.org>
Date:   Mon, 10 Feb 2020 14:10:48 +0000
References: <20200124133330.16121-1-geert+renesas@glider.be>,
 <20190912103734.1879-1-kieran.bingham+renesas@ideasonboard.com>,
 <20191231141642.31609-1-geert+renesas@glider.be>,
 <20200210123153.8257-1-chris.brandt@renesas.com>,
 <20200115051225.7346-1-marek.vasut@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: dts: renesas: rcar-gen3: Add CCREE nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=232961

Patch: arm: dts: renesas: r8a77980: Remove r8a77970 DU compatible
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=173315

Patch: ARM: dts: renesas: Group tuples in operating-points properties
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=222603

Patch: [v2] ARM: dts: r7s72100: Add SPIBSC clocks
  Submitter: Chris Brandt <chris.brandt@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=239115

Patch: [V2] ARM: dts: renesas: Add missing ethernet PHY reset GPIO on Gen2 reference boards
  Submitter: Marek Vasut <marek.vasut@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=228335

Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
