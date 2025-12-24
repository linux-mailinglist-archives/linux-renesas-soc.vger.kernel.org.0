Return-Path: <linux-renesas-soc+bounces-26100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C215CDCE2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C04A8301B4B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 16:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FAB31A7F2;
	Wed, 24 Dec 2025 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGXgyYw/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA82F25F9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 16:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766595063; cv=none; b=Exx6elEVqZkFuZs3l1jfatuPrPHzmZ2ssFrD8V7Ipl+bwhWC/xZzkcTKBUVh6x+yo8oAOnwypury7JJ2QqhdR5Kyq5k+JTznHwILxLfmuhvVGg8HOfR45Il+c2/C2rxv3bf016KstGs3pci3Fr3ozS+tk4oureABks15+ZYzHQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766595063; c=relaxed/simple;
	bh=ZrXxCTjXWGjjOG+8aqV+Y+mwv9ykkEgiYPHQ1T3uTpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+ENBVlDhlZsBYFEnetoSK7dD12mW4gMYIbXwx+LX87ezVjiT7ruGRut2Bvp/qn+hZPx7kzywP/vS81oQJl/nQK6WssDsQGlXrZx6JDIAqP9trhmfBAaJI7rcrCEZT5DRlkJ9wcfIGgw3z9bedhoGxab2oI+nXClASQNtEelXCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGXgyYw/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477563e28a3so38322785e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595060; x=1767199860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTmPuQNTTXZsqXP+8u86ygN51TXOteMoSzOM42GP7ag=;
        b=eGXgyYw/QssfvvTYTyeEw8SSzsiv4VbWJGZxfvAxGhXIsnB67zAuGKX6KbR8sOP3KV
         5pZxP5BDlDAeaEZ/8n2ECM0p3lUxUy7PpirB+ZEy+CfKOLLojyD/2Efcn7TFOpaUOIKb
         lCacb7WrPdut2si9tICrmooV8V+l06DKFQPOyPIlwlFaeEDgGZ4FpyzF4nPx6pL9qwyN
         cuX9tlUeCWEqow+jfNywrBTCvWwr1HiDUStLrR0jMgQ/lyNbggA9RDMHIVur3NpsEKq8
         EdDP9QqRRV+5xHx7Gj8Bt3YevpdmJxgyz/IwiWWYDTvF5EX45oUqaidJ0p9FWiGJZT2D
         pq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595060; x=1767199860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTmPuQNTTXZsqXP+8u86ygN51TXOteMoSzOM42GP7ag=;
        b=oxVTiH41hDzVAGMMnlIHqwus0YnEBWU+dlTUjb2wL8/SF2u7St7WAZkL5hljo3rboB
         eRFUgGWfrAaFaXl4c6B2N5ZlV30s98jRmj/xjnsMMMuKijmh7LNplwZlSLuqG7QV2wSf
         3VraQ8To8KUPIwQx/kfQOUWfF4xccc0CbWS0q2iVvVjocMXeapb3ZusJLse9dtfjGoRc
         P1uunCQYozYGGfIlKUiLRbL6J0e4VP0dpECgFd/R2jveRfFQfonyPfzzGgfrqLfXJetI
         wwOTIH9tjivEGwoNEH/4ii9OgH0Et2xt3mGOfQKkmGGijyq9NXj4SajdbGRFGzeqI5cs
         3eTg==
X-Gm-Message-State: AOJu0YzsZL4mmdpUOmAavQvownkhLx//PyNLmUwAFVqk4/FcPszTJlXb
	QyWdJIVUKDgOnB4rUEUIuhtnIzvL00OxHat7UBUClGeHw6HCu2NtXM9p
X-Gm-Gg: AY/fxX4aTQpyT9byW/o8cD8V5CbxlE6DewQiXSUN7tb/catKKwZ/KYYiH+DGwmoAIjB
	nn60g2PxtEpR+fbIN4PVNDsnlLoCubacMz1vIdEpCSlCp5m26/urkCWc9BF26vZgdwRTwjpMkqt
	Llg5i5U3LSyRTJ8VKOucrDn0m9YLcicDN196mpo/NYqB6U/I6TIrnAJr0RA0wrhF7iwTUrqfqjO
	UGuCOYBHIRSAFzqzJzfvHNuGKpbQ4leTQrcpUab9h8dHUU2bnSUni0WKxFlRYpOL2PZlrTiXIdC
	BtHXfpuTgasyVo/8wE676XMHWTjeR/THpKg1IrYneiM/Rd8T8D/VYrNKwblzR9nkyeBXk8lm+ua
	7RAthCyXyGmB1VJ10dkMWLsl2MFwV1wrPW21Dek8yGOZB7c7qFXAreUqkl8G+z3P/r4Ch8rT27f
	l8qCqxbPVb1ARdu3I6BjPyYXsKpRu8pmtxfvASZjVrldQz5ZRubEr2lAj9ALdzYLNC+5ZYdIpah
	CCFwPsfHOVT9BwVrDO9d9Tn
X-Google-Smtp-Source: AGHT+IEHoaqx50xdluKo6iOyYLijbIpNgJk6AMJ4ejz02SDIzXXq58fP4NiJQLWVqEs20tcyZW/NVw==
X-Received: by 2002:a05:600c:c093:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47d1cecac53mr149793425e9.6.1766595059883;
        Wed, 24 Dec 2025 08:50:59 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm136482305e9.15.2025.12.24.08.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:50:59 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
Date: Wed, 24 Dec 2025 16:50:46 +0000
Message-ID: <20251224165049.3384870-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add PCLKCAN ID for CANFD to both R9A09G077 and R9A09G087 SoCs. This
definition is required for describing CANFD device in DT.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 9eaedca6a616..c4863e444458 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -33,5 +33,6 @@
 #define R9A09G077_ETCLKE		21
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
+#define R9A09G077_PCLKCAN		24
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 606468ac49a4..0d53f1e65077 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -33,5 +33,6 @@
 #define R9A09G087_ETCLKE		21
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
+#define R9A09G087_PCLKCAN		24
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.52.0


