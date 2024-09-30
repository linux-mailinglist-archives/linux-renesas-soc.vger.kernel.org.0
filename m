Return-Path: <linux-renesas-soc+bounces-9245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D471398AFD3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 00:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DB71C221F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 22:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062F0188CA6;
	Mon, 30 Sep 2024 22:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqO3oJ6k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF9188A3B;
	Mon, 30 Sep 2024 22:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727735347; cv=none; b=MGzxW0M+sTB0yWKZzKm1nNhxxlYGzLFh5F+W8fGXE6vUb+ZGMpZCcYbouB88IsQpbHZqOgPFVSVlNuj5PirFYoH4IHNo7aHNSWoBy6J83EWFlHL2etJ+t+P9KYfk52ukCqXIuA98Q318ZTgsKcJ//h5jYRj5IaUKo0n7qHFD6j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727735347; c=relaxed/simple;
	bh=/mq1/7TS4lL82I1QLjkKX5CI0UrFzICZCCU/f3l8tXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OB0FwJKtKY8H4Z63r+w12J9zE7XFBnrVYyYEyGxu7Pao1JE9p4VNV8Ih2GdLchpmXnLQvepI2ZNPPDs9coP4KR1KXECZIxy6M1BcqSj3AQM2fJ1DLBDsekahpMGZfIFu3q8iD5JHGPkKoUSQuE0+T9R7HJCB/oRvUyUQ4wT4PsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqO3oJ6k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7131AC4CED3;
	Mon, 30 Sep 2024 22:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727735347;
	bh=/mq1/7TS4lL82I1QLjkKX5CI0UrFzICZCCU/f3l8tXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QqO3oJ6kBoK8J0KLL+7aTPwgH68c5v+Xo1OdgIx1oYRzTUhcGg4xJCtZpHA5mMISd
	 1E1SXABPmpa8uCbgOn71H75flhBq5EBt9AXfWsQInLEDJdJqgrlw3Tit/UTDlqcCtz
	 Yzdv+9nIuRYW3fgJX/r0uUwD1Cb5YwgBy157WxPphfNL05Pqj0w5IrygmaRVN+8yeg
	 hNxPpfFY02tsEMQgBjg6EOPAFhurD+8msIo+mk+PPhD/xOFNQfwNNfpweBZdJJNqwK
	 sqKKnRqk3t5+Oui607/ccpD/+rfJ95PAEIrFVLBu2EhzEJtf+2xLn4DWcBysyOq4SV
	 8I5gr6jzXfhHQ==
From: Mark Brown <broonie@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240926113241.24060-2-wsa+renesas@sang-engineering.com>
References: <20240926113241.24060-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rsnd: correct reg-names for
 R-Car Gen1
Message-Id: <172773534521.2224334.6019952106506396995.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 23:29:05 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Thu, 26 Sep 2024 13:32:41 +0200, Wolfram Sang wrote:
> The device at 0xffd90000 is named SRU, both in the datasheet and SoC
> DTSI. Fix the typo in the bindings to avoid the false positive report:
> 
>   sound@ffd90000: reg-names:0: 'sru' is not one of ['scu', 'ssi', 'adg']
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas,rsnd: correct reg-names for R-Car Gen1
      commit: a36614bf88cd4b43984f24fd960c7aa0e43b5fb7

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


