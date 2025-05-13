Return-Path: <linux-renesas-soc+bounces-17057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5163AB58FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 17:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F0DC175FD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439D72BEC40;
	Tue, 13 May 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYcZY5cO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591812BE7BD;
	Tue, 13 May 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151208; cv=none; b=c21umQfnN+5jac5VzrYwRPSm1R6TU5wlb9qYSMCzyRXWUY52cQ0mla9Tymz7SYpoHgL0ABtrKSf1DE4wjl3Z6nUejPKruRclf+2D8Byg3skAsvFs6HVyXrrO+QttJtv+eRpEzxseFCF/V7WA9l9Q2MjyMziqp9+VqVicUQCjdnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151208; c=relaxed/simple;
	bh=LI3mbOUtgq+1PPe2kyvkUpTF5WLNyxcZW8ejjH9IOX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H07PXVS6ruzczbeQZvIgTpd1stJ0u0g39knzozjhZwm11EeGdpeWugAHsQyUgxARTZkMyqrZgVCYob9AJsJzdjBwTpV9egPdAaZXx8fxJDXp/ivFjeEJK4tJHaIkVnCzicKB8uv+/Z7p2aVctFDrA9Shf+esMlcZO+1ofVMHLfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYcZY5cO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso38710495e9.2;
        Tue, 13 May 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747151203; x=1747756003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G47Vz6fvEHe6vCJ7AEcadKs65EoTqDV9LPlrLeWYtgs=;
        b=XYcZY5cOTlH59WNlzDA2mtH5enXRSYUrEMXdqwBtrJb5EpB5/U85ifvjIUIvRM8ojG
         oOgt7rgMI6D9F+vVbcgikNFQq3o2ZGmYlmxpSJ3CxZQcIMRc1KGaTShnkzq5y5Xq5uxb
         FxUfFYk0nFB9kfepOtN2cb0yt0mN3Z2RSCVWJrJvfkql79P22R2b56SiuHL35uwYv/XV
         e48iJNueBsBYp5K2qWnkEkkKqRxATq5UxTI2EmTEcAlASZAZn2DxWg8+Vi1+JPtUwhRO
         HwMNMpl3fDRQ1URLh4iXJN/8kF/LK6pqTZdze2vUf8IQwYeEBA9cEeOfu78gILWz7Wqc
         5MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151203; x=1747756003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G47Vz6fvEHe6vCJ7AEcadKs65EoTqDV9LPlrLeWYtgs=;
        b=HXg5HzpUmeYmPVkJJFsrsl7iRURQ5zpYXvNJsoYzzhDF7e8TWkvzz82UtsrZ0/YJXn
         EdTR5w/3zaipPW1UWxdtVWeNlnBOQzxukDSKiUJRC6SQPKlOyDdv8QufwlWT4H1+O9xE
         Bo59QRd6bTGD9Ro+5RAxnDCyw1JY/UWqNhvYpHuQVwbT6BiWj10TPj924PferqPUTDvd
         q8K/lLSugrLCW08ekKOuSKj9rOrYvFvcRkeOknNzI0RsnY+FUnl5yEQHdhelOSso7tg4
         CVNcqCiziW8CFjwFfLvw3MAZk3RrljFUMwxm5DXfI3aw0p458/L67J2vtVPXThJNYRB6
         WHSw==
X-Forwarded-Encrypted: i=1; AJvYcCXGIyKwXIAivCuuYgto3aCgFmr7YC0C46ts1FexkpocU0ssqxaFpI/KTkmh4jvEAOdnAIG9iMTKPZwmb94=@vger.kernel.org, AJvYcCXYQn9uBOnYAVDIxJEpCw2s6yA8LvRA/kwGQU/DWXiBzXaxAonjX3ZH+19Fnk6cTTR6mOBkT/bxeUdwZH2Ml4+HOsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhiIKW3yn37jcrCgWJuVoiSFi+5PeHL19VBA5IKlTYOQMJbZtx
	T01jRV89uNHvGurEYh8ucs8WUE2tlbEj6cOsLd9EdSUZCx/V+08e
