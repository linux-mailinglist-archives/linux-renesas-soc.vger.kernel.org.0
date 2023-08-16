Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00F077E762
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Aug 2023 19:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345141AbjHPRPE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Aug 2023 13:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345137AbjHPROd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 13:14:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF2A10F0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 10:14:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E590062232
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 17:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423A1C433C8;
        Wed, 16 Aug 2023 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692206071;
        bh=F4cUJzysrXK5YoMFqnu2TIAQEvB0qEY6QIpk+2dm0ag=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=iJ3i8Na1fhrHrajaT78qwMBInrX0BBRxRNKxNOIfkg46HcJaKeOSWhxfXo+isr1rA
         a6yV+dHuLWUsX1JRp1b0vP3K0fAzN4cAuB+8DjgZ7TjVWlfWLUZdDMzsVshraUGw4x
         BNeKqIeN4gB8/1u9yl/W7+RSaq0SPSVeK2GSn9ufeCZVdnFzaiTRgOjnqSzlEcdbXT
         qnRdPJ6zix1rEqa3E8SecI8VmOf1nvZV3dLrgdMTs01LsOqE7MzZmX2pU13APMbaoD
         RyJaxKKEudzmYyctzNgxnh4hn7ll5AjgQ/shaAEfwgMqyKnq3QBDxpbSl9ebI0AxeG
         4mm2l40kqlpTQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230816135550.146657-1-biju.das.jz@bp.renesas.com>
References: <20230816135550.146657-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 0/2] RAA215300 regulator driver improvements
Message-Id: <169220606998.909854.15877882074805656913.b4-ty@kernel.org>
Date:   Wed, 16 Aug 2023 18:14:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Aug 2023 14:55:48 +0100, Biju Das wrote:
> This patch series aims to fix a resource leak in probe() and adding
> const definition to local variable 'name'.
> 
> Biju Das (2):
>   regulator: raa215300: Fix resource leak in case of error
>   regulator: raa215300: Add const definition
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: raa215300: Fix resource leak in case of error
      commit: e21ac64e669e960688e79bf5babeed63132dac8a
[2/2] regulator: raa215300: Add const definition
      commit: 727d7c1c3695657873d62030b968ba97c8698c54

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

