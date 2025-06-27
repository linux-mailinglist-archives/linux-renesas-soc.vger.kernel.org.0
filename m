Return-Path: <linux-renesas-soc+bounces-18861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B493DAEC12C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9431898EB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FBB2356BD;
	Fri, 27 Jun 2025 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQxSlJGV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C617A306;
	Fri, 27 Jun 2025 20:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056967; cv=none; b=kot+BEEWF8iC12DGxppCIbdWd771YIUdrASfRxYbRdwB84z4YciAgLf86oag4cInbQEgDjk9lnL+hmMUANtueyk8hQE6EFpYXamq1NZ2nhGUHozJH+LKwxy41MctR9Px8E1MCpxuKuzsRN0hXQm+4d2uB1q200d7xegbRAVZ/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056967; c=relaxed/simple;
	bh=/5l4Gc4xjvXUQ6ELFrIb8IcxqtvAEeD15782wiZqkTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUu2rQw8nBZ+SWhmTf6h0aPAjU8+fdtlEMloyRMnous7XBzzXQhkB9JYkhadOXfOLMxYF7xfaW19CQ0NVoVA8h4T1Vaw6uV+K1XIk5+Qi1L2rurQjOkhKyeKDddLD/y6a6BQKk1vE8AF9B8jmlUxzKhKqQC0xmQA4R4q5W0wPVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQxSlJGV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so2353757f8f.1;
        Fri, 27 Jun 2025 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056964; x=1751661764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHFR8C8op4d34ipHs262mh9OKpO4kFQljif78l456mU=;
        b=BQxSlJGV/BvRuH/TT0SMQ0vlZfiaJ7BVrcAxD86psQ+eDs9budIBIxCBk0fUoOVgBh
         0TqZWARUG5PuvBJB8GgQ573V+6puXSp1m/HNKs9qL4+VBH/ZhCGiHX7lmAVbwdC5dzTg
         F4MtSOwKuHfwGv0yPMTI5/pGRqRlKdyxZqoqsTCXlkj4KoyI43DoxM2MifWTeoTA3ca3
         RQu1KSqIDFSWpURW6OjatlJrcBKPl1NReTWvAmhYjQ0UTbtBn0PwWDKRlwS54vkL3JOG
         yh+kuNiU7vj/3gskggeKbgkJYJKj9/KWEvzmiVuZbqnEYiBk7JRcvH3CEWUQpfiIwGzl
         +LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056964; x=1751661764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHFR8C8op4d34ipHs262mh9OKpO4kFQljif78l456mU=;
        b=VxZG5uxqmWuy6xTBl84KJ+A2u+stmycpymfKxFg0MHkYNxGN+vTthpwBoOwNU0pest
         T1IJ+yyH+/Br9ChsUMyTabu9wb8ZsVZqv7ijcJhrTJvkIM5wxjeLbWhfritkWW979AZs
         3rVJw0Pep6GEVqXY7GRUaaq7/9g94CjRwgCyFjtcauwCOLcXLa9HvF7APDGq3OGqRFa/
         o4Cqf2Qv1U93W6oWIXKBbWB4jze44GmOejD2hyFZyRuZSx1BY5Hz4XH9sILufp4TSvGN
         WmsbR9ZlXJsgX5Gcdi5JIxG7H9wqkGaOf9W+lUGF6H3zosmbCpZgJN7EMPMFVOx3M2Zc
         w2tg==
X-Forwarded-Encrypted: i=1; AJvYcCU2FsTo8L8oiVy5M+FuU7/qi5sad39zaxMglHBohvaRITBYnGRgxkFTbyo7/EU5heOtGz6ZSAQbtrfn@vger.kernel.org, AJvYcCV5i7qcbo+z3C5S5zCJN3Ux+oJmRJlO5P3kyJTgn+9RvTIOY/vc5WxScG+Pi9wZ636rSh8GAvAHsFaQmY5D@vger.kernel.org, AJvYcCXcyjz+letZsLFday7oBp4+VfkXukH25TMqa8vcW2Y99LQAAI53AnSFc+pqXiZTEqmCSecdH2BzNshP@vger.kernel.org
X-Gm-Message-State: AOJu0YxSOFz8XYjKidnejA8PgfmWguLNT/06TGzfLin+xK9Blyh5gH7G
	RT4xyuZUzQd1m2vDA+uVIJ89cCKbD8L5RW02kc6wMNDsv2z+PlYRruF+
X-Gm-Gg: ASbGncsqOac7Cf6XDQbhfxX9LUT7h0n7v5FCohQ7n85IpHr40wfTP+mMQSHZ/qaVQo/
	ICKzkHiH/Srnu1gIUOe3cfc+LTPqNa5oTiwqUAxjGvH433p3AgyjlWFp9tWxkMwSDZCOVxRX8Wr
	CzKRsYZu0fsDjpW71bKezt95abAyUOdqk2Lu3J06emJPfW1YO0m+/+5dpSQ1sfz0I/WBwzjW/qr
	Dih8xZOWXY/pQ4mxDsUKbVdTjkhOl6gV192WrDbQvBBXvhg31m1h9h9m5dTa0vfhn09SCOpa7GR
	ex1uOhUgSqCIxvGdaGX5TqlikhYyO4H9hHNIFHU9kXGM9ksOANHIyOqQQ9zHftIRZhUhfVtFaRP
	5dRds1aElXg==
X-Google-Smtp-Source: AGHT+IFGwJXLwbRHkTzQQSL66q3uLxcdLjdyBue3jUI6yGfy3CWe20gjfbMJG9bwUpguhKVsiMFCgQ==
X-Received: by 2002:a05:6000:188b:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a6f31027e4mr7661954f8f.9.1751056963813;
        Fri, 27 Jun 2025 13:42:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b46:edb1:4d0:593b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3609322f8f.24.2025.06.27.13.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:42:43 -0700 (PDT)
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
Subject: [PATCH v2 0/6] clk: renesas: Add XSPI clock support for RZ/V2N and RZ/V2H(P)
Date: Fri, 27 Jun 2025 21:42:31 +0100
Message-ID: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the XSPI clocks on the Renesas RZ/V2N
(R9A09G056) and RZ/V2H(P) (R9A09G057) SoCs. It includes clock binding
definitions, clock mux and divider configuration, module clock/reset
registration, and support for fixed-factor clocks with status reporting.

v1->v2:
- Moved rzv2h_clk_ff_mod_status_ops to the CPG private data structure
  and initialized it in the CPG probe function.
 
Cheers,
Prabhakar

Lad Prabhakar (6):
  dt-bindings: clock: renesas,r9a09g056/57-cpg: Add XSPI core clock
  clk: renesas: r9a09g056: Add support for xspi mux and divider
  clk: renesas: r9a09g057: Add support for xspi mux and divider
  clk: renesas: rzv2h: Add fixed-factor module clocks with status
    reporting
  clk: renesas: r9a09g056: Add XSPI clock/reset
  clk: renesas: r9a09g057: Add XSPI clock/reset

 drivers/clk/renesas/r9a09g056-cpg.c           | 37 +++++++-
 drivers/clk/renesas/r9a09g057-cpg.c           | 39 +++++++-
 drivers/clk/renesas/rzv2h-cpg.c               | 92 +++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               | 24 +++++
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h |  1 +
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h |  1 +
 6 files changed, 189 insertions(+), 5 deletions(-)

-- 
2.49.0


