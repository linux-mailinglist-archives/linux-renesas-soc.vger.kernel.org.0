Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982BA3EBB6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 19:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhHMR07 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 13:26:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:39196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232168AbhHMR05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 13:26:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BD0D60FC3;
        Fri, 13 Aug 2021 17:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628875590;
        bh=aOqBmh5sZWNm3xPDNpYuAmOxdQby4H5RHJySluzbP5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fWsazR2NAX1xidpKZN7MEQv9wH2vt03JKbTAz7XXy3fLrHBYA7nBD18r+ydeYhJv/
         HBiuMIx5K2viPzMRl8iTGt0lfbtaDUcrDzwCws+Qalq5189PIRhClu68R3zrWpCtNx
         8pxIifoLCVCQ7139bAnJ24ALaBrhE4LMzhDVH690GsKcJ2X7btNtTSTsAG6HCrxtE9
         bdUMLh54csiyk+m38cTkJh6aKYu0gih1n2H3g5JEHF2mKDduqFZtw3ahKWSZDMkIf1
         NivepE3Hjg4caSAhRKxcIogmcxROFEPvfQBXQsbt8tfL0m8ROYJDAU4DwqRO8DZhwB
         g/PWza4uVTN+w==
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 0/3] Add RZ/G2L Sound support
Date:   Fri, 13 Aug 2021 18:26:02 +0100
Message-Id: <162887455324.19744.6771563830810696575.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
References: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 13 Aug 2021 10:11:53 +0100, Biju Das wrote:
> This patch series aims to add ASoC support on RZ/G2L SoC's.
> 
> It is based on the work done by Chris Brandt for RZ/A ASoC driver.
> 
> v4->v5
>  * Moved validation of sample bits in hw_params
>  * Removed validation of frame bits as it is redundant
>  * split the rz_ssi_start_stop function into rz_ssi_start and rz_ssi_stop.
>  * remove the spin_lock around rz_ssi_stream_init.
>  * Updated dmas description and removed fixes as it is an enhancement
>    now.
>  * updated ssi_start functions with setting fifo thresholds
>    and ssi_stop function with cancel all dma txn.
> v3->v4:
>  * Updated the subject line as per style for the subsystem.
>  * Removed select SND_SIMPLE_CARD from Kconfig
>  * Added C++ comments for copyright and driver description.
>  * Moved validation of channels in hw_params
>  * removed asm issue reported by bot as well as Mark
>  * replaced master/slave macros with provider/consumer macros
>  * Improved locking and added more null pointer checks.
> v2->v3:
>  * Fixed the dependency on KCONFIG
>  * Merged the binding patch with dma feature added
>  * Updated dt binding example with encoded #dma-cells value.
>  * Improved Error handling in probe function
>  * Removed the passing legacy channel configuration parameters from
>    dmaengine_slave_config function
>  * started using dma_request_chan instead of deprecated
>    dma_request_slave_channel
>  * Removed SoC dtsi and config patches from this series. Will send it later.
> v1->v2:
>  * Rebased to latest rc kernel
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: sh: Add RZ/G2L SSIF-2 driver
      commit: 03e786bd43410fa93e5d2459f7a43e90ff0ae801
[2/3] ASoC: dt-bindings: renesas,rz-ssi: Update slave dma channel configuration parameter
      commit: bed0b1c1e88a27b76c74584128cadebc6fa58622
[3/3] ASoC: sh: rz-ssi: Add SSI DMAC support
      commit: 26ac471c5354583cf4fe0e42537a2c6b84d6d74e

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
