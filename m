Return-Path: <linux-renesas-soc+bounces-7373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 066C8932767
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 15:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5911F21481
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 13:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1579919AD58;
	Tue, 16 Jul 2024 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGp2VYdo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E465B19AD51
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721136382; cv=none; b=niJHUt7QcK93BQrzk/9o/MdnwE7idD4WPW8l3hus7ZJdkPg4p1tLL6/OOSbxKdX6YtfBS4rO3h3VR7HxhOT/90h15IBzv86XjivBtPSIbnkvveO+6eb0dm0J4UYA3wofuUCVMq6VDzDhz1ZLcNKyJlj+1QV/lWSCfjkSM0yChlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721136382; c=relaxed/simple;
	bh=RfJKc904W1K/tDv0iAz+QmuAGLFcmn5Q2giWNLtvk+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VSeE1Q3W+kTR998veoXn1+Zdn9duFSPf8IZaxS3Dsjk8SsBS8XZvn5yNer3DZ2jPRwqJnTPOFVerRHrwx2UPqJKgITg7b7TxQ1YCkSUv+LnAMQN2Y8tDGGDvHTAYl5v/5l3lctrYwK/dy2kqAHRQ1y50CjFWofk68nJtuZeuzh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGp2VYdo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A8CC4AF0C;
	Tue, 16 Jul 2024 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721136381;
	bh=RfJKc904W1K/tDv0iAz+QmuAGLFcmn5Q2giWNLtvk+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FGp2VYdowofk2J1tMEOjNrrOAFDWJjm39XGRLbS9qYIVUf2LAb7xnPKOQmjcDFHSr
	 Qfgnm8qAfXFwvSvyESa1R1ysAqmxHsmqIlG0f9ftzb0itJdD9ubufOLAY2ffn56nmN
	 Wz6fHh8ol+AgYmBs+TK2sLWT7PNJLXoIscU44MD6QEKir3vCQlfwyKF5oOrqI9msI3
	 c4n17N1aTyZaRGZZAUYhzdSY7dd6KuDOYeSUjRJYHNPgGW5CF1mNhZGC4f93nkMvmi
	 QJnyB2uNZZ4DJATRt9VNg01ZJTMZOhny/TgAtuxA6egkoHCAf1xeZx2D+Bid/0ZL8d
	 Y6epmDT956ccg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20240715134120.312610-1-biju.das.jz@bp.renesas.com>
References: <20240715134120.312610-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] regulator: renesas-usb-vbus-regulator: Update the
 default
Message-Id: <172113638008.45790.9156617225849755123.b4-ty@kernel.org>
Date: Tue, 16 Jul 2024 14:26:20 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 15 Jul 2024 14:41:12 +0100, Biju Das wrote:
> As the "rzg2l-usb-vbus-regulator" platform device is only created by
> drivers/reset/reset-rzg2l-usbphy-ctrl.c, update the default stricter by
> replacing ARCH_RZG2L->RESET_RZG2L_USBPHY_CTRL.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: renesas-usb-vbus-regulator: Update the default
      commit: 7164122e25b18806f5dce68c8a0bdaa9e4f902a5

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


