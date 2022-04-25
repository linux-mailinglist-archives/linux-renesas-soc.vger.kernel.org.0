Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BB550E722
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 19:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243935AbiDYR21 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 13:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243982AbiDYR1c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 13:27:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4020140E7D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 10:24:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CDF4561583
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 17:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F472C385A7;
        Mon, 25 Apr 2022 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650907467;
        bh=oYA/5qwVt2no/9pKCd4CNdLbo4ChI1dy6z3kzNC4xfw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=kAy0HdU/w0/d/I4tT+cLgSLNN16EMTMF2gTydmhfp+DmBu90/3CqAD2u/zHySvuwo
         6FMSAX1O/mYTprgb6Yb6kF5VtTU/fpaLDZnfv9RPxzs1SFBxSXbwzWfzOlP8rRlqI1
         0jGfpp+2MIcguiIX/CXyJK591EHuW7l2hYFO7iQjhgKP2XZCtAyA4/d5iXhKEVScqD
         /jEQV7OUaenrGgxKr4OA6zRiw5VgoNw1S5YypqDKEaR9ow5h3f6vw7K7gshzKcA3X+
         tnBmUe5bJnF4TsaFyPAckzEMQoQo+I+hk1pz19BE9OjjSfkUr784MBEwL3BIJUWkmY
         uSo62ManH0Cmw==
From:   Mark Brown <broonie@kernel.org>
To:     tiwai@suse.com, perex@perex.cz, biju.das.jz@bp.renesas.com
Cc:     geert+renesas@glider.be, lgirdwood@gmail.com,
        biju.das@bp.renesas.com, alsa-devel@alsa-project.org,
        Chris.Paterson2@renesas.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20220423164443.146299-1-biju.das.jz@bp.renesas.com>
References: <20220423164443.146299-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: sh: Make SND_SOC_RZ depend on ARCH_RZG2L
Message-Id: <165090746497.583823.16541884820378976603.b4-ty@kernel.org>
Date:   Mon, 25 Apr 2022 18:24:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 23 Apr 2022 17:44:43 +0100, Biju Das wrote:
> The SSI block is identical on Renesas RZ/G2L, RZ/G2UL and RZ/V2L SoC's, so
> instead of adding dependency for each SoC's add dependency on ARCH_RZG2L.
> The ARCH_RZG2L config option is already selected by ARCH_R9A07G043,
> ARCH_R9A07G044 and ARCH_R9A07G054.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: Make SND_SOC_RZ depend on ARCH_RZG2L
      commit: cc691ba94cf8d6c586076ed489bb9d385a2650ad

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
