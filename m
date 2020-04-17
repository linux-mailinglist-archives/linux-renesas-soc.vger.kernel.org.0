Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3391AE1FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 18:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgDQQQC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 12:16:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:38158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728105AbgDQQQC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 12:16:02 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1680120857;
        Fri, 17 Apr 2020 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587140161;
        bh=dMnwJXovzpQ6YBUUVCY4KPofcSqzELKGUYZ13cOxUdI=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=2puiKB/0hiVpk1D9MJlEu9jeNCctSYUHooAr1pZSC9C4mMMjiYt2xjJMHYza+dh9P
         9oGoYR4/8Z6FSOcRGaxAc49WewRgBYQ6S8UyVyNK0Fcd5Te3/KnkaMQDMiwSJ6MV9X
         cKTvjq1ss1t31ZKGl8MG7fVht9JIrM3x+xh4qjvk=
Date:   Fri, 17 Apr 2020 17:15:59 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matthias Blankertz <matthias.blankertz@cetitec.com>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
References: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
Subject: Re: [PATCH 0/2] ASoC: rsnd: Fixes for multichannel HDMI audio output
Message-Id: <158714007098.22963.15064526974433346524.b4-ty@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 15 Apr 2020 16:10:15 +0200, Matthias Blankertz wrote:
> This fixes two issues in the snd-soc-rcar driver blocking multichannel
> HDMI audio out: The parent SSI in a multi-SSI configuration is not
> correctly set up and started, and the SSI->HDMI channel mapping is
> wrong.
> 
> With these patches, the following device tree snippet can be used on an
> r8a7795-based platform (Salvator-X) to enable multichannel HDMI audio on
> HDMI0:
> 
> [...]

Applied, thanks!

[1/2] ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode
      commit: a09fb3f28a60ba3e928a1fa94b0456780800299d
[2/2] ASoC: rsnd: Fix HDMI channel mapping for multi-SSI mode
      commit: b94e164759b82d0c1c80d4b1c8f12c9bee83f11d

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
