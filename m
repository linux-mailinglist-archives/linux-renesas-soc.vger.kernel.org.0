Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0326079C2D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 04:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237568AbjILC2g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 22:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237596AbjILC2J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 22:28:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A61813425E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 18:52:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7139CC116D2;
        Mon, 11 Sep 2023 23:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694476638;
        bh=pou2z7nAab+CNoh4C4r/YVeK04dc5SYkmgaSpz+6kRE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Ccv6XsdXFfOWlx01Asz4v+bVRnbmfwMPO0qsJk2OuXF5iZuN4IunompKL+WQ+83bx
         2ZbJNVkwvgiD2xY310WCFi6TcVX/kI3IVAdL1PehJZwU+T4Hg0vw3bBIMU4Lxt1h9W
         jedWLJc1K5Iy7movTs5iqQTh16eP1LfcV8qIKjb8KOUe+x2chS4l+81txrsAJ2ph2b
         7gmvNlO0lfrD6fzLo8z3AQ4v6Pa1VS+8L2KNuWzQ/XkTeA/1EAcRlAPCv1zfQ7j/Zh
         +v2tLMlkN02xdwaWiIZGHejM4/O9ZS+033iRV1Tjtl5AuQ58NzbQ1+Sbqwrl2f6oTx
         8iD5IAYN30YlA==
From:   Mark Brown <broonie@kernel.org>
To:     James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
References: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: cs42xx8-i2c: Simplify probe()
Message-Id: <169447663509.2387538.11279382377590731249.b4-ty@kernel.org>
Date:   Tue, 12 Sep 2023 00:57:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 27 Aug 2023 09:09:31 +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42xx8-i2c: Simplify probe()
      commit: ad191992330cfeb80ba341d1e75d9fe2719ced68

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

