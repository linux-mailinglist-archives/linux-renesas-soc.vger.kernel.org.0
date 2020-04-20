Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DA41B0CCD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 15:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgDTNhI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 09:37:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:44398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725550AbgDTNhI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 09:37:08 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 834CE2070B;
        Mon, 20 Apr 2020 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587389828;
        bh=8pBXPljPGGgD7G9G7WPPoDba5tlB3IeSIJiJ8A4QQrc=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=fQryNMJoGFgeXErMNgMY3bHlPoXglQjc2CEsWr7H1VQ2pmV4VpLKGwhw4nrPZ68Iq
         vRM4k1TxElw7ope8fFA4M+irqxoIQLXv44ARYr9OK6XW9cCZv9ORk/e08KpQHWjVqE
         XmkCMEiNWCjSdU8GBc9tX+W+FA7VCAPoHv1Y2d2A=
Date:   Mon, 20 Apr 2020 14:37:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matthias Blankertz <matthias.blankertz@cetitec.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org
In-Reply-To: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
References: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
Subject: Re: [PATCH 0/2] ASoC: rsnd: multi-SSI setup fixes
Message-Id: <158738981359.28730.2521567380411409191.b4-ty@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 17 Apr 2020 17:30:15 +0200, Matthias Blankertz wrote:
> Fix rsnd_dai_call() operations being performed twice for the master SSI
> in multi-SSI setups, and fix the rsnd_ssi_stop operation for multi-SSI
> setups.
> The only visible effect of these issues was some "status check failed"
> spam when the rsnd_ssi_stop was called, but overall the code is cleaner
> now, and some questionable writes to the SSICR register which did not
> lead to any observable misbehaviour but were contrary to the datasheet
> are fixed.
> 
> [...]

Applied to

	broonie/sound.git for-5.7

Thanks!

[1/2] ASoC: rsnd: Don't treat master SSI in multi SSI setup as parent
      commit: 0c258657ddfe81b4fc0183378d800c97ba0b7cdd
[2/2] ASoC: rsnd: Fix "status check failed" spam for multi-SSI
      commit: 54cb6221688660670a2e430892d7f4e6370263b8

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
