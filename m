Return-Path: <linux-renesas-soc+bounces-23893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E154C1DFEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 02:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B64511886637
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 01:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263FD23EAAA;
	Thu, 30 Oct 2025 01:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkLYAEx8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E6167272;
	Thu, 30 Oct 2025 01:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761786630; cv=none; b=LByfjyVqdpaoVNwf39k8+uwITQXL4+Mj/FZdTfQItcOu/+HZLd4JboBJnxhPTRknsqkYhXZNTUFCzs924E+cELTxx3hTDUsoWdT5Hv1hgZ81rUQARCMDu31vFOiW8t1AY8VrbEnBp0gWH9LVYPWTaHz9bZhOBx06ImCMJBhlJcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761786630; c=relaxed/simple;
	bh=bhyYle5OnQlLM7vWdXD+m/nM5n0USIuUMEVTwEtnhVo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X2iJqusw9BY0nA/In+T9DQnc0HwQfV8k5xQVhK9PGALCk/lItJTTFgA0dZZ5Jz5LJxHYijPEWDvj44IzFnW0ZVQFV8z0AS+4Eg+jdPUfHvh7Cc3Wjre/EWqf1BI2CN/C0PUGXWrslnqZbKMvSr8+4jCyHsrclkkQ7w6p9zJfnbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkLYAEx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BDAC4CEF7;
	Thu, 30 Oct 2025 01:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761786629;
	bh=bhyYle5OnQlLM7vWdXD+m/nM5n0USIuUMEVTwEtnhVo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RkLYAEx8byv79th2y5WYRIVVJGDQBN4EIwdX/tKwYbRRvJoGT6LeIVac7Re7/0yGh
	 3GZnsIimGh7OW83rofeEBNhZwzHv6YhUbFNZ2IJC1J3roCkxrIVvUnJhmP4Rxw5HO3
	 YOS0yBB5H3JcD63S+Jvf/MQVPF1tID8PQZ7xfIMet4a6V+BmYVjemeCVjSLF1M905+
	 8Xg8W9x6nwDiE67ik95LHLKFBsr8xHNnE73yovUbCoFfO09axajPhh5bOvJw+nJef9
	 x/do0CsGnzibLS+NSVxyhtHYJ48zyfj50u7QUbaWsiCsw3r3Niv6eX/w7RqVC+I8JI
	 4LAxmh8lnn1XA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1783A55EC7;
	Thu, 30 Oct 2025 01:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net,PATCH v2] net: phy: dp83869: fix STRAP_OPMODE bitmask
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176178660651.3271894.12130005044811502264.git-patchwork-notify@kernel.org>
Date: Thu, 30 Oct 2025 01:10:06 +0000
References: <20251027140320.8996-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027140320.8996-1-marek.vasut+renesas@mailbox.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: netdev@vger.kernel.org, thanh.quan.xn@renesas.com, andrew@lunn.ch,
 hai.pham.ud@renesas.com, davem@davemloft.net, dmurphy@ti.com,
 edumazet@google.com, hkallweit1@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 27 Oct 2025 15:02:43 +0100 you wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> According to the TI DP83869HM datasheet Revision D (June 2025), section
> 7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
> Fix this.
> 
> In case the PHY is auto-detected via PHY ID registers, or not described
> in DT, or, in case the PHY is described in DT but the optional DT property
> "ti,op-mode" is not present, then the driver reads out the PHY functional
> mode (RGMII, SGMII, ...) from hardware straps.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: phy: dp83869: fix STRAP_OPMODE bitmask
    https://git.kernel.org/netdev/net/c/298574936a6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



