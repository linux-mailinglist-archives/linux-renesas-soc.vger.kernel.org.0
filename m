Return-Path: <linux-renesas-soc+bounces-12403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD3FA1A75E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A99B17A1D10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90357212B29;
	Thu, 23 Jan 2025 15:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo0z7LUl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C8F4F1;
	Thu, 23 Jan 2025 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647773; cv=none; b=DU4qiXk4bqnVDg3q3FWvTIjR+CVEBsLvCo7pHSoVdVDwKCIr6X5QjRC+Rj2oVc9G8sWRsm6tiZJ3g5m72lNaO/2SEzTKxJn+D3+3QBh6h+VHZe5+TmTmfuinH3xalfripQMVFourwhycppfQZuYRULojtTagz0KiMAcSuh1ZQF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647773; c=relaxed/simple;
	bh=t4YeYUGxMCanEIPJ6O5BIH3fkHa29QWztda2pwtTDnU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JNpS4B3E/nom8jpocW8yi348oueki5slvfftHcfWj2ZA/Z+iHa8G6KjDBfbmVOBvYuhzAK8VubhYUo08VATC4mhkaZNjfWbWjyszAVEBYnpL2PBgYJTbUZBZMnmt3PB+jxEzHeGPSvH4S1yBNAxEyhMbhRnKaG69HvMQ4vVwVpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo0z7LUl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166E5C4CED3;
	Thu, 23 Jan 2025 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737647772;
	bh=t4YeYUGxMCanEIPJ6O5BIH3fkHa29QWztda2pwtTDnU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Uo0z7LUlFNpfxJ3vj+q8eaiMV2CG8t3FGKxcpj7XgK0a9pVmWXaUswbgPRqbXGuzo
	 oJuYyzqL5sVM4O021GjY4WQQwla67pHgNoXDTrXq1dVFHIvuHWEHwzCyXA1OmOHvpw
	 JWlF+G/6VxoNEAOaimPLK3BYzRmmnLiLrOQceL0Y8uwtbcUCvv8tupKzP63r+E56FY
	 RT04GFtvFMe6GeKrNJ/16QVAmTfUu6mgdEo3g2Lp/IXHFCTYxqF6hckkzUHN5U2Xpl
	 rCe//7FWu+lnTZl3Zt8fjLxeGHuBmBHM+ySoKQ+qKFq62HutGZ4/i6GIApBHgIhy4v
	 XzDtI0m1gLVOA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, support.opensource@diasemi.com, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
In-Reply-To: <20250123121036.70406-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250123121036.70406-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: da7213: Initialize the mutex
Message-Id: <173764777084.76475.51964784481759167.b4-ty@kernel.org>
Date: Thu, 23 Jan 2025 15:56:10 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 23 Jan 2025 14:10:36 +0200, Claudiu wrote:
> Initialize the struct da7213_priv::ctrl_lock mutex. Without it the
> following stack trace is displayed when rebooting and lockdep is enabled:
> 
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> WARNING: CPU: 0 PID: 180 at kernel/locking/mutex.c:564 __mutex_lock+0x254/0x4e4
> CPU: 0 UID: 0 PID: 180 Comm: alsactl Not tainted 6.13.0-next-20250123-arm64-renesas-00002-g132083a22d3d #30
> Hardware name: Renesas SMARC EVK version 2 based on r9a08g045s33 (DT)
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __mutex_lock+0x254/0x4e4
> lr : __mutex_lock+0x254/0x4e4
> sp : ffff800082c13c00
> x29: ffff800082c13c00 x28: ffff00001002b500 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff800080b30db4 x24: 0000000000000002
> x23: ffff800082c13c70 x22: 0000ffffc2a68a70 x21: ffff000010348000
> x20: 0000000000000000 x19: ffff00000be2e488 x18: 0000000000000000
> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> x14: 00000000000003c1 x13: 00000000000003c1 x12: 0000000000000000
> x11: 0000000000000011 x10: 0000000000001420 x9 : ffff800082c13a70
> x8 : 0000000000000001 x7 : ffff800082c13a50 x6 : ffff800082c139e0
> x5 : ffff800082c14000 x4 : ffff800082c13a50 x3 : 0000000000000000
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00001002b500
> Call trace:
>   __mutex_lock+0x254/0x4e4 (P)
>   mutex_lock_nested+0x20/0x28
>   da7213_volsw_locked_get+0x34/0x60
>   snd_ctl_elem_read+0xbc/0x114
>   snd_ctl_ioctl+0x878/0xa70
>   __arm64_sys_ioctl+0x94/0xc8
>   invoke_syscall+0x44/0x104
>   el0_svc_common.constprop.0+0xb4/0xd4
>   do_el0_svc+0x18/0x20
>   el0_svc+0x3c/0xf0
>   el0t_64_sync_handler+0xc0/0xc4
>   el0t_64_sync+0x154/0x158
>  irq event stamp: 7713
>  hardirqs last  enabled at (7713): [<ffff800080170d94>] ktime_get_coarse_real_ts64+0xf0/0x10c
>  hardirqs last disabled at (7712): [<ffff800080170d58>] ktime_get_coarse_real_ts64+0xb4/0x10c
>  softirqs last  enabled at (7550): [<ffff8000800179d4>] fpsimd_restore_current_state+0x30/0xb8
>  softirqs last disabled at (7548): [<ffff8000800179a8>] fpsimd_restore_current_state+0x4/0xb8
>  ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7213: Initialize the mutex
      commit: 4a32a38cb68f55ff9e100df348ddb3d4b3e50643

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


