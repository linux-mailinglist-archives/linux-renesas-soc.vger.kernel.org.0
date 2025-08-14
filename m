Return-Path: <linux-renesas-soc+bounces-20515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC37B265C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 14:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42BBF7BB930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 12:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6292F39C3;
	Thu, 14 Aug 2025 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cptbg7K/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67162318157;
	Thu, 14 Aug 2025 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175719; cv=none; b=IciNKB5cr2gRKtPFJPz5fHjNx9sPBYXp+/EF04khdfUvi0ZUCRD/k+8tyxYvsCo7MqR0lrOt/y/Q2jxzaEFgV9E1iOrz8hIm8OZef2REAZ58etV0Jgnad8830h1sVsqFzCS0hghYAVq1n5rud233x7DQ5KtfL27dYf6le8TF1kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175719; c=relaxed/simple;
	bh=qsEIxSoadRh7yIrxNFMagrWs/ueAEVrhFQQT4KDnfv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdS8CTa0M/N3Yd/TYDgyfcHGL/Cb8ZxBHm80Ggv4BD6yPU4di6TpcDiOjLrgTJO7mZ7dTCIAY4aKO2oAbOGIZgcqPbETOTe2HuqOXbHsSS8dDcO9Y+Mn51pfY/Z0C4dvv/EkPaW4f0Bh9bS5zVkU3yp0hetOE3BBbJqlPeHo94o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cptbg7K/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b005a3bso4287895e9.0;
        Thu, 14 Aug 2025 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755175716; x=1755780516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVy7tYLtXQbSkC4Emvjy88IQs7BjfVsb1Snv8qVFaXg=;
        b=Cptbg7K/rPf0xr5ofvde6g7Reh4PgDoYKgB95JXoW/tIjYt54zT8LO2XQxdxW3xMY1
         jzRZAqECIDPKz8aaHz8L0+ng4a9OGiVaN1FGVu9NDEeyYnKwgWhiHqcvSeKjqamPq4+O
         a1TyrdsGfPxPy4yx5EDj+0i8kkjMKMNvBXVAa9xlwB2Pg8A1nWWxYBQrNeyYVio+VTL5
         U5Z4p6ZNdhScv5ffVRPGtCO592iBtU7gastxlAl/0sPhHmzZySoXGYo2Uj/TK49Xv9Ix
         rtLl3nGo0A6DyNEFcRdXVQYkPTihrz1wNWnkboMp5Fx4EiYUXduwFVdRAHCTrZP8jOXo
         6Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755175716; x=1755780516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVy7tYLtXQbSkC4Emvjy88IQs7BjfVsb1Snv8qVFaXg=;
        b=TlfJRahQu2qGJg7nOUcqih/qlItE8bkSyupZ99YH9VLG5fBqzaCb2H5Xk+MGEdaXh2
         YOJY46Fny7dhTcJu+4ovJcE7MLZIqGa69WrIjImJEtpWaXMGNP0OHplXcwcwkPc6qTm3
         nF4kwG3j5n7ZkEMKtGT3jYyM0vSq9G/1Df5vAngCuMG0e5Vask8Zm+HtAsPK/XtDHjVQ
         iU5VfD7qvwp6ZL2iyC/veZnDZQBU36mmwME2RRmXt5q6MtBcvJCRuCf4hnFaS2QZu3fy
         gQrrvjoOPbtgFRpD1tBsti5Y6Rv1IQtnzKVnLRWtfNOjspUZ6CUK7uPAGbZOweiDKxWF
         smJA==
X-Forwarded-Encrypted: i=1; AJvYcCVvNbJgXBwfmiR0adUQmCkXL1kEYoXP4u3awrNLWhKlKh7YE/ALhfxeqg4iCVRD2cQILSExw8GyfXoc@vger.kernel.org, AJvYcCWFISovEKaz7vVGnTw5Bh3opBF0xkGg4Qem+WyQniPv5HOzunz06diUj1CHVnTdOSXVbanbu37FKj+2e3Pk@vger.kernel.org, AJvYcCWM0svvFTEb4Smgha/Vgh2G4rbB0uTsAI355/y4ZcxO15x8AYsQOPfymoMiIFoboqgvxwq4ZANF6i+03VuG82YJFSc=@vger.kernel.org, AJvYcCXX2XiJXGsV3cfc5rSIAhM7GTCfabzIoYfn0j/U2/cv1M051cy7cWLFSMozI0O4KMy8TRm2Nd9XIqMC@vger.kernel.org
X-Gm-Message-State: AOJu0YxQkIsjCR9OFqQmH58bM6hejFIik4rwd5nUenrtow87MBwVgQ1X
	yH2DkmPiBPuYkCAKNgxBJwcPNyiv/LMy4x7/Pi+ni4WxMvhiWkCr+Gnd
X-Gm-Gg: ASbGncvnb1WNNmeuBNv9T6Pp3YJBfIJxu8YkDKryJk6FFS5L+daArK66hN9YgkUyJC5
	y+ga7sQoKIov3h2fChjaJ5JtG/cZ+dDbhTGK6xg+zczDkNwvf3N80W+qmIo+A/P+iY+x2L9DZcg
	gx1HOF3LbAxC51NKmVH4pw4VRhZhU3eNzNv8YTq+h7LFa4oO5dGA02HERD2cosXBdsZb3tuJBNU
	hNoK+w1OjACE8AuHr9b0PsEoxIj+gvSexVvsnB4/pdMwRBT8m33+pwNygAFkSEz6UnGMGlCKBP4
	trjT1TeOKZYqKJusjxJs604Hshl+FPReg6XaUNRgObAFCeS4uacHXhN0dy1PjoDX5c67qr/UUXD
	bUWz2wi6lqFRISBffQed2HPCN8n7U8SU4ztH1F0gF6i9kmiwUCXnxb8CnLB/cdnwqW17uQx69Y4
	mmbGJpd1xy
X-Google-Smtp-Source: AGHT+IGsml9K9x6Rgdie5ws55C3BMuDFXQDdDCDlE9wpE+nokfAy8H1wuWVAl7m0+3LUphufDOjy+Q==
X-Received: by 2002:a05:600c:3146:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-45a1b653da0mr22712015e9.26.1755175715315;
        Thu, 14 Aug 2025 05:48:35 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c466838sm53497380f8f.49.2025.08.14.05.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 05:48:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Add RZ/G3E GPT clocks and resets
Date: Thu, 14 Aug 2025 13:48:23 +0100
Message-ID: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3E GPT IP has multiple clocks and resets. It has bus and core
clocks. The bus clock is module clock and core clock is sourced from
the bus clock. So add support for module clock as parent reusing the
existing rzv2h_cpg_fixed_mod_status_clk_register().

Biju Das (4):
  clk: renesas: rzv2h: Refactor
    rzv2h_cpg_fixed_mod_status_clk_register()
  clk: renesas: rzv2h: Add support for parent mod clocks
  dt-bindings: clock: renesas,r9a09g047-cpg: Add GPT core clocks
  clk: renesas: r9a09g047: Add GPT clocks and resets

 drivers/clk/renesas/r9a09g047-cpg.c           | 10 ++-
 drivers/clk/renesas/rzv2h-cpg.c               | 74 ++++++++++++-------
 drivers/clk/renesas/rzv2h-cpg.h               | 22 ++++--
 .../dt-bindings/clock/renesas,r9a09g047-cpg.h |  2 +
 4 files changed, 75 insertions(+), 33 deletions(-)

-- 
2.43.0


