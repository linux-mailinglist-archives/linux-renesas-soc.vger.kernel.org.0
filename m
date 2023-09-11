Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A7379C393
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 05:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240471AbjILDCu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 23:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241026AbjILDCi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 23:02:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8883A1A4BD9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 18:32:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D597C4163D;
        Mon, 11 Sep 2023 23:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694476686;
        bh=TTfQYc+Hydqi5KI+pNsGlabzmpl/p3MdgVxaHvhSSg8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Bh4pBMw8ZC9Lm6+9zEtcAz+EvTNUvpIW3bPqgh+l1OV5HFTNPoRPZOc13+GEg1hBo
         aKpqUkFk3xCtw25EhHmMKSQoyBipPnv7BEe6y+Ortk86D3HMqgdHeomAwe+f/HpqM4
         1e3Ujmprhs6Vd0Vw+d4yJdWyiB4Ztj9tvBBnLrZ2fEJ6NxzxMS7Qr1aYXh/suCj72f
         xHPGAC6ViN3ysOTsYP7qZVpPldwq7rCsKPnhzPBGnHJnW/uU7cAAuGlCOHjAp7g9v1
         0tTQo/d3zoU+TdKiTSAZs11ppWP/se6xRvngBQXwlmAU+iLar7AfoyDYfGRkUL+06m
         bJ9CedQKm585g==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230826173841.91807-1-biju.das.jz@bp.renesas.com>
References: <20230826173841.91807-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] regulator: mp886x: Make similar OF and ID table
Message-Id: <169447668414.2387765.2805881082689120983.b4-ty@kernel.org>
Date:   Tue, 12 Sep 2023 00:58:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 26 Aug 2023 18:38:41 +0100, Biju Das wrote:
> Make similar OF and ID table to extend support for ID match using
> i2c_match_data(). Currently it works only for OF match tables as the
> driver_data is wrong for ID match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mp886x: Make similar OF and ID table
      commit: 9e38482cb562f03fe8d521a001d44eba176a9201

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

