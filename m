Return-Path: <linux-renesas-soc+bounces-7450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4AF93A0B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 14:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B7A1F22CBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 12:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6C8152E00;
	Tue, 23 Jul 2024 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHkDkwO/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080521527A0;
	Tue, 23 Jul 2024 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721739517; cv=none; b=Ah7BhEqgKaL6bZ7O85x53JChDuiF7rMsJhH7EvBKTULAvbdXuNw63unizB/onYCbrTUPdFL09JNUsBvGrdVmjun9nKaEKtep1qKnJi6qfkstg6acLBKcjusmK75XmKhVv+hKS9fmGFPIdfjv/gC4z2QH2NGR+5eCKTp+1XDh074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721739517; c=relaxed/simple;
	bh=MH1AecxN6hBhMEENyKPQfaDdwBYj+Uh3PGqrMvR+6v4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Kl2UQCS2mjwwChf4PsgkWxUAP7VJjwRIXiAcS21NGp+oL0/psa2YdAKxbwl8NFjvzyXYYSxOtkJHAcVif0hRXZz8x9Nmpj4M8DSZaVPoCJh9fYGIcPXNNJAGe03TXAVcAhDjM7bmuhPb0OVcSuPkTsmgNonW9JtxXTwNOLDwPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHkDkwO/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C9F1C4AF48;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=MH1AecxN6hBhMEENyKPQfaDdwBYj+Uh3PGqrMvR+6v4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LHkDkwO/ZPXShs7BuzSNAZi3gcAn2cGMJHnroRzPo/iFjnZm0ENjbQHpMo0UqrhjX
	 agCB+gA4y8j/m2dWS3f02h4OvZ2VLdL/Xu4BUfVjZJ30x1jGSe7J+1yEUxim058UIQ
	 IVHYCfAyMtx0XuBECvqFFIRsKCYEUapppHvQC7qBoCnAHceGBqsiS1E5rfSo3cGFiJ
	 U4WcLA9ZRDsVCUqgli7qK39tEh3KOzd8R2cyPx/aKpeNBOP0aGaxPjpC88yQKD+xra
	 L8KJwcXb3BkoB+va/fGL7KYhdplvWvr6a3L6TLzGli2m+IL/Qt80I6JFLpnuQpNtKC
	 ioGaDVVqURVEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8EF1CC8E8DC;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] RISC-V: run savedefconfig for defconfig
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <172173951658.10883.5835597869579224496.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <20240717-shrubs-concise-51600886babf@spud>
In-Reply-To: <20240717-shrubs-concise-51600886babf@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 prabhakar.mahadev-lad.rj@bp.renesas.com, geert+renesas@glider.be,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 17 Jul 2024 14:29:24 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It's been a while since this was run, and there's a few things that have
> changed. Firstly, almost all of the Renesas stuff vanishes because the
> config for the RZ/Five is gated behind NONPORTABLE. Several options
> (like CONFIG_PM) are removed as they are the default values.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: run savedefconfig for defconfig
    https://git.kernel.org/riscv/c/82b461680651

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



