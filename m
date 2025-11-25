Return-Path: <linux-renesas-soc+bounces-25100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AA272C84278
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 10:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 56FDC34BF9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 09:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23E3217736;
	Tue, 25 Nov 2025 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bw0QsxGu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD222DAFBA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764061846; cv=none; b=OdPxEONMM5fXHr5Bt7R6RvwqDbkY9WI5ADj7mR4tGwmKLbcjAFaR9A5ED4fALxXYOMcw4zZamnC3mBjopekAxRkBBZSsG/acCa/Hj2na30YrZsv9CTVItMeN7DrehcINOHxr+maovUPRN+jGBTtD8LiFPzssIEFSLGkk4wv2uds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764061846; c=relaxed/simple;
	bh=YwNQ0w9V62TsFuP0SwAN/n4C2sLAWuTW7Io8v6gPeIg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=APtw2o5ld8XGHXHzNQv+M6vpuJTLABRweEbjfdkbbb4YEEXtgxq02X06e4l50aWi0NmlaEZQJhZ2Bq6qs8FGY8FI00J8Ck26pr63pxCi/0ZYuzdz4+h+MKH1UaY90MAghUBtjpfEbQBpV3C1X0dSPZ1rodSlp/kurwdBP7jABaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bw0QsxGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A327C116D0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764061846;
	bh=YwNQ0w9V62TsFuP0SwAN/n4C2sLAWuTW7Io8v6gPeIg=;
	h=Subject:From:Date:To:From;
	b=bw0QsxGuuNYAVLJ66rYYCSOmcFQKB30B8iTWnBZyYIPSI6RdvJxGlqUmyendc2+xZ
	 wyrVV70kEfoNHsgPHFu9Qc8ZPr3obP1vtfrgxbd/ri6oTwJpHk0msCH8+cBxGizVdh
	 F7VCe1cl43Az60enDL7H6aha9cAOsmZR2ni2SVW0NXVD+1JB3vdl7zMOnHfjw+w/dx
	 FUEux4sUd/pgfKxDjeCMoNLOcMu0lb1AXfFJL8lcDYN6DCtAoStaDSx3NHT9TPf5Cp
	 SpOQjWWaSiWWtiAVGmP9jBdsK4CNYmie3xsZXslJbj4XWYzlykc8X7VFmgbERsFJ5K
	 +0JoZDZ7Jx/2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F01B63A8BEFE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 09:10:09 +0000 (UTC)
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
 <176406180854.260868.12021294806175661463.git-patchwork-summary@kernel.org>
Date: Tue, 25 Nov 2025 09:10:08 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add USB3 PHY/Host nodes and enable on RZ/V2H and RZ/V2N
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1025273
  Lore link: https://lore.kernel.org/r/20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: r9a09g057: Add USB3 PHY/Host nodes
             [2/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB3.0 PHYs and xHCI controllers
             [3/4] arm64: dts: renesas: r9a09g056: Add USB3 PHY/Host nodes
             [4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB3.0 PHY and xHCI controller


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



