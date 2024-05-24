Return-Path: <linux-renesas-soc+bounces-5460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49E8CE253
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 10:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A55E283075
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 08:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C2912883C;
	Fri, 24 May 2024 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omg+KgOc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8235B1F8;
	Fri, 24 May 2024 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716539352; cv=none; b=HPY7gZhWfer2h/dPkfUB2ruxcIOkqD0PGZ8srOwcldpipoud9w0Q5CgrfqrziLdTubFI+os0D+J6PPgKdz+ywrrw+razx6vBeMiery9fHpFVzJ0eGRn7pmmIlIQ7SK8oNEuZ6puIt97LO1olzgpfpohIg7hnjMxxiS0qpTqk6iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716539352; c=relaxed/simple;
	bh=Gh6NlYPXprP3xGD7ZZUEg2JlAMSrlweXjgU9wuMJn5s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mf/YNCR6ECYvoCSF/0gOhTZXFe4a5uhRdfhFFxweZt+r4FLtq9NpePUykmWeDVG+DKruzJyGinphJLwtmEtdFUWquJS+I4cf/zsp3+sSnJ9dH7mVRfp0fP7muyMiQHeGJGCdw/IRsLlRkk4suY5FatqfJWJ7gBXQRq4pLl2w8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omg+KgOc; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f3423646b7so13153165ad.0;
        Fri, 24 May 2024 01:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716539350; x=1717144150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiZre0HC6g5xQkUkEEPwrvwt2kz5afaYH2z+fiQKH5k=;
        b=Omg+KgOcZhA5HwuTpFhvwsnq8SdQp71mxp2syJbT+5AN5k/8iFM/L95W1dqnnc3bBi
         PV77hcF2cH9Lvk52fm0jRrPaIMJzW9Pr7WpivepMWFgO7mhWxtyJ6ha1rLrfQDir2ZMe
         Huey8DtS+Po0DcIss1xVOWZkIAwQkagjOcPxSPmA94cSgegpdvrGqlh581x6OroIhWN9
         uxu+0dhHcKBwCxyWjfvnLOpj0TnouddiqiVSz+ZXU2Nc3olUwz2kGVllxLN7dZn56nA3
         A9OamoXrlqCulNs9uJkdJk8HN+0Hfdwh449Y+peyO7Tob2ZLc0d60zKEaLli5cy9rMCQ
         IdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716539350; x=1717144150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiZre0HC6g5xQkUkEEPwrvwt2kz5afaYH2z+fiQKH5k=;
        b=kAEUn23g/mvNdXVf9rkpKGG7TtUjTEsjZc5UuT4O6DztzfC4AcLMJGQUOOX9JQ7Z7V
         83mxFFNM2JqMAgrHnxBqM0acTnn3/kJuhktW15kMwPLvEj1olS0smbf2QbhKWKoQjNow
         6kNqQJg3TH4M0TqLRQ9Noj2sWmRkpMDX0iQ3Uo1+0FR0fq+XNSI9/RXJbLPB6AJDtp1Y
         ltk2wfWAnvAIiYWvISk8ON34DU+eIuQMB0inNw7aTdFswDfn1Q8j+r3yrjkLzj7/aelF
         b7Gd+QdEQTJ1Z9lJYDyTCIUCZCcGncgqqI62RI2850JH7nOpIey2JOli7U8GY0Lvqhn7
         ccwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzTFlFQaQVBbcVkusU9qaL649AjSbK1XyDoeOORqBNUJzShiJjgzZCD43tQmhguFzJ7EbgaqSII3Q2l7WfTAoN2NpmcwbFG9/BEx6saAjfl2qfoboS5/fDefdOP//Ecrmy2EnJyhPpiNB/0sL9IeUBAiUnaFTfTWKDvbuCMC3TTMCYpA==
X-Gm-Message-State: AOJu0Yxaq+aqaJp/eJFxPmQk7n2UQgskRFe36IoB+s4WOcMVSABMA4YZ
	UYUnEBy45f1tJ9vylZyTOHDmIeSc8ARkMjfWwTcA6I30SxufLaXI
X-Google-Smtp-Source: AGHT+IHG1072pahpGeSGZ0ububXJmGaOpVjE9EfnrmCTcoQyErQfa6B3YwvGI2ql6Egx8Iesfmeihg==
X-Received: by 2002:a17:902:c403:b0:1e4:4ade:f504 with SMTP id d9443c01a7336-1f449029c88mr15498605ad.46.1716539349864;
        Fri, 24 May 2024 01:29:09 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:bfcd:61e0:7fa9:84b8:25fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9c6ea3sm8420325ad.277.2024.05.24.01.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 01:29:09 -0700 (PDT)
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add CPG support for RZ/V2H(P) SoC
Date: Fri, 24 May 2024 09:27:56 +0100
Message-Id: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to add the CPG support for the Renesas RZ/V2H(P) SoC.

A separate CPG core driver is added as compared to the RZ/G2L as the
RZ/V2H(P) SoC varies in terms of features and registers.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG driver
  dt-bindings: clock: Add R9A09G057 CPG Clock and Reset Definitions
  clk: renesas: Add RZ/V2H CPG core wrapper driver
  clk: renesas: Add RZ/V2H(P) CPG helper driver

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  78 ++
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g057-cpg.c           | 112 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 677 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               | 151 ++++
 include/dt-bindings/clock/r9a09g057-cpg.h     | 644 +++++++++++++++++
 7 files changed, 1668 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h
 create mode 100644 include/dt-bindings/clock/r9a09g057-cpg.h

-- 
2.34.1


