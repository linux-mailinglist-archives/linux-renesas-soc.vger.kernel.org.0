Return-Path: <linux-renesas-soc+bounces-18463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A31CCADD46B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9583E1946BD3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B232EE5E4;
	Tue, 17 Jun 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Io3w9Uv6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B1B2ECE99;
	Tue, 17 Jun 2025 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175882; cv=none; b=Rq6wQS/nu1MRQFUnjWWU0CIBOUr2eer8azHGgjvwkoDSHcQ66e+1dUJMSU3QVFP+gb0XqXXIZkyiGWydsyyeNa83VmsOiFKrLJnp389ZocekV3Hi6vmJ5a7VuaK6Em/h/zFTjo5d/F9LnQJdjvyV9uv3BkQfsdqsaEBMuOzCjk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175882; c=relaxed/simple;
	bh=SffMIIFbr7xI/iF/n2eCRR6ijDsf2+ugvTClsReolMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGPg7hbBld5m0ykSA0csWQk3obMzqUzAk6r7TkNUbweVmkIcXpZp8sFUmgq445wQclDPy7Rh1+crccoxm0sh53xR+aixKNrWihkc3jfBAPoFITWUsxQzXG/Sr/4rNGZ4NGstCSiKg60W1hY+nzqrYNFiZMTB/ATTxLZsqOiecQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Io3w9Uv6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ce671a08so37400365e9.3;
        Tue, 17 Jun 2025 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750175879; x=1750780679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJJNLvFYXH8jXiom8tinXa8ZRDeIOxc/CjQYop7JDbc=;
        b=Io3w9Uv65yn2DGfSGuJxHRiIaz0bkAxWp7WGRyRgFsYJnRJklcgrwdfd89FfoxQ2og
         zsE6+mU09PIZAw7pTKd976EoIb7A6/1LtM7hwzNf5u5e4QaX3Bs5epfWZ/cABVSA+y7R
         BZeO4TncU2BWVDdwl8yU741kxTNiiezqTQllXl4oOWwJEnZsEqZMyo7vtGY7DETGkS7e
         Xvy6kSUgPXWSUTGHX3HSFto3ROs8Pfb2R3PN1cQYka1vsVmBv/ti8x7zufm/tOmh+ycd
         Y0eZPzUz4BhYcHHtViU/eXSwnFZqVVFBTs8bkK0klPeFyC0eiZD5Ueen1wACmywWytqX
         miNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175879; x=1750780679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJJNLvFYXH8jXiom8tinXa8ZRDeIOxc/CjQYop7JDbc=;
        b=er9M17ftnWdT2Mxq0hLO5VFyp6Bf7ApbB0YnENuZTmTcHMgBKZLEj1Tiw7l6ygMipG
         y0TTDAmJh+tNKBCG6ihUlR1hzaHNmQfVPFD8xcO83+E/gC0hKtLqu88NVJO+yQNKT0gb
         AgvE91f2XsytRUxt+r8QmIiG1iHQA+u37eKmce/MojOlCONLxL9dyYaWfxpNy9cDw3Io
         Q1fe2RahyQwYE/yZNBnrueV5SsAEWbxH+NfZ6TO7IAEvGEpMfaN3DxxiwgqcuQxENDSN
         vM+s25mmTdNHY2pDvaG5JIhnMvafWvUnQw05rcKdxrjZng+jl8WM8+srKlDQpC/S6ip+
         pEAw==
X-Forwarded-Encrypted: i=1; AJvYcCUlmw4gqOZhCfdXcARKMZXUnOXUw02n1c7uj9qAKmzcyADGWBgsWeeQ67hNs51bSA27bG5G7fKy6Wr2A1tJ@vger.kernel.org, AJvYcCVzyL8SAQnQH7F2zOphEOSTOm7C3VYg/TIGT2nNwBReEji8kGxgh861yiuY3bhwGLp5zFx8hb1F6nt1@vger.kernel.org, AJvYcCWDYBTbZnTHQbv4FzbMFjtpTptR2YdOBmrcD0fe0SzWi23meB6arZZsA0RHQCl+ufySaMtVcQTNYqqc@vger.kernel.org
X-Gm-Message-State: AOJu0YwD5tyDUXU9F157bqxdB5cLAhmjdQAPsSA5pxBSIGNCcqxJ+9/6
	OwRl6N7NWMjeGJke7LnK+Fpvil9z+mDoUqiQ6477qpAUlWVLkg/kiXiz
X-Gm-Gg: ASbGncsOLTbLGM9Rx2sW8aayR7zNeWxjWbrH45u6AoFWBd0KGPrRv3Rv6SbkjisHWP2
	2dSTeHmvRIQxlQNuYEt59BaXj6KHKBUJ+/skFFNNnvbA+E5fmxV9yt4QsXmwT8Tri0LCTU+OHuM
	kMuzgZjaC7qTE+8AukKOChERhsE/cz9QfZkhl76R6srzmskjZcn91zl6hZtMjHtIzefoXaFFa3n
	YkaHqvaMzy36KIRnZFmwychvgGPOXsB+uCUgh088Npna78sp8o17WsKR1UT4TrhcCSIP1z6N6Xz
	c6ItJ5niJe5vDD4xyTXJThYcGVi8ea3Ms7da5ZDO7e6m11Sxp441Lr5WPV/HBWn3ApqNXydCL0J
	1yHXO57MApTY=
X-Google-Smtp-Source: AGHT+IEHG+qH1Kc0aRWhRe2pFMGOtmXhNLQop3+1vD7jRkXX9/xcUoyibN9G6CU0imRTOunbvijpqw==
X-Received: by 2002:a05:600c:529b:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-4533caf5b1amr132980785e9.12.1750175879106;
        Tue, 17 Jun 2025 08:57:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a53f79sm14189115f8f.4.2025.06.17.08.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:57:58 -0700 (PDT)
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
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] Add CPG/MSSR support for RZ/N2H SoC
Date: Tue, 17 Jun 2025 16:57:53 +0100
Message-ID: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This series adds support for the Clock Generator, Module Standby, and
Software Reset (CPG/MSSR) found on the Renesas RZ/N2H (R9A09G087) SoC.
The implementation reuses the existing RZ/T2H (R9A09G077) CPG/MSSR
driver, as both SoCs share the same clock and reset architecture.

Note, Ive split the CPG/MMSR support into separate series previously
the patches were part of series [1].

[1] https://lore.kernel.org/all/20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v1->v2:
- Rebased on latest linux-next.
- Update commit messages for patches 1/4 and 4/4
- Patches 2/4 and 3/4 are new patches to add PCLKL core clock
- Added reviewed-by tags.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support
  dt-bindings: clock: renesas,r9a09g077: Add PCLKL core clock ID
  clk: renesas: r9a09g077-cpg: Add PCLKL core clock
  clk: renesas: Add CPG/MSSR support to RZ/N2H SoC

 .../bindings/clock/renesas,cpg-mssr.yaml      |  5 +++-
 drivers/clk/renesas/Kconfig                   |  5 ++++
 drivers/clk/renesas/Makefile                  |  1 +
 drivers/clk/renesas/r9a09g077-cpg.c           |  4 ++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  6 ++++
 .../clock/renesas,r9a09g077-cpg-mssr.h        |  1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        | 28 +++++++++++++++++++
 7 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h

-- 
2.49.0


