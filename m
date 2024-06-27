Return-Path: <linux-renesas-soc+bounces-6827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232291A4E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 13:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2BA5280FD8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 11:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71923145341;
	Thu, 27 Jun 2024 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmpW9XsQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4938F79FD;
	Thu, 27 Jun 2024 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487078; cv=none; b=BroVCt/tRU6bYM4nwSiWUsgqsZFmARAvU4o6B5g01sz6eV+os6DU4jR0gij2YkiXJH/KWAi3j3Z+1QypF8J/nKDRmSLetk8oJyLNXMfbBhNaZtXzBFx8u/sysYfqDiX7R1NG9UkV5JPlzMuvISTCgujJhRyMPy9/1mk7ZLlYWMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487078; c=relaxed/simple;
	bh=lYXCKK3L8/DSkekHvSq+N+Z2VYSpxXcAEISKHGObnxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YWsQ4XpHIUpEBVfPDSzMkWLh3laQiygm8x314z8D/NM+yN19CuQaIyISHFBDzxCIUMDExPe5QmwXBC3r1pICs6fLxEa4YYPoRq/+5NugicOIouxDJto9RgUhVwzBwk8SjvzX+g7vMIyWleYKjk1Kk+Q8bb64a8w+0n6F8SHBwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmpW9XsQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204E5C2BBFC;
	Thu, 27 Jun 2024 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719487077;
	bh=lYXCKK3L8/DSkekHvSq+N+Z2VYSpxXcAEISKHGObnxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tmpW9XsQG/WwI+RcUrAMLEvl/Gih+sV+nymxc4UnjuU116Pgi8wCKIeG4SH1W9HUI
	 dNj9asjQqMODOc0cEjFhcvs/F6rGg+En9yLuES52GXot1qw4QvlCLl11JMib6gJYcd
	 WQhJMpK81xdBiKAmpfGeFyX7Z7wZ19IXHADiVQ3Sj1WB5PiIRQccC8DnqKfhJf+Zit
	 8KSO+9JCZOyKsvTLlZzEzW0vsnXB4mmNB2ajjeHcSmfOYMpLlv78tPFo37lM77bUyk
	 dTrd6sXOSuiErLWAehEebVLr2ZmzTA5lFhHX0/h5KJ4TOypIY+Ovl3HigBkb6kL8pW
	 s2twWSv9FvthQ==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v4 0/6] Add USB VBUS regulator for RZ/G2L
Message-Id: <171948707484.56488.11243036600032850483.b4-ty@kernel.org>
Date: Thu, 27 Jun 2024 12:17:54 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Sun, 16 Jun 2024 11:53:52 +0100, Biju Das wrote:
> As per RZ/G2L HW manual, VBUS enable can be controlled by the VBOUT bit of
> the VBUS Control Register(VBENCTL) register in the USBPHY Control. But
> this IP is in the Reset block.
> 
> Reset driver exposes this register as regmap and instantiate the USB VBUS
> regulator device. Consumers(phy device) can use regulator APIs to control
> VBUS as controlling is done in the atomic context.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/6] regulator: core: Add helper for allow HW access to enable/disable regulator
      commit: 1cb7d29157603561af4c38535e936850ceb99f0f
[4/6] regulator: Add Renesas RZ/G2L USB VBUS regulator driver
      commit: 84fbd6198766336f627ba08f073fd9970729074e

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


