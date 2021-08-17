Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB13B3EEE6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Aug 2021 16:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237740AbhHQOXl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Aug 2021 10:23:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:51318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237944AbhHQOXi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 10:23:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4269A60FA0;
        Tue, 17 Aug 2021 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629210185;
        bh=R6w9f3DNaAwvzEWdkV1n2SQA2vQEt45LORZO+y06V+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YS1wWj4ceAAMHWuKUcRLm/+Xv6lot2Q/PulxXhIz2h7O7QVICDLy2RJqo06zk8S69
         Rk/w7tT5t0nJza7q2zUV0rcZd/GKzfhnGVr263FhjVVFxhm9i9yD3op6r7qmpYwpPY
         NR0JoXcpafteup7W+7E6dxz1YETYvSpXFDxtfSt7NijgVwlkbIy9V4QP5rrM6Y1fje
         AQ5ifhgjg9yfv7s9hnAE/SZII1FZpg0ns2DBYdkhxMI/lkH5A4VejpTcBMZF0a+eg+
         Xw+4i37q0PVtyoNyCcY5dRew7E5qqtTj3++qefRudXmGx7IHWeZhuias2tiPtuczn9
         IFiIEt+Uy7f/g==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        alsa-devel@alsa-project.org,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH] ASoC: sh: rz-ssi: Fix wrong operator used issue
Date:   Tue, 17 Aug 2021 15:22:35 +0100
Message-Id: <162920984133.3104.6780936326749389022.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816182336.29959-1-biju.das.jz@bp.renesas.com>
References: <20210816182336.29959-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 16 Aug 2021 19:23:36 +0100, Biju Das wrote:
> Fix wrong operator used issue reported by Coverity by replacing |
> operator with & operator.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Fix wrong operator used issue
      commit: 1b5d1d3a2f77250707225509cadc17997bab4353

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
