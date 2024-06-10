Return-Path: <linux-renesas-soc+bounces-6027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A41902C6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 01:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96678284C1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 23:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA445152189;
	Mon, 10 Jun 2024 23:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTfUTrBr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1C3C0C;
	Mon, 10 Jun 2024 23:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718062353; cv=none; b=q6b2nHXCnpnwgnObe7Ib5hb/IfCZfUG8e1OzxglGhpBm7/3xQkdiaWQW7MnpqDGc62LeWYRIGECQxk8XZQcAMcG0F/6HtgNPoo3YVI5Tlghh81A7NOhTAydSM5nnI+jy0AjmNoXKhabpn2oA7FOpClZ36rwia1ZEKbQazdVNHe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718062353; c=relaxed/simple;
	bh=uQqeXMrqY9jIY6Rwlu2dWwe8qTUS/JIRMkkk1O9hI/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EPt2IKiiz849guDDHj50mXiyW3mO6ulU+LMzTS100RohKc4iEAqiCHJN7tDLO1ocvuqAedbrFvFkijrMYLjnLk1H125kSEiO8T3Y0YCi/qDwymDuQrA7+mhVdx+/CWpxKxmrVRXkJQYMkS4XPVzsC8DV4sF6wA+uY9MSmxKwEFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTfUTrBr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so6731675e9.0;
        Mon, 10 Jun 2024 16:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718062350; x=1718667150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AtmGbALiQyWQp+92PG+UfrEgPA1Ooa3Ezx/gnPyCfis=;
        b=PTfUTrBrUdb92IGVRMN93O6l21RfIU4W2rXyfQSrF2F0+yG68AbJSQjoFW3bAZngEN
         X+94wceEcIOsk7pZgHYBSBM+G0UjcUv4np1VbbRn3It4/0l2pr0WsCeUKLw6IO3we2wO
         KT7RbHI6Rwi4uEB41nKcce3m4F48mEPAL8x1eV0FyowyRJpao3HOLArt17TLDSl1XsrR
         pwORG4zWKI6MjkyYTC/KWUxUPvQ9Ujv8zmbrYDkyPsK0rRq3HbUksWcJvOzll1FHAQFd
         y+DjzWRG09Zjp62mnnNF4bzytfLVZ81f/OOh0I/IEzfz0JImAvuU9cF2Ll73MWi3H5RV
         02gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718062350; x=1718667150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtmGbALiQyWQp+92PG+UfrEgPA1Ooa3Ezx/gnPyCfis=;
        b=LZJh6IWnDrlrkUWP8UH7uWQ8nyIhvFh4UZSa8V6j9TN19UaP75JGC7szNt5a1gvo4i
         7vaizrLa7zvvZoVkyE6OZ+GMyz21L3ctWfXSMCnfp5f4EkU5o9KT+0x3oDx19+hU95bn
         h+UsLxvFqVQuzv5wv0QGRjug7NpBtWTfTNXA0t7UsVN3nZxeG7+IHOKkUWJ2kVT7Mad5
         A95Pg+MAzFC62VmRQlk8vfWoUPq0gQRvrEQEoyo6UXuQ2ey5PBR7NsY+VWK9TMc3nVGv
         8MXN6jtT3+91Am/ZZRfP+LcztQXjIrvIr8uYYCMv7OkX5fRM/RW6BoQassfBcmancNgs
         wfAw==
X-Forwarded-Encrypted: i=1; AJvYcCWMfP9ZvpvFixcFYvffbJXhgFMMw/k7iiUJ5auVd/lfhCOiz1dGJx9u8hMAh7WsVUJj9THnTD+t6il8iBXNQeSA2L3Nrn9KxWo7aIkdD8zq6ii0Gd72nxlhkM0xziknKGBJ/BaoMa4X2SxMWQ/SRfpHlbOCXXveblza0ZDstZc3qtSRFg==
X-Gm-Message-State: AOJu0YwCVga0Ix0qAtNUewn66PYt1d876ZJsfBuWVGu4KX0c5cHXBqP+
	pvC7qTho6yOdTx0SAabH7Zc12pqAEe3ebnep+QTF/3XNCXWzG1tq
X-Google-Smtp-Source: AGHT+IGMCK9IHk80wAOrOg3oZafxcIdyswUQfOY+bDYmdRokib8LCYcLfKY8Ypb9kW7rqzvvoXN3XA==
X-Received: by 2002:a05:600c:1c16:b0:421:8445:4f8d with SMTP id 5b1f17b1804b1-421844556c5mr46414895e9.38.1718062349954;
        Mon, 10 Jun 2024 16:32:29 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:74ea:e666:238d:5e76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1efe9a74sm5447698f8f.104.2024.06.10.16.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:32:29 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 0/4] Add CPG support for RZ/V2H(P) SoC
Date: Tue, 11 Jun 2024 00:32:17 +0100
Message-Id: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add the CPG support for the Renesas
RZ/V2H(P) SoC.

Im sending this as an RFC as I have dropped the module clk macros to
avoid adding reserved macros and instead now using the combination of
register index and bits as unique number for clks and resets.

v1->RFC v2
- Updated commit message
- Updated description for binding as suggested by Geert
- Updated descriptions for clocks and resets property
- Renamed extal->qextal
- Updated '#power-domain-cells' value
- Dropped the module clocks and just added the core clocks
- Introduced family specific config option
- Now using register indexes for CLKON/CLKMON/RST/RSTMON
- Introduced PLL_CONF macro
- Dropped function pointer to get PLL_CLK1/2 offsets
- Added range check for core clks
- Dropped NULLified clocks check
- Dropped pll_clk1/clk2_offset
- Made r9a09g057_mod_clks/r9a09g057_resets as static const

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
  dt-bindings: clock: Add R9A09G057 core clocks
  clk: renesas: Add family-specific clock driver for RZ/V2H(P)
  clk: renesas: Add RZ/V2H(P) CPG driver

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  81 +++
 drivers/clk/renesas/Kconfig                   |   9 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r9a09g057-cpg.c           |  77 ++
 drivers/clk/renesas/rzv2h-cpg.c               | 676 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               | 164 +++++
 include/dt-bindings/clock/r9a09g057-cpg.h     |  21 +
 7 files changed, 1030 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h
 create mode 100644 include/dt-bindings/clock/r9a09g057-cpg.h

-- 
2.34.1


