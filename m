Return-Path: <linux-renesas-soc+bounces-21637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD68B4ACC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 13:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D4B1175872
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 11:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC292E3AF2;
	Tue,  9 Sep 2025 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldAjTkig"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A21F30A9;
	Tue,  9 Sep 2025 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757418583; cv=none; b=WcmzEHaDSmwkE0MkPMnK+XNNcU0a5Wq0qoObumoIbTVtndtPgp2If62APh+UVPEYIZFiVwIwHMBw+84fTNFqYC50HH2zsh5/BIdBKmua6hwYxwY4opNEpCntGx0FawiSMUeXNvz+b+bAASseykvNE6E34Op3IY1lj02gPUm4FxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757418583; c=relaxed/simple;
	bh=qtgl0WB8EJm3ib0J2lPSGz7+ZZElKH5cZ7NY4HbJvas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AZb+ehqlf2fCn9Edk51Lyahbw20wNv1fktsfbm+JdtGzzPVkzJVKFO0+I5+Waq+IB/BXbhG0iYOPRr9q/0YNujPV9lHdOyuGJvVYJN3UgLaF4SBIXni++EwTxX6I1RIWYhmUSM66xMjmVMcpT7jmeIwNZx2A2ne8+yuBL4LRRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldAjTkig; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8181C4CEF5;
	Tue,  9 Sep 2025 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757418583;
	bh=qtgl0WB8EJm3ib0J2lPSGz7+ZZElKH5cZ7NY4HbJvas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ldAjTkigURj+pvmZUqWLCe4cQLu6qDacWQhvyjv2k6nBvIAQtMG5tU4DmCLzPOm49
	 crYrcYAMROO8/kjqa2ABm2TF3G6M55o4Bq8+0SzXyI3bjoIjX2QWEPh8iD9qrMKYjA
	 G9aVY3tp3bioYPwvwDYKDj0vlw8xABIzZRr3TsoOxTC4P3QKJUDOgB2MP4GVpL25ZN
	 OEwIeprIDC2p7yaqQyQwWuHgwPv+y3K9Vz+RYY0KtHZgKM1Gon7Ypduic6SVdQVvS5
	 7pIoch5KXCjwRU3qX2pPaRvTlz7IE3H5VuG7rNIzwyrsblzM9GqYMd7Ali13jT2orT
	 DgeCQoPcPamoA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>
References: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2] regulator: dt-bindings: rpi-panel: Split 7"
 Raspberry Pi 720x1280 v2 binding
Message-Id: <175741858068.53877.8850228769612193229.b4-ty@kernel.org>
Date: Tue, 09 Sep 2025 12:49:40 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-94e36

On Fri, 05 Sep 2025 21:16:30 +0200, Marek Vasut wrote:
> The 5" and 7" Raspberry Pi 720x1280 Display 2 MCU is a bit more
> complex than the original Display 1 ATTINY88 and the binding is
> also a bit more demanding. Split the binding into separate file
> and fill in required gpio-controller, #gpio-cells and #pwm-cells
> which must be present for the V2 MCU. Include mention of the 5"
> panel in the description of Display 2, as the 5" panel uses the
> same MCU.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi 720x1280 v2 binding
      commit: 5bad16482c2a7e788c042d98f3e97d3b2bbc8cc5

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


