Return-Path: <linux-renesas-soc+bounces-4884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79628B0BD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 16:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3EE4286FD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 14:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A10315E210;
	Wed, 24 Apr 2024 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPgv5GFM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73E15D5A9;
	Wed, 24 Apr 2024 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967347; cv=none; b=ZHYiDdcXk6jrbV5v5oz07TcWIrMOkaU+tyO3pWX4ZL/owd4PwkvhlF5iIZBxsQ/yVKOm5HGpf8HJBQ98Yu34kgtWbHcTEccUcgS5A+gmM/eOUeutJSiiEW/hWL56kqKo5MEKNKPqsznWSqPaJwZVLh7qdDJHKX8mejsUDIjHh4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967347; c=relaxed/simple;
	bh=J/W8G6AHYtkJeU6pLXpJpuJehmlnpDVucXxX4M9+OAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=imd2GBHRn2sdXLMUfgPVxpANER3+Aw+TUnrWojsObjKyjCh1z3VuyYEujGDnTL9ryxF08DVioqd//Dd1x2X8SYBTA32Z1JsnStZpX2OY6rqtYcxY5CVVCTs5UDhX30TXLUaItz/CCyqPBjwkz1DlGpQd93jNhR/pTi1O/24hp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPgv5GFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733D7C2BD10;
	Wed, 24 Apr 2024 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713967347;
	bh=J/W8G6AHYtkJeU6pLXpJpuJehmlnpDVucXxX4M9+OAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aPgv5GFM3MBU/uHSthEl00TQLnlV9LDi19rpNBqoL6qdJTk5uaIcvYVcDzjDj+t11
	 EFNu/YdwHp5nSiE51L/YmcD2ASYYjhqnKXjrTBafhuOw5XG4uePUOo5tnd/Iw1CFkB
	 zroCbcaem2v7xhOVGoQRgxm6NeXu6/cK6mH6mGWbisN/gBemS1+CNq1lzTbbAxshIr
	 xa2cGIqLlwynuZfTTFHFs92EWC6Uxlg+x+4dhOFRDN0SOA/Ln7BzjqzoSpSul+pKA5
	 u+/qy6WNCSsTeaCDQOmbQc2Mg5xwGHJgV1l7tdyG29BIV46yAQOYMuI7YpeXXYRo/2
	 KVphWvlTMOXVg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <b3a6cf12c46b23a501b0d54c6892b969e2a55145.1713874657.git.geert+renesas@glider.be>
References: <b3a6cf12c46b23a501b0d54c6892b969e2a55145.1713874657.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: Fix R-Car Gen4
 SoC-specific compatibles
Message-Id: <171396734270.1799261.6189828462792087587.b4-ty@kernel.org>
Date: Wed, 24 Apr 2024 23:02:22 +0900
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Tue, 23 Apr 2024 14:19:26 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: sound@ec5a0000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	    ['renesas,rcar_sound-r8a779g0', 'renesas,rcar_sound-gen4'] is too short
> 	    ...
> 	    'renesas,rcar_sound-r8a779h0' was expected
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas: Fix R-Car Gen4 SoC-specific compatibles
      commit: 466c8c46b4ba763435b2a787b7824d9f0fd3e76e

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


