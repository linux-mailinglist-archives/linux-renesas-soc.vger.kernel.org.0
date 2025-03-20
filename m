Return-Path: <linux-renesas-soc+bounces-14649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716AA6A10E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 09:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A99BC461123
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 08:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B584A205E3E;
	Thu, 20 Mar 2025 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deEnrTxt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEE01EBFFF;
	Thu, 20 Mar 2025 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458800; cv=none; b=aeYbZr7krI1pxJ2VROSUVzs9ilqwjlxEs4PxTNu1nvMhTyP0oaL9N3pc+dCewEQtkuoGIqod9qHpGVYf5sEJQ2WysNsr9kOb5rxhD84OCHsN4DGgXPHeNYwV5u0qhU9foSAe2rfgEKvhHmie5kfjZOIm7/ntAWthoCYHwYeVksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458800; c=relaxed/simple;
	bh=L9bS85dMXhR005G+CyHV4zLNHJwm5OXSjWXaoXSNV6c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OROhDizIrft4m2PkLfa6JCLxTTvdpNUYDis7QWCDiqm0Vewkf99m6amYo/UQgvbrD9ymO/5ZytmXu2hh74pxf8aYXn38E8LvIMxorzNoJZ0UVfpeTOXdL3aPiNoZdgc0HVY6DN1oD4ARnPUtOroHsxBwojhQXVSXDVLjZDV02EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deEnrTxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95F0C4CEDD;
	Thu, 20 Mar 2025 08:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742458800;
	bh=L9bS85dMXhR005G+CyHV4zLNHJwm5OXSjWXaoXSNV6c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=deEnrTxt+byCfMrdbqUE3JJUt/DoAyx8nGVpM+2GxsKOpIFpuiIkhS3K4LH1PVZBV
	 XARlk6KdZNLR4FRgi82bKIvWY18ex3mpS7/Bgzzm4I/izn3ApdOZBpnyL5dJo+lEf6
	 xhl+4B6ZyVk5tvUx8vuM3tWn+j3Emvv49ZJc+R4R11Nw8JRK8l67ITd3fnnMUPA5Qn
	 vtH3XfzNnmegi/0atWYQd2RWysd7z8rIXvvzIX8HpcI47cKHs5vVL+823yVLAu29cy
	 CXi/nZ4LYw/K6PrHJxyeCpKMALg+QM9Jw8fLtRX87xbtB8/5JjIKX2u0VeyLa+WKws
	 hZpRyS62mDWfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4863806654;
	Thu, 20 Mar 2025 08:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/5] net: ptp: fix egregious supported flag checks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174245883577.1343567.2281095132838177451.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 08:20:35 +0000
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
In-Reply-To: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 kernel.hbk@gmail.com, paul.barker.ct@bp.renesas.com,
 niklas.soderlund@ragnatech.se, bryan.whitehead@microchip.com,
 UNGLinuxDriver@microchip.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, jonathan.lemon@gmail.com, l@ssejohnsen.me,
 vadim.fedorenko@linux.dev, michal.swiatkowski@linux.intel.com,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 12 Mar 2025 15:15:49 -0700 you wrote:
> In preparation for adding .supported_extts_flags and
> .supported_perout_flags to the ptp_clock_info structure, fix a couple of
> places where drivers get existing flag gets grossly incorrect.
> 
> The igb driver claims 82580 supports strictly validating PTP_RISING_EDGE
> and PTP_FALLING_EDGE, but doesn't actually check the flags. Fix the driver
> to require that the request match both edges, as this is implied by the
> datasheet description.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] igb: reject invalid external timestamp requests for 82580-based HW
    https://git.kernel.org/netdev/net-next/c/5eada2aabf13
  - [net,v2,2/5] renesas: reject PTP_STRICT_FLAGS as unsupported
    https://git.kernel.org/netdev/net-next/c/51d58c0c7921
  - [net,v2,3/5] net: lan743x: reject unsupported external timestamp requests
    https://git.kernel.org/netdev/net-next/c/c0b4ddd30871
  - [net,v2,4/5] broadcom: fix supported flag check in periodic output function
    https://git.kernel.org/netdev/net-next/c/af2b428f7992
  - [net,v2,5/5] ptp: ocp: reject unsupported periodic output flags
    https://git.kernel.org/netdev/net-next/c/8dcfc910a81d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



