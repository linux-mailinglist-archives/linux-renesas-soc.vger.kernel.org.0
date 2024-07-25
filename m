Return-Path: <linux-renesas-soc+bounces-7538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466893C91B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F03B284215
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CEB55898;
	Thu, 25 Jul 2024 19:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eQeqUQqB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D149654
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936972; cv=none; b=snnPShQa54ewnBeTYQ8POETg0sRm3OrdqOsWbu3wMRB9uqHsH5NAbLPOkCJERycxp4Yae2MZ6c5xWCizfjbqpB+eGWdzwriFHh+v4jXUXdz8CBbIydUJwB2mLGpKeEk0qGX84MPxITzQwSojuVykYwfqQlC5QYTCyi82fY7+Ce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936972; c=relaxed/simple;
	bh=dGvu/lzg9W4Ezj1kinEkBRpId06wazDtq8LOym9mDhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSswyOKoYQ5nzA1Bw6SbaZvwoBqv1q42DGNj2qDKgoe0nCSb4gsHmR7gyUPpWjXlKQR4c+hgxXDTL8kkp0YEQ5UBbS0Ehwrvg592nE8+frMgWUYf30T98YOwwvsq17ycOMJVJ4bzBR3N8Qh01PtdQWmj+WeBz61cURpaFAhDvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eQeqUQqB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=15WlEkMYnXsmWgFeIYtC8h73hwVQtv7LQENIW2/+GPE=; b=eQeqUQ
	qBWa3XZSl2zF8oSWLdBfNZUjohy456JR+U7Ut2jGya3rimfcEeXsphQwh6wRsW13
	57BykSwXe+8ia5/Ug7EKb8Zhr2FqTvHNBOMiFIZHomzOw61GhOJ0XHsvqcVmk2hn
	3lrySzGjhdicSwLr0Sw5z9sfhkui/LmV/hnKeTF7srzHQozHWZkXeAm1+mLDIgcI
	Ib3y4vSyTfSC4K6VPdKVdcPqCAn9BZ6KbQ692sUjYT8NBR9wNhKIM3c0RcXTdP8c
	3hSjGllx45Q+MbMCYYkMwNN+atNnPJpVydlvPY/WgHLvyW6UBDikerZ6DAbRtqKo
	kfMiRSGIuN9TJQyg==
Received: (qmail 3088312 invoked from network); 25 Jul 2024 21:49:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:49:28 +0200
X-UD-Smtp-Session: l3s3148p1@GXBPsRceoIgujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cong Dang <cong.dang.xn@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 2/6] clk: renesas: r8a779h0: Add TPU clock
Date: Thu, 25 Jul 2024 21:49:09 +0200
Message-ID: <20240725194906.14644-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clock used by the 16-Bit Timer Pulse Unit (TPU) on the
Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
[wsa: rebased]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index a9614d0c51ae..1f311206506d 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -209,6 +209,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("tmu2",		715,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("tmu3",		716,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("tmu4",		717,	R8A779H0_CLK_SASYNCPERD2),
+	DEF_MOD("tpu0",		718,	R8A779H0_CLK_SASYNCPERD4),
 	DEF_MOD("vin00",	730,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("vin01",	731,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("vin02",	800,	R8A779H0_CLK_S0D4_VIO),
-- 
2.43.0


