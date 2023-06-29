Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 127D7742408
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jun 2023 12:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbjF2Kd5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Jun 2023 06:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbjF2Kdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jun 2023 06:33:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F158170E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jun 2023 03:33:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3E9226150F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jun 2023 10:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D83EC433C8;
        Thu, 29 Jun 2023 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688034823;
        bh=fjDhLQK+C/4grlxb4JNVMVCRUNEmk1Uy+wQs3uV5VFA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=HrFk5jZqRwXOlRDLhSWfYriLTiylYxP+n1mvPeKIGZy2nmG0+4OLiljuO1ieKfYeh
         vzX5QTVWee2h/sI9PT7z6m0MoHpq2JsRhp9+Bo+S+fMMpNzYOokMbec8lgL1pj9Ius
         kRFaz9dy7WRIIYrFRbQNhnE4Jfg1dT4igNa3K7+YNj7gvDe/vFhxZCOUMxBlbGEtgv
         kqpBpA3lzhhnza093PbQEofXY+FRAljovFmwExGpr7jQMfCv0iktpfBWCKe8CoqsFZ
         lvBmqLpCgiOdWht8qFzt2DVIrQtHj5KRCOhQV0vZjHckHniw2YdbWvnkxfR3yY5O7G
         NpGx1bFolyZbQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
In-Reply-To: <20230628174004.63984-1-biju.das.jz@bp.renesas.com>
References: <20230628174004.63984-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] regulator: raa215300: Add build dependency with
 COMMON_CLK
Message-Id: <168803482217.25339.17631731264544434289.b4-ty@kernel.org>
Date:   Thu, 29 Jun 2023 11:33:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 28 Jun 2023 18:40:04 +0100, Biju Das wrote:
> The COMMON_CLK config is not enabled in some of the architectures.
> This causes build issues. Fix these issues by adding build dependency.
> 
> ERROR: modpost: "clk_unregister_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
> ERROR: modpost: "clk_register_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: raa215300: Add build dependency with COMMON_CLK
      commit: e9bd04e52d649c3cfd713b594c5db35cab03c42b

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

