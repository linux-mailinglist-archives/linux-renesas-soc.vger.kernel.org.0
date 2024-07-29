Return-Path: <linux-renesas-soc+bounces-7607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041D93FF75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 22:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 846011C2274C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83241154C0D;
	Mon, 29 Jul 2024 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuByZOAN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D66189F27;
	Mon, 29 Jul 2024 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284911; cv=none; b=H9NdH0r39izQIDTgrhJUkR2R/9xYjuFineGZ56/7vSI+mrWlXGpuhrfqAk09r9awJrm3dLzWLBxU3Qwsq9kLCsreqVMGFTM5hqofQwKqRqiYbpOcGAX7QagjxOFe9fhYDBVYHsQKBThh+i9IXxsMQDFesf17MpKUx44yuEK6NwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284911; c=relaxed/simple;
	bh=S7hvrf+9Paq/uhlTpuFZrrrwvEqHdkAAKsQXj61NzuI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kQ3rLi7PdjFElRxWEr2STJDR7u5xPAzbRTCRkUTn39SIORmtsYUAIo/nKmAHs7fqKI5d7NyGIa5J3s99idiTp95p1wrEkkzqLUTil6JQaawp7ejl7guXs7PYF7Y+YFoFKyVuX9SeMUbIlJ5/WjJ1Z6UhLW0Mvzgcm54BWfVIVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuByZOAN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so13376365e9.1;
        Mon, 29 Jul 2024 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722284908; x=1722889708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W285L47FymCa5B1MY1AIE9W3CgMuwpH/hLzuxYQVFR8=;
        b=RuByZOANP1ltJxsB6dJB26JDg+OHC6xNPuUIdW0ugZy7ALu8tUALXYPgStG+5wqp9P
         dimfxlA0KPO3f9Gx2UfqT730DRSMJA3/wRBE/DdOugxQf4eqXdJLcKysT5Vb5gKUcuc0
         lt9DsJ06dnqMtwEuBWBPC7/Mr9QMZRZwGipSZv/M03M8U1eK9xvEgVAf9eAvk/4Gpc3s
         +uYAsmoLmP9cxa/SAQDFWfbc82lF5Ruf6ct0eb2LybG3GNy54bfL5oSATau8TXp5F9bN
         bVdI1u/yfeKdkTZOXiWFX9BrOCqaaQW2VW04f+WHfM6KSPwZGZ1iGGRQ9p/XVsT/0Ari
         cddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284908; x=1722889708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W285L47FymCa5B1MY1AIE9W3CgMuwpH/hLzuxYQVFR8=;
        b=rKRPhbvk1dCDVIPMlqIwo3T8VbdM8A34/M2t81BWNJJoimjzjy3AzEyX3BXgs+XjF6
         JBeKDk/ffx4MkCEMz8i7CRIFG80ozXDvHrUpIvPTdK/Z4hUItzGLQpPrLfHa0pdRS73F
         fNjt8CPhpvZymmSlpcRtVJNtcNSJF+pbymxnb/ZCqIfUFCxJhf+p61w6zj1oXSkLkfgm
         rS6o34oYFceE0V6Of+30odad1lcbfPVCLCXrN9PtPwVcHKqQeQpHdRGekqrVSVI6XCnE
         Kk73BhJS1juptoWvyRPOEXunlAw7ith1LrXSgjssOLtAjg2OhuHWVb+rzXIpq2zntllW
         I7TA==
X-Forwarded-Encrypted: i=1; AJvYcCWvkJEcGqh9iTg/ULzEmfech2K9gzLaXAz52lrNCCMVG2PLy9U/T5gvxzVHdUneXlSGg7406DJMogNEFsT9Hptjypi4eo/N8btcEiKzhZeFAWWlI4bqjsCi9RumqwEvhJqfQtAiZJfoqk6Y4UZnlu2xf0l8LvsijfbdrjcIOLs9D95bVQ==
X-Gm-Message-State: AOJu0YxgmiKfGwB4C9WnM7B/SKfPAqrzEfq0y26qbe9uH63pq7yHqEN9
	9DcGkN6ie5nPXBIFEmHpEJ4+982z82bkyeqGorQ1LhbWrd8xfQW6
X-Google-Smtp-Source: AGHT+IG7DX+8vGSp1IdYAI7LCaAtmO5EJO4lzP9zDgbDSE/2BA6sGAhtL1/ioaanHmeuCpLuC3OP5A==
X-Received: by 2002:a05:600c:35d4:b0:428:b48:8eed with SMTP id 5b1f17b1804b1-42811e52248mr58321195e9.7.1722284907299;
        Mon, 29 Jul 2024 13:28:27 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:91c0:6bc7:8f80:c05e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280f484cdesm125478115e9.44.2024.07.29.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:28:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/3] Add CPG support for RZ/V2H(P) SoC
Date: Mon, 29 Jul 2024 21:26:42 +0100
Message-Id: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v4->v5
- Included RB tag form Geert for patchs 1/3 and 3/3
- Packed resets array
- Updated rzv2h_cpg_reset_xlate() to get index
- Dropped description for info member from struct rzv2h_cpg_priv

v3 -> v4
- Included RB tag form Krzysztof for patch 1/3
- Changed reset and clock values to hex
- Renamed __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ to
  __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__
- Dropped masking of parent clks with 0xffff
- Dropped storing mod clk id and now calculating it
  based on index and bit.
- Made parent to u16 in struct rzv2h_mod_clk
- Made a copy of resets array in struct rzv2h_cpg_priv
- Added a comment for core clocks in patch 3/3
- Made r9a09g057_mod_clks as __initconst
- Made r9a09g057_resets as __initconst
- Made r9a09g057_cpg_info as __initconst

v2 -> v3
- Dropped '|' for CPG description
- Dropped description for '#power-domain-cells' property
- Added 3 clock inputs for CPG
- Dropped label in example node
- Used 4 spaces for example node
- Renamed r9a09g057-cpg.h -> renesas,r9a09g057-cpg.h
- Merged adding renesas,r9a09g057-cpg.h in DT binding patch
- Updated commit message for patch 1/3
- Dropped num_hw_resets from struct rzv2h_cpg_priv
- Dropped range_check for module clocks
- Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
- Added support for critical module clocks with DEF_MOD_CRITICAL
- Added check for mon_index in rzv2h_mod_clock_endisable and
  rzv2h_mod_clock_is_enabled()
- Added CLK_PLLDTY
- Added core clocks sys_0_pclk and iotop_0_shclk
- Dropped r9a09g057_crit_mod_clks

v1 -> v2
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

Lad Prabhakar (3):
  dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
  clk: renesas: Add family-specific clock driver for RZ/V2H(P)
  clk: renesas: Add RZ/V2H(P) CPG driver

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  80 ++
 drivers/clk/renesas/Kconfig                   |   9 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r9a09g057-cpg.c           |  80 ++
 drivers/clk/renesas/rzv2h-cpg.c               | 689 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               | 151 ++++
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h |  21 +
 7 files changed, 1032 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g057-cpg.h

-- 
2.34.1


