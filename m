Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2C43DBEAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 21:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhG3TEI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 15:04:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:45278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231124AbhG3TEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 15:04:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2917660F4B;
        Fri, 30 Jul 2021 19:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627671842;
        bh=zOGnjhKkN2kboqIf15L8awEjWTGdECV9Wk8eV4CT0iI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BWbMtYdr1e4orAi0AhIfLxTzTikGp6jegSZuSDY79Ug88WoJbJTgXZOgFD75pqzen
         KeI/xW62UgsaqAtaUcE7wWClivboGItXaLcb+aSBDA5/DRqOEGpf5Hf2rfKj2xRQQd
         M28VsvlYzTrqJFMOQ0wOIwUQj9cq6DSdC0+TcPTdVZgG3wsABDFACT2s8yAJRsL87C
         V0xTa08UQkpW3UhsZ0XaybeBiOeT+Ai7P06twznG13PwvCcmr9RqHnoELnlA0BuM5t
         8FGK5ymWlDXldBf8AVjdy8duPyxwF6UtWhK3LxzuaX+m+WjHdrQdgo2GNtFl0QlBhh
         BKL+F2SUREVfQ==
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
Date:   Fri, 30 Jul 2021 20:03:38 +0100
Message-Id: <162767143674.56427.1812897829636885311.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 19 Jul 2021 14:40:32 +0100, Biju Das wrote:
> This patch series aims to add ASoC support on RZ/G2L SoC's.
> 
> It is based on the work done by Chris Brandt for RZ/A ASoC driver.
> 
> Biju Das (8):
>   ASoC: dt-bindings: Document RZ/G2L bindings
>   sound: soc: sh: Add RZ/G2L SSIF-2 driver
>   arm64: dts: renesas: r9a07g044: Add external audio clock nodes
>   arm64: dts: renesas: r9a07g044: Add SSI support
>   arm64: defconfig: Enable ASoC sound support for RZ/G2L SoC
>   ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
>   sound: sh: rz-ssi: Add SSI DMAC support
>   arm64: dts: renesas: r9a07g044: Add SSI DMA support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: dt-bindings: Document RZ/G2L bindings
      commit: 2b761f476f3a6e0a212c8c88e7855f66edb177e0
[6/8] ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
      commit: 5df6dfbb6de815ba3a75c788a916865212fd5221

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
