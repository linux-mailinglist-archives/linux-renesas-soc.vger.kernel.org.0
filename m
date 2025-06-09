Return-Path: <linux-renesas-soc+bounces-17962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260EAD2074
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 16:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073C716593E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 14:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8E117A309;
	Mon,  9 Jun 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR93ri7A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73622A59;
	Mon,  9 Jun 2025 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477831; cv=none; b=YLC/zBUPRTxiUeHG9v0TwIfPkBZgCBxc66+OObyZNS1HirTGcm9YkZVMMqlzW9Ex6TsqVDCPj5qI3bpsoqZCW36MgiREKSUd95m/E++jzYFuv+au8DLogDDlLKZTv/HS6N+4eV9ahWfBhUGHB/Fu9z6HckH8/NCBpkp5S+giNSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477831; c=relaxed/simple;
	bh=sqfo4EfU9H/OvZhdOK2jn5tW08tExXp4eULzYHcG9u8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyEnS7PmIQVsXhAsSbyjFIpfntFCYHVNbNdbah2CaEZzGivtrxSw0sgS/SdSv/7miqodxUEbSnJkGCKpNLvdwiXNqyCg9dV1OlkiEA3CUAYZX6mqeJC6UHYfkVn/0PCDM12GEVuCbR85EtBdBnjnEKv4fpzN7KVVHCguBPXoWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR93ri7A; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45024721cbdso37701445e9.2;
        Mon, 09 Jun 2025 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749477828; x=1750082628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ItkUwDuPvXDwuFTbW3/jhZWSpSP44wUlErpQgJpqPe8=;
        b=RR93ri7AJpiDpzz6tGQ9zAay+Fp3C7GNWFZOf9iDWlQoYu12yyKst2etBFX5K+9olp
         Eey46LNZS1GVmaBHr7FtVCcrvKPgkqj/UJ4vO2ZTP5VXOB4lym/r3ynjqt9tbiYC7PLB
         m3V32+e0qY5n1DOngmFjE6n4XxhjGs9k/kxKyZO0hkDuG6qf8FfCS+56RHuabulMK8XP
         A94ugymKtEOfKIbZegtBsTvPQF6jY0a3XkNFgzXEodawOByis4ZRnOozTQpu6H3Qkjrk
         OxJRBnpX48ty8TAs0Lk/p2w7j+/hSzj9qSqIHszyHG/lDDvdZKdNeTjeBQVsBV6FG3hL
         2PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477828; x=1750082628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItkUwDuPvXDwuFTbW3/jhZWSpSP44wUlErpQgJpqPe8=;
        b=VW/dc5BP7xPBi255O2osyTqKqFbQETpMTLldkuy3edCHXauamxPMbCNpGyRsMstD6a
         pwp1F2H23q4HUlaCD0cyFsuHu8WNt+KRqmJ1TfpwVN/trTZANsTuP7dro+UuZtdSYpt2
         REwcXxhUJJp2PBZW81p3yQOKTj6n4Z1rZ4dhhcW1vCXhDa2ertUoTOwqb9TbtVVAfaf/
         Il8nrVagdhY6lflaRNsnQ/eyVqfcm1nnSbmmwARqWySMI0I2LzHM6VrwLi1GySu7ihdL
         SnPEae8GozFL87eO92Lvu0m4IExnYeWLFDqCk8PXk/y9GpSWpEOBaS6Rr6IyXIYsUjg6
         KMhg==
X-Forwarded-Encrypted: i=1; AJvYcCU2jwk3TtTeOw5sgme0bmthcuDtRSaWDOizrD9VYVxX+efe8QY9R+kFTSs0XYq5CNkD+w6lUrmzyLhQ6nyO@vger.kernel.org, AJvYcCU3g/nT4+GrFPvnFIYKspstoeF1AxrF/YBZGFht6im+BbvPk5zVDpa8V+b9/eC1rHcTwB3aFix4XHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4BiqAuVRW6aVRiZLyIxyu3Nvn+EX2n4t/cZWT5nsJgc27OiWz
	/w2pVn6/wAaD+SSZPHiKDvxkplYq+2qF0/JvgZxOCbUBB2ChKB6v2aq7
X-Gm-Gg: ASbGnct3jMHum8ANt1jIpOS3YUhU+bINFN47V4j2XrI57ZPO/A6NUYPZRh7Sh5/pHQx
	DzNipnwzOmbNt5azQNLXD9BHHMNGgCCNaWrRyvEgDmwN5ROLqcZTG216GCrpyJ4vMgIadeJr3fc
	atmtFBAZWc3wO+GZ6Nzy7Qr0EoW+ErLeQTfneYdsWhbiZjjo7l2P0pAFatpzKTrhymk2VZrkBUF
	uJqz7O4PIAoFohgJoS10Hut4H6wFyuHoSE3Bv5y/kV0smenbZOnrjGenNyG1O5NGaDlZ24HmRyU
	sK813UuKZ95/yI/8RlP2ihTXbP3SakbwoMg0zooShDx0XlgSWk498LznkE7CKqmaQShXMIDf0Jv
	796ImC074
X-Google-Smtp-Source: AGHT+IHfGHWcceesO297NeI0HtViVZTiHychN7i4shTt694vmnxB+lj2Njit6TkH9CdQwKpMEqILhw==
X-Received: by 2002:a05:600c:8b43:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-45201427c5amr107071995e9.32.1749477826958;
        Mon, 09 Jun 2025 07:03:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8f12e16sm85688065e9.1.2025.06.09.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:03:46 -0700 (PDT)
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
Subject: [PATCH] clk: renesas: rzv2h-cpg: Fix missing CLK_SET_RATE_PARENT flag for ddiv clocks
Date: Mon,  9 Jun 2025 15:03:41 +0100
Message-ID: <20250609140341.235919-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Commit bc4d25fdfadf ("clk: renesas: rzv2h: Add support for dynamic
switching divider clocks") missed setting the `CLK_SET_RATE_PARENT`
flag when registering ddiv clocks.

Without this flag, rate changes to the divider clock do not propagate
to its parent, potentially resulting in incorrect clock configurations.

Fix this by setting `CLK_SET_RATE_PARENT` in the clock init data.

Fixes: bc4d25fdfadfa ("clk: renesas: rzv2h: Add support for dynamic switching divider clocks")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 2f045acc5080..761da3bf77ce 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -383,6 +383,7 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
 		init.ops = &rzv2h_ddiv_clk_divider_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT;
 
 	ddiv->priv = priv;
 	ddiv->mon = cfg_ddiv.monbit;
-- 
2.49.0


