Return-Path: <linux-renesas-soc+bounces-11776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FAF9FFDC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 19:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 257751618BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02B617A5BE;
	Thu,  2 Jan 2025 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwDQpEnL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334D029408;
	Thu,  2 Jan 2025 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735841930; cv=none; b=AVR0WFilI8gB7hC6gXJtNR1HAEMJ/PV9pe+4LN+etwhClQl9s8r7CsLBDIhM5FAgZN4h7XO6LzxgS/sx7krP79NxZONTaFX5dWErVhdg9qKiRDHUgjiZBeAaCzG6x/3llCDpnZD4IHGyLq8RA14hLmc2f42mUeb3gIiuZpj/X38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735841930; c=relaxed/simple;
	bh=zyCvXv7UQzRU2ElWQEdmObP4kPdcR8UNQrR3GTSIPkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXtHayy0WAVq/VSsr8ATvNjgj01bBQEtSlv2tLZGTvhXUJ7FMbNsCRsxBTJv4E/Hdk6xzpNPdKgdDKCmaiRtNokhe/2yfYbkFhwLk2kegCV+buSpydyFKvwvicODcPUlhxX/3igYAUPjjnXiFueQ1s1ALZaRP3hxQR/C+BHMZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwDQpEnL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso6416210f8f.3;
        Thu, 02 Jan 2025 10:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735841927; x=1736446727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIztyH9Dr24aPiHFCVLKhP46DvR/fBzHNn044g4DYKs=;
        b=IwDQpEnL5m+CP2gJ8AMjw3Xr1VMAF6JErvWLX/nYT66zzpjEq2Bu7Oy7d5r013ufOg
         /NTBzOeq6Lies6y26ncrviSYKepnlUbiTUXSF+yAFX/cxk3Na4u0BVTfOF0AeEi4Wrtp
         66+vg29+Fe3vbkxr0ne+qN2SNwlhjWsTZcfcb+i1670pol0MY79lLctGcOy9jNvrhbZz
         gE6J0EcPJlXXi7fXgxk0qEMKdLyrHt9nCpexXBubRbqGtoKqywlClDqlKEEl4/T2QUrA
         cEWl3PJYDBO9ajs/D6ffz0M1FCsoF7Wuo/Tl9/ilQJfX+cG+Muxvkb5zZ6JegW62Ye4U
         yweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841927; x=1736446727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIztyH9Dr24aPiHFCVLKhP46DvR/fBzHNn044g4DYKs=;
        b=sVmV/HEfOeazW/N6i1kayb3d+nddBGUzF/L+JltZNTn4ho8pzQtkUN1wJ3GHsJVrOn
         kP2ZBBH18Qznu8N6fh1l9y2N2MzV886Yo3iy3W6CK96Dwg2hf+vwfWIagZ0X86u05Xmg
         RYbYh7eS6ClkSmxJovS7N+2YcOgj3hnarPHBpa+Wjr1wc+TOKMIYurVx+U111qflP3dF
         /FL8+CyDf+F3JKRruCC4M83k3amqeCjZfibpi7keOid0fwQ3kfSSKni56e5iYfGLZiAb
         U9bUyDhRA9Est3lYWcPJ6EjKyX6J/6EKPykOlXKLjRVhXHIu6fWlmdSgiOSddyo4R/uu
         IQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaW3bM+6K26gJ3YfDZ7ONBQiw372M0Yn2J2t0/wdX7AcgqR0gRMvHkpgxX/XokFLfx0MlFNjFStTUk8X+l@vger.kernel.org, AJvYcCVfv2zR+BdG7MFbLOxyNKudQe9vrIKRtpjo9O8AMzrovQaOs+nybruDW+YclhJgCPCNnj+xLn3/OB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXywQSPbjleVS6csYUi0+gUsAYNHo278Ec08XGMW5e5jW+a2an
	3afDx0Tip4UBDLqjSsB7adloy92lKj+C1IzLIthXYtwcnGg/ge2t
X-Gm-Gg: ASbGncvaZ1Zpum697ZW4temXZSgRy1Hkvb1vdeqox60keYC019mkgyy/VSeyyeVnWHq
	jbugRwD2HEkm6mlrwV5btLIoTz983/oSxfWlAXGt9NPeACoO0UHJ2s1lRKy3QG7gwIo2/+Hcd0Q
	XEVbF98sUPHdArHSkLzAtEjx2iUu2pogKkBl8Kq0BvxSzVNUkYR5cK4QCdmIh/TUzHEKOH55/+n
	+9px7elRrS3nBFFZIG4Jad/4DgRzWk/TMZUa9tdVpJFn2WXLD+We/Lkmbby+peIFBKs0pBHTacG
	JTYGev+fpg==
X-Google-Smtp-Source: AGHT+IEqp7Sx+3H6YWmkJsPUbJ5h0QqZlzSaUZ9aoBzKkRtY1pPety1O3v6fQonJAo64trYKHMHahQ==
X-Received: by 2002:a5d:6da1:0:b0:386:4a0c:fe17 with SMTP id ffacd0b85a97d-38a2220039fmr38423366f8f.27.1735841927271;
        Thu, 02 Jan 2025 10:18:47 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm493291925e9.3.2025.01.02.10.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:18:46 -0800 (PST)
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
Subject: [PATCH v3 0/6] Fix MSTOP handling and add SYS/GIC clock entries for RZ/V2H(P) SoC
Date: Thu,  2 Jan 2025 18:18:33 +0000
Message-ID: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series fixes MSTOP handling in the RZ/V2H CPG family driver
and add support for clock and reset entries for GIC and SYS, along with
some cleanup.

v2->v3
- Included RB tag from Geert
- Dropped unnecessary parentheses
- Fixed review comments from Geert for patch 4/6

v1->v2
- Updated commit description in patch 1/6
- Updated fixes tag commit header in patch 1/6
- Introduced new patch to support mstop configuration per-bit
  instead of group based

Cheers,
Prabhakar

Lad Prabhakar (6):
  clk: renesas: rzv2h: Fix use-after-free in MSTOP refcount handling
  clk: renesas: rzv2h: Relocate MSTOP-related macros to the family
    driver
  clk: renesas: rzv2h: Simplify BUS_MSTOP macros and field extraction
  clk: renesas: rzv2h: Switch MSTOP configuration to per-bit basis
  clk: renesas: r9a09g057: Add reset entry for SYS
  clk: renesas: r9a09g057: Add clock and reset entries for GIC

 drivers/clk/renesas/r9a09g047-cpg.c |   2 +
 drivers/clk/renesas/r9a09g057-cpg.c |   7 ++
 drivers/clk/renesas/rzv2h-cpg.c     | 185 +++++++++++++++-------------
 drivers/clk/renesas/rzv2h-cpg.h     |  13 +-
 4 files changed, 116 insertions(+), 91 deletions(-)

-- 
2.43.0


