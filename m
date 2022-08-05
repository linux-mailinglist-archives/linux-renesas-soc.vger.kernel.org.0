Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B9C58AB7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Aug 2022 15:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237867AbiHENUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Aug 2022 09:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237188AbiHENUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Aug 2022 09:20:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF9826A
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Aug 2022 06:20:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67FC260A47
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Aug 2022 13:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACECC433D7;
        Fri,  5 Aug 2022 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659705637;
        bh=HMXwjOMiGKcjIRj9VaWB5oAAcM0om1YS65OgfQXe8FA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=FBPvaw0zo+NvxYYcQWUuTo2sO+ylgxLMv8R38LZFJzQuh08Hp0J8QJzxTyn+vzCDP
         fMqP+nPaVn8sYKJw/yTc0DGG2lFmXILWKaMFoMK00P9AQpFdwHcZr93uYBMM/NWODd
         9FzTdNiGeNl8reVPmSCI5PlA+MAEPXXRFMgfGD57VjEYkRB6CuLpmWmfHZiP6/84dk
         gPiiG+xFVOAUic3rZodlucEq94RGeG4fNZwBdzTIdto8QcVhusK/XMTsxOZGt5Oe8O
         /wATtcMT0n1VEa8/wi+dB71POyLvx3XUO81aoINlAfUSlUq76Q+01k8glGSvk/q7YH
         EmX+FeSnMM2Ug==
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
        Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20220728092612.38858-1-biju.das.jz@bp.renesas.com>
References: <20220728092612.38858-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe() error path
Message-Id: <165970563480.1032419.491538826538981135.b4-ty@kernel.org>
Date:   Fri, 05 Aug 2022 14:20:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 28 Jul 2022 10:26:12 +0100, Biju Das wrote:
> We usually do cleanup in reverse order of init. Currently in case of
> error rz_ssi_release_dma_channels() done in the reverse order. This
> patch improves error handling in rz_ssi_probe() error path.
> 
> While at it, use "goto cleanup" style to reduce code duplication.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe() error path
      commit: c75ed9f54ce8d349fee557f2b471a4d637ed2a6b

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
