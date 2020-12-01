Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8A62CA4C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 15:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403886AbgLAOAJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Dec 2020 09:00:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403876AbgLAOAJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 09:00:09 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 769692086A;
        Tue,  1 Dec 2020 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606831166;
        bh=EWyVZ1R7HsT27442RKZA5Etb/yqhcmh1LoGbxLfyGJQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=cWVHbkd32O6lMTdMEIKFY55gH8HBi9eDqB/xVBxbITF096wuDiS2LBX41HhT7av31
         bl4CdHwppx0/sih/w85LkFbIgnikKs1GJcVlhAxYZCQlRQ0yF2dv7hL5CCaE8jWcX4
         1qV4LelHelwdK6ty075Mh6avKQXoyj28C2o/mtEw=
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        alsa-devel@alsa-project.org
In-Reply-To: <20201119125318.4066097-1-geert+renesas@glider.be>
References: <20201119125318.4066097-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
Message-Id: <160683107676.35139.8906151580229078441.b4-ty@kernel.org>
Date:   Tue, 01 Dec 2020 13:57:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 19 Nov 2020 13:53:18 +0100, Geert Uytterhoeven wrote:
> There is no reason to keep on using the __raw_{read,write}l() I/O
> accessors in Renesas ARM or SuperH driver code.  Switch to using the
> plain {read,write}l() I/O accessors, to have a chance that this works on
> big-endian.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsi: Stop using __raw_*() I/O accessors
      (no commit info)

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
