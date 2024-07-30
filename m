Return-Path: <linux-renesas-soc+bounces-7629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F2A9411D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3994BB224BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 12:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CD31A00EE;
	Tue, 30 Jul 2024 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAbA2cOH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658D719FA60;
	Tue, 30 Jul 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342387; cv=none; b=PQg3Ki2IuEvgIZpOXd/g9MPrf4EYsVpw+qoru6uT5aKM8q9J1X28h/2V/WfnqL+GxD16+sf0CoMmhNJsObNhMKd4xUKbRZNBBBChp8f30vcTB/TdEb9tEu3MTiIvESJ0gHAfnZcPy/PdL1edgEYWx+OMrWm11aWXlhEiwVG4Wxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342387; c=relaxed/simple;
	bh=JNqXawV4NKAwCarjLYWeEORk1Ul8YuYleC06yoYhXEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XWwuuX8AuvPys/nfXrHgrgn9u19j7xhUvWwWPeZ1uClOTgV6L+52+xa2Dl/kJLqnNnuyxYmREd0HYWZM+yv2ytfzgr3ItfqXWHLKj2aDRNzaf+YlkZ1PggX62L0Uoh0y1s9Wm88T3LlEIB2A34Qsp4m2jm8OjT97Hx5zJ78+kTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAbA2cOH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428035c0bb2so16396405e9.1;
        Tue, 30 Jul 2024 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342383; x=1722947183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmLmYVckyjaetxQy0PMBTXgOrMq4Vl+ssIabgZ5+qIg=;
        b=HAbA2cOHjHQ5XDhIXgFCRE1PGXyDXBgYDjPg+Yqeq8XqTZ+PJUQyQwLddBSDGWMmmk
         s1ou0jokSqugfs89aEPzXO2j6/AovCkdNTPhThc8WZNJWRbRIb2tsrTGCPfJAN3irkiZ
         QvcVOraVfS3TcVGoZhCK9cs6awekkYm1j0AENUG/tTNChg8qBjhCekDjsVDsLU9f7Dld
         lpLMp8pkmexc1GpOZMDEk28FR+CssfnUOMoXYn4GTcgLvL2MCDBhzwFF03AtOccyP7qW
         ritKuvqsAu7gow0JHuYEnDhgYrcbwJGAutNvWvQL/c+bRzYvWssKJ9/356BAsjAZCurF
         gTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342383; x=1722947183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmLmYVckyjaetxQy0PMBTXgOrMq4Vl+ssIabgZ5+qIg=;
        b=nzcmU7UjmXzV9U/eEJVIFigiK7BtaBvM7AvXj2LEauUjL5ttgtzOvMUD2dMpPmRJhx
         DMZZ92Or56qIyiUMasWfGNIl4BkyR9swBbxbjxezRkPhlyOu2/AvoECfg4zlJR1NDRYx
         6L/3fBa6h52oaTJNl+uUBDR0RhU56ISoQtOJh4QVsi++YeTE7Z4LV0oqHr7Z2WR0FXzf
         UUR4JjKzEqwlEkIRhssW3LnDzRccRRInHezprdi65wVkce/gTSCtL51bB1HJXbJP5OHT
         qhjpGpvyseEykAbGsZrAJePF3M1+LRZUxWb4c3f6/6ffvhViPU2TrmesJLet+LYUp/Ce
         Sg5g==
X-Forwarded-Encrypted: i=1; AJvYcCW6SDX+2sUOxIeisLctENc/Fh+nK7OkPLoIG8rz3x/s8hnSXq6hKw9eDJOuXxogw8nX8rSUsC2zPxXwBymSxI+vrx2qdFfTaf5qHOXTFWcwUzxE79XYm2m8LCZE4p/QxSpiZYp6/RCdsA==
X-Gm-Message-State: AOJu0YyxifTghziCjTBk1ELvd8kkpHZxgIGo0jqusNPdaiHO4pMOG9PJ
	uuEutSOJXBJLT/DIRkc2Ops8IdYLKoFox0I32He8ExgW4/Qt+JbQSx/PqFBD
X-Google-Smtp-Source: AGHT+IGIkanf4dSdxkgAKx9WS+DaRU9fDdKcFxp6WTBD/mb2JiKAkaYLDSuMCrJPNnodpQUoMmdHAA==
X-Received: by 2002:a5d:40ca:0:b0:367:40b6:b90b with SMTP id ffacd0b85a97d-36b8c8e5cdcmr1211813f8f.10.1722342382369;
        Tue, 30 Jul 2024 05:26:22 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a2b2:16cc:b7df:405d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42813a5b3f6sm125366615e9.2.2024.07.30.05.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:26:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a07g054: Correct GICD and GICR sizes
Date: Tue, 30 Jul 2024 13:24:35 +0100
Message-Id: <20240730122436.350013-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730122436.350013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240730122436.350013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2L SoC is equipped with the GIC-600. The GICD is 64kB + 64kB for
the MBI alias (in total 128kB), and the GICR is 128kB per CPU.

Fixes: 7c2b8198f4f32 ("arm64: dts: renesas: Add initial DTSI for RZ/V2L SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Updated commit message
- Dropped changes for single core
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 1de2e5f0917d..8a9b61bd759a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -1051,8 +1051,8 @@ gic: interrupt-controller@11900000 {
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <0x0 0x11900000 0 0x40000>,
-			      <0x0 0x11940000 0 0x60000>;
+			reg = <0x0 0x11900000 0 0x20000>,
+			      <0x0 0x11940000 0 0x40000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-- 
2.34.1


