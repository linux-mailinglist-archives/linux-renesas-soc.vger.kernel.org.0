Return-Path: <linux-renesas-soc+bounces-23017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41BABDA4FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 17:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D8158710F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 15:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499973002DF;
	Tue, 14 Oct 2025 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m35svozl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341CD3002C9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454829; cv=none; b=KNY/BUz0ua7x46ylvOvciLqRicXsLv1D5fYLAiEqX3FaYFOH3Lwyohs9HthmpWfTFosP85UJqDFVu+uP0RcM2yOfom8T7eWTIjVrWLcUhmsr4reyOr6HE1WajkDobmyEeqlGdoQpzGRzwKOWaM6JUjBluCx5kHn8PIjWwktZqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454829; c=relaxed/simple;
	bh=4l1PEhZk1G2/8p3MtkkZqUn68Cuzz+W5KwWiBPIO5NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1A9SkjSnz9JJhpJsAhA4YRwiMidWrYm/2ChH3tOrkMXVhgjz73OXGceXwQ4vjyJppYIJt049WEnuN5HH4VI80MyutYoLzDcBIsqjLrt7bsyDKRB0n0lU5xF7FDeukj8BzgLz889Y3/oQKYHVr1rVO9qvCyW4Kp3A9DYPO080JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m35svozl; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso742988b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454825; x=1761059625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFqfxSZngP7oXH9+DvZVe6YfUWRdnzIGpWugECUd8pY=;
        b=m35svozlJJ7aCbhvK2VHL+JO3qmDQNruk/nU4fgqaffEY+qC3C8ZHSjjMspMf6Kndp
         ZK9x0D7F7J4bcCA9Q7sGRfOUkNCCMvrLPfyJZvxbLdO5G6z7sb/cVe/2LaKkKkyqno3c
         ZL/hz0qVTy50qCnagLaTGDwfN9BJtC74qei7R0L658eQy2Y9LxNcSpWbQ3s2IME7/Ykn
         mI4nqeePCG0jH9Yg/EQWe3y2vjm0mu62dOqpt3bIk0sMnTFm1HnPAM0w3U2SUvTpW87h
         bI64wBZfnLuQjQiIfHXO9rvhhldKbuukOGG2AovqmSHvXvkigW30DToHM3paH2zxiNb2
         /KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454825; x=1761059625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFqfxSZngP7oXH9+DvZVe6YfUWRdnzIGpWugECUd8pY=;
        b=rkZTXGJPN5i3MRVsMTi7bhdU+k2JSqvmjIuJ83TSsOtDGLNqT67ohGujXouiYtU9Du
         c0qINtxkJ7yO0VPQJuSQCdAKyjlxK/xX3z/4qMGWPswfcG3hy63HkUnFbjoVMOSexevM
         rUhoHLxZqCtJTYtlQBj24ni8f4snHgnWzRiP4O4WwQ1tsx+PveJhcrHhF/4sM+Or8UWA
         mO29d6kz79HJr77rP23Ag0v1xcknC5mmRrX3xF0FKCmerJeMqgRpJR5DwWfVDNx6Rgs8
         Nst3wBLhdqxqScNRqgSXgH4LAkFJ/cZLH1TsoC0vVuO2obiI7bdROEonTTlz4tR/OqNP
         wAkw==
X-Gm-Message-State: AOJu0Yx5NySbGtx2Y+hdYmhk6oGaI26psvinY2nDaK/HsJpLYeo2QYY9
	d2Ve4ufF56UO7SblcD9O6kiHUHvskaR2mEZpHAt3KKJISXe3w4GliTcj
X-Gm-Gg: ASbGnctDwJUtpNyqQBRqPAIPQFl+Xh42mfXFmoSWX8jVxxGgAPoc4u4Dedxb02voAvK
	9lQIaC/getrT2tBqKB5/oR/JsQJAcjpceND7hrTbnjf3/EL4xGeh0WnwQapKSEUoZI7UsdkjCcl
	/MvqHHdPC779p251VvX0/pp3XWS7fZ/ACdxvVzTE0IRW2cv1gKuCDeBvoDzJ1gdB3BFaJbkPoXt
	kAfgRhTnRWbEa6DyPigYDdciHApGw4BU+3nkYliy41locCLgl59vCf1uYFmEjGKRAbL9/8x+Wi0
	rj64pKqyeypLPig9KQyqANjE4VLbfP4pPDZhwkSaskKmsKDztT3o/Wsxo7hWwYYh5R3VkvV5dj3
	P8pCd+x0axGnIwscn04zWxvtvne1piePX6+BHocXDbCnkJHI+smNLpnaWvHnptfeQsy4crlDe4+
	xuq6xQ6o8G
X-Google-Smtp-Source: AGHT+IFYYizKEfdSx/Exyb9Umb5pCxnPbfheHglhxt1KBGSv/n6E0xPdNIQNKiH244PGB9Y2zVCvAg==
X-Received: by 2002:a17:902:e788:b0:286:456f:8c8a with SMTP id d9443c01a7336-290272dfad8mr294196425ad.50.1760454825310;
        Tue, 14 Oct 2025 08:13:45 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:6d70:c338:e681:47e3:e797])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9bbsm167171125ad.121.2025.10.14.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:13:44 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
Date: Tue, 14 Oct 2025 16:13:24 +0100
Message-ID: <20251014151325.160062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock definitions for XSPI0/1 to both R9A09G077 and R9A09G087 SoCs.
These definitions are required for describing XSPI devices in DT

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 2 ++
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 2a805e06487b..9eaedca6a616 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -31,5 +31,7 @@
 #define R9A09G077_ETCLKC		19
 #define R9A09G077_ETCLKD		20
 #define R9A09G077_ETCLKE		21
+#define R9A09G077_XSPI_CLK0		22
+#define R9A09G077_XSPI_CLK1		23
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 09da0ad33be6..606468ac49a4 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -31,5 +31,7 @@
 #define R9A09G087_ETCLKC		19
 #define R9A09G087_ETCLKD		20
 #define R9A09G087_ETCLKE		21
+#define R9A09G087_XSPI_CLK0		22
+#define R9A09G087_XSPI_CLK1		23
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.43.0


