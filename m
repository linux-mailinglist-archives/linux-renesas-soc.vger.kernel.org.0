Return-Path: <linux-renesas-soc+bounces-830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B55808BA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 16:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 385BDB20F89
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 15:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8474344C75;
	Thu,  7 Dec 2023 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aq4wll0z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6764544C81
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Dec 2023 15:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB4C6C4339A;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962426;
	bh=yePXrMcyjaNLPyC0dPVTwrC8yLwFl3TN4nR0VbTsVjc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aq4wll0zFMO6KFcSHA6vSqHwMJwsuVtLQ+Cu8yFxZ6agjgCCFjHmyggE3tggHkyuz
	 RM4teSGZU9FTc3g88epaGGTjT8D1VUqaBQepd5g9eKfmxLTMjKhgBIb3SlqyAagc9g
	 dktPI7Xg1OWlkxI8W24hzc0MV9OciUxL4Yh4XDUgGaCe9GBPRMzkbnMf/zfpzv9aGa
	 D09mmd2crPBJqoU/SBh9Tc3m4fdeGDcgkNjJIaYZdmtEXfvNvGHiy6UJx1MG77DvL3
	 rDZsSWyXX6aN7tZ0O+4CUODC2qKPw7qaAsIDdTdX/6FdkrHdVDaEYOlJ/vo/ZS6dw1
	 Z4fH2ll0hWe2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D47DEC595C4;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] riscv: errata: andes: Probe for IOCP only once in boot
 stage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <170196242586.12999.12037381297044836180.git-patchwork-notify@kernel.org>
Date: Thu, 07 Dec 2023 15:20:25 +0000
References: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 geert+renesas@glider.be, peterlin@andestech.com, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 30 Nov 2023 21:26:47 +0000 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> We need to probe for IOCP only once during boot stage, as we were probing
> for IOCP for all the stages this caused the below issue during module-init
> stage,
> 
> [9.019104] Unable to handle kernel paging request at virtual address ffffffff8100d3a0
> [9.027153] Oops [#1]
> [9.029421] Modules linked in: rcar_canfd renesas_usbhs i2c_riic can_dev spi_rspi i2c_core
> [9.037686] CPU: 0 PID: 90 Comm: udevd Not tainted 6.7.0-rc1+ #57
> [9.043756] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> [9.050339] epc : riscv_noncoherent_supported+0x10/0x3e
> [9.055558]  ra : andes_errata_patch_func+0x4a/0x52
> [9.060418] epc : ffffffff8000d8c2 ra : ffffffff8000d95c sp : ffffffc8003abb00
> [9.067607]  gp : ffffffff814e25a0 tp : ffffffd80361e540 t0 : 0000000000000000
> [9.074795]  t1 : 000000000900031e t2 : 0000000000000001 s0 : ffffffc8003abb20
> [9.081984]  s1 : ffffffff015b57c7 a0 : 0000000000000000 a1 : 0000000000000001
> [9.089172]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : ffffffff8100d8be
> [9.096360]  a5 : 0000000000000001 a6 : 0000000000000001 a7 : 000000000900031e
> [9.103548]  s2 : ffffffff015b57d7 s3 : 0000000000000001 s4 : 000000000000031e
> [9.110736]  s5 : 8000000000008a45 s6 : 0000000000000500 s7 : 000000000000003f
> [9.117924]  s8 : ffffffc8003abd48 s9 : ffffffff015b1140 s10: ffffffff8151a1b0
> [9.125113]  s11: ffffffff015b1000 t3 : 0000000000000001 t4 : fefefefefefefeff
> [9.132301]  t5 : ffffffff015b57c7 t6 : ffffffd8b63a6000
> [9.137587] status: 0000000200000120 badaddr: ffffffff8100d3a0 cause: 000000000000000f
> [9.145468] [<ffffffff8000d8c2>] riscv_noncoherent_supported+0x10/0x3e
> [9.151972] [<ffffffff800027e8>] _apply_alternatives+0x84/0x86
> [9.157784] [<ffffffff800029be>] apply_module_alternatives+0x10/0x1a
> [9.164113] [<ffffffff80008fcc>] module_finalize+0x5e/0x7a
> [9.169583] [<ffffffff80085cd6>] load_module+0xfd8/0x179c
> [9.174965] [<ffffffff80086630>] init_module_from_file+0x76/0xaa
> [9.180948] [<ffffffff800867f6>] __riscv_sys_finit_module+0x176/0x2a8
> [9.187365] [<ffffffff80889862>] do_trap_ecall_u+0xbe/0x130
> [9.192922] [<ffffffff808920bc>] ret_from_exception+0x0/0x64
> [9.198573] Code: 0009 b7e9 6797 014d a783 85a7 c799 4785 0717 0100 (0123) aef7
> [9.205994] ---[ end trace 0000000000000000 ]---
> 
> [...]

Here is the summary with links:
  - [v3] riscv: errata: andes: Probe for IOCP only once in boot stage
    https://git.kernel.org/riscv/c/ed5b7cfd7839

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



