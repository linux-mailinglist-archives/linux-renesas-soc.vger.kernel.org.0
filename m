Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B8C79C2C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 04:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237998AbjILC2U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 22:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238026AbjILC2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 22:28:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A93512918C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 18:52:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48232C116CB;
        Mon, 11 Sep 2023 23:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694476634;
        bh=9snFwBbBoXitUM3dr7LW8n+9wzN0NmBcRWUrdshcpEg=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=LWv6YbI5tJ9QV/UPRJJ2tAq2HBTzDY9ZA4hwVpuwhTVcBOFy/c8TWp1TrHkgyZoPM
         /scG2uInKBC/1a/nNu+1Ju0AiiySR4Bq2o13qQCGydygCtpE2tPhgKBQQ/DhEwL6Ul
         kS+TkvPFMesybu4JUZFr84FWH28SgtUadrvzvj/bYOzro79lFvYR08wQh6Go0F422Q
         rYodtKmhHz7WyhsSoiRIcq/AjQ25Ug8BpLNPHSGclJm9WI3xlztOblC1jb1zie/HeL
         iPPpnJwz0CoHaXROGopWa6lhzh4pcwxIYkQTru7kFNUNr5qHqDzLNW6HffVXq/QLC9
         knG9pkKNHYvVg==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
References: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: wm8580: Simplify probe()
Message-Id: <169447663194.2387538.5757531864571268154.b4-ty@kernel.org>
Date:   Tue, 12 Sep 2023 00:57:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 27 Aug 2023 11:21:14 +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8580: Simplify probe()
      commit: 26eacb98ca7dd3ba5a6845028a13d13a7f03123f

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

