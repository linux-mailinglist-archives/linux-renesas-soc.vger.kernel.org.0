Return-Path: <linux-renesas-soc+bounces-942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEBC80F16A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 16:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 472F72816DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 15:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A197543F;
	Tue, 12 Dec 2023 15:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcFK03V9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E9745EF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Dec 2023 15:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB37BC433C7;
	Tue, 12 Dec 2023 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702395995;
	bh=QdFOL5GvOmMjeT6ecJwNi7r1ylofZKmjdO216ly8fKY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CcFK03V9l8qE3zl4R/Qpxj4+eR9xKsYRNwj7tEbnyqZaT8/AnTlsRUoXvnLrPSVAh
	 +px0wae8aDtMedHB/MSvmCEghN6TgfFqMvo1R+4MoekhjKzNJ3lrRajEZSm7rCjgtD
	 INevh84+LJortP+519bg/SRRMbewMCjaweuMEIKItkOj6tzMJvbQ7ftQjIfyvlCUj/
	 9l62DcxBEv+rWQmICB4EXuxCMySsc6d67IBCckPEwbw3zV/OtVxEZccmgukSdurzfq
	 6c3ZEgs3kLdc4dSaAZYNnT+2GtIy/kQysEwJZ4jD6It7QIVcNttn1+kBZvLCiW7O98
	 ex5U9cg4Jjbbg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 linux-renesas-soc@vger.kernel.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de
In-Reply-To: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/8] regulator: Convert to platform remove callback
 returning void
Message-Id: <170239599261.81481.1924826267147407361.b4-ty@kernel.org>
Date: Tue, 12 Dec 2023 15:46:32 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-5c066

On Tue, 05 Dec 2023 13:26:15 +0100, Uwe Kleine-König wrote:
> this series converts all drivers below drivers/regulator to struct
> platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> Provide a remove callback that returns no value") for an extended
> explanation and the eventual goal.
> 
> All conversations are trivial, because all .remove() callbacks returned
> zero unconditionally.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/8] regulator: arizona-ldo1: Convert to platform remove callback returning void
      commit: 03560ff08d2839d7381f18576b329a2eee5cfb37
[2/8] regulator: bd9571mwv: Convert to platform remove callback returning void
      commit: cddda6f5f47f7cb13191b7753bc3882940b6f325
[3/8] regulator: db8500-prcmu: Convert to platform remove callback returning void
      commit: 0210a60aad02149d8503d259525bfbe0e99f8cb2
[4/8] regulator: stm32-vrefbuf: Convert to platform remove callback returning void
      commit: 6f382a0c7ec12f85f4e40d5343ba53f16f543ccb
[5/8] regulator: uniphier: Convert to platform remove callback returning void
      commit: 964575179663db70832e374edfacc91539e783d3
[6/8] regulator: userspace-consumer: Convert to platform remove callback returning void
      commit: 3b2e8e98692b20436d0346fc6adffff1b596d50f
[7/8] regulator: virtual: Convert to platform remove callback returning void
      commit: d637a75ede3db84f7ae4bc2ab398fe2232f22c26
[8/8] regulator: wm8350: Convert to platform remove callback returning void
      commit: 8d6fab52f3fdaeb8aabfd046d95e5d3f9464399e

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


