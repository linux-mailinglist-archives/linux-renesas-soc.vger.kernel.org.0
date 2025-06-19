Return-Path: <linux-renesas-soc+bounces-18553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC9AE0D23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 20:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BD427A3A7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 18:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F267E257D;
	Thu, 19 Jun 2025 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeQ1cntv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90730E851
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750358987; cv=none; b=h0UTKCfFPJltlk15PAaGeqdrwWGmAwiODupOXT4yy7DY5y3u29LmQO/dRHoZWqZrSBsChtVCCWJz4j8iQRmSseLzkXtgsLzLoKmhdWLtJiiVkhoGJsSLgcsYArnQo9kkEsTyq2TwtCxI6Q7wF/UIsNljI5jZZqMJmTi9scT2zTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750358987; c=relaxed/simple;
	bh=MzsOTUqgfdyoHiiCBUV7wo4ZrYWKSW+O0ct3RXbIrfU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=LKkC2N/i06SiZkMoYjIaFOiiRM/YUd514xZIw9hhL0s+9+AMpZIiwaqufhvdVKn4zS8dovg4bGvQqgBvJzzjbrVPXjkZpPc1MRydpwyAnHPaYmjfBWJYwQa2h13WvSyiFjqwIXWUKQftsPZL6F6rVgEviepF34zoZWC1g9QqXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeQ1cntv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5791FC4CEEA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750358987;
	bh=MzsOTUqgfdyoHiiCBUV7wo4ZrYWKSW+O0ct3RXbIrfU=;
	h=Subject:From:Date:To:From;
	b=HeQ1cntvLHfsMAxkePptCXSGwRoVwbWQkN0utm3mx0EOnrQ5OXUY//X33fCw3zZsv
	 HMwR6sLcFuvj4HZqB7cxAdXRWpViMc1+77D8rOHEVb/E/QknRN4QFld77ckXjmoOna
	 El1aEg0joo8OgWUprxhGfdLiFgkVd8vZHycLj1eHUEjpTsB9IGG9wUbKYI7o8Y1D//
	 gQ4jcUNUtpTBkQE6ULUkrp2/LV8T0/BVE72QVosdD+eyC5ZCn7fNKOBFzkuaOFlrvs
	 GgpWnrFX6wWtJYaPNmfmO9NQrLTjtNJg1SGN669SgnSsN8WjvqxXTgS3CAfx6WPu68
	 9wvfMElvKtVEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7445638111DD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 18:50:16 +0000 (UTC)
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
 <175035901495.956151.11170736893842291081.git-patchwork-summary@kernel.org>
Date: Thu, 19 Jun 2025 18:50:14 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [v3,1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl driver for PCI slots
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=969499
  Lore link: https://lore.kernel.org/r/20250607194541.79176-1-marek.vasut+renesas@mailbox.org
    Patches: [v3,1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl driver for PCI slots
             [v3,2/3] arm64: dts: renesas: r8a779g0: Describe root port on R-Car V4H
             [v3,3/3] arm64: dts: renesas: r8a779g3: Describe split PCIe clock on V4H Sparrow Hawk

Patch: [LOCAL] arm64: renesas: defconfig: Refresh for v6.16-rc2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972480
  Lore link: https://lore.kernel.org/r/00ef7f91186caa5dac755cfa1d682c75b107d3bc.1750074453.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: ebisu: Add CAN0 support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=968651
  Lore link: https://lore.kernel.org/r/612b999870dd64789041e4b0e9c568389b3fb95e.1749048320.git.geert+renesas@glider.be

Patch: [LOCAL] riscv: rzfive: defconfig: Refresh for v6.16-rc2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972481
  Lore link: https://lore.kernel.org/r/09a124b503cb00fb45be844bc34d8ca29d78bc22.1750074549.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Refresh for v6.16-rc2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972478
  Lore link: https://lore.kernel.org/r/f04a2b0e2c9128b4fa644850270b55493358be39.1750074375.git.geert+renesas@glider.be


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



