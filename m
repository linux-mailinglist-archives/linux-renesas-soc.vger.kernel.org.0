Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416DB79C23D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 04:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236783AbjILCIC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 22:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237122AbjILCCA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 22:02:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B06E1A399D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 18:32:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0C7C32780;
        Mon, 11 Sep 2023 23:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694476684;
        bh=0+c0m9bIhTjyR9NC8aDZ7VvTmYfV1AOLjkXBUGGUnsk=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=G88ylTl9eD7e3JXrf9c5Ipug2oxAdcuVQjuXfxKLKmGKy3bpFIQeu6aiZkctIPFHv
         mzY2ZJJLWQfrSz2nxmTzR+KXeEaCHVKv5LoOTl0lApovHnvpIjpAMJXAJAAvLY/OOW
         BIVcWMoAmecfyiA4gmADutlRA+wHN282WUJvEWuuMXrvYaZi6TpzW/sLo5dTgAufpv
         MGW1rBmd/8Yu5UesqkYI2GfnZeFwYNYlKW8ka0F7vdC/FpLtC9ogbeKy5Hv6354TLk
         xJTcSJOvBfDOcvb1YwKbjtDRzjLoNi+Hv8C6+RZ1OY4ptufWlwxfoGboj1lZhE4P0P
         spqLTlCOQNtgQ==
From:   Mark Brown <broonie@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230826165316.77949-1-biju.das.jz@bp.renesas.com>
References: <20230826165316.77949-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] regulator: max20086: Make similar OF and ID table
Message-Id: <169447668200.2387765.14400768002754011105.b4-ty@kernel.org>
Date:   Tue, 12 Sep 2023 00:58:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 26 Aug 2023 17:53:16 +0100, Biju Das wrote:
> Make similar OF and ID table to extend support for ID match using
> i2c_match_data(). Currently it works only for OF match tables as the
> driver_data is wrong for ID match.
> 
> While at it, drop blank lines before MODULE_DEVICE_TABLE*.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: max20086: Make similar OF and ID table
      commit: 9d9cd8e6a4572efa328ef72a83bbc78a39deca37

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

