Return-Path: <linux-renesas-soc+bounces-11692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361D49FB39B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 18:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9095616678B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 17:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCCD1C1F0C;
	Mon, 23 Dec 2024 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWHgW2Q4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F571C07E2;
	Mon, 23 Dec 2024 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734975452; cv=none; b=hN/r3MPGzUIlUgnIV1d8hJ6mtIl4+HFDculHx2Mc3dYLrOuB02obLMS5HMVXcwDIC3N2gnJYudMtqPCO3yqUSYz1UoPD2wjBNu6QRjuUdND47gUEWFKpJAyxWMlLmYeh5TzciHZ2mf+xoAHI8g+ZBT5jyOwk4bppcCAG1FFjx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734975452; c=relaxed/simple;
	bh=S/y7VxQ7s+s/KaOLUikgCjxdMYQD3EHqKCwpoQdd2vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+07Qlt9DwoE/Aeg9aVkgsrn1GpjL/Q6TDNNQMnlISo9BukIG76BpmTyhhIWykvagKdcGbs8qATrElyq9TDpkM0357XVdJTMEYdZL/vZEGzSz5OyffnMlTGXLWYfVY2WCl1QPe797tX6f1MCJTxVZCZr8u4kkmAU575xXNtbwZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWHgW2Q4; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-728eccf836bso3791610b3a.1;
        Mon, 23 Dec 2024 09:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734975450; x=1735580250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbQIMsV64OzBBCngLPgduB4QbObVjLKTUUJ7LtJlilM=;
        b=MWHgW2Q4DDYOVEbWtu/6b25vbKu2jaUSJ4bQaPvxl3pZlQvGEMrR902Y1PxTooWCo6
         iZsYIsV4Buy0uo0VMZ0fRwuiVMXymEDpOvOq4evT8+Yqi82GM78oQ5qk8WFMz0VurD1K
         9xwHSKAG/6Oeu/LfOgkHtbRzVv1tjLvok6pqnlJrszxujN54svkC+Qbcqn7gnzGfM+d9
         M32nf6ZfXUfXtDOn0693drBnkOKjI0V+zh3MkXorVAw0vE2jq5Cow/ZY0MchtaxGaj7s
         My9Yo0gVTbnyQZW+xNvqkddCTrXmRSpf0P5gjRzU8xUBhi3lInPcKWV1SjQs5D1mh3Wk
         qlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734975450; x=1735580250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbQIMsV64OzBBCngLPgduB4QbObVjLKTUUJ7LtJlilM=;
        b=qi+7HXhh/OHo7MjyJlFyCZQs7PplVqMDQf0jEsJ/dVsrLPkBRS+vO1iHCeyJTyfBQ3
         QSiAPfy0NjZuZ5TfJfHVvadlxImeYg6pKUJ3Cz+puPMPzI/1IsBMXTMfokLksbUIGEBg
         F6a89KI9SgUzMdB9a7z8qilDxgl9H08H+nIgOb1AgtguHTlip0Etyjh37Jv3+Z90WWHV
         wahBmuA6cyN4AsTIMvzesifcis+r+c66kwX3LtUAsXrFvtMsgPZIXIc+ggcPxqFA8qpC
         r8gCrdMHyVMXxtUitoYG+ANRUZ15vPdN2NbHqrA5FaBVdp2lGIVtWZnG2s1QVK8JH4qP
         8CQw==
X-Forwarded-Encrypted: i=1; AJvYcCUpCD5NQqBHaNqb1gzptt+d2VjvTPaK5qEIWonBEm1ClZGt5uX4JHzOjsZKKvZBF76nupRzmvqLg/tMJQR1@vger.kernel.org, AJvYcCWuGMkuv7AMv7riqNEs91e7VRv1BxH/2Eodp/XnJQ5EhJniyVSlHDFKvk4JZIoDejn3n1h7yTupooY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLbRK5/U2iLn0k8LnXdpmFLQtLDRLSGht+rDlZsuXUCJUX45f7
	7d/q20VWlqaJtUCorNtptSJvugV+OR1jt/cYewdMWUkh0ZortJdd
X-Gm-Gg: ASbGnctu0vYI/WNn4aI9rEvAOLShsfVXQjrpS2LDn6HlGhas1z7I6ZtuQJelwvIydW2
	cIzca9X2itd0j+B1xS7MjS4TzYHWOmdELKv7kbeQ9wYlQFjKVDilGeH+l6lDf/0ZW92Qp2Y6qRY
	UGUNI+tJjjy9E96vcitPPli8R/Qt85oaisqZ1aAxhaZNsEg/PGWfo334+mTw/eD1uRue780P9N8
	sPlhmNLsddaeQAoZEr+ZFhLLYHIQsATTJJBdX2fejbwWjGmONFJco+FnOWtEbpDzB6SdKk+249R
	95sFXJk=
X-Google-Smtp-Source: AGHT+IF9jMP5gU+lJYEwH+1Ci91DTfphddOJIYS/s8WfAeux6l1YIoUw5Wypl/FFddiBwImhX5yf1A==
X-Received: by 2002:a17:90b:51cb:b0:2ee:b83f:f876 with SMTP id 98e67ed59e1d1-2f452ec6d8bmr18469239a91.23.1734975450170;
        Mon, 23 Dec 2024 09:37:30 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:689d:b086:b856:9280:38c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cec5sm10664032a91.7.2024.12.23.09.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 09:37:29 -0800 (PST)
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
Subject: [PATCH v2 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and field extraction
Date: Mon, 23 Dec 2024 17:37:05 +0000
Message-ID: <20241223173708.384108-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v1->v2
- None
---
 drivers/clk/renesas/rzv2h-cpg.c | 4 ++--
 drivers/clk/renesas/rzv2h-cpg.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 38edddfc42d9..29b1ce003370 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -582,8 +582,8 @@ static struct rzv2h_mstop
 	if (!mstop)
 		return NULL;
 
-	mstop->idx = (mstop_data >> 16) & 0xffff;
-	mstop->mask = mstop_data & 0xffff;
+	mstop->idx = FIELD_GET(BUS_MSTOP_IDX_MASK, (mstop_data));
+	mstop->mask = FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));
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


