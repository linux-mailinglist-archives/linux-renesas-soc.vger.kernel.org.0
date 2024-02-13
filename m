Return-Path: <linux-renesas-soc+bounces-2698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D338536B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 18:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE17284B08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 17:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC4F58124;
	Tue, 13 Feb 2024 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLVrkRSH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFC85788C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707843630; cv=none; b=bjwVrkwMIn4OzfZuES+k0i5RZzK3BsQnsgP5gsEiW0vllnM0qw55yHcwYTAb6BXLIw4DWx9Kuj38lgMW7nK6/Xx22g77ilR1CRwJTOJXFAewGpb/naZEjzJD2oC/nXWINnCm3YjaR/d2N0FtQZ8S/RPjM/0YK2ZQTiThRtP8Z1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707843630; c=relaxed/simple;
	bh=E9lUWd+Wh6yrBIhaW0CRacr9BWP1i1bSP9JkwvYf1yk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=rjccC+bD3CMcYMNctyPdg+UJw59vgrqNS7n/vhH2u493jIDt7Rs/nFoimbQYfS5TD+xrhl5Qyt/tFWPe5e+2n8PhFBtxsCzXuvgkK2hHe/OWgBE5xoh8pcei7/UiSwH/+1yMCoSSi96QNPYuBUxeSKBOzd5hTQD49tDS7E02btI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLVrkRSH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6067EC433F1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707843630;
	bh=E9lUWd+Wh6yrBIhaW0CRacr9BWP1i1bSP9JkwvYf1yk=;
	h=Subject:From:Date:To:From;
	b=XLVrkRSHbRWO8CIKm1bERL7BWHpcFyieKnbrlhYmVb3QbpZ+WL5T9sIc/p1I3NkYe
	 fQoRgaVZASrW01EbT6Gpdjkq1a/WHIxOJTTf/w6CdwPRu5A17k8qzuR8QISaTkKY/e
	 HIsW6LoEurUVv/syzLw7KOLIDaj550ywSKJsthR8xLLDhyvMYZfnFDRYxOeG0d3X7F
	 0re96Nj3xUh7r1zAKvCcvKXXHmCgGE3oaRhu/sg2BJPrhESMmrv22+SrpuV2kTT5nR
	 qyoB7/xDdVbab4XsxbJRq5P4SRDE0vy6JlK9I0qOE0dH2ZJNTJ20jE46aqU133cd9o
	 mO50rq6M29FRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3BCADD84BCF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 17:00:30 +0000 (UTC)
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
 <170784363016.12409.11615684173282184420.git-patchwork-summary@kernel.org>
Date: Tue, 13 Feb 2024 17:00:30 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: pinctrl: renesas: rzg2l: Add suspend to RAM support
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=824331
  Lore link: https://lore.kernel.org/r/20240208135629.2840932-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [1/2] pinctrl: renesas: rzg2l: Add suspend/resume support
             [2/2] arm64: dts: renesas: r9a08g045: add PSCI support

Series: arm64: dts: renesas: r8a779h0: Add full CA76 CPU core support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=822145
  Lore link: https://lore.kernel.org/r/cover.1706796979.git.geert+renesas@glider.be
    Patches: [1/5] arm64: dts: renesas: r8a779h0: Add L3 cache controller
             [2/5] arm64: dts: renesas: r8a779h0: Add secondary CA76 CPU cores
             [3/5] arm64: dts: renesas: r8a779h0: Add CPUIdle support
             [4/5] arm64: dts: renesas: r8a779h0: Add CPU core clocks
             [5/5] arm64: dts: renesas: r8a779h0: Add CA76 operating points

Patch: arm64: dts: renesas: ulcb-kf: add regulators for PCIe ch1
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=820909
  Lore link: https://lore.kernel.org/r/20240129135840.28988-1-wsa+renesas@sang-engineering.com

Series: arm64: dts: renesas: ulcb-kf: adapt regulators to schematics
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=821074
  Lore link: https://lore.kernel.org/r/20240129212350.33370-1-wsa+renesas@sang-engineering.com
    Patches: [RFC,1/2] arm64: dts: renesas: ulcb-kf: adapt 1.8V HDMI regulator to schematics
             [RFC,2/2] arm64: dts: renesas: ulcb-kf: adapt sound 5v regulator to schematics

Patch: dt-bindings: soc: renesas: Preserve the order of SoCs based on their part numbers
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=824297
  Lore link: https://lore.kernel.org/r/20240208120455.48009-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



