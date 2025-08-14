Return-Path: <linux-renesas-soc+bounces-20518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 078A6B265DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 14:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83945C310C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 12:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690E52FFDF1;
	Thu, 14 Aug 2025 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDG7koxY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67C12FCC1E;
	Thu, 14 Aug 2025 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175721; cv=none; b=S5CmMQpFMYwWFNxVHe9VYZRhrVRWvBqb9rVWedbbmEztNL91afrfuDjlmxQeuBlbutOn/uAdNPGszf+IHRCZ/d4lrPFZ32OR/A4U3TT8fuWONk1/QCgxmHbMY99bVVgFu5dAs7MTvp+5ZZDTW6KtFSd/c8prheuFW9aLSBQyDh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175721; c=relaxed/simple;
	bh=xIpnvcRgK6keN8SsZajP7QOWVROT//xhLjdQ8gtBmC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPdD4tI8TsejL2RBBNHi0pittUHDclznTP1m9sa3xvIiUTPxfsryH/vtGuUljF9ItAU3yKTHSzHmaq/+K7Oi9PjxotBu1hGQrIoUKCyTNckpvEo49OLTTxaTASpZtOuBLh9BKgtyW1h0fbfgqqJyBMHALqzqhrPZteUtaX0FwRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDG7koxY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b281d25so3596945e9.3;
        Thu, 14 Aug 2025 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755175717; x=1755780517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seSepI1SwkhcWo2g+eNikbmkOSgFCIfDJqBCVLKBGfQ=;
        b=RDG7koxYCd8QvtybiWPlpP5QC+Y3hASlKGq0bg/4cPDeoM2uFwMCwkS9ycMvrK+U4h
         THit8GDrz0eSPo+OaeTQ7SIUw5Ez2pc2IwExRXElXqyoyyYWiAA33XOSK0cAXUaR078A
         8ocwo+wqti0KtPSIQ+o+nx8h9cxsLDAsTDCXNMunsNlHferd9BYNWk/wsAn+VBVr3xA0
         xANUVTaaI3K6Do19SJNuSIQSKsJQp9N9Q0Mj4oLLv7+3+l0WJl7K9BKd6MmNsPjuDnep
         BvZSC18vJNzXw1ncUI+z0vgLDSN63QVVaF0l2/y/J5JlyD8flf0UJFS5YS6obUhp2a8/
         GQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755175717; x=1755780517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seSepI1SwkhcWo2g+eNikbmkOSgFCIfDJqBCVLKBGfQ=;
        b=i2NwG3FW5pHZD0SaSLM6/kVpx4k/AmVH0lUqmtdS062U0zIxyRPQbciRKsl7OQbNiZ
         P05TNljC3YfrEeri/ijditSECFExhR5yCl68DJJyldnNmly3byym0NzM5CeamgYKGkjn
         F4f0FbZ+vwbXFzMEQ3zp6G+c7sCVT5dKeZui1X4t7TgoKNEZFQ47T2YJapziEIGCad00
         KMuvUi67bhay5R2WS1e68LR6kqJ3zNdXKlaDeSK9yZCyizJSlLtHgRFJ7pYYa1I/5My2
         SBZyP4t4RdBQa0xk6ZCRLOraTmfyP+ZdRw069Odhx2ZbBIbBH6vHWnc+iN1VrLsXvstk
         ojbg==
X-Forwarded-Encrypted: i=1; AJvYcCUDz4Os9uY8pYi5IIIgE6K5NToXXm/RCHOqxkMD1NK+0TvYm+z0clGMB06pYCfWK23D+qTxjlfaY5n1Bo8I@vger.kernel.org, AJvYcCVQkKLAxS1nm7smkQFoSZ7kZwbv//eBcSopuGdmMTUBnOL23bs/Mv+MrZz0d2wLE9hFuK/uYZnU1ReyZSDtmc5Ou+o=@vger.kernel.org, AJvYcCVYXNx18SKgbdGW6MCAEMiK3Y+gbFoOjMRfbyuThd6JPln4OgZX0MwOcqOXtny75bRxuECDwZt7xTuG@vger.kernel.org, AJvYcCWof5UJRI/4xUapZdlXy/b2CEeXmsJKgUQqd4FBVTC9iVvmQLD3OvdwSiJ63QDiDKFcPXPjT2RzxyC5@vger.kernel.org
X-Gm-Message-State: AOJu0YxMZ7KHDbmXYUkXIDVnAChd5ic2As6Gju7gbCartf7mHMJzvM8B
	LbvO5XlBPEpAwTSNbjks6GWnuEt5axcsy1w1c6KacwlDs/ClOqz0bbDS
X-Gm-Gg: ASbGncvkqheLPY1WEn+4suVfjDvEkLUmqc5fOBt6nQ+zy7rs362X5/eKfQmcbQV4HRw
	cZfcHzetijOe81L5K7CT0xMdWAXkmWIpipd8MlzVlOVeY37mnzbJG2aL4qitoFZTZsWXp+Qq7nX
	vzZs1VjfTvaEirrw9iJKlUsXqy/V3nsvQO40JLhU4PN5X7rCGEnM7L0c34VVsYrNcTPvuLIN1sR
	+7T+CWM3JnWmTCGxRgPxsfYMnOk6a6UVfB0st3TvdmK/37lEBOph2vTejzbayjgvwoYj40mKFq9
	ySAYv309HgEL8jpjAE0hWVHS8wwh/LQGi4blPN5ki6BXvP69egLglkw5RKOZkw5QfCB3P/WWspa
	7oBAb/y6vgcVCD5ncGXmM6xsn10AivWJYa6LuGa5hXfEmc9Vrwo4HLhofl+Eyoh31SJjDkVw/eA
	==
X-Google-Smtp-Source: AGHT+IEGBrAqnbKDrFlHCELSCCSoKRb2Rg3v895ZlS72+IiRKX8VvMgQWb86WzhOot9cadZzZgyLgg==
X-Received: by 2002:a05:600c:6383:b0:456:133f:a02d with SMTP id 5b1f17b1804b1-45a1b73f808mr27550495e9.17.1755175716912;
        Thu, 14 Aug 2025 05:48:36 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c466838sm53497380f8f.49.2025.08.14.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 05:48:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g047-cpg: Add GPT core clocks
Date: Thu, 14 Aug 2025 13:48:26 +0100
Message-ID: <20250814124832.76266-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add definitions for GPT core clocks in the R9A09G047 CPG DT bindings
header file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
index a27132f9a6c8..ac0f1ce3c752 100644
--- a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
@@ -20,5 +20,7 @@
 #define R9A09G047_SPI_CLK_SPI			9
 #define R9A09G047_GBETH_0_CLK_PTP_REF_I		10
 #define R9A09G047_GBETH_1_CLK_PTP_REF_I		11
+#define R9A09G047_GPT_0_CLKS_GPT		12
+#define R9A09G047_GPT_1_CLKS_GPT		13
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__ */
-- 
2.43.0


