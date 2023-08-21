Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9ABB782B8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 16:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbjHUOV3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 10:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235864AbjHUOV2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 10:21:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD97EE9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 07:21:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E694F63962
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 14:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143ECC433CA;
        Mon, 21 Aug 2023 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692627635;
        bh=Mle48rbA9k2jCMtnCXM6m7ZFhN2toGIz5oxzwxYI1/c=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=saJlUtBQV8TdP5sq9YPJlvWpC+V7VC2z41T392M6mvuCZpsYn6+EcIqlkjepUEuOG
         W0T+BKoDyWJ6q8JRRsrQibXNMji/r4/Pzu4dmR8fZOOP+RRfM9pkyhUyK4ZENcxmT4
         PpKrO6Km8m+5OxrSuk32+FouKrJJj1dnqrAsrd8mNTS8agbwY4/B9+9HQUcuaCKUF0
         hdd9914VrbOtlH3ZyYevqpJvXmYT29TNj5NidB9pplutjOdNGUeiAP2XGcU7dR29R4
         88oW456Y9/uyEqoUG3HQQZpH4w/Fzzrwtgm//nr7BatRLfB3LkepZUimtj8L2qcKWQ
         c0uWZ/UWtJ3IQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230818141815.314197-1-biju.das.jz@bp.renesas.com>
References: <20230818141815.314197-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 0/3] trivial fixes for raa215300 driver
Message-Id: <169262763379.266290.6090018235862980506.b4-ty@kernel.org>
Date:   Mon, 21 Aug 2023 15:20:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 18 Aug 2023 15:18:12 +0100, Biju Das wrote:
> This patch series aims to add trivial fixes for raa215300 driver.
> These issues were reported by Pavel while backporting this patch
> to 6.1.y cip kernel[1].
> 
> [1] https://lore.kernel.org/all/ZN3%2FSjL50ls+3dnD@duo.ucw.cz/
> 
> v1->v2:
>  * Split Kconfig and add missing space for comment block as separate
>    patch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: raa215300: Change rate from 32000->32768
      commit: 5c1212a67e5838aca49707ef96be71612a72ab43
[2/3] regulator: raa215300: Add missing blank space
      commit: 6673fc98953231f5d85f780d3025ea95c7584683
[3/3] regulator: raa215300: Update help description
      commit: 8845252f6690e4fceca67f2bb7ee2920939d3ac5

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

