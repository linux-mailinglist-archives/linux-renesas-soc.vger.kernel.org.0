Return-Path: <linux-renesas-soc+bounces-10483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D24D69C7089
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 14:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33684B34929
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 13:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5C3203712;
	Wed, 13 Nov 2024 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oyn6Qk3c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478AF203705;
	Wed, 13 Nov 2024 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731503010; cv=none; b=E8YSXT3Nc9bIcay7BQqQclRNlSSuAZRhlcvEgK5jRa02ZZLDP2G4XSkZX3eCmeCzphIaDRKqdcEvlGzVZkiEaSP+wqyZym7LgPpo23mw7fPTfp/8AJK/zepTiidZGbfp8vEiLS2xiC4qjfumj4TMIxg5iiiJtIDV2iqFvM42P0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731503010; c=relaxed/simple;
	bh=3hSrEerVz63flbUMSNM5kNo4q1EzHTQJwl/k9YXWWXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KYoeyGBVADjeDzW4ss3LslGS5WN6pFmsIS7UlmRDcLgoWEKQWFwSL1PAAYhw+TFaCGrqmXZpC9efBj34Iut5FWXI882zO3Glxy01UUHW/F7X06DS83Z9gJmc0UxjU+oKCoA5ouyunyDRaSa8o0qT24Jl7jNU3u3BQSurnqCnVHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oyn6Qk3c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEDBC4CECF;
	Wed, 13 Nov 2024 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731503009;
	bh=3hSrEerVz63flbUMSNM5kNo4q1EzHTQJwl/k9YXWWXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Oyn6Qk3cbXGXHOTIyYwF0JjkjWmA2gO5vSv5pD6Zb6sCBbFTXdht9wS6vqmEJy0kc
	 jovqjilanwp3ERL6LQn94WKNRoEGHOKcOTnI4cvj74SMlN7DYgYX7NfjTmsm36WCEA
	 Z0IWayIQ9JoIqhp1vuA+7YCM4JisPjeZfIF0B0iWLo+S1kxz2cW6m5gdz7ewSMVOVm
	 Dblbsl0nOklNcmy9hM9q81niWsP8RM6ghv9qAsIZDhE0sbwBJqhQFUv3c78XVmegtq
	 eOHvcnscCdq8gDnsjiF2gAhUQM7gqChgzemaBJEIErs742H0KCAXiS+xD5R+anCy/J
	 6vSileRfaUrmA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <ab85510f83fa901e44d5d563fe6e768054229bfe.1731398433.git.u.kleine-koenig@baylibre.com>
References: <ab85510f83fa901e44d5d563fe6e768054229bfe.1731398433.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] regulator: Switch back to struct
 platform_driver::remove()
Message-Id: <173150300581.429927.11116814842133511799.b4-ty@kernel.org>
Date: Wed, 13 Nov 2024 13:03:25 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-355e8

On Tue, 12 Nov 2024 09:35:21 +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/regulator to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Switch back to struct platform_driver::remove()
      commit: 1b55354745e276db38268f23865eb2c4eba5f59b

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


