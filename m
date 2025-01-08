Return-Path: <linux-renesas-soc+bounces-11964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDF4A05F48
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 15:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C851661FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 14:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0ACF1F9439;
	Wed,  8 Jan 2025 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTdUg8GN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDE515B99E;
	Wed,  8 Jan 2025 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347686; cv=none; b=ETm0q6zTtD4TrMCekMEcDmw4YaRayYFUfe4wi4tjhHL46/LSOAdcTpDa1trPDl9ZOxaP4GmEvGHioGr/2d6I7ELgwQqTr6rV52mA61L7lbHQUpNfUYxW15I8pWaDeycIkhZk7k6bMs7/o6WE3FAB4xBEKsQDiahYAhq42Wxjurg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347686; c=relaxed/simple;
	bh=NxTtR1K2YZHJIUWkMeyKHIFszBgiS5+igLz0WjHsgfM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vup2w8f/7EYCvtJiSrgFi3EPya1WzSrncdhDCh4ytLawyyBWSZ0tfEaC8kCvR8hGgb5CGndTioXrg3kpfhIDug0tweHQ5kWjw+XWrv53m4oinwKgDfrpei/M5lgfbyD4MuNpCtDT3lPQb15Hc6nzOfR/RD0FZJOha9XHJYItGoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTdUg8GN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74A9C4CEDD;
	Wed,  8 Jan 2025 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736347686;
	bh=NxTtR1K2YZHJIUWkMeyKHIFszBgiS5+igLz0WjHsgfM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tTdUg8GNax8Ws/gI7ixtfT81VHxUZEgsykOZqpZ/S8IQkuvEwLbZlq5lFhrUJmDkD
	 C46CQAHYboCGxzcDzXjJKYjUi7dZF0tvqfJjii/zFbUJRSGdFxpZT5NQxdo5ihYz2K
	 p2LVig0YfwxEUw4lvUpgBUNADrGqMYlYGkubACEUoZ0ZWROqirF3a6uT+izQeznvuI
	 kOWTsgGoL6u+XkTJMdCtJoJn76jY8LQBl38/NvfijlSxfz0JhQAj7GuTCGWjXC5pQ5
	 nbEoPPNcHO1cwoH/Sc/b7xQQDQRWXEJRx2ozsJ3IO0DWg+3frCWzN3ORb8IfQRw0eW
	 trmyFdlJmjUJQ==
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain>
References: <e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain>
Subject: Re: [PATCH] ASoC: renesas: rz-ssi: Add a check for negative
 sample_space
Message-Id: <173634768360.57096.9164270045125879919.b4-ty@kernel.org>
Date: Wed, 08 Jan 2025 14:48:03 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 08 Jan 2025 12:28:46 +0300, Dan Carpenter wrote:
> My static checker rule complains about this code.  The concern is that
> if "sample_space" is negative then the "sample_space >= runtime->channels"
> condition will not work as intended because it will be type promoted to a
> high unsigned int value.
> 
> strm->fifo_sample_size is SSI_FIFO_DEPTH (32).  The SSIFSR_TDC_MASK is
> 0x3f.  Without any further context it does seem like a reasonable warning
> and it can't hurt to add a check for negatives.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: renesas: rz-ssi: Add a check for negative sample_space
      commit: 82a0a3e6f8c02b3236b55e784a083fa4ee07c321

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


