Return-Path: <linux-renesas-soc+bounces-16378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D1A9C900
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 14:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 226A44E21EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA69248896;
	Fri, 25 Apr 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgMdU2He"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895385695;
	Fri, 25 Apr 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584495; cv=none; b=JoXf1O0I6EwGmue5e+9Pp4tgWj9LAQtbr0rPHtRYqidLb39tPORnRVnDtdre/1/Iu8Qkals594W//NEGMAQ8pGLk3PXau0vzrBw8fA02xUeIsVFMBGlv80x4A9HWB94uUT64cGauXcSAjA55erf9+Z1a9pUJOO3G5BKIFUtK3WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584495; c=relaxed/simple;
	bh=0jC+f8mlnZwJBUtQlx0T8zUGzXV8KJCXfOyP3vLVigw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=juV0TerbDrKk5Udh53+Dh9UPAdMtR/nQRTRPJ0CKyTC0vJZp/KCRNeWown2Y+DWpQwwXNbv1o5DF9/F5zVmEt5k6lF10MltusMT7JqEJnf5nLxFcO0q8iAcswZgv1XwbQcgX8NbPE0SyDVwx/UvjxTSeVhNwip0sttVKZ5H3twA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgMdU2He; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21467C4CEE4;
	Fri, 25 Apr 2025 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745584495;
	bh=0jC+f8mlnZwJBUtQlx0T8zUGzXV8KJCXfOyP3vLVigw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AgMdU2HeBbp1QKCYJ6Icni1zXm+0+lmyILLqSAoeke1HIyTBc46589nPsGLSehqxP
	 d6T5xMQyIHGttiTPk2R5S8CFQE/AcqM8AZTCdvLhb5p7enckwSarO2UpS5tw35FwkH
	 tOysSlwX3Q0VOWetFR74l52IdzFZBgdKKLfTKKaZ9DppPv7q7xDblmajuSasaTMV6B
	 Rrpb+iYJrtwOAkZQE4aplwJZj+1C6k8ytPF3wLioiYsd64vjfQZgMnOWbxx4PcYnXg
	 0jJg5JVnVAexE6ydahaBcWKgTkFcxx//FAScpwOxIN8uEXCt7CvDfcutDg4D0jVKNS
	 BAIcWyoa8jZlA==
From: Mark Brown <broonie@kernel.org>
To: biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
In-Reply-To: <20250410141525.4126502-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250410141525.4126502-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: renesas: rz-ssi: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
Message-Id: <174558449287.45647.11999550141673145450.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 13:34:52 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 17:15:25 +0300, Claudiu wrote:
> In the latest kernel versions system crashes were noticed occasionally
> during suspend/resume. This occurs because the RZ SSI suspend trigger
> (called from snd_soc_suspend()) is executed after rz_ssi_pm_ops->suspend()
> and it accesses IP registers. After the rz_ssi_pm_ops->suspend() is
> executed the IP clocks are disabled and its reset line is asserted.
> 
> Since snd_soc_suspend() is invoked through snd_soc_pm_ops->suspend(),
> snd_soc_pm_ops is associated with soc_driver (defined in
> sound/soc/soc-core.c), and there is no parent-child relationship between
> soc_driver and rz_ssi_driver the power management subsystem does not
> enforce a specific suspend/resume order between the RZ SSI platform driver
> and soc_driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: renesas: rz-ssi: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
      commit: c1b0f5183a4488b6b7790f834ce3a786725b3583

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


