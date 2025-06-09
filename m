Return-Path: <linux-renesas-soc+bounces-17964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC6AD2213
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 17:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78E3161DEA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 15:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FD419F41C;
	Mon,  9 Jun 2025 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUCiR6HG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996CC19F42C;
	Mon,  9 Jun 2025 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481959; cv=none; b=O10Gi8Bme1UItWn+WfCy1TMjwwhWsMBPjrDEt9Au9e+Gl1mMFqKM99pyPLZgJAVH/ANuggCjXwqP+hC60bo6O3EwaldWhLOJKQyfo5A3g23dDAxRbhkKahs0sogl3nYD6CwBKnGB7qPGdAyuNnH/rbS8XNuBR5svJCAlnbDX+u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481959; c=relaxed/simple;
	bh=Fq4Gw3eBE6iJsFqutxXYbbq+iN64HPcwkkKNFeMgfNs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pbGjtyr+K7FUxTCh1sDwuAQBjTnGQc12QawTCIzosUNXVKfeq3VTzQ2v9GxQ/VH4yEWnmWNC3On2QkWIdo3kHnc+k5ZtS4QL23sG5R3FSYSeb322NRGjhlod+wl2mTLGmHOIIpcHsUEzbPyuvfQRCs0+br5rdoxTq9P4R71d9xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUCiR6HG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EE4C4CEEB;
	Mon,  9 Jun 2025 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481958;
	bh=Fq4Gw3eBE6iJsFqutxXYbbq+iN64HPcwkkKNFeMgfNs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DUCiR6HGlDKIav/QuQDJBCcgHa1UKzzBUVM8aFjLOFQIMr/DzEUnw23tJJW1P5Xud
	 1Y2rsJzuyALDq/2ISG8W1tcLLhq61yovCG2qFrTX2AWaOvk/jB9D1iSlT0HC2PXe2M
	 +3G4+JSXzjoKV/LT+wIN7b7cjJJtmnZLyqtftJZ7GuH/EoeJ+DmTLrHcHhEZL/Wdsf
	 UgmynThjJXogHVvlhxiDlbxSNbTCb+XxQw51mHx2b12bj4SZEaC5d8/sEJxu/gewSI
	 pck71H2FN6jz7yJPsLItc+Xq1R0X5Wn3OYYvkph9/Zqa8R+SckwPL6PINQLmOyXRQB
	 sL6dT16A+jesw==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
References: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 1/2] regulator: dt-bindings: rpi-panel: Add regulator
 for 7" Raspberry Pi 720x1280
Message-Id: <174948195556.144772.17933863518828459548.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 16:12:35 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 09 Jun 2025 02:06:41 +0200, Marek Vasut wrote:
> Document regulator compatible string for the 7" Raspberry Pi 720x1280 DSI
> panel based on ili9881. This is the Raspberry Pi DSI Panel V2. The newer
> Raspberry Pi 5" and 7" panels have a slightly different register map to
> the original one and offers PWM backlight control.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280
      commit: 6d09c6e474bd27a86352deaf73d02c8c21eeec7c
[2/2] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280
      commit: d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4

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


