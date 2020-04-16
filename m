Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C271AC98A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 17:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634379AbgDPPYB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 11:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395169AbgDPPXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 11:23:53 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94D082223D;
        Thu, 16 Apr 2020 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587050632;
        bh=Je+2heqtyGCACjbnBaORL/Xoy6YXSNIeA0Bzvqh+r0I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=A1plrI0CiY7wygNk+xkLmg0J7xuhkzanqdyTTy13LCBwUjBgc1NflzkDgtopydN9N
         9EcDMLvqW3jFHs95xOT2tdqptSMTyh8V0DBnkyFs6Ovh/+ofR14l8TrL0afEVocE8z
         5sU5CmXqAlG+BFI9yWSzLNHcZ/PhbnIC6lJpx/go=
Date:   Thu, 16 Apr 2020 16:23:49 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matthias Blankertz <matthias.blankertz@cetitec.com>
Cc:     alsa-devel@alsa-project.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode" to the asoc tree
In-Reply-To:  <20200415141017.384017-2-matthias.blankertz@cetitec.com>
Message-Id:  <applied-20200415141017.384017-2-matthias.blankertz@cetitec.com>
X-Patchwork-Hint: ignore
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From a09fb3f28a60ba3e928a1fa94b0456780800299d Mon Sep 17 00:00:00 2001
From: Matthias Blankertz <matthias.blankertz@cetitec.com>
Date: Wed, 15 Apr 2020 16:10:16 +0200
Subject: [PATCH] ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode

The parent SSI of a multi-SSI setup must be fully setup, started and
stopped since it is also part of the playback/capture setup. So only
skip the SSI (as per commit 203cdf51f288 ("ASoC: rsnd: SSI parent cares
SWSP bit") and commit 597b046f0d99 ("ASoC: rsnd: control SSICR::EN
correctly")) if the SSI is parent outside of a multi-SSI setup.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20200415141017.384017-2-matthias.blankertz@cetitec.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/ssi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index fc5d089868df..d51fb3a39448 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -407,7 +407,7 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 	 * We shouldn't exchange SWSP after running.
 	 * This means, parent needs to care it.
 	 */
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		goto init_end;
 
 	if (rsnd_io_is_play(io))
@@ -559,7 +559,7 @@ static int rsnd_ssi_start(struct rsnd_mod *mod,
 	 * EN is for data output.
 	 * SSI parent EN is not needed.
 	 */
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	ssi->cr_en = EN;
@@ -582,7 +582,7 @@ static int rsnd_ssi_stop(struct rsnd_mod *mod,
 	if (!rsnd_ssi_is_run_mods(mod, io))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	cr  =	ssi->cr_own	|
@@ -620,7 +620,7 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 	if (rsnd_is_gen1(priv))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	if (!rsnd_ssi_is_run_mods(mod, io))
-- 
2.20.1

