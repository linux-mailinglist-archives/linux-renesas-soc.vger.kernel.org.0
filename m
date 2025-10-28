Return-Path: <linux-renesas-soc+bounces-23782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BCEC15F7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 17:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15D264E9554
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 16:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DF134A3A7;
	Tue, 28 Oct 2025 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBDswHIi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B693491F5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670329; cv=none; b=WqQQ+IgypYYaAZ8Jj2ilGxuTRsXLrPPWsxIz1dpZwNaMx2fRmJdhwbdpms2jU53ugwYeMAvAJd2Hl+woZ+kMW2rmLjXi/tFIBKK89XyB5cRJUyzTk0dbhC9sXbj03ftoUGd5UppQHGr+ykpGQi1RtBNTylDFL4XpOMP9j+iGH0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670329; c=relaxed/simple;
	bh=uAi2FHcWsJ3GX+mStHxzc2rrz7IQpZYtqIP74XffftE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9MWcW/T8CfNt6+KtDFk7bEzAi81bqVPTwAfsfyma+pW0sjvQH1keJeLcglB4fwAUwk14H5fNRTDW+gpej48/1jevOIsBiso62y3L8qwVlz3FFspwmQuki4aewkCE8ctXJreBXgfipaLYl7BFCCgbaWEpBEJViFemEr9g5VswV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBDswHIi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-290aaff555eso57601335ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670325; x=1762275125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozhuagEONZfNxkbetsUDydMVsoqSUlAvk99bJ1oqkyE=;
        b=VBDswHIikAYS2q0DgNT6jElJeM8Tn4FQ7TG5FDNH5dlPJSmbWYSFpH+8UzamC+Grwa
         7zECYJ6zkBJ5LL7jKlSo5sSMtHNuZ9YBWMa+IycOp9PX/ye9nig7879/XMRyii81g2e8
         Z+ujwtzreE3lvFkPAyeTdgpELJ1RmsG0O9quDHapWU44hV8/rYLKmtEOT2W8c7DxE1W2
         MiD7VqliDv+qqrkTQCYQP8oGjJHElrxEqAqMwJ7a1UMBLnhUMYY1KDDAYLygJhU6Tark
         j5tLzCQhMReRF3B7Ic5WWJ5+dzYX+XUMyONO8bw/OJ2iwHknj4fz2RxBg+0co99nzPRR
         Z99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670325; x=1762275125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozhuagEONZfNxkbetsUDydMVsoqSUlAvk99bJ1oqkyE=;
        b=EtBSIyyFNYkFy4VLGxWlYez2kj1fxMkWtBqTCNH1AfeACcg2DLYmSG5479/emUE+5T
         acIzzPrA4tejGlG7wwY9MM94s8FNmgD1GGPU5QjwpddlTHKpBsN4iFJ5ngq4s7cfDLBI
         NKTmm8uJMF8hCBD7qkQ4pvMIhI+GWZXGwNK2mDn3tN/6d8Z2nGssix3nJrSZ89PeRNtd
         vaE8QjLnvmc0xq8FsQxnugmPKBQSmr5eHHxunObNf+VfW+ebCATEsPc6cmQqzP5V8z7s
         B4yD+W4t4VYhrfGpLZmupz+d0EG8R/Qx3gGSj2BaOvAa44rL4UPccXTl9MdSbe2C+iUf
         NiWA==
X-Gm-Message-State: AOJu0YzLZ7mAe7ZExwZF7OFwBo286WOxMdmh0LfzSMbm34hqjlVrrOwU
	kHsAZySaKBbwcFX9TLEdoLVC1KHHhCddUvBw6Q4TDe+pXzGdqFzfRM3T
X-Gm-Gg: ASbGnctLrmVLgfAxWggCwp0UMEjftJ1wgB8i4BVfENnNxstRFzRgYHumdJEttBOLSy0
	hP42mw6XCUhhU75XygIsB7bVvfWFoysrybSK9aTNaTeeWWa4tfwDGai46/8DbwdNcSmWW3PFLb5
	0F8iiE4TlFN7484y3m+PAiruz3mfPLnsbkBIDPyBh614VYvaDGCccetuAaWzrSKW3Eb3Igr8SGI
	J4fhYLxlrNCre4P1zLx35KRSJ1QGpyBmm3nxq9ILSNUEeg7323G1DlYHFd/CRJ8lCbebQ1h3ZVn
	9zaNglsey6bjS3ASdV8DQvBe4GXKzr++pdLh/Fer9lDeRVw0YNqZ523oaIcwnlyAZDEJZSCdiKI
	qKExSn7lOsYBw6nXSeQv7nOlFF+c3xLCrF/M6YN5X0YGIPi9ek3ISG1Ei27iYS2+NMWA+A06gXd
	3BDKT/9WvqEsdcjQRbiIueDg==
X-Google-Smtp-Source: AGHT+IH8qFlYrrL24sCRWgUP6EN5lsSkXhcAlMQevGU1F8wGdL4QnVY/o2LpJYNhO1zLzXrVH+kFBQ==
X-Received: by 2002:a17:902:d2c1:b0:292:dca8:c140 with SMTP id d9443c01a7336-294cb6739b3mr50494845ad.44.1761670324753;
        Tue, 28 Oct 2025 09:52:04 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm122123665ad.96.2025.10.28.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:52:04 -0700 (PDT)
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
Subject: [PATCH v2 3/5] clk: renesas: r9a09g077: Use devm_ helpers for divider clock registration
Date: Tue, 28 Oct 2025 16:51:25 +0000
Message-ID: <20251028165127.991351-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Convert the divider clock registration in the R9A09G077 CPG driver to use
device-managed (devm_) helper functions.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-v2:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 30 +++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 666fc16b9a81..b46167d42084 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -220,21 +220,23 @@ r9a09g077_cpg_div_clk_register(struct device *dev,
 	parent_name = __clk_get_name(parent);
 
 	if (core->dtable)
-		clk_hw = clk_hw_register_divider_table(dev, core->name,
-						       parent_name, CLK_SET_RATE_PARENT,
-						       addr,
-						       GET_SHIFT(core->conf),
-						       GET_WIDTH(core->conf),
-						       core->flag,
-						       core->dtable,
-						       &pub->rmw_lock);
+		clk_hw = devm_clk_hw_register_divider_table(dev, core->name,
+							    parent_name,
+							    CLK_SET_RATE_PARENT,
+							    addr,
+							    GET_SHIFT(core->conf),
+							    GET_WIDTH(core->conf),
+							    core->flag,
+							    core->dtable,
+							    &pub->rmw_lock);
 	else
-		clk_hw = clk_hw_register_divider(dev, core->name,
-						 parent_name, CLK_SET_RATE_PARENT,
-						 addr,
-						 GET_SHIFT(core->conf),
-						 GET_WIDTH(core->conf),
-						 core->flag, &pub->rmw_lock);
+		clk_hw = devm_clk_hw_register_divider(dev, core->name,
+						      parent_name,
+						      CLK_SET_RATE_PARENT,
+						      addr,
+						      GET_SHIFT(core->conf),
+						      GET_WIDTH(core->conf),
+						      core->flag, &pub->rmw_lock);
 
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
-- 
2.43.0


