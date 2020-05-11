Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563581CE18A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 19:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730864AbgEKRVn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 13:21:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:38570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730644AbgEKRVn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 13:21:43 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 905E720714;
        Mon, 11 May 2020 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589217703;
        bh=26/lzuyJSNJHTBq52yvxlizty5jVmHdqC8aFKJMIJ4A=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=fM/pMnS4gzd9iZKxQkSoxVmuFQ0w1GVe84fQ5VXA08+KkLxlZ+dl5rhZW2jJ3xqPV
         vDFQ72HmdVqkUWVsEDPGJWw0AdyGSnxWNaj4RI8qIywnvnPvmMTpuOKA3e6SngyWGA
         SBuNa4sqlawQAdWF+BWYEfpFjxQAnGALv13+JeOg=
Date:   Mon, 11 May 2020 18:21:40 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Yongbo Zhang <giraffesnn123@gmail.com>, lgirdwood@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chen Li <licheng0822@thundersoft.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200511100415.12502-1-giraffesnn123@gmail.com>
References: <20200511100415.12502-1-giraffesnn123@gmail.com>
Subject: Re: [PATCH v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-Id: <158921769452.22432.14661061075576126965.b4-ty@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 11 May 2020 18:04:15 +0800, Yongbo Zhang wrote:
> SSI BUSIF buffer is possible to overflow or underflow, especially in a
> hypervisor environment. If there is no interrupt support, it will eventually
> lead to errors in pcm data.
> This patch adds overflow and underflow interrupt support for SSI BUSIF buffer.
> 
> Reported-by: Chen Li <licheng0822@thundersoft.com>
> Signed-off-by: Yongbo Zhang <giraffesnn123@gmail.com>
> Tested-by: Chen Li <licheng0822@thundersoft.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> [...]

Applied to

   local tree spi/for-5.7

Thanks!

[1/1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
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
