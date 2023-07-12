Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2167504C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jul 2023 12:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjGLKgn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jul 2023 06:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbjGLKgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2023 06:36:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3002213C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2023 03:36:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F7FF61727
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2023 10:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B0CC433C9;
        Wed, 12 Jul 2023 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689158151;
        bh=INdFQfgIyhiR16pfnEfxc5l33JhDxIjOcb4/GfrG67o=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Wk4W+NmhMNlQFyqga/owzrGNGl80fdqoJhfhaMaCpmusBMRoJGOTmlzR7L/ByOkGw
         qtJs7ygl1psnml4vwLH1KKwkwEtMPG/dw9pJBw53xjCwivcDek1pPUCWpO9z5YouVc
         P86ZCqFqe+/bvHlITFwW/yqLoyvywGMzww06Pf1l1Q4nNTFyflTs6hV8c2yW0LXbBz
         ftnxMeCIZGdD3VuGQhRyKcedzymZ5IFGW8Z9GBpAo3SExp8LxhvbAR2/JlM+Dhg8gH
         m44Afp/hF5mVF2ErCneaGUb5wa6yripZlGYRoGeSxjdsBlWzQUuHI7rRkRfVsuyQE7
         2fsYThsmNjlCg==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
In-Reply-To: <20230629104200.102663-1-biju.das.jz@bp.renesas.com>
References: <20230629104200.102663-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] regulator: raa215300: Change the scope of the
 variables {clkin_name, xin_name}
Message-Id: <168915814931.10612.166602938872042440.b4-ty@kernel.org>
Date:   Wed, 12 Jul 2023 11:35:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 29 Jun 2023 11:42:00 +0100, Biju Das wrote:
> Change the scope of the variables {clkin_name, xin_name} from global->local
> to fix the below warning.
> 
> drivers/regulator/raa215300.c:42:12: sparse: sparse: symbol 'xin_name' was
> not declared. Should it be static?
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: raa215300: Change the scope of the variables {clkin_name, xin_name}
      commit: 42a95739c5bc4d7a6e93a43117e9283598ba2287

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

