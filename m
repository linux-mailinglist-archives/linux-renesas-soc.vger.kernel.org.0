Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189963EDBFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Aug 2021 19:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhHPRFi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Aug 2021 13:05:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:58106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229587AbhHPRFh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Aug 2021 13:05:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8055F60F39;
        Mon, 16 Aug 2021 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629133506;
        bh=+z3+YzSUEPziONpahSudSFlJvPXb7i6H++q1llwpzAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PHSvv0gy4WlvdLM6ttP4dohXm/C38wZ0kmv4SURd9IG6cK8zMfQ5KAmlub/AG0cC9
         RJkAMrV6OxsfKtzwD54DXXuyBlmyXgOTFjLdi3ukwxGKLotq/m56sTVmxrPnQCnKDc
         UHR6N/ry7IzOmE0pqnWuplPwh6b6rCMcmBl1gw1p13n+rvn+YT43YGf+UPxukLtZ55
         7OMrOzMHkaQnIr+HZER+savLsGyf+m5b68prk8TwUWVlyoHU4KZ0TiD8klrRS7POFl
         dCcIwk4py2SeMYJ69rSkXT5F1RG17sHZceHME3kerXZMaQXSaTY0VjoazjweehfQLv
         izI24H4/FDiqw==
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: sh: rz-ssi: Fix dereference of noderef expression warning
Date:   Mon, 16 Aug 2021 18:04:39 +0100
Message-Id: <162913223313.13582.16813599087905835194.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816132049.28128-1-biju.das.jz@bp.renesas.com>
References: <20210816132049.28128-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 16 Aug 2021 14:20:49 +0100, Biju Das wrote:
> Fix following sparse warning:
> sound/soc/sh/rz-ssi.c:156:15: sparse: warning: dereference of
> noderef expression
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Fix dereference of noderef expression warning
      commit: d40dfb860ad72a32b9c2aeae739a2725f8ce011a

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
