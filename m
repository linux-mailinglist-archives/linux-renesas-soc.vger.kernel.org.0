Return-Path: <linux-renesas-soc+bounces-23603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E33C09BD2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 18:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92398548D53
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 16:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA7D315D37;
	Sat, 25 Oct 2025 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSJj/2Ob"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C263305946;
	Sat, 25 Oct 2025 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409482; cv=none; b=N4wLwHEao3WAfOQtQKTvXInOPY4oLJpPHelyFqxC5K+24MAv966DKNqi+mzao4W+r4GD9ebArOPVzz6jqFhJ1IHPgclUPekLuIalilWltWGKr+PlDLG1p4b8S6lE8zHlSOPX69nyTOjd6q7/DaXG7YviprYCgEFHLbulL0pXA0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409482; c=relaxed/simple;
	bh=cDpqqZMbuH/zCYWcZBql0FBBAkpS2qZDHBt2YhZ9NFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYZoV02955a5N3cyeDREh6nbTLjMz/dsWZRYgTHuJr5QishIKB+FlUhKnNv4kp6wZMoqsmoKM67GL7u0XuL60jAxRzLvBmtT2vzKVUKPUCZ83FYm6lxKM7VWxV9p7Maa0tSoMaw5v2CVcnkOQiNaFaS9D9gNaKZ0ksZio3rabTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSJj/2Ob; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47875C4CEFB;
	Sat, 25 Oct 2025 16:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409482;
	bh=cDpqqZMbuH/zCYWcZBql0FBBAkpS2qZDHBt2YhZ9NFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hSJj/2ObLzjwvH/PGryu1VG+w+W4tjtxUy/OACaMrLn8+W02HBY/eFqqQrUvtl8a4
	 vCR2xben2fDvJXvUp1hjxpQj+ax32HFCYaejKIHfXVhMDoPGUHrNvcayo2MfFM8lKK
	 y7yyqIJERDbW5+mCVHw9UsmsaXilevvTsl+TbwPaf0mgLtqLuoDMahy3NIghmj3Lfz
	 VHIbjTQyBf+mNTIfxz+2Q1DGg2AOYAe9ns/+7vxIbUAC6Vv64Dqc9Npkp+Suxuh7JR
	 ftE6WDe4ADe70aJD6msYtZEmewKcBErivItMiBocL8+U7qkW5HKuK3Tar51LMEB0wK
	 nttTePxfRD0kA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] ASoC: renesas: msiof: add .symmetric_xxx on snd_soc_dai_driver
Date: Sat, 25 Oct 2025 11:59:34 -0400
Message-ID: <20251025160905.3857885-343-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit ab77fa5533e4d1dcfdd2711b9b1e166e4ed57dab ]

MSIOF TX/RX are sharing same clock. Adds .symmetric_xxx flags.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Link: https://patch.msgid.link/87a52jyuu6.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- MSIOF programs both TX and RX registers in one shot while a stream
  starts (`sound/soc/renesas/rcar/msiof.c:168`-
  `sound/soc/renesas/rcar/msiof.c:259`), and the in-file [NOTE-BOTH-
  SETTING] warns that touching those registers while the peer direction
  is active triggers hardware FSERRs. Without symmetry constraints, the
  second stream can request a different rate/width and the ALSA core
  will try to reconfigure the shared clock, recreating the FSERR
  condition that the driver is trying to avoid.
- Setting `.symmetric_rate`, `.symmetric_channels`, and
  `.symmetric_sample_bits` to `1` in the DAI driver (`sound/soc/renesas/
  rcar/msiof.c:395`-`sound/soc/renesas/rcar/msiof.c:398`) tells the core
  to force the late-starting stream to inherit the parameters already in
  use, preventing those invalid reconfigurations and the resulting
  DMA/FSERR failures that users encounter when running full-duplex with
  mismatched parameters.
- The fix is tiny, self-contained, and matches the documented hardware
  constraint; it only restricts configurations that never worked in
  practice because TX/RX share clocks and register programming, so
  regression risk is minimal.
- The fields being set have existed in the stable series since well
  before MSIOF support landed, so the patch applies cleanly without
  dependencies, and it comes with Tested-by coverage from Renesas
  hardware. Stable users with duplex workloads benefit directly from the
  enforced symmetry.

 sound/soc/renesas/rcar/msiof.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 36d31ab8ac6a5..7a9ecc73231a8 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -292,6 +292,9 @@ static struct snd_soc_dai_driver msiof_dai_driver = {
 		.channels_max	= 2,
 	},
 	.ops = &msiof_dai_ops,
+	.symmetric_rate		= 1,
+	.symmetric_channels	= 1,
+	.symmetric_sample_bits	= 1,
 };
 
 static struct snd_pcm_hardware msiof_pcm_hardware = {
-- 
2.51.0


