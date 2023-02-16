Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C7269977E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 15:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBPOdF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Feb 2023 09:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjBPOdD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 09:33:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8416735247
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 06:33:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 203F960EC0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 14:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CB3C433D2;
        Thu, 16 Feb 2023 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676557980;
        bh=QqmQt/krC6S5uww76juPUBb0WAImXoL3KsjKZXWfA/0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=ADjwh5iLY63HLuZVMYO4D5VbvkVzcEIiH36I7s2fBoYZDw0WSjgdWOEWLRTH/UrJf
         F83j9PoLNzjS8YK74bYntQ0jIk89Ae6Cd0cGkMRCOMq57jLgthe7x7XzsKtG1GumYW
         pnxgQl66eeekB6B9eQXjE5AkQaXXQ0mGAELuo+Xutnol8o3198y/BR+hefq0QFft6a
         CB3ZQaRdzA/XO70ucrrGXLyrHZ0QbgVND6b9qra0Czc0SHgQimWIRxNbTgVEEr//5n
         09osxMH5cJ1w9xYh54aCgjM5MzmC57qzp6MUVbMBdvFIsSnTqPVlTRUbQveGnfZiaZ
         RVgae3W4elUJw==
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <ac6365c17861d71fbc89d823089db4aafdb763ed.1676470202.git.geert+renesas@glider.be>
References: <ac6365c17861d71fbc89d823089db4aafdb763ed.1676470202.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: rsnd: adg: Fix BRG typos
Message-Id: <167655797866.4030382.9723735853907637449.b4-ty@kernel.org>
Date:   Thu, 16 Feb 2023 14:32:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 15 Feb 2023 15:17:41 +0100, Geert Uytterhoeven wrote:
> "BRG" stands for "Baud Rate Generator", but is frequently misspelled as
> "RBG".
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: adg: Fix BRG typos
      commit: 4932b1fa61322b737dc3615a298aafdc42f97f79

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

