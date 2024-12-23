Return-Path: <linux-renesas-soc+bounces-11694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF379FB3A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 18:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 436E718814DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 17:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18D51C4A17;
	Mon, 23 Dec 2024 17:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwEzdXrx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1551B87E8;
	Mon, 23 Dec 2024 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734975459; cv=none; b=KEptaZ4gbjShNGGiiIhmg4PHCa8+ZE7loPUWOBqdAa1UHnOyF73bm3aPc0BZbNuuP2favZA/uhORcYz6FvgZ3pO7cqspGU2lnU6KE8fAq4Zg7aMhFmHmROMtHJS8vO/zQeT81axinOXVI+11AlzBjArya8/NlUGgz/QHh6CraVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734975459; c=relaxed/simple;
	bh=AmF6nAv0bXPa5I6Jh6MAICJccMsxI8ckHYpkjOExBPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUhSGZNB4idvI5NWhinm2jXRwVJYWxFcMv12CFPM2zEbga73aUUwVCC498XQOjbpJOJc/veOZIQty9Tzd29oMU0g0kqWrWW1i7MlY47BhShmTcOQucmRAjjtvrgk0+jXgPMrlEuk9O1r8EIxQhtuyewbVeQbTMzp0C6xGyVrM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwEzdXrx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso3557753a91.1;
        Mon, 23 Dec 2024 09:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734975457; x=1735580257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/7g/GW0hPzWY98vSGFDAmW28zseJlXcN6Ajahq5D7c=;
        b=YwEzdXrx90G1fIZVDqkwbAK6llzPtRUw+6Jqi0RkWalACGoMwtoHniwAI3aUVRYlfv
         guVqNkhRqrrfe07zST86G1Rvg4DoZ1oPegV0Zc/wCkXy7jcyAIuiRwaGf++Mo0rEtKSw
         XpE4WGVl3aTuRCdOsY6wI3Km/hVuFnVgnEmYaxOFd63wCU3TNrLJjBjd/fcHiY2D/6Ga
         jRICf5vSLuzJhYUWoIAa9S+LQ4An36SocZXshyEtA0IT1DjBEBIKCER7z0I8lnWOlW8P
         gnSqndqJ9Ztp8KOmU+n/9drA049n1IHzPsZdxuLKDOOEOxbSHsZreMAAf60Mc2fmxk4B
         pKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734975457; x=1735580257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/7g/GW0hPzWY98vSGFDAmW28zseJlXcN6Ajahq5D7c=;
        b=LK5dHMUCPUVNgpmSJoTHsxF7ldhkYQvIo41KhisbgSFDr010Yvrl36Jaf43TbDzgRh
         TPecuEHJSi6V4KygS74S+pby6ogWxC14vqDoJDQ/LxbajXifCAldmO3wRcec9jngRAqb
         /mjVuSE4jg8uihaLpu8yhM92sOxUM4CeT0SOhF8hlS6Q1+KzW6MwTEHybLVGw/nzN5iy
         ekkpfT4oGCCjV7ovPHUTW1az2cQDTtbb6pVNHtCZF6SrbiDYfS/MDmPVUc5Xuvtq59XX
         nCVqyFf+5xGk4RHbrPaIa0tUaDXPo7NLod67DgXt9aMfzq/18LZnPoNyDipnvqEJ3osV
         OL/w==
X-Forwarded-Encrypted: i=1; AJvYcCU22VBsqpi8KI2vu4QyylA6iVVoSctbH3KYbb1vt4PE/dVRsl99W9ztSZsJyqqxqcxAM+tpnFYgd3w=@vger.kernel.org, AJvYcCVQEoRuMSZYO1+9CFwYPi7S1iqCx6bynzrHb3MNd1yRW2ORR1fjeyaEqZC/7mk24ycaDTqQtaxZ6x5eT62s@vger.kernel.org
X-Gm-Message-State: AOJu0YxABgb6bKMU6wUghcFkxBX/fGUbn0M/PMZqy/cd48YkMY1FMxEz
	cVzGnOHcMrdVFKLfiV0Zv6SbCOT2tHc8KNXIN+Y78Mm91lDFzZCT
X-Gm-Gg: ASbGncsoJhb7zuT0cdMS+wVHjqHoD/rS34571ECPNwP6rtEmm7e5rWBzi/jhKeyOiqU
	RtdnNuuFXu8+vg2BIIy5+T96H2iBdynKORvvsTR67kN0k+BJxmCc93+vNxCOxrhKldjSjsgv+Ot
	sADlMx/mh9kRjHns5Syn+wG6A0aSn5gBcBBhScz/kIwwrcAANT0QPm/BMXLNvlfO8T6ksDm5psI
	aiLV3rPtLVOZbtvyTEK9cD0OBQLBptR5wUxbHEwTSPBTQuAIcXL0o637+aI3/0+xa2T4Qpsx+pa
	MRSUvco=
X-Google-Smtp-Source: AGHT+IEz2OeVNHpiMzfidUYqdYxK4ezcj0YUQ6+M0TOZvXLZcSlcM3mCVPGQdcyjT1diXMPbvD2cUQ==
X-Received: by 2002:a17:90b:2c84:b0:2ee:8430:b831 with SMTP id 98e67ed59e1d1-2f452dfaf84mr19389213a91.2.1734975457307;
        Mon, 23 Dec 2024 09:37:37 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:689d:b086:b856:9280:38c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cec5sm10664032a91.7.2024.12.23.09.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 09:37:36 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/6] clk: renesas: r9a09g057: Add reset entry for SYS
Date: Mon, 23 Dec 2024 17:37:07 +0000
Message-ID: <20241223173708.384108-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the missing reset entry for the `SYS` module in the clock driver. The
corresponding core clock entry for `SYS` is already present.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- None
---
 drivers/clk/renesas/r9a09g057-cpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index a45b4020996b..7ef681dfcba5 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -220,6 +220,7 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
+	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
 	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
 	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
-- 
2.43.0


