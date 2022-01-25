Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0546049B181
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 11:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243269AbiAYKXL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 05:23:11 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46480 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243434AbiAYKUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 05:20:39 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 60669B81756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 10:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6A1C340E9;
        Tue, 25 Jan 2022 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643106030;
        bh=VSeTcONbx+WORK98MHc29x8HH8mhmCIlSOehrd2mu+M=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=KaOU0HiszTRLCxI1tZOngxCg3KUwsHhLbFPcChkpABqzpAqxgkOOvwTES2aLQComr
         1vFvadFq8nCMrcjVNOe2xeR75Vu1LC//ziltFvdYANj/eIM4WcXUr4BlMwtihpSqUy
         dUl5M7/Urs6k8yDTI+1wXTSOT4fl4JNLGB8A0zXMx5KLYp5M2Qi3sse31F1x7rRTwW
         X4NLsP5yGFJxZFjbXtIemDXM8mCrT0jokRUyqEJwUziPeyTG3GsHa8SJGFG25iPkdy
         KrlvEWbZT6jGnTh5GNbcJ49WlKdR3J34FuqcycrjvpdeavDZDNMJDjKDOGTyLtxyvu
         /UA4EvLXyPHWg==
From:   Mark Brown <broonie@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
Message-Id: <164310602822.74844.12177586903406990983.b4-ty@kernel.org>
Date:   Tue, 25 Jan 2022 10:20:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 15 Jan 2022 01:22:58 +0000, Lad Prabhakar wrote:
> This patch series does code cleanup and fixes to the rz-ssi driver.
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (5):
>   ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
>   ASoC: sh: rz-ssi: Make the data structures available before
>     registering the handlers
>   ASoC: sh: rz-ssi: Drop ssi parameter from rz_ssi_stream_init()
>   ASoC: sh: rz-ssi: Change return type of rz_ssi_stream_is_valid() to
>     bool
>   ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
      commit: 6570f991582e32b7992601d0497c61962a2c5dcc
[2/5] ASoC: sh: rz-ssi: Make the data structures available before registering the handlers
      commit: 0788785c78342d422f93b1c9831c2b2b7f137937
[3/5] ASoC: sh: rz-ssi: Drop ssi parameter from rz_ssi_stream_init()
      commit: 4f78f3c970f131a179fd135806a9b693fa606beb
[4/5] ASoC: sh: rz-ssi: Change return type of rz_ssi_stream_is_valid() to bool
      (no commit info)
[5/5] ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
      (no commit info)

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
