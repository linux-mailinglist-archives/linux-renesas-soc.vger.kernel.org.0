Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF069439BC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Oct 2021 18:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbhJYQmG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Oct 2021 12:42:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:46980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234023AbhJYQmF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Oct 2021 12:42:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 792B460EB9;
        Mon, 25 Oct 2021 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635179983;
        bh=n5jXr5DbnDX7GorTe71SFdt+WecgsSmfJCkOC7hSvO4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IlU/NnkLpjf3aJuwcvFtFhzJASA9jYZiovR5qFNPWI8oP/XdwIuHKayzi2xREU8Ec
         Rd9Fq0F6uHy1XK/ZjdSV32+lZzDPyVnMbjcstGjAOeGmjtWDKqtLGYKnJUX/92DAaC
         SPneeckGvnQiQDdvcnqvCswzimdDFW+axqpT033XJkrLuVd7Vcxa/57J5tVjwNGXvr
         HgJHApzEyLeDUeGmrZk7JFTQLwVmk/hwWTwwmT25WgiCGEv6g5WeBG5GyKb0LRImus
         kzbZl6jT30A4Qrb5cmIO27tD5Tdp5CSOudbISM+sOEcAcqbuLhBqYjJYJumqFj2C3u
         34tLvzZvh8uQw==
From:   Mark Brown <broonie@kernel.org>
To:     Adam Ford <aford173@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        patches@opensource.cirrus.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: wm8962: Convert to devm_clk_get_optional()
Date:   Mon, 25 Oct 2021 17:39:23 +0100
Message-Id: <163517996156.3558038.2022301808170066410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
References: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 18 Oct 2021 16:01:11 +0200, Geert Uytterhoeven wrote:
> Use the existing devm_clk_get_optional() helper instead of building a
> similar construct on top of devm_clk_get() that fails to handle all
> errors but -EPROBE_DEFER.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Convert to devm_clk_get_optional()
      commit: 044c114014435fa723e2a0540cb7ef55d2c812da

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
