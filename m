Return-Path: <linux-renesas-soc+bounces-7594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C9093FC38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 19:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10AEFB231FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 17:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46E518734B;
	Mon, 29 Jul 2024 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YS5VSpME"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8914F15F32E;
	Mon, 29 Jul 2024 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273446; cv=none; b=qw6vSE2fVEesVg9B49KxTejlX467QmQkRIutMvMlTqHQLJetIxDIuvbNnzbeXBDK6LLdD8UMc9/gWLsAM1tFn6xp0knlGR386j/Lc0HrhL7wVQMxNVhoBxJTejTjxobK69katSU3IF7bhgLaaNAJBb8nyW3ljoLPMFq71eal+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273446; c=relaxed/simple;
	bh=jPVwPbzGjpuo+qaDkF9mdK7f0mgjanMEINPeVhLJejM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UIHo5yWqfjCdEdHTRdvGoJaTmkgKxbUKgRKnwf3FdT8r+NkUPiyqsxAY8AQftVTU77PrhVIAwxzONzG9CQNlBdTXjFhp/SfZQLKYiIVfVwvVPPE1iJRU9sdE2jHufvvgTWiYj7ivHN065DBClXsQbHA+9TwWz4IzHTzVw1tSWQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YS5VSpME; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2378DC4AF0A;
	Mon, 29 Jul 2024 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273445;
	bh=jPVwPbzGjpuo+qaDkF9mdK7f0mgjanMEINPeVhLJejM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YS5VSpMEepZ9R58xMIv3/G5EyHeLzOqkkkbsDKeeMxD77XwdbudyuMN9OkJ5GBqEq
	 MqexMOW8Z+PzTeLKdrDAuLtMjv6A65arKhY8aFkF9uun0rNS5H9ya1hsgkHW99SyRP
	 yas6drFTiC5LCzBGAjBHBgqvylSKuhERSCL2/zPc8IhDzrplaAsFUBAxTtHm6VAJvI
	 twEVO+7onblEDpRaOdQsah2DOOhxk1qL/5HrYqKv7CQOcBX6DoheOePhaYH58CS2Jz
	 nt+a8qzcp7TbLyyhSen0mWBFH9eVPtF+JL0JNku8+NggwJ51BMhz8lICq3dlto4dvl
	 8HmWTx/HpvXbA==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <7645c9024a1762d281f4067504bc32a7a3d27caa.1721649741.git.geert+renesas@glider.be>
References: <7645c9024a1762d281f4067504bc32a7a3d27caa.1721649741.git.geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: sound: dlg,da7213: Convert to json-schema
Message-Id: <172227344287.109775.17086394127467756882.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:22 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Mon, 22 Jul 2024 14:04:00 +0200, Geert Uytterhoeven wrote:
> Convert the Dialog Semiconductor DA7212/DA7213 Audio Codec Device Tree
> binding documentation to json-schema.
> 
> Add missing properties.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: dlg,da7213: Convert to json-schema
      commit: d57ef03314f529e76385a9d5108c115459b54c2b

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


