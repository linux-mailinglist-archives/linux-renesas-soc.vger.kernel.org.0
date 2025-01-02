Return-Path: <linux-renesas-soc+bounces-11779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141E9FFDCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 19:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2A5B161817
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217C41B4121;
	Thu,  2 Jan 2025 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTXxq/pF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394C1922DD;
	Thu,  2 Jan 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735841934; cv=none; b=C88dsX3NrzfdwEJu6209ILlhJDuEsZSErS05AcqIpSjHMD6kJtHHKdZTvfCcc3EaliEYPQB54CHoUtPmQJ3zqpABL569/i2Ke8qZCVQA2tpBwavjpCmQy7Vat7O7UwuByWoMR9rY3p8KXGvv8ALs/J3U5pxadQzatHQ3I/tZCI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735841934; c=relaxed/simple;
	bh=NJrckm+X0jY7m27sv5LtekG5oeOI7Lx4lnBR9Gj0Z5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7xB3eNy6mQdOV/hWvTLeecc/GDt53HA/LzVoNMfFYqkj6M/LTKnbaPa7Bqaj5rGAvdidFsl809FFSiBquRUAx4qpJfaSwkuKe4dJJVY9Mi8uKSGJbYt/FSpe3kB4yHdzIr2Weg0VENS3iNpBRIybwNobOPmdm9FKydnuSQcKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTXxq/pF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43626213fffso73896035e9.1;
        Thu, 02 Jan 2025 10:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735841930; x=1736446730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVpezAOIY8u7O4nqWlwsaNhzAHGIf1UMTuZ4EeLwVkg=;
        b=UTXxq/pFGTNBAQgmvXR7ULGRVtcy+F+Lj4pRRmzrKdv950ScIgcRVhTd1AablyGYUU
         VsATu05asFo0DCh32K/fxpNz4cid0PE1FgggP0swqkTL5tsc99rkh93QvxjE64jDw+v+
         ywkbVewKFDAJJx+6rSD+8gtjVcaMP+IM2BcNq5baeXaBmVmzA57pucHMdBxJMbrd8iHv
         3TzWMfZf0+EkznT8Nvzj5sFjUNxjCyf4mpbSEyUi6rdmhZf2a+qrTp69P5MlJYDZXymo
         i78cAXD6H2DeyG1LNi2dX1PjKZXRJu/1CEUlO/OOWtkh2ijnhVLWEVyW4iko0cF8QdIE
         ldyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841930; x=1736446730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVpezAOIY8u7O4nqWlwsaNhzAHGIf1UMTuZ4EeLwVkg=;
        b=uTiQxyTS2NYJoJlXXBEv/4bGMx1g4gWk6poKzLd3ivOVoHte9da5Lj0XmdjR4Uja2B
         vJckRiKd6SuXpJN5ne/vVI3eotK4tlC86wNi+8ICKsCq0dWNk//Ws76z5O8xE+FqIP0O
         0Vpp5fjCPSWEr7MIVIOGesbnjDQX55VkPuzYM2/3KNERiGY/fiVcxalPzxktDLVm/JK4
         NRDytLd5DPgRcMolQ2Fw9CAxLozOzTiVurgMgqdEciH2TJW/v7qk/43jRRSc0MMXGBGu
         x5yAVJzICeav2GexAgn2g51LPtZAIvXYWA9vJXAlh+eo0MeSXKny9fiNZMMtRRH2ATrN
         uTcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAdYPx2827az8FYVouxtxzL6S+jaGoW95gewouzl0R+85x3ajpGq0Nrkhnp9MBz35A9d0ornLhPKgN2aMq@vger.kernel.org, AJvYcCWLn3OwsFQ9Vhveke8L3gARNuMiu0F7vStmmAd2f2be97ZZ3HZ2F7sDkJk7Zdy0o8PE4kCVh0QXPUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr6qeTUo1kout8oIPUpWQBu4jIM8ZCsM5Cus9efzsKFwEUWdys
	pWV6OlJdwtOZQXuVtDjbVgnIYe4K6pkzfsIZWXoDpm6voowUjIz4
X-Gm-Gg: ASbGncu0Bur6IHb1OUoXxPC7EgYFVE3XFcdUYLez1oy6KRjIPefau73VNXOR+sCrx69
	OERR8Abmg2QqqY9/unYce5InFkmKkj6CF+uFMj90L8/TEXr2gIRAr9/v8aM+p9FTEeyHKf56Br+
	SMtNJ/WrH0aRnyiP/n6OHISoKri3I7/4ODn8fyrqUyqGvyr7OaK+V0l3feKFbRA9yrYK9N0wAyn
	Qnxq6R34uZjPq31+nCGZ0iH5PKwLGSWHFQL9GQp+rgKE/Hyxl7jVhHfui0Cm6aswX27k8bmo/tb
	kpaKxNnDJw==
X-Google-Smtp-Source: AGHT+IHy4mAkEjD3wCssYhb67xfcfDIZcOH5dDqmz0MfWDAzYkvyun9MvRmStc8mFIYES8k3qg2rdQ==
X-Received: by 2002:a5d:6d03:0:b0:386:3213:5b80 with SMTP id ffacd0b85a97d-38a1a274920mr40851699f8f.24.1735841930544;
        Thu, 02 Jan 2025 10:18:50 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm493291925e9.3.2025.01.02.10.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:18:50 -0800 (PST)
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
Subject: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and field extraction
Date: Thu,  2 Jan 2025 18:18:36 +0000
Message-ID: <20250102181839.352599-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace manual bit manipulation in `BUS_MSTOP` with `FIELD_PREP_CONST` and
`FIELD_GET` macros for better clarity and maintainability. Introduce
explicit masks (`BUS_MSTOP_IDX_MASK`, `BUS_MSTOP_BITS_MASK`) to improve
readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Dropped unnecessary parentheses
- Included RB tag from Geert

v1->v2
- None
---
 drivers/clk/renesas/rzv2h-cpg.c | 4 ++--
 drivers/clk/renesas/rzv2h-cpg.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 38edddfc42d9..23fb209d3232 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -582,8 +582,8 @@ static struct rzv2h_mstop
 	if (!mstop)
 		return NULL;
 
-	mstop->idx = (mstop_data >> 16) & 0xffff;
-	mstop->mask = mstop_data & 0xffff;
+	mstop->idx = FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
+	mstop->mask = FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data);
 	if (rzv2h_mod_clock_is_enabled(&clock->hw))
 		refcount_set(&mstop->ref_cnt, 1);
 	else
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 810275eba473..f918620c4650 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -46,7 +46,10 @@ struct ddiv {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
-#define BUS_MSTOP(idx, mask)	(((idx) & 0xffff) << 16 | (mask))
+#define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
+#define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
+#define BUS_MSTOP(idx, mask)	(FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \
+				 FIELD_PREP_CONST(BUS_MSTOP_BITS_MASK, (mask)))
 #define BUS_MSTOP_NONE		GENMASK(31, 0)
 
 /**
-- 
2.43.0


