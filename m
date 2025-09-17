Return-Path: <linux-renesas-soc+bounces-21989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745DB82259
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 00:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3379D620BB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 22:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937FE30F93A;
	Wed, 17 Sep 2025 22:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRIC5E+W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680DC30F92C;
	Wed, 17 Sep 2025 22:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758147626; cv=none; b=PPJ0OtVOONvqIj+4fRiMnw2FTzPhQQPgEQ59YPcDX/iD7W4RND+TDfxbciowkfn24wBF2wJwLJJs2FGCZdG3gM4EfHIrz7Uu3uQ8VfO+s0R7JaOMwiVK1z/3zXHVzi63DDI1C9AtRs3068qIJ+rha/hRG/m+NWt0NOymVlADwe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758147626; c=relaxed/simple;
	bh=vFFGJiMFCDxsnqXYrf83viYFTXNZ4fZQAJmYQsJZIpk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=stryXgvXzMCpYeVCQHlo9pPAji7IiDPEJ22oWc6CXk8RgM+7IWvTWhmFoShjBRQbHDqVIBZBdDYGmjSzwoi4l4A95gOR0VAAC0uDpZdTL67ALfgXeRv0xdKdiYkPfZMenK7ELk1JSrp1j4qEImdvYD+SCPTkM3qb5P2WtDAmlMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRIC5E+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E17C4CEE7;
	Wed, 17 Sep 2025 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758147626;
	bh=vFFGJiMFCDxsnqXYrf83viYFTXNZ4fZQAJmYQsJZIpk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GRIC5E+WHHkSoae1unctFYI0d7NNuf8nEoIrbIK05aW3y0P+bTYroix9cgOhgHV7o
	 PDF7RgluuleyDGrvn/63ckQTAIL6ERy1HaMBYYQWzvMEPeQ7lv6DyO3PNy8sIGKgHH
	 0IBEUg27+M1ZZGPrgIZJNkQyub10TLwi8q59cbRTFw35MAwNeipAenM3U7WD9Wwnsw
	 JtJCvrmzkPi2uIIgRkceO9cAxAwky3nAlzMBlGzlwS9AJm59z0r8ig0Ife3CbgSqrw
	 lPTM8dqw5ixhhymDP4Z16lBCwWruRgFyWOj0kst4e9i2hJSrmlxKtdZI06VD7CyGyK
	 aRrjNn2e8E+MQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD9D39D0C3D;
	Wed, 17 Sep 2025 22:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: pcs: Kconfig: Fix unmet dependency warning
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175814762624.2168096.4750691508233260895.git-patchwork-notify@kernel.org>
Date: Wed, 17 Sep 2025 22:20:26 +0000
References: <20250916162335.3339558-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: 
 <20250916162335.3339558-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lkft@linaro.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Sep 2025 17:23:35 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Fix the Kconfig dependencies for PCS_RZN1_MIIC to avoid the unmet direct
> dependency warning when enabling DWMAC_RENESAS_GBETH. The PCS driver is
> used on multiple Renesas SoCs including RZ/N1, RZ/N2H and RZ/T2H, but the
> existing condition only allowed ARCH_RZN1, ARCH_R9A09G077, or
> ARCH_R9A09G087. This conflicted with the GBETH/GMAC driver which selects
> PCS_RZN1_MIIC under ARCH_RENESAS.
> 
> [...]

Here is the summary with links:
  - [net-next] net: pcs: Kconfig: Fix unmet dependency warning
    https://git.kernel.org/netdev/net-next/c/dfc85640796b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



