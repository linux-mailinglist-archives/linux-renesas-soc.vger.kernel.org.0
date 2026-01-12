Return-Path: <linux-renesas-soc+bounces-26627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF470D15586
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 22:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14F173012256
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 20:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96C32147E6;
	Mon, 12 Jan 2026 20:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uD7CZxKs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A6C30EF65
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 20:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768251583; cv=none; b=huA2aWIKXOdT7l5J6PUqqrbJxsGBgd4LW9qZzhGxccL5et6VyvSyF9fQiWcoxgWRmTOqrpV5pcetKenkPMx5y03SH9rhet94DoWQbfHJzD0nRdpnEH+MuhX6TNpIeYdJtrvI6E8/hBt0IH3AQDZ0CFhMGVFOYpIH1bmvMeAOdUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768251583; c=relaxed/simple;
	bh=c+beewJYtkKru829ybznXqpS5eDj4Q6MbwofBRte0Y8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=rtHloEBw9aKwsqsG5+tZR3HHjZ64SG3nBev2fRQjSS5aN469FPk4HGxup4V7tyD5sz8O7zbs+uY6/5zhZt0eRqZFcI+p/SU4sdM4C9QN9T6OJu01mSZAx9Go8qkvvQdhBaEJIP63wNQltHj6UTTuhP4tMSQ5T3+r9BD1wO5DgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uD7CZxKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE92C116D0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768251583;
	bh=c+beewJYtkKru829ybznXqpS5eDj4Q6MbwofBRte0Y8=;
	h=Subject:From:Date:To:From;
	b=uD7CZxKsOe2nTApTpnm3xezvFrs4caGW+GPRXqM9qO7MS4NjO5K9m2/3bYwreek+a
	 Sg4BdW004G+OQvKN+Ifx6wP55WM4HjvBwSzCV6/ltYQUbiWpW6z6CemzuDpv5lcM6o
	 r/cfRWA1L2sSilgZ29VEpUOW/3xHAdpkMPFZJ911Qgl62cUEJI2ZS01/wPdn1ocY/u
	 iasZIIdCTOTvpof5SythBqExYOBlnL+MGG+eESnee/h+ruqdPB8qjwwLyNODmTD4Jl
	 a2LyfUPQj1ebimthf5bwac+ElU72DyEQsMD75PXDHocJbsbAHdpLLqEfYobJlyTF9x
	 3I/frW6IR6oTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 404FB380CFD5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 20:56:18 +0000 (UTC)
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
 <176825137674.1092878.11214420516596400361.git-patchwork-summary@kernel.org>
Date: Mon, 12 Jan 2026 20:56:16 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [1/2] arm64: dts: renesas: Use hyphen in node names
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1036093
  Lore link: https://lore.kernel.org/r/20251223152358.152533-3-krzysztof.kozlowski@oss.qualcomm.com
    Patches: [1/2] arm64: dts: renesas: Use hyphen in node names
             [2/2] arm64: dts: renesas: Use lowercase hex

Patch: arm/arm64: dts: renesas: Drop unused .dtsi
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1032732
  Lore link: https://lore.kernel.org/r/20251212203226.458694-1-robh@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



