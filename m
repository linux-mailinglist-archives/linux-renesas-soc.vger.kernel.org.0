Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3541879C23A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 04:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236280AbjILCIB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 22:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbjILCCA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 22:02:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138F01A39AC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 18:32:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A369C32784;
        Mon, 11 Sep 2023 23:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694476688;
        bh=yLfjITnpCs/yW9vn3BndJNOf3f64SOBt9CmCG9c8EzM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=mNIUe2p2WXmEFMGJ/1dC8fBMJEo2082EJSJd8tK4CtOfsumW37+56GtRp7MREGcOZ
         4jWboyxyJU594FkI2gBluhX3k5Rup3dbcr3+teaPkXUXJOGyfcwBc4hthUYnG+x919
         OZ6aZ/OmJs7fZYNCFLnKMJX+EYS6ff4BszGldXqLp6P7GxIhZgK4e3QouXqwfru1qv
         SdNtCrer7t4ckPzic8cMeXdIrBqp/UoerKHbI5KvgO8eOxMQS24WeXt1acU8xGvzqS
         YbcgkkvQQXtnTorMfkqwlBS9dupWXZPJZ5rQgbsPz9W/G/oC6wylWx0AEOrJdIwIde
         hD7OZj/VqgB+g==
From:   Mark Brown <broonie@kernel.org>
To:     Saravanan Sekar <sravanhome@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230826183020.102196-1-biju.das.jz@bp.renesas.com>
References: <20230826183020.102196-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] regulator: mp5416: Make similar OF and ID table
Message-Id: <169447668619.2387765.579748651400080545.b4-ty@kernel.org>
Date:   Tue, 12 Sep 2023 00:58:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 26 Aug 2023 19:30:20 +0100, Biju Das wrote:
> Make similar OF and ID table to extend support for ID match using
> i2c_match_data(). Currently it works only for OF match tables as the
> driver_data is wrong for ID match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mp5416: Make similar OF and ID table
      commit: 969b033a77a8fa59a5fe9320b371eadd4f4321a6

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

