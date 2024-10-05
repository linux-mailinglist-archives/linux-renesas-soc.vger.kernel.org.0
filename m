Return-Path: <linux-renesas-soc+bounces-9480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 854569913D5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 03:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 342931F23A61
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 01:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66412231C83;
	Sat,  5 Oct 2024 01:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEUG79+q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37D1BC2A;
	Sat,  5 Oct 2024 01:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728093227; cv=none; b=rkL/Ii0f02ks4ssgmAVTUmCuCViSHsAtwLWAnc4BVU77JFr/hHdSS0wn6uMA7jYB3kBkBQGma80YwKC6G2tW9LwBpPsJXSuCzRswwoaSTqpiUxmXxPv9xjd8cVudtuDM0H0CGdQN1DuK/TUTXIKfdCcyOlSEuuNtPisVE/FcxfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728093227; c=relaxed/simple;
	bh=xZ8767UXpTwyZFY7SSMD3py13ytUyf5XQQJ9eNUQqKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sXAM7ycECKZjaotmYn+2DcozGiy8Lln448pTvciLROYnNoep1i7wfCHYxQ9Zcb7LXVUTAmfufdRqlOk345ER8YmvBsZAhGl1QoUJopH2MmY17weJLXx1kDKweJcYrqVblyuQ/dX6TAgsKD7tMJauvAQVvbiQZxE3kRSLDBbS6kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEUG79+q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26880C4CEC6;
	Sat,  5 Oct 2024 01:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728093226;
	bh=xZ8767UXpTwyZFY7SSMD3py13ytUyf5XQQJ9eNUQqKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oEUG79+qCJGiUIVWtVpvxCfm2MEi9Qkzv4oTw7dyuOf9BximSAzgKYhogKkZH/rC/
	 eeTwQ1zo343LVRLa9nuKnAeMwnuoNKozPBGfwxMrsjyRMEqiaDytxBPWpP0uFA05Ga
	 7nBHBtJiTrJTjs9sQLISjKQDXXe4q/tfq4BidPlhR8CXw8303rIo4EVxEcII0M+9aU
	 2aLfbOuaifO74aDhsn/PwiQT0Gn52nZOTtzw1oUVcR+LGF6ugfKBw4qCQ121YJsgIj
	 0uhp2FXLHOjDcCVvG6+AUojz0Va9wBq8n87QX/Z/HaUAE713pusanFp+MSwFMp6o74
	 8crGCOWIPneTg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-sound@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20241003081140.31332-1-biju.das.jz@bp.renesas.com>
References: <20241003081140.31332-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: sh: rz-ssi: Use SSIFCR_FIFO_RST macro
Message-Id: <172809322387.807456.16909484510083610400.b4-ty@kernel.org>
Date: Sat, 05 Oct 2024 02:53:43 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 03 Oct 2024 09:11:38 +0100, Biju Das wrote:
> Use SSIFCR_FIFO_RST macro to make the line shorter.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Use SSIFCR_FIFO_RST macro
      commit: 64207f8024899938f8e13c4649a060a19f18bff3

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


