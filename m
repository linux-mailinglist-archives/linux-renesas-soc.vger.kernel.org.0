Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB3554071A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 19:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347439AbiFGRmT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 13:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347561AbiFGRl1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 13:41:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47E81269AF;
        Tue,  7 Jun 2022 10:34:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B4CE26157F;
        Tue,  7 Jun 2022 17:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE3EC34119;
        Tue,  7 Jun 2022 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654623217;
        bh=jE+fTdTyGSQbmvonPusKjQ2on8qK3eNevvuTh1iXRHY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=fIP0rg/oFWsqb87lByMhIKBEX/OTuJuLD6XKooujPKFlD7rweTSwbt0k2vu6lf3UW
         3KiliitW9RX+HSC6PyCbCB1dqfPt3e1vVUjW2HRvOWZK3p1eib3Jq77P63hWyFh0A0
         XW2eqkDF+bD/JTKCwCnuc1nxt1+1joTiBkpV5SKarHSM8WObPzQ9XtYVdzsIwW3VCU
         uv3kjq07d7W9o86F1MgmhEm8qS/2LqJqntFnDgpcYSP73x2AoYoTmLRuwlUsW1yzKZ
         HURfZF3gtsgHzfYpNTdwjpLY4ypZHyH7KhnmFwpdS6IlXZzEG7ho+ZVUDZN5q7TA4Z
         yDNAfSAx0YEVQ==
From:   Mark Brown <broonie@kernel.org>
To:     krzysztof.kozlowski+dt@linaro.org, biju.das.jz@bp.renesas.com,
        robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Chris.Paterson2@renesas.com,
        lgirdwood@gmail.com, krzysztof.kozlowski@linaro.org,
        alsa-devel@alsa-project.org, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com
In-Reply-To: <20220607124231.3248-1-biju.das.jz@bp.renesas.com>
References: <20220607124231.3248-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
Message-Id: <165462321448.3040195.10462732413429997703.b4-ty@kernel.org>
Date:   Tue, 07 Jun 2022 18:33:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 7 Jun 2022 13:42:31 +0100, Biju Das wrote:
> Document RZ/G2U2L SSI bindings. RZ/G2UL SSI is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rz-ssi" will be used as a fallback.
> 
> While at it add a '.' at the end of dmas description for the first cell.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
      commit: 71ba950f3b1f1468afc2f793ec52644602ebaf9b

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
