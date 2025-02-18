Return-Path: <linux-renesas-soc+bounces-13250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84DFA39B44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 12:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0B3B7A4059
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F8E23FC58;
	Tue, 18 Feb 2025 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU++f5oX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A30923ED7E;
	Tue, 18 Feb 2025 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879051; cv=none; b=Q2o0Db5TdBKQshZAZRWBQ2HTBc1yqUmj0bS/8dQzArGVueMuGI8drmIYTeJRD2Rp1hg6WH6YN1mgiqDqNarY/oT5eUip9cJ1Ff0ax53lW9+ROSssktZnVwZJoqUvZ2AtQNgAUaqHvpKgF3h0wBo1fCLhLPB7ZoKhfajXwDdFlLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879051; c=relaxed/simple;
	bh=3Rn6yPlYrw6pH9OJVXTXzmCWtEjRBGlFtZuKMuHsDvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELdQeqj6nfWX22G5DE3G7kKazqm8yoFOdKZeH8Tn2/5jROk2VOpF/kcP0iO7Mpf3jwwt35JxhGmY362MSE9lnE+7epxHsMAIqCF9ZAoX3f3p0Fs4QW7SfX5gX9pZXN6tpd/rfbm0ZHOWBoqOF790xSN7KDJf9RmPI+IqrxKFkH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU++f5oX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso58652395e9.3;
        Tue, 18 Feb 2025 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879048; x=1740483848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FD2lS/I/h0H9Wm4W1lO9wLjJM7Kr10MSDNg3fub6NTg=;
        b=PU++f5oXQX8hd4KIgkmmWhrf80ihtx3/UX/UgDhe2+QvA2lHk4WuFkCwLAPBu8zXn0
         DS96O7scjMoEpgO/dvvEbUT7xcl/T6rhhCoiAc40TghA13T1jNHCakcJaCUL5pIEgocT
         4tpnip8k3AWjXdcApQLjaqyst/9tzL2EMoz6eueTiAezaEepm8A+EmNUT4USFwwwAX0J
         89bJYHxttyLosXyPTSV0CdnSNPcx6F6fyYgUrOSObPUS4uitYOlDh6sp2/4985UX8Zhs
         ri21kdhdhS3b3ioVSPuPT0r/tYzRhkUHcwLLfbFtzO3s3ejSaOhitYpvF2/AYj/gmcKL
         oJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879048; x=1740483848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FD2lS/I/h0H9Wm4W1lO9wLjJM7Kr10MSDNg3fub6NTg=;
        b=r732iy+kZCluUCKPzBTCLDpB6boLek0JZ0yfvBEAy3NA8F5l7ZpcbR77OaObcLJtL2
         2BamBNERiAFKockOokXC0+o3ZagQbVvjI4fS0d8am7BCSFNWAUcOYiHMI+VnE2p4EIXl
         s1X4SF/WEFGctH+eSyYP+AUFFz71QmIPsKzirX+7jnvbzqLrdjSXBOQN8BJ2tqy0ywzS
         Un5dO3kAa5xD08qn5x6nY1ZfZCkwHmmnNwJy/qF7Qfu3Bz8x9ymF4lGMq8o+x6SZPSOP
         e5BXxYx1SAT1dJIkPqt5OnUtXENmvmFVdRStUOMzvFRtP0H2rT7tAEsdB1VuAeXk3UK6
         +hMw==
X-Forwarded-Encrypted: i=1; AJvYcCWjjXa1jkZLjjmVd4ejOtqPqEcit8bAGXAugSj/XU+jBYPuETyDlA8iHdI2QVzSZLaxaGhCHpbJPls=@vger.kernel.org, AJvYcCXDfpsmYpFUu9Hu2iOlqWReeyRE45M1bv4xLd0xUqBy+5O/c9Puysi2wX++cgD+7ChpRUawKQVYPdxVpHvB@vger.kernel.org
X-Gm-Message-State: AOJu0YyylP2kdjWLhKKr7nMyLyvJr0cOu0Tkyln2/b2d563UXdRwevsN
	pIu6LEwpODpcQfREEQap4Yzi5wrcwQdPY28nkRiqT8C0mPu4Cy86
X-Gm-Gg: ASbGnctrlso21Su9tDHHqtfZN0bQ9QXi18iTODWylAs3YkFjR6bo0YjZ94YDvKaKw31
	nU0sQLhyf3Y6Uknf3OWdU1kwMfLS9A3ODEeTgbt1bQgkhHNF65ZoMs1tDdKk0WuAyom0i5kSF7+
	KooMMdnAz5BRw2UpT3P/bzmhArBpIBCZvqxP+EDyM34BkePEtEymEN4CIeFuXRarpoJvFKEwpnQ
	hlNC5JlkO2AtlU2V3PHUbxKWc0cf4BRvHcjUhBqHhmxSc1uQNTyCPTb6w4gx0+PXFrceecStDPM
	4RokvuLadsb9WBSf6teo1y1STmvvLsK+S8cgGBPts7Cf
X-Google-Smtp-Source: AGHT+IGxtnwlmszNOsjbP+aDY8Mj7UC6ytmWzNFzK7VjhkGuPWSBG6ATnBfWrNd9pFTDZ3gdi+WE8g==
X-Received: by 2002:a05:6000:2c1:b0:38f:474f:f3f3 with SMTP id ffacd0b85a97d-38f474ff5bdmr7381111f8f.13.1739879048203;
        Tue, 18 Feb 2025 03:44:08 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm14997029f8f.56.2025.02.18.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:44:07 -0800 (PST)
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
Subject: [PATCH 1/3] clk: renesas: rzv2h-cpg: Move PLL access macros to source file
Date: Tue, 18 Feb 2025 11:43:51 +0000
Message-ID: <20250218114353.406684-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the `PLL_CLK_ACCESS()`, `PLL_CLK1_OFFSET()`, and `PLL_CLK2_OFFSET()`
macros from `rzv2h-cpg.h` to `rzv2h-cpg.c`, as they are not intended for
use by SoC-specific CPG drivers.

Additionally, update `PLL_CLK1_OFFSET()` and `PLL_CLK2_OFFSET()` to use
the `FIELD_GET()` macro for better readability and simplify the
`PLL_CLK_ACCESS()` macro.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 4 ++++
 drivers/clk/renesas/rzv2h-cpg.h | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 419dc8cd2766..1ebaefb36133 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -56,6 +56,10 @@
 
 #define CPG_CLKSTATUS0		(0x700)
 
+#define PLL_CLK_ACCESS(n)	(!!((n) & BIT(31)))
+#define PLL_CLK1_OFFSET(n)	FIELD_GET(GENMASK(15, 0), (n))
+#define PLL_CLK2_OFFSET(n)	(PLL_CLK1_OFFSET(n) + (0x4))
+
 /**
  * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
  *
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index fd8eb985c75b..81f44b94f6d5 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -87,9 +87,6 @@ enum clk_types {
 
 /* BIT(31) indicates if CLK1/2 are accessible or not */
 #define PLL_CONF(n)		(BIT(31) | ((n) & ~GENMASK(31, 16)))
-#define PLL_CLK_ACCESS(n)	((n) & BIT(31) ? 1 : 0)
-#define PLL_CLK1_OFFSET(n)	((n) & ~GENMASK(31, 16))
-#define PLL_CLK2_OFFSET(n)	(((n) & ~GENMASK(31, 16)) + (0x4))
 
 #define DEF_TYPE(_name, _id, _type...) \
 	{ .name = _name, .id = _id, .type = _type }
-- 
2.43.0


