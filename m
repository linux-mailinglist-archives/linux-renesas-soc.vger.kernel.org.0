Return-Path: <linux-renesas-soc+bounces-17549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B9AC4D25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 13:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FFB3BF6B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6822925FA05;
	Tue, 27 May 2025 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M+Iei9aX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16B25A323
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345060; cv=none; b=byyQxvYf2XJgTr95yPgUbESF1pxLJWVMLVfDjnfG/eKNZFx7ioYG49/FWZyiftvOAAqRgmBXhNj3yas7kbahF2jk865p0kadHGTN4OuU96Y5d57PXJLQoA3IzWvbV4keM7vvB8YOWutuURfKaKJyEdxpakFmxK3uxQCH6fk0lcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345060; c=relaxed/simple;
	bh=PcZ3HrcegfnXqs3zq2KhUtyO7SNQPGKEOh8eL3A9+lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDWJ4QhV7XyiBWBmi6T0sWejH3meS3qEWIIhu4NIShLh8tkkTuayAJ5kho2cC+jegb4AJHZosr9R9DlCQ6jgErpXB0WifYitj5SUZg0gsNpgtlfJxjngM+7RRe7fXd6JSGK3Z2xPqxWblw+5y63/Zch1Xblf3zj6F8RVgoefZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M+Iei9aX; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad69e4f2100so487203166b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345055; x=1748949855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDUY/udCFbCQ/CxzHCrSVeL89fSktFtkiZrjui4aduo=;
        b=M+Iei9aX+uPj/9YBtlwlzLDtUdKJgKpKQGWW5jWhq5Y+tNFOjLFDZJ+vTQOP/G09se
         I7vdHGsY8wEm2XFe5Erchvl1lL96HV7nBTjgbEMAfSvb6qhC7eJVVmqqwjQOT+oJAAWa
         ckongLEym4348QLaeyfgNUQaifMXNLNfcY09IniINPk85QJxh4HkvrQqxvuc9WOFq5Re
         N3mtmvSsmdHH8slxgmihNQQQzpb+ein65MC5DcIwC4zHoaCrx/OCoGnKNMNcBAFtsLjA
         7zqfCHcB7CEqjW/vpuzbi18EiQ+aufhz0UHmd9Kyplmoq+Y+tRQyVM3NlURTe8YEa9+O
         I73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345055; x=1748949855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDUY/udCFbCQ/CxzHCrSVeL89fSktFtkiZrjui4aduo=;
        b=WanVuET2OApFFBjj31z4/xfqc4jJ94edX9EgVw+mkaGWtNamZsDdFhgwYI9UMRejHd
         CjcCGHFXwUpL+IPoI5T7C3cw+Yxql+DirXvWbLWZGHdFk2zVJWsbiR+wuaz3hmJfVng2
         /PDaHxZN/ti/mUMPptBFPFbLqN5o4XaHvvbd3NEgh5lYUCnz6gM74y0hG4i5H7iBwOq4
         YwHqoiZlgDRBzup9UUH2eQAZdPSo9R2oA3T2JwSAsSpgpxoG7fKstriRHh8nx6so4Wie
         v0Ja5+v9HTnbEsdFKo7+iynSSkdqVHPhi/3b1qkxGkJOhin9b9vLW17uQznKV9v2yrnr
         oDnw==
X-Forwarded-Encrypted: i=1; AJvYcCUmhcklhq7fDptAmWQYlzD9jCmqnYPV2qh5z6h/d2/+YPwhP23YURFQiNvz2zsqJdiKlgWkAjZ18un7KOjpU5X24A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQObKuGHiD9KfemSXhNARW4+YVMXeI6EwSTN/Zl1wKWUpYrKR
	1f4EE8iSdOGOKNsbTsdT8cGTcuBWWSBlMI2sGbRZfKdkJjf9YKPhDmmmayTLIxIjMxA=
X-Gm-Gg: ASbGncuD/pBT8u2XhGY3Qrby/mm5JwNih9XSYd34aplf/U1DL9UIuaBnkC1hxBQGrNY
	fEg86bltJfI0ajYynfo5oqYdPR3/cc40sYM+UZpev45IDdxeRO5F0mWxxUFB+kX/BOULVPsMDcE
	7tBOEnqDcjey9xCJ3KG3GnWWl4GGnQmov/kRc2un4GoPTq38mjv6PoL5G03pRXtV5D4Demnqsgg
	ijbTp+Cl/NYy0yeKZ13qF4TRlBVZ9WEcSDXspyqGfkez51Go8O2NN7Z4Sxv1zAE08k+kWlC88bF
	eC37rcotR54zBVa22tr0GD8Ki18DN3mrNKkfpGCD9RG4fEh0lWrkLIMl04Z0GRFixIALsxd6UzH
	+YrXT
X-Google-Smtp-Source: AGHT+IEapw+oDUNYJWzRpbqivOuZHluFTkHfFwaB2YzuwZtTgF3IVbvJeRzozPCVZmCAbTiyVocwyQ==
X-Received: by 2002:a17:907:3e9b:b0:ad2:2d60:24a1 with SMTP id a640c23a62f3a-ad85b130284mr1127859866b.11.1748345055154;
        Tue, 27 May 2025 04:24:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 2/8] clk: renesas: rzg2l-cpg: Move pointers after hw member
Date: Tue, 27 May 2025 14:23:57 +0300
Message-ID: <20250527112403.1254122-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reorder the pointer members in struct mstp_clock so they appear immediately
after the hw member. This helps avoid potential padding and eliminates the
need for any calculations in the to_mod_clock() macro. As struct clk_hw
currently contains only pointers, placing it first also avoids padding.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- moved pointers after hw member
- updated the patch title and description to reflect the new approach
- collected tags

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c87ad5a972b7..767da288b0f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1185,19 +1185,19 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  * struct mstp_clock - MSTP gating clock
  *
  * @hw: handle between common and hardware-specific interfaces
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
  * @off: register offset
  * @bit: ON/MON bit
  * @enabled: soft state of the clock, if it is coupled with another clock
- * @priv: CPG/MSTP private data
- * @sibling: pointer to the other coupled clock
  */
 struct mstp_clock {
 	struct clk_hw hw;
+	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *sibling;
 	u16 off;
 	u8 bit;
 	bool enabled;
-	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
-- 
2.43.0


