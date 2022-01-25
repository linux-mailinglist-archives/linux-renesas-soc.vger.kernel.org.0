Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDE649B180
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 11:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348627AbiAYKW6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 05:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242894AbiAYKUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 05:20:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3911C06174E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 02:20:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68AB6B81756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 10:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2089CC340E8;
        Tue, 25 Jan 2022 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643106013;
        bh=z0bkA1DOtzXT/Y9S38wKVIbWBfbEwX445rAyqA7vHpI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=M27YfqXh5nzytxCWsS86alhRhWJzy5bfaVXl9Fc9vnC0JrjKOkTbX4Iad4pYwyh1v
         UHcyFju1qrONgdFSmwxQW68uZy02ZnG6LZ4pg490opeie+mEXhZsvhwI+QVH5CZF95
         0VHugl6RZ4Qt5po4O0uylgcgkDQv/HVP/Zu3hYjOnTxeX/FkBO5RkpSCokOdX/dCuv
         fCyYC0BvryXk0CuZ8YP/qzT+Ls4QcKdSR0NEUIYNU23ftOpv0aT3WOSlFtOqtldpaD
         YW9SCD9DW1eiHFJfS8xxeQZGouF7/ZvctnptrbZaFBK/NqO8coGHqQHIcJkKz576XD
         oZApfE3h94TXQ==
From:   Mark Brown <broonie@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Pavel Machek <pavel@denx.de>, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
Message-Id: <164310601186.74844.5990821411200273836.b4-ty@kernel.org>
Date:   Tue, 25 Jan 2022 10:20:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 10 Jan 2022 09:47:06 +0000, Lad Prabhakar wrote:
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
>   ASoC: sh: rz-ssi: Make return type of rz_ssi_stream_is_valid() to bool
>   ASoC: sh: rz-ssi: Add functions to get/set substream pointer
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
[4/5] ASoC: sh: rz-ssi: Make return type of rz_ssi_stream_is_valid() to bool
      commit: e42c903e8bf400728c4ae1f922169b4d28b72efa

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
