Return-Path: <linux-renesas-soc+bounces-23779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB2C15F33
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 17:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD2E8355688
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 16:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90309346A00;
	Tue, 28 Oct 2025 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erq408jN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00468346E63
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670308; cv=none; b=DUq9VpwgWCafPuF0m0Rs72p8MY9lY9DW4RItuEMrJ3RrKs/1WIVFndd3xBq9ZdBn+n6yg7oWVOvaJm1GyCMh4+dMvYviZ1e6/4UbtFIrznzDkmeM7HX75c3irpyMQBZBkLC4kq5ruwbtBIUQNkyfxLlfN4S86HKTMqkPLJU0HZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670308; c=relaxed/simple;
	bh=SaHXQvdh2UGDjNMvQuSgMOQm+hQXIPvqzOzIWG/Ij6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PSwJn0dVqjYhnMQ/yAgXd92x/u/iTjXdCkG7Ns7poWH45Fu/D2lG9MhsJzYMzP1EDnVeksR3+QMnEc7h58lm3nczQ8l8coB8pw7Vn93pB3ywskfNBAMQtJTqrBi2LNBesvQ5ND427BdpgbPY6ddCG+/uYRpFd7JUoncqIDN/k9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erq408jN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-28a5b8b12a1so64848155ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670306; x=1762275106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TW6r50dwFdVWTwN56Kmq0E/zepcTiRFAnQQGIUFFOlY=;
        b=erq408jNv16Q9doD68JdqRULGj1p/PJAq6kgs+7DNFb/2HUz2sy0LnfyRRv0P0bm3k
         dxYHRY+k+mueEy65NNEvsEMIWODJrFQ6b6CPZtrIybITzscqMoy0FJSJp7xmokmHqCHq
         XIsEwlbIobxNqZcfLPzQfcq5CQRyryaklmK12QD/aN6Kt4gOvnRHOmIRH7mg6JYSZ0gy
         QmR9KO1idaWteW1zdAPBG4aEQ2PmT7uLRbFNs9E4wguhPkNtmvzhnOgnEJGBSxywkTQa
         g+O3DIw8fIzrU3ablHN5pRcqsJ3g1AHg6BHnS73OmoShJKatRvhd+8EdSaKolqyDewk9
         MzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670306; x=1762275106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TW6r50dwFdVWTwN56Kmq0E/zepcTiRFAnQQGIUFFOlY=;
        b=c8o3jEyRa5iSB3mpnd91ZWkvpoPK5Cytl375KCcMgcK8a15bFlucYzUvZLNpu9v+vs
         03++i/2fTn2m13q1ebnBdF3nVwYmN8bM9Z8Ta/XygFaK24FWDriE8ByCTvhCwSUOhq1u
         d80xyNRPyaOi+1m6U1IhkPaiaB6kufZWZGYRWXr/7dZL4Nv8cVnvXu2tbGyax241Y7kC
         9/Od8AJ4GTItS9VhCxjKL2I5cTul3XBjWjC8mua7gluT6mUk3aqCyN8kTeP6pLfUgeoj
         tWOu3XihwBf4Iw0QKKT5H60HYFhdeUwTgUKIphgkijR8VTgzUZmqKDN3bdy+TycytAy9
         0rJw==
X-Gm-Message-State: AOJu0YyMleH9svSSUz1E/WiQQpf2Wa1YivY9d62ccsDeE7/5KQamtdFL
	S/iyQBVmAa8yuGeP1AST58dL9wFnnodmvm5J4/BozUFwhM7pByObGzMD
X-Gm-Gg: ASbGncuCFFCwrzTxoczeJdt4Apst4RQIEEkNpHkwp8IunuYvJAcv04CCsvtRNaGG+NP
	aqitXDWAxvXg1aAeZB0NK4zPwQ6LpsbTwZ9Ms3h4846jAlLfSMOvCpbDU9l8t3LfTaBNGfuDSZ6
	vj3OiYQYQM7D5ooHnyG9EoDAEuKyOHA+ym+oHKRTFB9UN6EMOFGJG3C0P0kGWw38AbwohpLV0l0
	Iwobk0Ng6H5NYDR11i6AjGx2YE6KH6X6QcaZI0QUQVaEy+LXjVtEZ73kyhzV1m2VELbtwNGWjFm
	7kltzujgJvn3PYhysDMMzmwN+VwaQ9nmDa/+7SdZvqaLN9QX4EfNO96Bqvtt+dYaupwsELPDORp
	zw5c5GoRtnIKd8CIWAMfHOa5RZp+Na8hm1+3mte2yCrwUfPKxQze8DjfTmnVqGuZBmAjvcAzeOA
	vpH2i0pZm1Nj2i9chRQEgKCg==
X-Google-Smtp-Source: AGHT+IFa+t0T9JhACfecPKraiGSJrNfChEEfsYiWyHTAHA4vmk2NppgRgurHVrK/RhTfdJWkTbdROw==
X-Received: by 2002:a17:902:e5cc:b0:290:56e7:8ca9 with SMTP id d9443c01a7336-294cb6916bemr53051615ad.52.1761670306208;
        Tue, 28 Oct 2025 09:51:46 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm122123665ad.96.2025.10.28.09.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:51:45 -0700 (PDT)
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
Subject: [PATCH v2 0/5] Add XSPI clocks and improve divider clock handling for R9A09G077 SoC
Date: Tue, 28 Oct 2025 16:51:22 +0000
Message-ID: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series introduces support for the XSPI core and module clocks
in the Renesas R9A09G077 SoC. It also enhances the existing divider clock
registration process by utilizing device-managed helper functions and
ensuring proper propagation of rate changes to parent clocks.
Additionally, it adds necessary clock definitions for XSPI0/1 to the
device tree bindings for both R9A09G077 and R9A09G087 SoCs.

v1->v2 changes:
- In the fifth patch, added a custom divider clock type for XSPI clocks
  to enforce hardware constraints on supported operating rates.
- In the fourth patch, added Acked-by and Reviewed-by tags.
- Added three new patches 1-3.

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: r9a09g077: Propagate rate changes to parent clocks
  clk: renesas: r9a09g077: Remove stray blank line
  clk: renesas: r9a09g077: Use devm_ helpers for divider clock
    registration
  dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
  clk: renesas: r9a09g077: Add xSPI core and module clocks

 drivers/clk/renesas/r9a09g077-cpg.c           | 186 ++++++++++++++++--
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   2 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   2 +
 3 files changed, 174 insertions(+), 16 deletions(-)

-- 
2.43.0


