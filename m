Return-Path: <linux-renesas-soc+bounces-11778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1AD9FFDC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 19:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BA623A1779
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487401B07AE;
	Thu,  2 Jan 2025 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtAwlAa+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC0188596;
	Thu,  2 Jan 2025 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735841933; cv=none; b=QA2ZbcQjnL70wqp7VbdnjDe2LKl1zBcA9EbUx39znWi/VfkAOcvi/8S153Jvtai/+0P8wyF3JdbHsCU0rhPYyPe9mAxbGrHlr3PRAUSbC2X4YlCQyigb+d6WkVH7BYatFqqgDxOkT27AHeFifeLSontOzR/U0akh15IA51ngZ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735841933; c=relaxed/simple;
	bh=ZSo94qHiMehA9YL1TEdJYICeakm1X0RTS6YmBtreBjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fC+AxtIweELBj/y8lp/02rNwNB9nDcy0YwatLOmuy5AKpSQpe19kcJ9JDHtdLIUMyL0HC2LBCVWKAObSOOCvARTaKJ3/6jWbWfUKg2qoQfv7EAtQS06uXKoNSckVBPs/TGu0H8xZLNeFwP/uUh+b7MJJv02h+/KlLW+r8m+ThLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtAwlAa+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso79234475e9.3;
        Thu, 02 Jan 2025 10:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735841930; x=1736446730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0+JLrW5DLnjAHxth74m+OnybyFYzKU3YKVZKXvyhr8=;
        b=FtAwlAa+KwMPM4ozkOJtGdYl+du5DNKlvIPzrVn0wc8nZQRa/jBzZdVbK5ElRz4aHP
         lKCr6NYN3VIore52/GL1Ay6vgRiTMFSJTAO4BODikNJT9Pe/JDRLiTRzcYCv3rFTIG9r
         CFIdsFQTIvZD/NEeub177ydVc2EZiRLOJY8EPyeExkcHbv7p/S+1GoMfrFIrY5yLNyuF
         Rh++v+DpKvwRhKYQdLBNCKtj+hM2vp9/En0g9Sxn/5Ftyx+GTn0+qSd4fLSCnseCj+6z
         nzksILvy9KmkjBf8X6YUT3KtaXhaizt7gGr/HwdTjmdC4DNFNiRrXT1LK4Dl5LxHCsFv
         7SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841930; x=1736446730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0+JLrW5DLnjAHxth74m+OnybyFYzKU3YKVZKXvyhr8=;
        b=mue4NhqEcXqSq5Yfq6oUiXrkBL/2CYs/cwvS9I5Cy5TddxtZbBnaeszrl5XRqzlKfN
         YswCOENN8b+OXvIKXmCCWDxupHDOgB48wIS7KTDsDt8Fp8loOEu7liJ88i+CN3aC/TGq
         LYkvVcFRTVewoIqBtz7Omfg17g4OmFhe5OKKCY544BdDKVfj8pZolkgBLmIJMI33Q2D+
         EVy3Fb4cIECOz4VQ93gHJBeT+ObQAQT0VQZFYmld2FRqutBC7wwtrDD4WZrXDUpA3B5N
         veikTOL4uSA3M2HQhWQv8knDJy9KYLj8JHR/oob0ZnUhcOG6OOm/nGJorhvAE05BPmhy
         myGw==
X-Forwarded-Encrypted: i=1; AJvYcCUSeBkeTcpFlwJN4qKFcMc83KepgGh4hlWtvyhz6Fwo/Q0r16s2Ky0BTgZMRtW8yDlY7ABZGKKUwPOPSDhU@vger.kernel.org, AJvYcCVxh5gsshDzZx6lh77yeA+deMRAVXpD4X+ml657x/PGaa/yka9jm0RL3GaYOq65ncWdhBEPBjdNTtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/I8uKdsPLfJcrQezgoGH2QZZkfGQXzeJwM1dWHNVTFybMbWVl
	MPQjz4dnlTxGsjCnssjoIiIZOOuGnCA6tRZ5TN/B360x4n22U6NIi+GzPg==
X-Gm-Gg: ASbGncvTW+Z6kZVb7T4X+XYsuTzA/dUaUASnauel7BojJ/znuyBXMQYB+dUGpkLZYdo
	YCJZ9d9qr0op/x0MnqAgAjdoyDMX8GyG1ETlh4Gmuuh4m4bJDrAa3Ds7c4EIqR1oXCx5kYMAZpI
	vaSKpQ01LDuSzTlCPKrUVjt/tGQ+RsEnYj4h1XRNpP9OIeEHyHVuUoj38OnsrtkRy5uqJcarZom
	8AQe3Qxr+UbawUm5UgcrkKYQb4WI38IYovocHkYcqj0tOvRgwuioFlWTpfwcKeB1E5TDYlsJcS8
	Xfh3LTM50w==
X-Google-Smtp-Source: AGHT+IGZ/F/4VOijh17y1ntXU7fmXNTrz/uGpVCJ6UqXE+SrXZ5z+HxfJS3znSdnKNVvkY2ucRkr1A==
X-Received: by 2002:a05:600c:5246:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-43668b7857amr428349845e9.31.1735841929730;
        Thu, 02 Jan 2025 10:18:49 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm493291925e9.3.2025.01.02.10.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:18:49 -0800 (PST)
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
Subject: [PATCH v3 2/6] clk: renesas: rzv2h: Relocate MSTOP-related macros to the family driver
Date: Thu,  2 Jan 2025 18:18:35 +0000
Message-ID: <20250102181839.352599-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The `CPG_BUS_1_MSTOP` and `CPG_BUS_MSTOP` macros are exclusively used by
the RZ/V2H(P) CPG family driver and are not required in the SoC-specific
clock driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag from Geert

v1->v2
- None
---
 drivers/clk/renesas/rzv2h-cpg.c | 3 +++
 drivers/clk/renesas/rzv2h-cpg.h | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 23c89b0de38a..38edddfc42d9 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -41,6 +41,9 @@
 #define GET_RST_OFFSET(x)	(0x900 + ((x) * 4))
 #define GET_RST_MON_OFFSET(x)	(0xA00 + ((x) * 4))
 
+#define CPG_BUS_1_MSTOP		(0xd00)
+#define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
+
 #define KDIV(val)		((s16)FIELD_GET(GENMASK(31, 16), (val)))
 #define MDIV(val)		FIELD_GET(GENMASK(15, 6), (val))
 #define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 9be5a312fa96..810275eba473 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -35,7 +35,6 @@ struct ddiv {
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
-#define CPG_BUS_1_MSTOP		(0xd00)
 
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
@@ -47,8 +46,6 @@ struct ddiv {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
-#define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
-
 #define BUS_MSTOP(idx, mask)	(((idx) & 0xffff) << 16 | (mask))
 #define BUS_MSTOP_NONE		GENMASK(31, 0)
 
-- 
2.43.0


