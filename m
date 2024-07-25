Return-Path: <linux-renesas-soc+bounces-7521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4948E93C32E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04A61F228B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 13:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D805619CD06;
	Thu, 25 Jul 2024 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrLdfTYF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9AD19B3F6;
	Thu, 25 Jul 2024 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914880; cv=none; b=N97F42CV+pBW2/WH7C3VXmYmM0QmLPqFnztP2yoRAbDD4eP99Z1aGRpNGKCKaprlPYM6PVN5mVfd6Ziuo0bdSIZHJyxoC4PKj4z0+li+z5yvcuuH3D3lUuyIQqZwn4N4AY+cmfrye/lahgPrSut4OGuhGDZl9kmU0h32mcftxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914880; c=relaxed/simple;
	bh=SNhpqd1alKwT3RAnJLueQOnuMeRhA/kZWnnazUw9Fkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gp8PgkMSLf7C4ul+q7yszMGzYjg1mHwNsqD6Lm8t3tV7pDFDT+3q+8YhBYxYwBWvKpt5KVYgwA5Z6e9/sukAcP0voCdDTUzOA2VwxX0qXJMYWZtxSL2H+lEitwaX1F4scngmv3PEIDsFCavKWN6PlXlmfxw30RYbkyNnJRPX/Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrLdfTYF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266dc7591fso7060225e9.0;
        Thu, 25 Jul 2024 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721914877; x=1722519677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkZJ4dUPLrB41/jSzY5wnzI3vnjRPDgLmnmuhV28G8E=;
        b=DrLdfTYFrTJUEiIRM6lA6J4070y1Xin0aihNdetDqryoHL537gJI2q/VCNeHPyGF0r
         PkrFfVj2guKtwERpN8/Pf/+OF4NSJ/bfjjyNGi/vx2f4+2BDtlD1/u/vk/4g4DmkcziR
         LRsxZY87sR98NAwTlNt6FatB3ulr71ZBAQdN38WhrITGYqakJZd6ZkT5RsTTVBVDqOF4
         bKPIMTeqwiajY612ZJLbAzf6x/x+bflk/ta6Ie5dpNVvRGA7FrTrwSoc0s8fqarfE1Rw
         qlC9Z/FyWb4KgIDc/9jAxkFpXNlKaXswaN81ECGRzTuVSaoaGtxh6rDzp9+s5NVdEYUY
         Djbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721914877; x=1722519677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkZJ4dUPLrB41/jSzY5wnzI3vnjRPDgLmnmuhV28G8E=;
        b=e4rtHIU6ynGZ4IBvnlWHYcnWHKs/Dk87zIxburCWGhiDqAFrf4hreK7+q4Eh/i7c63
         YfDVy+kvOYqdTWPoks6zmcH2KK3aYi92uuiae68UWi3vLafQLP1i1BUfVsG6QoA+T/5M
         9dudadv6iKSsNWJaF+qo9wpkehO0n3o6O3+daH8Dl634Iq42gMs+FarSouBR+7hsE7Jc
         +5ENIoYKZO7+JXtVwETLlYoZpwylcC0kVWuui5M668r4OJR/gzXNpHgGn8i6aDirAqc3
         9kAsRzeBCOVmuSC84yAIiz/nW3y0v6L3mJUdnjm4C1zg5Xf+zUKJtsHCOMIm4r0lPjMj
         POtA==
X-Forwarded-Encrypted: i=1; AJvYcCVYu5M43jJSr9cHgUqswXc2KkYLDURCkWDsgJoExq+lEPS89P/jeoSSp9Zkku+DFkVcayMwzfUqkcTmTMdXWQ/xZ/LPvcxIV6fyHcYE5HPLkEmgRjb4cAiiDbaPi1loPz7WEh6IbX2u5Q==
X-Gm-Message-State: AOJu0Yzse6y1ozt3Df5pEgu1JIn5kXSj7ecNvoU2RDHZtYJrRc3OO4CR
	uzBrmO+YlzlhQ0V/yZ2rzuosWxLM9H0SuTUIMTpeBpy2Nrs+pYNxlYxnkyIYOb0=
X-Google-Smtp-Source: AGHT+IHWanDzm0HEWpeLEMyqNgSi2mEY1ZHXKd6g4r8ty/LS8rkkpm4iaqroBogcDU3Tdtv7VHMPjg==
X-Received: by 2002:a05:600c:548b:b0:426:5f75:1c2c with SMTP id 5b1f17b1804b1-42806b83e4amr13477215e9.11.1721914877181;
        Thu, 25 Jul 2024 06:41:17 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e605esm80447085e9.34.2024.07.25.06.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:41:16 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: dts: renesas: r9a07g054(l1): Correct GICD and GICR sizes
Date: Thu, 25 Jul 2024 14:39:30 +0100
Message-Id: <20240725133932.739936-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2L SoC is equipped with the GIC-600. The GICD + GICDA is 128kB,
and the GICR is 128kB per CPU.

Fixes: 7c2b8198f4f32 ("arm64: dts: renesas: Add initial DTSI for RZ/V2L SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi   | 4 ++--
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

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
 
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
index d85a6ac0f024..5c0f6c5d165e 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
@@ -16,3 +16,8 @@ cpus {
 		/delete-node/ cpu@100;
 	};
 };
+
+&gic {
+	reg = <0x0 0x11900000 0 0x20000>,
+	      <0x0 0x11940000 0 0x20000>;
+};
-- 
2.34.1


