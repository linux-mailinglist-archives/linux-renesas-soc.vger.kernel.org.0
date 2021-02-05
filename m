Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54475311221
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Feb 2021 21:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhBESf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Feb 2021 13:35:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:35702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233255AbhBESeA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Feb 2021 13:34:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2D1264FBB;
        Fri,  5 Feb 2021 20:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612556145;
        bh=qgY/DVuIqSludWLeA3R0K2D/h0Yt+L6hRa2j/mG7ovM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=JHNd0zi92Uv88DwkPWRe87CobScKHeKGVO7+dGg3kVNKeTOjx+YLRINqFRKnfog51
         lYN6iYzA/2/ivVyELn2U7gAnD+J51SQhvZcMPsgqLf/Jlo39BV1Xxp4rWZ0o5XakBT
         C2akIFP5EmLdIdf4QfoxT1iQriryfu6XT5d8/skqfheNX9JtNP480VLQMt6VcuQvhp
         E5lDJ896C0lLyljjqpsgo5cC0Fo2HNhAvtOZYU93ga9OrxxWmBbsDNEq2vCy/ZDVxU
         odY7UZOO1Git0+yg7qzvBw7u8tCrcXKF6JxQvs1Zg3gEo9x2bf/ptG6Nu3i1TxPQy4
         deKcZTojy26Zw==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20210204130022.1646427-1-geert+renesas@glider.be>
References: <20210204130022.1646427-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas, rsnd: Group tuples in playback/capture properties
Message-Id: <161255607745.56562.5489379179875398712.b4-ty@kernel.org>
Date:   Fri, 05 Feb 2021 20:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 4 Feb 2021 14:00:22 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "playback" and "capture" properties in sound device nodes should be
> grouped using angle brackets.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas, rsnd: Group tuples in playback/capture properties
      commit: f08c74a3b52d126d053c741b906ee1ca2a4f3568

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
