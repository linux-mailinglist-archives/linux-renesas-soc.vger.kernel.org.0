Return-Path: <linux-renesas-soc+bounces-9684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646799A519
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 15:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2ABB1F240B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 13:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDE8219CB2;
	Fri, 11 Oct 2024 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMBBgT9R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F512194B0;
	Fri, 11 Oct 2024 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653483; cv=none; b=mgURLhrjg5tDga+G+QMIpL8EPnw00xtWTB4afOFYFGf3oMMbsqs3bcmOIyuMhyQJ5Ka6LW69evhTz0xqthdnFipy7+/lx9ca7wtw7BMhs9a5yBctUB9RFRyLiSyuZEdLVQVbrpvESpDmDmxpPuiucWiBY7WHTWvSqKDLayrrd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653483; c=relaxed/simple;
	bh=nH00S/Q8Vah7DG0quBNmK+fo/KImimfuMbNiWCmaMXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DM3X6Ip8djHSu+vg5qZ7EoigWRfzp6EsQKIJ/G9yn+Fke+6uLTDMq4PdtOd3OTpFWdSteWafM27id6/Ih6Wlsc0fXtv27iounAFY3nnbGuwIEzgoWupZLugFIzYmAVHqn2V5cZ3zZnRsPJXt/71skP7hNIRM3QUighcZkAK/mCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMBBgT9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A46AC4CEC3;
	Fri, 11 Oct 2024 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728653483;
	bh=nH00S/Q8Vah7DG0quBNmK+fo/KImimfuMbNiWCmaMXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pMBBgT9RKEnJep8yxzzucfKuGmuBtKpnLQLIQ7oiykhjLIeMzLYTGvX02kpSA7Rlc
	 SJTyaSeIvfWrf0Zv1AALM9mZbyKENxRIxuDDVaoGvrZB2gDRW4o5a0neT6/YsGf0J7
	 83v96psJCLJKBsh2zgKkIATuA1XyzOgzvg7wSyaYAVS1N/TIFZJZK2pQGOY/xrenwJ
	 b44TWvsQxVQLW+3kLDumyUwgxsxWpGRo5rg+7sWsLixtjYGaX7ShnnEU5ED3C2qzdn
	 DUBcO/K9NJU18sWlcxg13cD48BhjyiQJ1RvDiEdm/XbANpIYYJ2rov8nnGz/XeSvOJ
	 hbk5qwpe+jWSQ==
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
In-Reply-To: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: Fix probe failure on HiHope boards due to
 endpoint parsing
Message-Id: <172865347988.3898502.18262403511737546227.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 14:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Thu, 10 Oct 2024 15:14:32 +0100, Prabhakar wrote:
> On the HiHope boards, we have a single port with a single endpoint defined
> as below:
> ....
>         rsnd_port: port {
>                 rsnd_endpoint: endpoint {
>                         remote-endpoint = <&dw_hdmi0_snd_in>;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: Fix probe failure on HiHope boards due to endpoint parsing
      commit: 9b064d200aa8fee9d1d7ced05d8a617e45966715

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


