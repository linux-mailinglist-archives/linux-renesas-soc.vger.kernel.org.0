Return-Path: <linux-renesas-soc+bounces-23541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 778ADC037D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 23:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67DEE19C83A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8532741A6;
	Thu, 23 Oct 2025 21:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LptrfI3D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3E2652BD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253667; cv=none; b=m1wmWeoQo8EVnPJMUC5bGZsuoEwzdqwrtDfaqOlk1+EsJknC4vUS9iwMUB37WW+4RwnT0tj3xPgWyI9WHwftjM6kM0SPtM6Df3yhnum6Wm5d1b4vAI3fHedA+gpxfxcoOo/b66KLuPZWyJi8S+zoHXWqAXTRMM/onhcyFcAZDt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253667; c=relaxed/simple;
	bh=QswsVxb7CR7KAytVqgYUW39GsQhUVHWw83KELUyhChI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kr/L+VOs96OnhymAIRF3I3Lh3h48wbjp1hiozgaENm62xiGgrURKllERqxnY+yajEmZzeaBFKOXWvtKMmfeZ6m1q2xA6tVOicGhp3rghE03zfI/t3awYiViL/ep35hPrFoRcKrI4/nTO0VsiewZdnh9iUvSMiqwksTjtFNmWKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LptrfI3D; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-793021f348fso1238499b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253665; x=1761858465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pRCHPQhpenSm0p43Ve07VuUVPD9MPencJKGnmFr85ho=;
        b=LptrfI3DJU2B9m/LWQwUB+RcOK07enwCBBdMk2Hmp/mDNmqVjVtc506VcONj4QtO48
         EjkSWMDlZpGmYT8Kt6iuW3f2548qLzwCq4+ErdGtIo0VtLs2SFJAgJr3zbt+coROAGRv
         rFKhjyRUN145dytkMeoZuXJiV1DRCuKOfuYfUCelL09Wx+m8Zb4wb43zTIL2wGACcArm
         yCth4DVUWmDZJ9vwPYmgrtnybHJNSJtXjigi2L2jzUdLQU0jroM/Rgx1EVEdPNlrO3WB
         6eoAmqCw6Prdp8f3pt00yZV96rAtgVtm+9tBavdpqywM46YvuGZ0F8ycspIHWId3a+13
         +Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253665; x=1761858465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRCHPQhpenSm0p43Ve07VuUVPD9MPencJKGnmFr85ho=;
        b=XD8d6nelWBQ+3gMsuwOF8Mkb2iTo4UGItjCcRfCew/RZbDv+DMfmsOWwtPnKu6yIRG
         MBhgDRkJ+Dssl6eGG7kTV90smTDJXDKOvcTtOR/LTJ3OfHyg8u6cPJM5n0uIADMkVS9f
         rSZpYKXZ572Uh4kgp08BMNWM0f/Jhe2XMytpSXtpHMqQKhPd38UFgtFKqAiVzbVezpDp
         ue8LxYYCfcMvKxWERliaLCpu8R0ID9WdFCECJwtEay72QH7EfyVBkerXwjKHc+qvwjoK
         6FHkjx2O9kzJkEQkyuslfsBT2hAraAwT4UJ5FrH+nFbcoSmA9bjfFf2urj6xtmjwuoJL
         LgyA==
X-Gm-Message-State: AOJu0YxOVpdEMT3kEgjYR2qu7Z4uPWstD2p0nGjKzpZZ+JfZVMYBjd/4
	htbJ9nAY/83OA2PrXBv6vISj8BiSb/e0oJz1Zh/aSo6wcjtNRgO8si/f
X-Gm-Gg: ASbGncvsHfckdABEbIVKlmRx/+jr7Y1g5zl+ysppT34ItSdphzicAb4GtkbW1sLSA8Y
	4qhegEfv7/oCMMalFC0AKzAFAfUwXZ3BO2Xy6GxUn4iiLGuMA/EyjXgcfuukZwAQEiFOsdj+mA9
	vXgPeqLUgYIMYjaAggqr/kiXxL9NZSGhwgVpglTTNoGdC8/B9YqwmGdyQkO5p5UyGHKeYpSnieT
	WoId1/3V8JVJCuyCodk6q4yfVYvtc9pVeHhfEcXcDrkoOVCSmvrtOIQZ5aISomUOzhakNuuKaTE
	Unb20Bi08h6v+elTNb1CecJa8Ffx8vmmhTWmx5ArDU9p8x57Kb/ovEWIjH9RaSvleWqAaYBEEWr
	Xtl7UhFkMY/GtABwiYcFk56j+uMe+6QFIIdPb4t5L1aYnvpol7lL1xWQjovmyGTdj1sYyQ5VHlj
	IJeex9N6QGVoaIwrbYU5JoeefpiMaMuvFxdOoL7LZJ
X-Google-Smtp-Source: AGHT+IEC9IGbZpflD7H2AaKcdyAZ4qswSf16TABaK+UleDIIM56YdcbNkdDFASJD7aYBk8i1wn3Wnw==
X-Received: by 2002:a05:6a00:a15:b0:7a2:7964:64c0 with SMTP id d2e1a72fcca58-7a27964678amr4134281b3a.12.1761253664951;
        Thu, 23 Oct 2025 14:07:44 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb2fcasm3461246b3a.58.2025.10.23.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:07:43 -0700 (PDT)
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
Subject: [PATCH 0/3] clk: renesas: r9a09g056: Add DSI, CRU, ISP clock and reset support
Date: Thu, 23 Oct 2025 22:07:21 +0100
Message-ID: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds clock and reset support for the DSI, LCDC, PLLVDO,
CRU clocks, and ISP modules in the Renesas R9A09G056 SoC

Note, patch 1/3 is dependent on series [0].
[0] https://lore.kernel.org/all/20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  clk: renesas: r9a09g056: Add clocks and resets for DSI and LCDC
    modules
  clk: renesas: r9a09g056: Add support for PLLVDO, CRU clocks, and
    resets
  clk: renesas: r9a09g056: Add clock and reset entries for ISP

 drivers/clk/renesas/r9a09g056-cpg.c | 109 ++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

-- 
2.43.0


