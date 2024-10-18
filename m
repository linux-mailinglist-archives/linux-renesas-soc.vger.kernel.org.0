Return-Path: <linux-renesas-soc+bounces-9892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D579A452E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 19:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B43B286573
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 17:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBA1205122;
	Fri, 18 Oct 2024 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1T8IUrJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E36204080;
	Fri, 18 Oct 2024 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729273429; cv=none; b=ZGgN3ZbFp3NbQSvcWGKWQK2b2N9VmS2gJNWBGUmaol76I0v6mac3+i7PVgtM/wymdEXTzg493kv+O764gu6CR4HhY4kt9nALN9UpSD9bZjWsiwvirWsNcTzDLrBsBLuRvgTblxbisG9byia0gJ1PgKIZfUbFYhPAc5fZEfhwTpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729273429; c=relaxed/simple;
	bh=2p5IF+ZWqEFOVQII1ShdYMBDiQsd1dQKUutWOu5irWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qIyBSQQdFkpp2ic1houiZaKFMAgGPubkEJcEJiLx+dco/i1wntBv9CwI0dJrhR1cDywYyRty2+wxRLAeof8Zm4IlprzVUQFvDeyLNZLwHNzcrUws8Ty7ibcT1g9PdG3vR+B8gdZpCSHPJoPHII9wdhs7r6QdBHSeXWInszArGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1T8IUrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0B7C4CED3;
	Fri, 18 Oct 2024 17:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729273428;
	bh=2p5IF+ZWqEFOVQII1ShdYMBDiQsd1dQKUutWOu5irWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o1T8IUrJUhY5KGJNL+zwwNnfzbqqkscpjyP1e1H/qp48L0poiB3hHP97ti/3u7KRr
	 puJMukpI4FgMxM8KpYzEBEbqURtEgn78kk2G6hpr6Bvk40PJL0PIgXfgD0CgF0BgKC
	 fb1HyiIzdlIlrjqP+aZTi0JRmEC7B28QTvduYJYZqMx0/RLJhgW+YtLmmA3ycPPUy9
	 GdGGzVtu3yE8aWWAyxutle0lRO4zKMTZQ+Oji8iHiLK95OVaKPT/1xoC8AR9YNOTu5
	 Umx7DwgT2dNy/UADghqExqnKIDTIUQdTXIaaEqHEfaU6loMwoguqoPtcmrWNOGcPgU
	 QwOeWHA822dFQ==
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241011175346.1093649-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011175346.1093649-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: Refactor port handling with helper for
 endpoint node selection
Message-Id: <172927342605.163659.12231131431088875442.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 18:43:46 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 11 Oct 2024 18:53:46 +0100, Prabhakar wrote:
> Refactor the code responsible for selecting the correct device node for
> audio endpoint parsing in the rsnd driver. A new helper function
> `rsnd_pick_endpoint_node_for_ports()` is introduced to handle the
> selection of the endpoint node by checking whether the port is named
> 'port' or 'ports'.
> 
> This change simplifies the logic in both `rsnd_dai_of_node()` and
> `rsnd_dai_probe()` functions by replacing repetitive condition checks
> with the new helper.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: Refactor port handling with helper for endpoint node selection
      commit: daf5e3c68144bdb7e605f46853febc7bb257d44d

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


