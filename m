Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023B93F2085
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Aug 2021 21:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234849AbhHSTXR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Aug 2021 15:23:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:56990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233662AbhHSTXP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Aug 2021 15:23:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8AF060F39;
        Thu, 19 Aug 2021 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629400959;
        bh=5nD+NxhHJqubpk1hmDTlASfSl9wCtYPZQgvo9y0BqQ4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X7qpYVrZi9jpExJW+0EhR4myp+16GytmRKQ5pS0h7qBh2ulj6B+bibLMALhG+GA1D
         6GBChkCKmULVqOSkTXhIfLV59owoafNoQyxZrerc85XE73SXFjxmBJaqrLOxtXg+sq
         RA7DTbYt5CMafK9nisU5gsAtthp93Nn2qZ+wCIHhIYUzPsHek77C/+wn5MGUPRu7/K
         VTB0/+/0i3YOTXJqL/rO2hA/4qQdfXGE3u7MV/4mItIVvQ4oqqJsEpjg2WdakmSdVK
         MiR2nkpaSXOrz5yPXGnZa/zakYuD3ClJlEdHOL3SpMB7RfTT8ZRM+sJ3IqAPqcq0kE
         si0WTWlU7B6dg==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        alsa-devel@alsa-project.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_dma_request function
Date:   Thu, 19 Aug 2021 20:22:09 +0100
Message-Id: <162940023650.48070.12049950686133021944.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818101450.15948-1-biju.das.jz@bp.renesas.com>
References: <20210818101450.15948-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 18 Aug 2021 11:14:50 +0100, Biju Das wrote:
> dma_request_chan() returns error pointer in case of failures, but
> the rz_ssi_dma_request() checked for NULL pointer instead.
> 
> This patch fixes the issue by checking for ERR_PTR() instead of
> NULL and sets the DMA pointers to NULL in error case so that ssi
> can fallback to PIO mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_dma_request function
      commit: 4b14f17912052a6963580dfba04781cfe6ccba02

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
