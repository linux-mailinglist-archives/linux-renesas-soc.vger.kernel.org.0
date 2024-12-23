Return-Path: <linux-renesas-soc+bounces-11689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0566E9FB392
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 18:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A2111885188
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 17:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F691AAE2E;
	Mon, 23 Dec 2024 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQv3sBzG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C936116FF37;
	Mon, 23 Dec 2024 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734975441; cv=none; b=uZGdtyqN0F6SHxKu1rUjRFA6r8q0Bz5NXpHdoeus8+KWpL6xYSaiXvevaaY3neg9Yg0XjukY+Jvehz9qloPMs7GstSjRC0dgxqqGoAOpJxiwJ7xsWDVk7/TccZKmtug8Z8XdMiR+rfhnW+GVSCvxmJ/jq4mymLOkzAh5PoiHmGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734975441; c=relaxed/simple;
	bh=mvbzwBvmS5VLAINt2ZKTFv+XDicvmvwnA/RWjqmiuxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VlKO+d9HT39Idkqmpjw7lF/VzSSFYEXzGkbEfF9O5xyWthND6ewX68mZnXqhARXUuDfWVS3Ne6eYf6bFmggC15wNPO/YnQPxmBLHrKmiNMgg8+yBzGhBSmOGOVVfBO9d+dNPmrjZuIF/51GFVp/lL2cjnSPzkFBSG9xH65i+caY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQv3sBzG; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-728ea1573c0so3639099b3a.0;
        Mon, 23 Dec 2024 09:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734975439; x=1735580239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5BPXUs7XDFyKDHNZ078Dqly+mBHZoWSc+mzflUGYTs=;
        b=OQv3sBzGYO7n4hRlsOMkuSFFOLWvlsPARwpB7DG5Mvdw0wv11p4djA5znxaZEq68+s
         Ctqq/bFL4Bh/x0SC74keO/8/2tW7Y3KDUJcB6HrHJa8EIF9J6yH/XR5hE9WLy/S8QmLr
         5lg41L49i60OljnUmyc66rZ78DrErUseAPbp5cjW4rZjcAyAjWsPRQ5T3XwyDmGdsWMr
         lXH5IA+u3mcpP3p3i+XfWixJsOaf3EP7uhHSBzEgsVXgV7ZgbmayEINLFr1bWF1/D0mt
         kdC0wOefktkgJdtx2vuEKwoW/nGH70/QBxp1kwC0aSrL6XWY9txco31y4oBH+8j8Vzfo
         lkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734975439; x=1735580239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5BPXUs7XDFyKDHNZ078Dqly+mBHZoWSc+mzflUGYTs=;
        b=kdxRalSYiT09pjKGxU+skWLnhLR9AnFdlWKEW3OaI8M7Uy1wfPq1Wdpf643vgLtajt
         MKIz+08+SYv8p55JDHtHVxSwiIGrQKc8eEFrQOK2Ka918uyqhSPI1xiU78CJSjvmMoN+
         HPEy+63Om1pUgpct5EWTU8v6QCLMJ2RWcUBUx59UlzvvIn04PaG/ZopB6xxvq+8W9n+y
         7vimuCL2N5KE3qCrJ7BJGY4ZM/0hlW5d/aVkR2n7ep+3tRLM7XL2C9+2u8UqePOYzVHl
         FlBymGGxoM78t62aYCYnkVxyhHpmUCVy3O2Ha6L1hrw3ScIQsZJU8ufKbhpwtlzGbvmo
         knXw==
X-Forwarded-Encrypted: i=1; AJvYcCVHtAJZyGSecS6CiQIjoqJtEW1v0hckljnC3jvsq8EUnKCoaZnkJWTtVhnr/6nKjxuXzUr1bd9r6Q2LiCVa@vger.kernel.org, AJvYcCW4JM5clb2vud70idF1huS+PU3xeCIq4Gu4kYqk5hjWpmtYwHp45FeydW4fruvRYK1m4Jkxe3sNGmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyayN+lD1DyRWXNaCYfhS/WNowOp+pS6AXjd7QjfT1GwobI62Al
	JzW8k0Ob4iH8ujjTk36sJGpufmrub5X80oDpEM1+5qE2iXLSzpZ3fUkbzD06
X-Gm-Gg: ASbGnct49P1jOx9Vzi/HDty+70PqZeageZST6OS63rw+EfFOTCuzmWo3NWHBB4FNRJf
	8s2QcqqZQqH0457xskqCFqVUGev0zRLjPmlTz3diDMZcZUvMp3Tv/uyYrjf/YaDT+OpLIbRtNvh
	lcNFNaVpmRbhhYAomus+4B0KESIkLDI9AeC8NnffvrGjy4Q31YOfV/xltbanOLjpIgUz+cyvfXT
	e2L+bY2/3HfCkKvcEJ1ca3vEFU0UAftVeylNDTcsmsfqG5Z3jPvx/ReKfwiBry53d7B+tV1RdpK
	xNCH36I=
X-Google-Smtp-Source: AGHT+IE4KvKdBQ8/TWxuITx2WijanHajsN1ggmNoomTbz9HF5hlCh156tQlqKmT+12J78X1dFeegsg==
X-Received: by 2002:a17:90b:514d:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-2f452ec1ceemr17475655a91.26.1734975439017;
        Mon, 23 Dec 2024 09:37:19 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:689d:b086:b856:9280:38c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cec5sm10664032a91.7.2024.12.23.09.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 09:37:18 -0800 (PST)
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
Subject: [PATCH v2 0/6] Add SYS and GIC clock entries for RZ/V2H(P) SoC
Date: Mon, 23 Dec 2024 17:37:02 +0000
Message-ID: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for clock and reset entries for GIC and
SYS, along with some cleanup and fixes to the CPG family driver.

v1->v2
- Updated commit description in patch 1/6
- Updated fixes tag commit header in patch 1/6
- Introduced new patch to support mstop configration per-bit
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
 drivers/clk/renesas/rzv2h-cpg.c     | 167 +++++++++++++---------------
 drivers/clk/renesas/rzv2h-cpg.h     |  13 ++-
 4 files changed, 96 insertions(+), 93 deletions(-)

-- 
2.43.0


