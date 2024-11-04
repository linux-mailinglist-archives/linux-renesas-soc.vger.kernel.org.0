Return-Path: <linux-renesas-soc+bounces-10288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C029BC15C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 00:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E569D282A3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 23:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A401FA267;
	Mon,  4 Nov 2024 23:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l41MyBwY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474F3C6BA;
	Mon,  4 Nov 2024 23:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730762649; cv=none; b=CBdbO+4Kve01WWbMtTW2GjkHKpdQGunDzWBaxnbqyQZZCE28lTtZGJFuDUCt8zCwbejH3no0EqGXNIeL7noHRYZldgrPnzBEdQ0MLpQK8BmecOi9N9LoUMnPoRmxIQ9Tgp7qPYQPMqtbfslePiZrDvTD5yW6m2ahU8zqn2ATzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730762649; c=relaxed/simple;
	bh=VY2BICNr1OBOM7eB3xGIZqvFEJnWLz0g/DQUSXE7WuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q73lVkFgBrSUyn7eFISiQUBA/dF4X86cvjAgIz91opHmOIVE4rmuboxnGXHlD6U8nOhzh2bnHhd2x/vEmil990hJx2ZzocbqemOqNd3FcPvPCnAV7DxwsInNhiW+tllfoSUARrxffDkk7vPfmTXB6dtnHHGc7qocdxe6h4VpPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l41MyBwY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so42692675e9.1;
        Mon, 04 Nov 2024 15:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730762646; x=1731367446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/AJelCwUAatEpHj0W+/VFCFi8oaAAF1DPEUolZ3lZk=;
        b=l41MyBwYVudyVnnyo3WW+kAjPqUKjHM9Kz8jZDYyFaRRtFM8QswQzYVdl8Ao7+89jB
         7kFcO6KyIqBBPFh8CxKROKtAthcl1wrWosJ+R7H0e2rTDiy4zZ98IvstSDIMR1EyAKkx
         H950nqAw3pCoIX2r0IjCwxMfJoLKIGCRDARgloZtBwU5R1lr4bGFWPGJUjPvVmx72Y0H
         FXhDeGiPMY6SxP0jfZOEbBDFf7Wy8bgSYpzdGJpilggXIzyPXKY5gOKzyAbcGuRSeXRv
         bv1buJaG5smQLnFAdpgZH/vsc7+f88+ZmlDB3cZIZPBH6lStEj7zScPaRpFS1cPnMJL+
         6QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730762646; x=1731367446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/AJelCwUAatEpHj0W+/VFCFi8oaAAF1DPEUolZ3lZk=;
        b=TPkFUJxOvC83k9M8zS43ocv3DAI/81ZNqlD9DuTVIF1GRZ5p2N81ueJUc1bx/CeZrt
         1l0MTyoL09V3gr+/UVmHMyDgmDBnzNnwGKbik7uUYdFvke2sBKq9b0/U/UgWBgB581mb
         Yypp47WevNG9U7C6BILV9C+N2Qkt32YSNr8AJkGYnv2j2UbKu8lCBHUMUzst3QpeD+oL
         G5oePixwttj/P5ZSWIzQhihmUa2sX+21YDFeR5w5Nf0eqPxFPqNU4UCn/IS7gY3eOyxf
         zq8aiMi0T8HZTOMldIVBWfY420RYTZ4jKATFrZuoZryfZ0P+/xWTGuZQFdZt5ooj2HkV
         tcUw==
X-Forwarded-Encrypted: i=1; AJvYcCVnQp2Z6mHZbCFqE/sZjrIk/xO5OVjtWdyS3Ar0KKh2qxiJT7zsal0yvO8yajEPbBkbn/mo/XNOMlc=@vger.kernel.org, AJvYcCVou5D0CJxHXawd4k8/AlzgxiUoZozAIEByrt1GXPhN+/UWqHsOSGMbpxCCac/D8nSzgzeDBhvKP/B9JW9l@vger.kernel.org
X-Gm-Message-State: AOJu0YyQj3oH7ysxY0A833gu+JGQqX8ztmDEaaPSaVGu9vXkzcpZL4t9
	l7tLeaz08Ko61S26nANfroavO0hY7MmnutbloQMXdvZ6R+wHteqq
X-Google-Smtp-Source: AGHT+IGFNofRiofz2zd5oO5zy4MSJ9efqwyx95YXop6INmj+R1VufUWycYTGRldJAhRwQ+IAwIbYLA==
X-Received: by 2002:a05:600c:3b14:b0:42c:de34:34c1 with SMTP id 5b1f17b1804b1-4327b6f9590mr150318615e9.2.1730762646241;
        Mon, 04 Nov 2024 15:24:06 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b000:5e71:8a91:bce5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab254sm167156675e9.3.2024.11.04.15.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 15:24:05 -0800 (PST)
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
Subject: [PATCH v2 0/2] clk: renesas: rzv2h-cpg: Add CRU and CSI clocks
Date: Mon,  4 Nov 2024 23:23:59 +0000
Message-ID: <20241104232401.290423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to add CRU/CSI clock and reset entries to the
RZ/V2H(P) clock driver.

1] patch#1:
 Allows exclusion of external and specific RZ/V2H(P) clocks, such as those
 in CRU block, from Runtime PM using a new no_pm flag and helper function.
2] patch#2
  Extends the r9a09g057 driver to include PLLVDO, its related CRU clocks
  (CRU0-CRU3), and corresponding reset entries.

v1->v2
- Update code to skip external clocks from runtime PM

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: rzv2h-cpg: Add selective Runtime PM support for clocks
  clk: renesas: r9a09g057: Add support for PLLVDO, CRU clocks, and
    resets

 drivers/clk/renesas/r9a09g057-cpg.c | 45 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 39 +++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     | 18 ++++++++++--
 3 files changed, 99 insertions(+), 3 deletions(-)

-- 
2.43.0