X-Gm-Gg: ASbGncttQQgb80y5VX26YkSIvqluo0Z2chzYXLhFz6FOqVyQupictvf42VQZHrmxDpF
	rjQe+YpA0S5HYPANZJEq46r88ItEJomTxWQkW9r0Lq6/FS5zHf1bTeOocDE80I5U/pTiBJXDiQZ
	Tag0UxqX0lq/sd4JYUeoNmb+CBYrEyLGb2s/D6jVxzQdtGjfQ8yPAaM+7tOUxP0O/BxelGzQyxZ
	awoTt2J2uV42RjhUdEZAzvOWfqreasjqBaReE/fDVFj+tB8kCYzIluh7uMvd/VM/ONzb2f9Va27
	XrIpRRc6eQ/IJM8M/YvMj3fvhQNVydiTD3CdSQy33/AITIckq/yonnLtUxdHpBtdEnMEhYrmPal
	pkbXcD15OSP25EpPyeXTw
X-Google-Smtp-Source: AGHT+IFlgguu579T11n1XG3482eOGf2Xqxwq8atO6NLI+PD9ZnCX/USeEANd62pNzKgdi0sTjcor+g==
X-Received: by 2002:a05:600c:528a:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-442d6d645d2mr170703775e9.15.1747151203337;
        Tue, 13 May 2025 08:46:43 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm183724645e9.31.2025.05.13.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:46:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] clk: renesas: r9a09g056: Add clock and reset entries for RIIC controllers
Date: Tue, 13 May 2025 16:46:33 +0100
Message-ID: <20250513154635.273664-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add module clock and reset definitions for RIIC controllers 0-8, which
are available on the RZ/V2N (R9A09G056) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index c57583e7f659..a489e718a9c2 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -154,6 +154,24 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(12, BIT(0))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
+	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19,
+						BUS_MSTOP(3, BIT(13))),
+	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20,
+						BUS_MSTOP(1, BIT(1))),
+	DEF_MOD("riic_1_ckm",			CLK_PLLCLN_DIV16, 9, 5, 4, 21,
+						BUS_MSTOP(1, BIT(2))),
+	DEF_MOD("riic_2_ckm",			CLK_PLLCLN_DIV16, 9, 6, 4, 22,
+						BUS_MSTOP(1, BIT(3))),
+	DEF_MOD("riic_3_ckm",			CLK_PLLCLN_DIV16, 9, 7, 4, 23,
+						BUS_MSTOP(1, BIT(4))),
+	DEF_MOD("riic_4_ckm",			CLK_PLLCLN_DIV16, 9, 8, 4, 24,
+						BUS_MSTOP(1, BIT(5))),
+	DEF_MOD("riic_5_ckm",			CLK_PLLCLN_DIV16, 9, 9, 4, 25,
+						BUS_MSTOP(1, BIT(6))),
+	DEF_MOD("riic_6_ckm",			CLK_PLLCLN_DIV16, 9, 10, 4, 26,
+						BUS_MSTOP(1, BIT(7))),
+	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27,
+						BUS_MSTOP(1, BIT(8))),
 	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
 						BUS_MSTOP(8, BIT(2))),
 	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
@@ -217,6 +235,15 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(7, 3, 3, 4),		/* GTM_6_PRESETZ */
 	DEF_RST(7, 4, 3, 5),		/* GTM_7_PRESETZ */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
+	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
+	DEF_RST(9, 10, 4, 11),		/* RIIC_2_MRST */
+	DEF_RST(9, 11, 4, 12),		/* RIIC_3_MRST */
+	DEF_RST(9, 12, 4, 13),		/* RIIC_4_MRST */
+	DEF_RST(9, 13, 4, 14),		/* RIIC_5_MRST */
+	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
+	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
+	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
-- 
2.49.0


