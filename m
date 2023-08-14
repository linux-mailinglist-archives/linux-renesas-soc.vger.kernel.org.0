Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C1877C33C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 00:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbjHNWGi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 18:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233168AbjHNWG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 18:06:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C668DD1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 15:06:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5BA0B6134E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 22:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08315C433CA;
        Mon, 14 Aug 2023 22:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692050784;
        bh=dz7p/IF5WXFJyzcADOT89NRKdfeQ2X754iNpbxAaiZo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=FlFf6UIRWqN1ejVfuFgwlEfGUgu5d3EGkqrQrnH1MybIBa3uJfSYNoG9c8usHW6Ju
         m9CHzvSmbx9bKTqXd/m0II74rUZbByJIBYSInioXgBh3S/wk2o1/B8rGoZQke/B1QO
         1F4/bA3FG3ZG5CYrCdPwpuzaceQ4DjFMMJTsqYNyokQqoO1yPcM5Ax5N6af4z5xtkS
         yXtpON/WQUjcgjQuIOiLDcFVoIkg4ZSkB+QZlOqhlk8v8PU+T2XH05/lSodFkkMY85
         vbw6StAVtvevySjchVtafbEkHwopkDdflJYGApdB1qPcUPgTURgSVzPjUSojZCOhwN
         toZOuOBAu9AXQ==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230813073458.59606-1-biju.das.jz@bp.renesas.com>
References: <20230813073458.59606-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: ak4613: Simplify probe()
Message-Id: <169205078274.98708.18262592487730953734.b4-ty@kernel.org>
Date:   Mon, 14 Aug 2023 23:06:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 13 Aug 2023 08:34:58 +0100, Biju Das wrote:
> Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
> retrieving match data by i2c_get_match_data().
> 
> While at it, drop unused local variable np from probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4613: Simplify probe()
      commit: b39eee2754e9fbcbbdd866c1aad59575d8c4342e

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

