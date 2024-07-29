Return-Path: <linux-renesas-soc+bounces-7595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA9893FC43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 19:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13944282F55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 17:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2DE181B82;
	Mon, 29 Jul 2024 17:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMzzMZ0J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C471802A8;
	Mon, 29 Jul 2024 17:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273461; cv=none; b=sKZxf9TnuhVjPMyn6N8i7k7tEOzddMj5NppTvX7ssm+mZFsutWikq5bsXoGHWgamJBEhAAVVBBfAFMQJ5070Lx1ID4PH51Go52B0VCgvB6XazZPj64u0rAKnd+yhAAUGeNmGpMLpR7ciyHezXbV5omVST9whNLZ7vpQwCwhZEcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273461; c=relaxed/simple;
	bh=zPFv4KwNIuU4ve60Fo9+iaJnjEzZlsd7Zqw0MTQ6lLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PsNcEj0U/lWUpubd++LGmsRJDwzcYhMdbUufAwY42NyGEgzGUNokY8+LENP+MYphHygxBkYv/5MTP4AdELSlnY8bfwqUYQMNS6pjr4uV14IspPLYMqTssXoCTSujkEcclJMLNJPywXa0WZeYUmwCzP7ODn9qOLsB/zWfunknaA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMzzMZ0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9955FC32786;
	Mon, 29 Jul 2024 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273460;
	bh=zPFv4KwNIuU4ve60Fo9+iaJnjEzZlsd7Zqw0MTQ6lLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fMzzMZ0Jc7Ho+gbE/bycsFnZ22Rei8oGUXeqgtEgwGhq8GoTZo8OmgYmx/7oTggKR
	 iQffh4oxiZIQModxMtnhfFbkzrGAu2JKQaegPCfI82ffHo0tv4wD8DO7ssdUOt1Pu2
	 OY6bmIS7BWsuYUdGcYCgS/SelI/2hxfe+sPAteOtN+YwzXQ/PIjoXnXZhqedqoznig
	 S2bVYtI2iqIdQmimhQ2GCk7o50ZGzeSRlIKYFOIy9ek9pZgCzrWSMIVQCXTFNGbrOM
	 bNqY236l8ShCExOtMpasd36/MOg1L0O1UOswQh4FXFeg4NOpxAHOrS4/7OYS3JBnMx
	 Q192odNDSdjFg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>
In-Reply-To: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
References: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH 0/3] Add HDMI Audio support
Message-Id: <172227345834.109775.4869081271247920625.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:38 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Thu, 25 Jul 2024 09:45:53 +0100, Biju Das wrote:
> This patch series aims to add HDMI audio support for RZ/{G2L,G2LC,V2L}
> SMARC EVKs.
> 
> Biju Das (3):
>   ASoC: dt-bindings: renesas,rz-ssi: Document port property
>   arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
>   arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: renesas,rz-ssi: Document port property
      commit: 2cc719983603f0e9d24da256b58d6abb79e3884a

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


