Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F2B3C5B08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 13:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbhGLKvQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 06:51:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:36144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234804AbhGLKu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 06:50:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 532BC61156;
        Mon, 12 Jul 2021 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626086890;
        bh=Q0LmCKQCfSGQOND5wXq1ayQltdByrVvEHp3u5Nb9hAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OjzSBlw+Jag83c6fTsDidspwoNOir2H7BVY60natVm45ehitMnbfA9ZABVDFbMXpY
         XGsJfr/pUB31vykZ5C23N+q2TodcsoILwlrkDApoRPl7zFEt/S38c1ry1ClRzG8v6o
         8Oyr/1ZbW6z4c9K2x2jDbg3wEPAeRpfX9Mc5OoqY+/XNwV1mvPYHebYXnHFp1KCecR
         PT0VltXhuY585NBM1J5m6pWWkZoCMs0i4HIVKBYUmOl10Jq88YzlQkHYcFJrKOOsgP
         /zORv7l+m6RyZR+Qlt8+y2mdPohY5sHHO+hTyiPfE+6w7DksfsqM/4CeLOph6nXMRv
         arjYtGoWdIxdA==
From:   Mark Brown <broonie@kernel.org>
To:     alsa-devel@alsa-project.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH RFC] ASoC: sh: rcar: dma: : use proper DMAENGINE API for termination
Date:   Mon, 12 Jul 2021 11:46:09 +0100
Message-Id: <162608623151.3192.11307653106365626153.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
References: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Jun 2021 12:05:45 +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rcar: dma: : use proper DMAENGINE API for termination
      commit: d5bb69dc54ec1e09f3fd626fdb9c340c0511dbd5

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
