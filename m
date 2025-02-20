Return-Path: <linux-renesas-soc+bounces-13439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 466B5A3E1D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 18:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E62F3A3216
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 17:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BDD1C5F26;
	Thu, 20 Feb 2025 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYqrbmM9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB71DF754
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Feb 2025 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070811; cv=none; b=VZPqA2tTVdckbct3gF+XoT9yXhg2vbf+9g4mKeqGnf/8uEfy0pEHe4IKZ9LoAXR41TYPOMqJV+ksHmBjPn+02HJLwIKdc8NSMJY5Fyz1YeAvfyBOQlNTcVzMqVQgaSlwSTc8jefd4GKuppvmqY0+pVmj0nlSeAmkEhNDNT3Sdos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070811; c=relaxed/simple;
	bh=ycSP6wMygE066QtZ/KqT6xHGAYcAIvUNkMh9uTng2DM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=SiL5+Y+ngY0LiYQMj/LUIXNm9YzS+6AwhhUDCVUkv2GEzV1OQkl9BqBvf3p4VT4o1CpYfSCs8MFR8sBSJtJEilARJR0bghvwrSv4ImqVxtggRPWGp0whHkTTVHwccD95UiJnaUNm6Ld5mQGBiuO1YuGl7rCpFDAhi2zcr0pkEsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYqrbmM9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C2CC4CEDD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Feb 2025 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740070809;
	bh=ycSP6wMygE066QtZ/KqT6xHGAYcAIvUNkMh9uTng2DM=;
	h=Subject:From:Date:To:From;
	b=DYqrbmM9ocEZLNtWg2DeQ64dCC/mgnadSskpepAXm8r04B2IXsYp5+YfhpdLNsu6U
	 KkYXXZNaGkeRPRmldhA0UH5rwyxkYqJ/u8KTNW3CNLcRSDf8BQEdhwI2OHAljHAtTb
	 hxRZ6DUENS5aSUt8XJS2FYCJqbvaE6yBjYMHqizV4du5FAP+gNl6dXjoiK01hvEo1s
	 shAFBwfaxSLqWIDcmeyN4Fnd2eeb5W6jkHhpJLF5HbLYzaJJTIUVUlLNwXgsklQyon
	 i+HWym3WlEC38jZy24C7uWEBVzDrZO8UB3uc6tKB3l4vdW73VDbzVIsGvZVbVf/fSb
	 BJBeDB+UaQZ6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C0C5380CEE2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Feb 2025 17:00:41 +0000 (UTC)
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
 <174007083980.1390304.16497505244257608144.git-patchwork-summary@kernel.org>
Date: Thu, 20 Feb 2025 17:00:39 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ARM: dts: renesas: r9a06g032: UART dtbs_check fixes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=933957
  Lore link: https://lore.kernel.org/r/cover.1739525488.git.geert+renesas@glider.be
    Patches: [1/2] ARM: dts: renesas: r9a06g032: Fix UART dma channel order


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



