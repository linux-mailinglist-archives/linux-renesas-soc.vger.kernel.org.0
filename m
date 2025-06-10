Return-Path: <linux-renesas-soc+bounces-18031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B2AD3AFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 16:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C5107A7D13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 14:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587C829B761;
	Tue, 10 Jun 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K14pOdt9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299D29B214
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565011; cv=none; b=GVPXtYkdkYh6G2ZUC7QT1h7Wm5Og7/kh0H0QkSf42Ef/hSdx7lzPCK4ygkkcCgMfEHa/BKjRI9rXSoa1up1e6kJPB5l9l/Htkw7WwtP5RGHsEXuIsXfDmq0+7hZsrnMqrV07ryuVRYcmLMtz4+xbdylj1mq4botrfaZJ7UT7MUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565011; c=relaxed/simple;
	bh=RXXxDrUEIPBbjy3PKDw2gspe6TvSiaJPcdNSDA6Iwfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TLE2Yq3vITUh0nf32YWsXPFq97LUpxHpfWypFpHpBfb2frBpFaz75//UlA4cjglPMguNyVN1A8BZysWpHLFaRKD8R2Gkz5yl3udih3ijPIeEyQou939Es4yl98otW9pjKKIcpkDphKnzmQ+6FxTIDf6BNcNYKTeb1fn9q1fuECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K14pOdt9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E14C4CEED;
	Tue, 10 Jun 2025 14:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749565010;
	bh=RXXxDrUEIPBbjy3PKDw2gspe6TvSiaJPcdNSDA6Iwfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K14pOdt9y3LijzY4is8PinBn0Qst18T1V0ya0YA95a3jxhQvz7ma//GLFQUixACfS
	 VGLDiM0fUupKGZ+KAiUiUMmgBu8E56xnIr2v/yn1SNb/ZUO5YbvSp5c/jtSqxN8uZI
	 KouS6sMtpM+d/3PF7sgr52VmxL8uGJmi0FnIjfmAF4Dx5uxZ9Yo2dlT82vltRO14uP
	 XmKZtxzVPKC3q8NSEvlFc3XLz3EoHug10Xuhkvaf2H1zLQXEQ1sa9uUkaQqX1BKh1n
	 40FfzAvt1olhbVzizcDedRB1fO/y/EYC972EK8CKYKnTGWny6dj2TgJ+Z65HSfsXJI
	 8W63ygGuNLdHg==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20250609200242.31271-1-marek.vasut+renesas@mailbox.org>
References: <20250609200242.31271-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Add missing GPIOLIB
 dependency
Message-Id: <174956500908.46190.8376782599079931737.b4-ty@kernel.org>
Date: Tue, 10 Jun 2025 15:16:49 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 09 Jun 2025 22:02:06 +0200, Marek Vasut wrote:
> Add missing GPIOLIB dependency reported by the LKP test robot.
> This fixes the following report:
> 
> "
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for GPIO_REGMAP when selected by REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
>    WARNING: unmet direct dependencies detected for GPIO_REGMAP
>      Depends on [n]: GPIOLIB [=n]
>      Selected by [y]:
>      - REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2 [=y] && REGULATOR [=y] && I2C [=y]
> "
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rpi-panel-v2: Add missing GPIOLIB dependency
      commit: d6fa0ca959db8efd4462d7beef4bdc5568640fd0

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


