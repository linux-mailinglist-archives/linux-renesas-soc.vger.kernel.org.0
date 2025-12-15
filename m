Return-Path: <linux-renesas-soc+bounces-25760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF9DCBE27C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 14:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23D2A3001804
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 13:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB662D0C8B;
	Mon, 15 Dec 2025 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0EzLenC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2452749D6;
	Mon, 15 Dec 2025 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807104; cv=none; b=iasxjIkby11SG/2IRVmuOEA4xHuScMVykzWKShwxTBZn9X0xbM/7yuQVI4ZKLwCkxYSPBUX4KfB6kMr/llfLSGMPgcUZ66Fpt8vv6cwT49r3K4x/H/Def5wNYiXaKySNCqpV+AsP2WdiaofN+lbPz8pHcpcgDZZoKTPX7tajexk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807104; c=relaxed/simple;
	bh=g/48S9b/SlzM6mvy3E8dnmmogUAiNufhdHSvXCANVF8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BZvLyV20n/WQzhVPehYdfw3IQE7ZY10etr3ZMukZhl9SXcvlr86QJ9AoBX40C4UgBtzj1Zj8oLJSd9gU5SgHKqPdqI2G5bZd85Ehr1NzfEABf1nuiLTMpXLlArzfj8nJj6LB3n9awT2o/uEo27gTdGltPckpsiGKseIqvlIVJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0EzLenC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A7DC4CEF5;
	Mon, 15 Dec 2025 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807104;
	bh=g/48S9b/SlzM6mvy3E8dnmmogUAiNufhdHSvXCANVF8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o0EzLenCe9OE8Wtzns4+3MYHp5P60R7E4Xz7k16kcPuNdMkviYQVvlckP0pl9R3u3
	 NP8aBVPKqez/3W0qMF/dQ9QD+3J7OKRgxHQMmY2KaRqUYbGBV/AryJyA+6zNogtnvl
	 zYPF8kvngPZz9CkLvXV7VnvNd0zMIN24C5F6Y22OD9bHncVeW+lKu6qwNS6tnbBdWb
	 lGPSl4oOGUyTFqFrm1Uxca5Co5i9FJlan7yL4cjq9PlOrbf9hVGKUKbzrodBP8EZ30
	 Iaqu9t7DM7iLg1ALtyVHNXBtDyHVR4EvOWpHDIZQCaVNSx4HLJOeMCnLZyNxcu0NLl
	 dq69nAYbKs2iA==
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Biju <biju.das.au@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
References: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 0/5] Add {24,32}-bit sample width support for RZ/G2L
 SSI
Message-Id: <176580710142.161056.6367112117497563338.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:21 +0900
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 14 Nov 2025 07:58:47 +0000, Biju wrote:
> Add support for 24 and 32-bit sample format width for RZ/G2L SoCs. Apart
> from this, the patch series includes some code cleanups.
> 
> This patch series depend upon [1]
> [1] https://lore.kernel.org/all/20251114073709.4376-1-biju.das.jz@bp.renesas.com/T/#t
> 
> v1->v2:
>  * Split the feature patches separate.
>  * Updated rz_ssi_clk_setup() to make ssicr assignment in single line for
>    24-bit sample width.
>  * Dropped checking {24,32}-bit sample width in rz_ssi_dma_slave_config() as
>    it is taken care by restructuring the test for 16-bit sample width.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: renesas: rz-ssi: Use dev variable in probe()
      commit: d6c160d5e86f4e7354dd6c3154b7cb562abc6c7d
[2/5] ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
      commit: a472f0b157832fc91c83179b1628d8f660c84c82
[3/5] ASoC: renesas: rz-ssi: Move DMA configuration
      commit: b541cb0a27dfa7504a8008320502f869c75f8bfc
[4/5] ASoC: renesas: rz-ssi: Add support for 24 bits sample width
      commit: 9e10709f831408d948be66bc8f6329fa37a3dc82
[5/5] ASoC: renesas: rz-ssi: Add support for 32 bits sample width
      commit: 124f6155f3d97b0e33f178c10a5138a42c8fd207

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


