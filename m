Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C5A79C2BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 04:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237198AbjILC2S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 22:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237447AbjILC2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 22:28:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95134F37BC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 18:52:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF77EC116D6;
        Mon, 11 Sep 2023 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694476644;
        bh=Q4qDXEJt6oAid1CrVYNdNibOMv2p5JVtH0VzbtF0oWM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=DgiK0kIwu71OJZ+NpAiBPevJiQDNu19qiULN0Yr9pMQzK+HEpcOYfpfXIODNPmkjs
         Dv2A4miYve0JYXg4MzkZ9YGksvIaKqR/YS2Sq563Vdja4icwDtmg56KdyAKEWWD9Fs
         X7ABPYVANSHAdlcmNO27xUFUWkmAqhYciWuBxJYoMcznOjDCMNjzVjfm/bsiNZmUVU
         nC4XTUouOeMJXg2CU8104O/fGt5cV2tgHmbMTvdXAJvjAlgDoQF+lcpje5OHm8MyJV
         11+owqy/OYHyJY7q6IZXMMM0se95ZjHT6Jz7wJL7TwnIrG1GcsFcqG5xfZtnbsg8vC
         n4RViAAJWRePA==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Kevin Cernekee <cernekee@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Kamel Bouhara <kamel.bouhara@bootlin.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230827091525.39263-1-biju.das.jz@bp.renesas.com>
References: <20230827091525.39263-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: tas571x: Simplify probe()
Message-Id: <169447664152.2387538.15701808950700785351.b4-ty@kernel.org>
Date:   Tue, 12 Sep 2023 00:57:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 27 Aug 2023 10:15:25 +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas571x: Simplify probe()
      commit: e17e892dc8d1404a758d38ec870e44299f97d227

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

