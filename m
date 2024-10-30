Return-Path: <linux-renesas-soc+bounces-10227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCA9B6B0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 18:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BCE41F21C30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 17:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A78213137;
	Wed, 30 Oct 2024 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+MkZl0E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2FE205AC7;
	Wed, 30 Oct 2024 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730309611; cv=none; b=g055mYlsm7pXbcptS4a4zqlku3DaztcHt1UH4OyAWF6mOjuM0mXyTjAl1ND+krrH8Ea0usl0H1ZE/LAmrkyCvETd4+WKfbhuJCCoqsyAr07pFAMcg0HzlCpq2+DPjM0j7rOvVa6iQSKPm45Z82hgpcohgXEHW/vOuYXh7+FBA30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730309611; c=relaxed/simple;
	bh=ZIyf7WCrqLwhcnOvg/DJm8/zI0IqGS0JY8JDkkt68nk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nq7IKjOhXB3KqCfG1DHjICS4lnRKr3YHGsxmE/qEHbnmp6W8gjIdeU7hCXgbAsGPqNKJa0KKPioY30HxaaBGUcFkc2WRFiD3UjiJvW9QI8n5IC1jzv5q+FizHQaLlQgZp4RLLfy3aB8JtzN9wUZBBysLsvXfAxxkJ61djyNlwhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+MkZl0E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FCEC4CED1;
	Wed, 30 Oct 2024 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730309611;
	bh=ZIyf7WCrqLwhcnOvg/DJm8/zI0IqGS0JY8JDkkt68nk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X+MkZl0EmcuWbZVAmvWMQBuR/l5xWvFURXxBGDDCKNDbS+6zxzkVPOMwCEGYQm45B
	 iQ3+5/m8DqcFkmu/5wMKie9w6FvqoPW9j/csm5uPQ0k5eK6et/CkWsY2KRloOxMEUZ
	 XAd6P44bw3jQnqrT01nePngeTdV9eCfBpmRx0YflKXi5OCnVn82u0lpv3OKCM7fWXT
	 L/FQ3NmEcDB2NPxoHtoEoJNUO5NhHyhTQEiv3MnewiqjbOUrHJh7t9nC+w2xyE3Zgr
	 Sk1KJegpYBQPxR3FXBQ6CmEheIVWE+7i1vcPrIQYgjt45t8iidhpWAitSS2hznmAsB
	 foiEB55OgDC/A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/5] ASoC: Rename "sh" to "renesas"
Message-Id: <173030960849.47565.15749613189750530919.b4-ty@kernel.org>
Date: Wed, 30 Oct 2024 17:33:28 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 25 Oct 2024 16:05:06 +0100, Prabhakar wrote:
> This patch series aims to rename "sh" to "renesas", along with this
> the references to this path have been updated.
> 
> Note,
> - This patch series applies on top of [0]
> - This change was agrreed based on the discussion [1]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Rename "sh" to "renesas"
      commit: c0aba02cdc1afde6c2349db95ad36b9532b42a37
[2/5] ASoC: renesas, rsnd: Update file path
      commit: 94c0a8a10f05782a4426a67343e3081601ad3f1a
[3/5] ASoC: audio-graph-card2: Update comment with renamed file path
      commit: 1b3130e9e77e4286a2e495b4b3c3efcf54848633
[4/5] MAINTAINERS: Add entry for Renesas R-Car and FSI ASoC drivers
      commit: 3dc2c89473a43b1ab83a7f0196e41eb3145844d6
[5/5] MAINTAINERS: Add entry for Renesas RZ ASoC driver
      commit: 8fc6907ee343336dc5ae75665883fdbf7e012d26

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


