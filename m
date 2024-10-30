Return-Path: <linux-renesas-soc+bounces-10226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283A9B6B0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 18:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCB841F2194B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 17:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0482A196C86;
	Wed, 30 Oct 2024 17:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKEv3+go"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA51BD9FE;
	Wed, 30 Oct 2024 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730309608; cv=none; b=tcjB3Zag07AfaC8oupybPcCnPf/th5D3oq5sPIJFNrc0JCNrGFnPtKrrZM1DRDzuZoe7Wz985XvwCZMCJYFc4AhOAyF/3IFuGy092WuPz+aKzKomqIUkpkgsJbijIZftZD1PneRvEb75luRg8eFUQUMpZSRg3FlQ+U64Jo+4N10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730309608; c=relaxed/simple;
	bh=E9S/71MirN4Ep5daxial7MdVtjN9O1iMQukaePnlYbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SUtDZeIUoqltwtLcBdeEbGrdPZ04tn+KkZBA03MGm3jWhH8/rCGShLNNsy/k4REecLgzpThR1iZ8A6K2c1viUn1/RKZJvJcSHmWRMEQh0AU5MkaO1qtjb3ZWQalH2gtA+UWCcgv9dhduPjkK/DZUKl+CpKWtYS5saa3IDjFKB3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKEv3+go; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069A5C4CECE;
	Wed, 30 Oct 2024 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730309608;
	bh=E9S/71MirN4Ep5daxial7MdVtjN9O1iMQukaePnlYbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kKEv3+goxeYyTwKFqRPioAO9kv9/7RXFDh2aqsqXNE6XqygoLhn3qwyVUFugWEK97
	 cYhdyLM2FHLqC40B8rh5Gs4yOgcKRNPFVxDe2D8b0DaUAqev2NalKfyPN47CyI/R+L
	 YqDomEv1eJv+cA+Fl6o1Ki2MW7M/fAjjLfvVKeKcp1DyUhHK3NO1Lhglb+V71MD7WI
	 FH4QoQV/o2mYYqoFXka4X+FivmhoUZ3vLEX2mZpj44g7LMiS9uT6+4iKnD7Le/ddi5
	 8CRO/aLt7Kqgql4GAPdHLimJmw7+koWffdEkj59IxdxCb78TA+WAATwEXKK6oG5bLW
	 H3njCI7xW/CHw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v2 0/4] ASoC: Rename "sh" to "renesas"
Message-Id: <173030960575.47565.8642908842032187075.b4-ty@kernel.org>
Date: Wed, 30 Oct 2024 17:33:25 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 21 Oct 2024 21:13:45 +0100, Prabhakar wrote:
> This patch series aims to rename "sh" to "renesas", along with this
> the references to this path have been updated.
> 
> Note,
> - This patch series applies on top of [0] + [1]
> - This change was agrreed based on the discussion [2]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Rename "sh" to "renesas"
      commit: c0aba02cdc1afde6c2349db95ad36b9532b42a37
[2/4] ASoC: renesas, rsnd: Update file path
      commit: 94c0a8a10f05782a4426a67343e3081601ad3f1a
[3/4] ASoC: audio-graph-card2: Update comment with renamed file path
      commit: 1b3130e9e77e4286a2e495b4b3c3efcf54848633

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


