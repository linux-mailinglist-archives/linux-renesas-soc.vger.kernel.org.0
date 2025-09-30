Return-Path: <linux-renesas-soc+bounces-22481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFDCBAC8FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D6C91C81BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B566E2222CA;
	Tue, 30 Sep 2025 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/kk0uL7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA312222C0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759229430; cv=none; b=pF0bqh8a2DkfG2r7qYA52aZKKf9R7AfjjSlENSITXWlhFi/uUTgnIL6GREz7sV/XqcT1WILXBbYBNIKdSrtO9MhTVZHw6ke7rV+xOcoY4ynRULjrr7IT2TEM/WpDU+bFmiDM29cH55z+T9GGl4mbiB7D3+JN6vU4zpm+kWY8q88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759229430; c=relaxed/simple;
	bh=yQgDTg6yVMsGstcrzzF0NHGgE6BATLRAyUZMr8LK71Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=gELFAwBHMPuetgzyTzlKdE/E1wJjAWJ025a7GU4UQuANjPc6IAnFNg/nvMbu6Tdd39PlQz5m/PTEa5NZs/dK16xw26+C++XfuVvUsggP3GfoaE6De3SBquG2bD+crWD/IxgHWg/6J88FGIyL0ruMyr7xY/V9FEjndtLmnwFnDrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/kk0uL7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2598BC4CEF0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759229430;
	bh=yQgDTg6yVMsGstcrzzF0NHGgE6BATLRAyUZMr8LK71Y=;
	h=Subject:From:Date:To:From;
	b=s/kk0uL76Z9zsT2p6+q+pSsqlmnJRLTg0Lqw670dwq0Mr+CXJxKi3vw7H5Z9Be9Hk
	 aXAMBhRh+phOcM6gpWNWViNt9pw8HLtIEgQYOB3oPx5++5BhzuFu9AFH07VN4xHQdc
	 E6xVIxcAO/Lzul6p2oMYaCaQZisghIYXvT0pPKQKZuWl2ZXpQcxJlG5UK+HwVamuIc
	 KnrlCNB2X8TNrEQT3bjOtAGsau6fZS1898JFIhSE85kyAOiUlaSskO68CQVhQvXWCh
	 /CWTzxy1LYmfNfSpxFZ57vVtWk0E309h+chzBWo3cc1QnKojQy57vUO70oAK7bM+HT
	 idtqZwsB0Rd5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7481D39D0C1A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <175922942311.1938567.5422935221288993557.git-patchwork-summary@kernel.org>
Date: Tue, 30 Sep 2025 10:50:23 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: move interrupt-parent to top node
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1005490
  Lore link: https://lore.kernel.org/r/87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com
    Patches: [01/26] arm64: dts: renesas: r8a774a1: move interrupt-parent to top node
             [02/26] arm64: dts: renesas: r8a774b1: move interrupt-parent to top node
             [03/26] arm64: dts: renesas: r8a774c0: move interrupt-parent to top node
             [04/26] arm64: dts: renesas: r8a774e1: move interrupt-parent to top node
             [05/26] arm64: dts: renesas: r8a77951: move interrupt-parent to top node
             [06/26] arm64: dts: renesas: r8a77960: move interrupt-parent to top node
             [07/26] arm64: dts: renesas: r8a77961: move interrupt-parent to top node
             [08/26] arm64: dts: renesas: r8a77965: move interrupt-parent to top node
             [09/26] arm64: dts: renesas: r8a77970: move interrupt-parent to top node
             [10/26] arm64: dts: renesas: r8a77980: move interrupt-parent to top node
             [11/26] arm64: dts: renesas: r8a77990: move interrupt-parent to top node
             [12/26] arm64: dts: renesas: r8a77995: move interrupt-parent to top node
             [13/26] arm64: dts: renesas: r8a779a0: move interrupt-parent to top node
             [14/26] arm64: dts: renesas: r8a779f0: move interrupt-parent to top node
             [15/26] arm64: dts: renesas: r8a779g0: move interrupt-parent to top node
             [16/26] arm64: dts: renesas: r8a779h0: move interrupt-parent to top node
             [17/26] arm64: dts: renesas: r9a07g043u: move interrupt-parent to top node
             [18/26] arm64: dts: renesas: r9a07g044: move interrupt-parent to top node
             [19/26] arm64: dts: renesas: r9a07g054: move interrupt-parent to top node
             [20/26] arm64: dts: renesas: r9a08g045: move interrupt-parent to top node
             [21/26] arm64: dts: renesas: r9a09g011: move interrupt-parent to top node
             [22/26] arm64: dts: renesas: r9a09g047: move interrupt-parent to top node
             [23/26] arm64: dts: renesas: r9a09g056: move interrupt-parent to top node
             [24/26] arm64: dts: renesas: r9a09g057: move interrupt-parent to top node
             [25/26] arm64: dts: renesas: r9a09g077: move interrupt-parent to top node
             [26/26] arm64: dts: renesas: r9a09g087: move interrupt-parent to top node

Series: arm64: dts: renesas: add SWDT
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1004463
  Lore link: https://lore.kernel.org/r/20250920064428.5544-8-wsa+renesas@sang-engineering.com
    Patches: [RFC,1/6] arm64: dts: renesas: r8a77951: add SWDT node
             [RFC,2/6] arm64: dts: renesas: r8a77960: add SWDT node
             [RFC,3/6] arm64: dts: renesas: r8a77961: add SWDT node
             [RFC,4/6] arm64: dts: renesas: r8a77965: add SWDT node
             [RFC,5/6] arm64: dts: renesas: salvator-common: mark SWDT as reserved
             [RFC,6/6] arm64: dts: renesas: ulcb: mark SWDT as reserved

Series: arm64: dts: renesas: gen3: handle SWDT
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1006095
  Lore link: https://lore.kernel.org/r/20250925093941.8800-14-wsa+renesas@sang-engineering.com
    Patches: [01/12] arm64: dts: renesas: r8a77951: add SWDT node
             [02/12] arm64: dts: renesas: r8a77960: add SWDT node
             [03/12] arm64: dts: renesas: r8a77961: add SWDT node
             [04/12] arm64: dts: renesas: r8a77965: add SWDT node
             [05/12] arm64: dts: renesas: r8a77970: add SWDT node
             [06/12] arm64: dts: renesas: r8a77990: add SWDT node
             [07/12] arm64: dts: renesas: r8a77995: add SWDT node
             [08/12] arm64: dts: renesas: salvator-common: mark SWDT as reserved
             [09/12] arm64: dts: renesas: ulcb: mark SWDT as reserved
             [10/12] arm64: dts: renesas: draak: mark SWDT as reserved
             [11/12] arm64: dts: renesas: ebisu: mark SWDT as reserved
             [12/12] arm64: dts: renesas: eagle/v3msk: mark SWDT as reserved

Series: thermal: renesas: Add support for RZ/G3E
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1003471
  Lore link: https://lore.kernel.org/r/20250917170202.197929-1-john.madieu.xa@bp.renesas.com
    Patches: [v9,1/4] dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
             [v9,3/4] arm64: dts: renesas: r9a09g047: Add TSU node
             [v9,4/4] arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

Series: thermal: renesas: Add support for RZ/G3S
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=989697
  Lore link: https://lore.kernel.org/r/20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v4,1/4] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
             [v4,4/4] arm64: defconfig: Enable RZ/G3S thermal

Patch: ARM: dts: renesas: gose: remove superfluous port property
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1007034
  Lore link: https://lore.kernel.org/r/20250929093616.17679-2-wsa+renesas@sang-engineering.com


Total patches: 50

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



