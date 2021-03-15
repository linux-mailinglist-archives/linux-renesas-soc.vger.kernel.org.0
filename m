Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2872133C2E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 17:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbhCOQ6s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 12:58:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:58928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234688AbhCOQ6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 12:58:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3306464F33;
        Mon, 15 Mar 2021 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615827504;
        bh=s5rgpSxnuIUuM/NC/umTECT+sHUHQPMB1mMDx31988M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F45mpRhqgT16Jp+PZF7OgjUuqjwRVATzTwfhxUa8uG3mHlTSHcrfZyQ/apV57Mz3H
         oIkI90SM2EDwzHbWdo64KZhfdx1CGNK9Zkg4GEPcupBNyNzlewkS8Y8xSBH3uvBPkS
         hRGi3me332HWT7htmU1XaSMyRO3nR3getXYBM5i6+5Smc6qXhpTys261WSICUNFsRb
         g/MN9P9mM2ZRP1Ct2H1Enbbma5C55fD+nAibmION/LgXbAkO7EEdf7oYEBI0nnaxHv
         Isyrz92aBZrsBhBO+TNobQfhrMZXI5ltHxWAYHJ/ZLy20Q7xvyLb64mp1pL807fDOa
         fNl6FcEA3xsAQ==
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] regulator: bd9571mwv: Miscellaneous fixes and improvements
Date:   Mon, 15 Mar 2021 16:57:04 +0000
Message-Id: <161582739233.20279.12170851873434705801.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312130242.3390038-1-geert+renesas@glider.be>
References: <20210312130242.3390038-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 12 Mar 2021 14:02:39 +0100, Geert Uytterhoeven wrote:
> *** BLURB HERE ***
> 
> Geert Uytterhoeven (3):
>   regulator: bd9571mwv: Fix AVS and DVFS voltage range
>   regulator: bd9571mwv: Fix regulator name printed on registration
>     failure
>   regulator: bd9571mwv: Convert device attribute to sysfs_emit()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: bd9571mwv: Fix AVS and DVFS voltage range
      commit: 3b6e7088afc919f5b52e4d2de8501ad34d35b09b
[2/3] regulator: bd9571mwv: Fix regulator name printed on registration failure
      commit: 9cbc23f7d51fb0b1363bdfdd0b770aa7b5982f2f
[3/3] regulator: bd9571mwv: Convert device attribute to sysfs_emit()
      commit: 1deceabbdc0dd3162def1e26acb2e57a93275909

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
