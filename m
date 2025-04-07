Return-Path: <linux-renesas-soc+bounces-15502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4FDA7E767
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 850D53A6E39
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456912135BD;
	Mon,  7 Apr 2025 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDaKsgmF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC0F2135A9;
	Mon,  7 Apr 2025 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044740; cv=none; b=iSDd+KWZzsjykj/ytRsFxylJLPTZWC0JZRXpOHa7kcPQUzP0eWjjtBlSjbDfkKKIPKIusSQ/er9GaNU3v3c4CeSBIZxVqF9HkT6Aq9CMejqG9HbreXInkCPJ6lRjlRhDoAJNWLfhSKVPxLRsZ66+ZxCqF74fUfN3lYZbiFwv4Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044740; c=relaxed/simple;
	bh=41RAK/PzbSJJDlWMcrK4yXqZH/pZPx1BSbQRA1MhZF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FDG4zN77dQb2QOdWGJHnHdFT10Cr2zbHIqTzcMkGipY5cmFEXT9DVe13tua1iJ9SFM6/2Nud3xkDPNpibKP0NuvIwk1SkaxgfzqnSC+5pCBqUZjbceE9DlxQiZWTr+1BySAkxMhyvVoa5ZinESqwALP2/YijPqO+d/Nn2U/aGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDaKsgmF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so40673315e9.1;
        Mon, 07 Apr 2025 09:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044737; x=1744649537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIpSqr2uu8JlBAGebwei967jEMi50JhkF9JCVtklwJI=;
        b=SDaKsgmFReYniO4eVcGKmYzjoCxFt0d/UELNVy6r6kyCTFgW7VDjbHCPMVsgMCOlYN
         YnPaFYdxVu/LJ7HddhLReUy2xGZ9bTGS2eCb9OAMB9p7gKW0vbqEYUcbh/TXJ0EF0Zu9
         obounfC+qmauQLYdOXR0Kn/m/oE0SaTrcAFujlOPoAWWZGOSdOwMxMpdrozvh4BuPexg
         7ZsyG54tl4WaaU9TOrabNiML0quGIV7YHsISpDJ3Dx1T6ZmdtZdgRYjpdABTvls2nU0E
         yyC4Y7sV0VtpVrRie6dUac2RWMCVanerD6IdpBNod6fSWfzcxnM32VkC4egltJh6zV9B
         698w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044737; x=1744649537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIpSqr2uu8JlBAGebwei967jEMi50JhkF9JCVtklwJI=;
        b=miaJy/AW45iBNXFs79/QWdv2IyqyNC3iHjAgSdzlsTMn3xKsz43eSq7uPGUvvWLkvL
         fjLwlSmFMCT6vNjrh38LyK6qslDhlz8E/7G73dmjZeDDYuA3Kvh5nc2GlcwcDsoVuSXH
         poUlTwpnG2skUv36NzvFSQuBnuKgA19kW9p44Go5WyG4A1E2brj0XNeShQsLxR0BZBxT
         hrIPsctZmwFPhjfgXZQd38c3TJuDSfbP+i+MxbFlvao2aC6nm/QRWBrQafDdHnXMig/o
         BTD12qHGQkW0TjWKi0txwRMI9H3Q1OErk41VUb4mQNtyqFc2u7NAdS16mBq7HP5IPpim
         yYwA==
X-Forwarded-Encrypted: i=1; AJvYcCVOFbjvj7ia0l5giRz5oebogCwSklhAnedPvrfimHnLtxYbT/Lk0BPSFfoRGeFigC2wmOuHZIWSH3Ko@vger.kernel.org, AJvYcCWR1WBH0uRo9EVWUBftv3Ss6U1pBzE3CEciU16GdYOghnSOyLe6jSkBoQmPYlYn8tLgF2d3qV0ZvEXXXX0Y@vger.kernel.org, AJvYcCXN8qi59y2jlnUZeSr5mso6wu9R5+wi4Y6fyx9Z6ZpuEKe2i9mx3GwvQCc0AtKLHfyj8L7opQu2pvHh@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVIQkxlRyOIDPZm8bB4YczyAg8qadX6pizoAA3t6ohD261328
	NlFhEfJ+PkoRX7wXwzy4JhT5Q8zlNxcZFLVCCbPUwPgfjeeQ/mKk
