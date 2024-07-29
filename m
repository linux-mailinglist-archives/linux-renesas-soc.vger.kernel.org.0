Return-Path: <linux-renesas-soc+bounces-7593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC53593FC2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 19:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33D3DB21332
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 17:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A20880633;
	Mon, 29 Jul 2024 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBYhmJYK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515667E58D;
	Mon, 29 Jul 2024 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273430; cv=none; b=sUcpa4jR0xZnRjLB/bXuaRceZn8/XBbkIj62lEYzK/168acGXwJonn7dDiCRGhgcqT/FDsBCUg8oIc8EPeHp7SGdr8LAceGdPiWvXVHXqQrhCAzNPkfU9qO1TgM9cLn1F42qgERo3SG6L+XsEgQ4jMDZoURXo9FBPqDwJS843jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273430; c=relaxed/simple;
	bh=y951BVKQUtiwE8SJIRQ0RqwJAK3Or/mHuMlhMRQ+NPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ATIjwki+g7L18GPVwL6Hfzbp6xMenFoAa61p7WbbHADPD2nj4Oag2iL8HseM4sBJ1E2jZJqkd798+mN17iltF773MwBuh2oSS6sQBxZuSnG+LrKG92jCAx+uWQYVctVS7fb2xbtKnuTy7ApUw2vfgERgGDoUtd4eaFgiwCw0U8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBYhmJYK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F79EC4AF09;
	Mon, 29 Jul 2024 17:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273429;
	bh=y951BVKQUtiwE8SJIRQ0RqwJAK3Or/mHuMlhMRQ+NPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QBYhmJYKNk/uGE58u6kcblXAi/i0UNKR0vYkcoEfyja4R+SpRV/2xfq8+szadt8kC
	 eE66sXOqWlPfRfNomTcxoBLHfB/uFQwrLsOao6r6/Z41BS8Mjnm5N+7ietB1mz5FZI
	 hk3tWPk+9S6ZUaJS8P9DXapbp3yuI5DrHNaeZEE9oUsS5DnKcYcH6CrW828HkzjkKy
	 WOgwqdFvKOEEq7ZzVdxY12zQAp4Z4GMJxPTYootlcwDKW20Q8hakayo0zdNTMlBKlz
	 DK+msD7hlvL47kNh3zp21xBSVTymAmYBEqCZpHhXNkbVbJ95ZZNSiSENGAaQy++xA7
	 88DMOSdhuKOLg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20240715092322.119879-1-biju.das.jz@bp.renesas.com>
References: <20240715092322.119879-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: sh: rz-ssi: Add full duplex support
Message-Id: <172227342707.109775.9630437653460387234.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:07 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Mon, 15 Jul 2024 10:23:20 +0100, Biju Das wrote:
> Add full duplex support, to support simultaneous
> playback/record on the same ssi channel.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Add full duplex support
      commit: 4f8cd05a43058b165b83f12f656e60415d2ff5be

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


