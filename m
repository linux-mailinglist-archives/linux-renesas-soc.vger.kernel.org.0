Return-Path: <linux-renesas-soc+bounces-13562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7980AA41C5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 12:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85DC31896E89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 11:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A8E25D54C;
	Mon, 24 Feb 2025 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHPqzTl3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EBC25D540;
	Mon, 24 Feb 2025 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740395828; cv=none; b=jNFJmHO4swtyGZbssQs+iqmxZuoObbw3iN9hjcMTQtUDGIWwVufkpFHcnB8m52s+wW5X/XuEklFNTtA1J9vzakSsD/MA5KGR5ZQdtvmDjPsHOFNzVGjwrkaqRjz2/RaskQ6cqXSBh8Sh3x1Ku0d7yv9h01xiBhQXdIJNF1991Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740395828; c=relaxed/simple;
	bh=dNIlM7cMUgFPTs5GYlOyc9Yd/V8vgzxfjrw+QHMbylQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TE16LZOdHr1csac/FYzoPiA8OjhG2o/s9vk5tKhYy2jD7CfFFPvwlVL6neAMmQq0fEytgI2/uBoGUBMIHVg2voUfyvHMGRCBDhniGF0fuzZVbfF23fBPEtcJ0JMIkBDc4K63gZz2woxWllem07lMMgeUnh5ZepbkXpoCUTi7sXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHPqzTl3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096F4C4CED6;
	Mon, 24 Feb 2025 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740395828;
	bh=dNIlM7cMUgFPTs5GYlOyc9Yd/V8vgzxfjrw+QHMbylQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hHPqzTl3/trDIaeaG97neHxtAJV82JNJXXH9mCdjPKwfic2xd7RVnBI1XApM4xwvT
	 vCXTlRdg+f68qT/bTN2Mf/TnQur2UnZNHTb0dm4V/9wFBqBUcsRa2WLHa9/jyEXSyH
	 sCE0ZndaR2IQIiVCcVzm0cwRoG/0C453BKyd3NMvlxfEsOdsNxO2HDv103GT8BIiRy
	 MA908D67E+7BBjVbrqSJPoWiOZnMFyMHoDhzzniJmd0KSSMdYzieScgkT3zh6D029S
	 tjAP26c5v7yKILZz3/tnH8a7XQH/o0dreaCc7mrj0ZxlEPFGnHXkRBH51IzJip8wuq
	 Fvyj4BY8J4C+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 10/32] ASoC: rsnd: indicate unsupported clock rate
Date: Mon, 24 Feb 2025 06:16:16 -0500
Message-Id: <20250224111638.2212832-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224111638.2212832-1-sashal@kernel.org>
References: <20250224111638.2212832-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.4
Content-Transfer-Encoding: 8bit

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit 796106e29e5df6cd4b4e2b51262a8a19e9fa0625 ]

It will indicate "unsupported clock rate" when setup clock failed.
But it is unclear what kind of rate was failed. Indicate it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Link: https://patch.msgid.link/874j192qej.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/renesas/rcar/ssi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index b3d4e8ae07eff..0c6424a1fcac0 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -336,7 +336,8 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
 	return 0;
 
 rate_err:
-	dev_err(dev, "unsupported clock rate\n");
+	dev_err(dev, "unsupported clock rate (%d)\n", rate);
+
 	return ret;
 }
 
-- 
2.39.5