X-Gm-Gg: ASbGncuzmgpGu6pgqJ+XVR1iLs8/9wCZLEMiEfjzTa1MvAaLHwU57nhUZKSx9ozwq0j
	2mLDrhugYAcqgI8DOed1F7C5hwfc4j/in+hE/l3Z+mO2ZoglHotmiI+d+gvKbKnp5SBK1JjwDsj
	wG50L42IWa7Q5txT5wT6g8lEssc88PAbE7AeAGk/s/d9a6g3QnFnXVqJVCklk+ZN57eqMfx61ZZ
	ioSBmJSRMqlK0bUXU35Xh5TXRQ+3iZU/NDidawYnh3ToOrFaIVoLQHV4AysyLEMx2uInzT7wJVR
	W5LZGiUHD8BzXxu9GBv9mK74VrmguXf/lBy85yk1XBeqhUPh6jvHsxCkXSy8NIOFt94kiw==
X-Google-Smtp-Source: AGHT+IF8WJpz44fOAIgAweLBW1W/MoUv5/v464NZGGVPtrubj96U87xoaQ34hl35kZVEtxeSlX87Fw==
X-Received: by 2002:a05:600c:4fc6:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43ee064009amr73363125e9.9.1744044736398;
        Mon, 07 Apr 2025 09:52:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/9] clk: renesas: rzv2h: Add clock and reset entries for USB2 and GBETH
Date: Mon,  7 Apr 2025 17:51:53 +0100
Message-ID: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series introduces enhancements and new features for the
Renesas RZ/V2H(P) family driver and R9A09G057 SoC specific clock drivers.
The changes include support for static mux clocks, static dividers,
support for ignoring monitoring bits for external clocks, and improved clock
state validation. Additionally, the series includes updates to device tree
bindings for USB2 PHY and GBETH PTP core clocks, as well as the
addition of clock and reset entries for USB2 and GBETH peripherals.

@Geert, Note I've squashed the below patch series [0] and [1] into a single
patch series to avoid conflicts. Patch [2] will be dropped from Biju's
patch series as this is now patch 3/9. Patches are based on the v6.15-rc1 +
renesas-drivers/renesas-clk-for-v6.16 branch.
[0] https://lore.kernel.org/all/20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/20250303110433.76576-3-biju.das.jz@bp.renesas.com/

v1->v2
- Added ack from Krzysztof for the dt-bindings patch.
- Merged the series into a single patch series
- Introduced DDIV_PACK_NO_RMW macro to support static dividers

Cheers,
Prabhakar

Biju Das (1):
  clk: renesas: rzv2h-cpg: Support static dividers without RMW

Lad Prabhakar (8):
  clk: renesas: rzv2h-cpg: Add support for static mux clocks
  clk: renesas: rzv2h-cpg: Add macro for defining static dividers
  clk: renesas: rzv2h-cpg: Use str_on_off() helper in
    rzv2h_mod_clock_endisable()
  clk: renesas: rzv2h-cpg: Use both CLK_ON and CLK_MON bits for clock
    state validation
  clk: renesas: rzv2h-cpg: Ignore monitoring CLK_MON bits for external
    clocks
  dt-bindings: clock: renesas,r9a09g057-cpg: Add USB2 PHY and GBETH PTP
    core clocks
  clk: renesas: r9a09g057: Add clock and reset entries for USB2
  clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1

 drivers/clk/renesas/r9a09g057-cpg.c           | 92 +++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.c               | 65 ++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               | 93 ++++++++++++++++++-
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h |  4 +
 4 files changed, 244 insertions(+), 10 deletions(-)

-- 
2.49.0


