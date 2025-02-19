Return-Path: <linux-renesas-soc+bounces-13370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB8BA3C48E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093283B45E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6872C1EB195;
	Wed, 19 Feb 2025 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ehy0sari"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9631FF5F6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981292; cv=none; b=GA10X4ZQIGh7J8/tfiBdf5Iddc4pyfhBvY8lfn4nmX3VogL45qoeYHFx+LztkVKDrrj+kYmvrcxkKSDvYkNKZW7WEOnvHYO0EWxohQ5/u6becE0AiEJ40t1uOZBR5wtXxds6k9QF8jPBdP+QRcEaDgyKkoOVCyJ1MthQljdpFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981292; c=relaxed/simple;
	bh=Nu+B+aent9gnDnLeup0LX+XZtFmQ3i9h19QHH4qM5Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqY3ymnZAKTqqpB1P8G7li8MiHTq0vIrliSPXnB/HVS/3wM1uc1P7QFbf6FvwjU90KC3/bNQqUiyO02Src3RqoLNNAU+j8jCtxiboQ/+q2H7py+PDfBBGlXQUq3tRkXIkHaBojI2OH36QkVKpB6OatjpEaEwHCit+wPwOyzVXAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ehy0sari; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaec111762bso1600281666b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981285; x=1740586085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtGBoe5coeUnXZJpUlOcRLqzBSKuMVRJ9kwi5GgXX1M=;
        b=Ehy0sariCfO4XSF/zqmG1HB8+NOcqx3EyYI89+XO3YwUnm05s+gG6Z8o9zMG9X+13p
         OiBW8ElNlzC3y84Gkc/7SMswqUa6RkS+VH3/Hl6IdWySdOzMflAc5A3cKMGu+0QgiMEu
         RWWbFaUCyL1mtPdcnSXXOJDoeEho21NNwTzIIp3hk90zUiQyB0W/HC+POMOQ45Emgqgx
         Ut1EBEVjIQU4O9V5NIU9EzOBtD+YIydLuhQe5PjZmiAkbpNUQtpXLHNmuCqGBN/3++sb
         R1OiDmJcdaY1oq1g81gOYmhYr6AuNfvKD4XgWc5SNaa9oKilkwY2P5h1FqSHg9GlwnUg
         RyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981285; x=1740586085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtGBoe5coeUnXZJpUlOcRLqzBSKuMVRJ9kwi5GgXX1M=;
        b=Q1rv6APypt79SyfIRX157d3cKt8YWZbYuAm39Jg93LmsybJOB8JN8I1QwKNTexFFXI
         6FbU90OyiPDISewFYmSbObPq1GgJu8wMlnjp2H0nCgstswzFHvrZA7pQcR7xkBg87fQa
         ThtoczAcfVf85/Ufcfqegdd39YdnHCm3mFHA+RFwYrS0MynMRQaouBhFFEgBnGWkSFaK
         1FL0m4NJFdJHVo08BZvTNaoQyi9n+Nk5jTikqEQp4vSME6tlBikQbZ+MDG9gqDEsM0u1
         +Qlv5mryAVeoS9m/pU4PSFcM0XvmmAbhOTPo6ODI02WpQSOSlSpbKAKT4Cp7JW5g7cv+
         Unrw==
X-Forwarded-Encrypted: i=1; AJvYcCV6CfX7XCiaTBF51tcqOcAJenZ/A6aiXPXQhYJCGl0r9FZkxRh8U56WfDfrtjvgi31ljPv3V7/JK/wgtrQATon5XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4TLTSlBQJrFWhBUwHMM8wGaWZ0RCAAHLT84uRttPHKWAwAQ4x
	0XkTuYlR4A/8S21Kj4x5FSoFfZSXV30w1jUU/BB3HtQhac9RcjAPxrv3r7oa2qw=
X-Gm-Gg: ASbGncupuwvvoY5omD4nnHukANr9cCG3JDq141enMmHlqevqax+HJsjpwE2wFjCIV5Y
	PM2UIPFK+Fj7s49O0Rt7nATpPUVUrBcaPUSYeKG/0EmBzXiIA3R9s6h8Ai8mZQ5ia5IbJSat7IG
	CZvpzAbNLSghtdLODEWbFNeg/xEL/kjsXLh9+iLrnsh7Dp0cenUhyEH6mBadhNAc/OldvmLVzAe
	T24N7oWRjWLTUlkaAohC8ckOkFgYTsm3FzYCYc5XABUU9qK7WFCb2ACH9Kus/qixcXyXll8ks3B
	me/cDSL9kdAs1Cizj4YABZ36RbU9zz89BTH7U5SFvWWX
X-Google-Smtp-Source: AGHT+IHxe5ZyQ3C/l0BujyjIhZwXC57yvWHfxRUBHLFeh5ZxtlbAM5sS46OrKTP8YZUtyZ2rOwWbYQ==
X-Received: by 2002:a17:906:9b4b:b0:ab7:c3c9:2ab1 with SMTP id a640c23a62f3a-abbcd0d1b4emr437963966b.50.1739981285101;
        Wed, 19 Feb 2025 08:08:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc0d0b882sm327791066b.109.2025.02.19.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:08:04 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RFT 5/5] phy: renesas: rcar-gen3-usb2: Set timing registers only once
Date: Wed, 19 Feb 2025 18:07:48 +0200
Message-ID: <20250219160749.1750797-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

phy-rcar-gen3-usb2 driver exports 4 PHYs. The timing registers are common
to all PHYs. There is no need to set them every time a PHY is initialized.
Set timing register only when the 1st PHY is initialized.

Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 087937407b0b..8e57fa8c1cff 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -467,8 +467,11 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	val = readl(usb2_base + USB2_INT_ENABLE);
 	val |= USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
 	writel(val, usb2_base + USB2_INT_ENABLE);
-	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
-	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
+
+	if (!rcar_gen3_is_any_rphy_initialized(channel)) {
+		writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
+		writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
+	}
 
 	/* Initialize otg part (only if we initialize a PHY with IRQs). */
 	if (rphy->int_enable_bits)
-- 
2.43.0


