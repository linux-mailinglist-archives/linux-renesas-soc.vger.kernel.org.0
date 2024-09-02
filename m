Return-Path: <linux-renesas-soc+bounces-8603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB79684B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 12:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F48C1F211DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 10:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526B813C810;
	Mon,  2 Sep 2024 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9kZ5tV3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECA813C69E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273060; cv=none; b=HFbzbVy32mMG0svAmnh0RwOfPEGxKV7M8ptXHqW+o7DT6hkEV76yy9vdVeptuRII0LlmT9D4t3Wn9PFDfsX16vQp15gKwWP7uwZN2lMhtvPDOhW+t5gL+Awen6fsULUncKnOeyw9YGBrhiMwzZo6k8cB2BNTGO3iy3cabTW3Kf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273060; c=relaxed/simple;
	bh=+rajunp7uI5jLlRcmNrJjxFTRmqTwEWpGD75mwdHfcI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=JSBkDmjN/5f2ERs2zScE8s+niYmzPjkiwbnCt6IbkEfpjvuqrd7wMqet+vlz6Hptm5LN86djvVNm9oJSHz2WPckFknlnSj/iStevrvCokakyV9ThIZfJRIQJHv1hlyYwYgP29KyZiXqttZPXrojl5kUJ4E1Rupsb75kUp7iM8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9kZ5tV3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4CFC4CEC2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725273059;
	bh=+rajunp7uI5jLlRcmNrJjxFTRmqTwEWpGD75mwdHfcI=;
	h=Subject:From:Date:To:From;
	b=i9kZ5tV3As0/LuQOfMBS3WFzgK8e/PY5O+99AEYCMfP6we0JSUSlgkvMPtNkz/fP8
	 ejOJ1IIFEIEFGYpGy0vLvpt4xoaiO9cL/aKu7b8AjFPCwAh5NxBl+GHRPJrPY8riIX
	 MYuCVacZ9jXtDclqxGlytCrH8WYLm7EY0FNd8kz8xHfiHQpU1U5CUvy0y1qd3qF5ca
	 XAlM7yfNEFtfiBLDShGRdooyL/V72ot3y3o8FGQgy8qw/dhJWXrm78X/rROYizRFVu
	 QlelIN9klB7sxTIZTIdoT2GlQtVYORdFMro44qniAznXcnwHDqHeF499zbncrL1hkV
	 Y9YvAmmC5ch0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 754EA3822D69
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 10:31:01 +0000 (UTC)
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
 <172527306007.3841035.10865712041614524272.git-patchwork-summary@kernel.org>
Date: Mon, 02 Sep 2024 10:31:00 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for Renesas RZ/V2H(P) SoC and RZV2H-EVK platform
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=884284
  Lore link: https://lore.kernel.org/r/20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v4,1/9] dt-bindings: soc: renesas: Document RZ/V2H EVK board
             [v4,2/9] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H(P) SoC
             [v4,3/9] arm64: dts: renesas: Add initial DTS for RZ/V2H EVK board
             [v4,4/9] arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
             [v4,5/9] arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
             [v4,6/9] arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
             [v4,7/9] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
             [v4,8/9] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable OSTM, I2C, and SDHI
             [v4,9/9] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable watchdog


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



