Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2563AF566
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 20:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhFUSs7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 14:48:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231697AbhFUSs5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 14:48:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0E54613BA;
        Mon, 21 Jun 2021 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624301203;
        bh=X/ClhhQjPACHHgoMNY+nkLUtScPSYLJ2zHhz5iVcXOo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vCV4E0ALII2XS7jS765GEtwyCJ4LNVJ/+h4ll/kJ95EqPVwPj2/IV/rs8LxRw0v9m
         UhyzesrmpsPxhjED1FiTTZ9RlF6AV1Xn/p+a8zxMPqTrOeRuosXmlwx38Co1Sy+DLV
         snDiy0TXv6KitKDivb9xaMF7UhuYpLHFqlQoqnUFea6GceWW38vUVWT232yj7kzk67
         aTd/zH8VRosFqJ0bMU5l6UAnM7fyQmYCpGTOHSeZQzGI3/OmNBZ9Dy5Hfg88TvxIDv
         7bsN48LLBxDuGJjPjL6bxnrBuijxuxAZKNXr4RIC9i891O+iTfDZYXoMvmyreItRev
         TDTVD+1H2H4CQ==
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-power@fi.rohmeurope.com, devicetree@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 0/7] Extend regulator notification support
Date:   Mon, 21 Jun 2021 19:45:54 +0100
Message-Id: <162430087045.9551.18236317326534579661.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 6 Apr 2021 14:18:04 +0300, Matti Vaittinen wrote:
> Extend regulator notification support
> 
> This series extends the regulator notification and error flag support. Initial
> discussion on the topic can be found here:
> https://lore.kernel.org/lkml/6046836e22b8252983f08d5621c35ececb97820d.camel@fi.rohmeurope.com/
> 
> This series is built on top of the BD9576MUF support patch series v9
> which is currently in MFD tree at immutable branch ib-mfd-watchdog-5.13
> https://lore.kernel.org/lkml/cover.1615219345.git.matti.vaittinen@fi.rohmeurope.com/
> (The series should apply without those patches but there is compile time
> dependency to definitions brought in at the last patch of the BD9576
> series. This should be Ok though as there is a Kconfig dependency in
> BD9576 regulator driver)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/7] dt_bindings: Add protection limit properties
      commit: 673e851b7da81256e73fb738c550ec39bac1c9ff
[2/7] regulator: add warning flags
      commit: e6c3092d43faf0aa095160cc552f8c05490d0962
[3/7] regulator: IRQ based event/error notification helpers
      commit: 7111c6d1b31b42c8c758f6681e895a5116e3bad6
[4/7] regulator: add property parsing and callbacks to set protection limits
      commit: 89a6a5e56c8248a077d12424a1383a6b18ea840b
[5/7] dt-bindings: regulator: bd9576 add FET ON-resistance for OCW
      commit: 627793e4ca4f511837de893545baf0e1b8174dc2
[6/7] regulator: bd9576: Support error reporting
      commit: e7bf1fa58c46db9f72220c4472272d6da0a54c91
[7/7] regulator: bd9576: Fix the driver name in id table
      commit: e71e7d3df7eb712fc29b609bd712a63d60b81b5f

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
