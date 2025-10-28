Return-Path: <linux-renesas-soc+bounces-23735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F1C1452A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 927FD19C33A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 11:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E392F49FB;
	Tue, 28 Oct 2025 11:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5H4tEaX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14371263889;
	Tue, 28 Oct 2025 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650246; cv=none; b=mcSuPaHMEyv12Po6paXb6VvMuvX6RyoJRGyI5EF7Zv65rCt3tyk5DhpU6/aE6RYUfqyX2IlaSTGVvV6tKgtZw32Jbd65WymZWUlL3x7NqzUu2RIkx83MM1wgLZBIyG6VnLbgDNE/ZneKEnEIXM9NdyYnGaN81ec+wHJL/vjwpLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650246; c=relaxed/simple;
	bh=KFHmoskfEoZUtq2ZnSkL6BqQjR0sDUKkeQJSEpcbWG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jHBGouf382MWGWpyPkWeJn95OOceQQEdeWI1A4aIjRimE/w6BdKnzVHZdw5TB/ucnnh/VtSDDiYpeggh2txPqNOb4lSyMM+nACzuct0HG2SC4cSwLdzkOamU9ivbPTGc5HIBbPSV3xFjx5Zwd4jWJWg9dsdTSVL8TLUCtJsdJOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5H4tEaX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0770CC4CEE7;
	Tue, 28 Oct 2025 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761650245;
	bh=KFHmoskfEoZUtq2ZnSkL6BqQjR0sDUKkeQJSEpcbWG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d5H4tEaXQrvd+/Y4j0wURACpp3nMe07KwZk54dIDeBcKWhE9HWhZmzNo0PnK1+EiS
	 hJcoXhuEu82RkY/LBYlmU6CGVCqa0OjIfsBNFJSSSpj/Gonx9nez5zk4hXGjKbpC6L
	 5Fm3tFWuQVn45OPd5/UMeMW4e9BaOWwxTz98sf3qSLwE7zhm+dYBlKRDR8iecHmVkl
	 NR12rU7DJf1NtZH2nCXox5iYdaghUfvlIECuRZYtrZD/f+c72WoyEElvG+TRONEFNK
	 tpFFjc+KLOgZqLUozAf6jAd+c96poOIZ1JGicC6va+F9bfDxq5F29h8gwjKs/RzEuk
	 77OL8NEAvglfQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <88ca34df9006b74a7596b91714e700bcff666c4b.1761507792.git.christophe.jaillet@wanadoo.fr>
References: <88ca34df9006b74a7596b91714e700bcff666c4b.1761507792.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: renesas: fsi: Constify struct fsi_stream_handler
Message-Id: <176165024378.34272.12649082972979023920.b4-ty@kernel.org>
Date: Tue, 28 Oct 2025 11:17:23 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Sun, 26 Oct 2025 20:43:36 +0100, Christophe JAILLET wrote:
> 'struct fsi_stream_handler' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   51837	  12312	     64	  64213	   fad5	sound/soc/renesas/fsi.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: renesas: fsi: Constify struct fsi_stream_handler
      commit: d29479abaded34b2b1dab2e17efe96a65eba3d61

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


