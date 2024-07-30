Return-Path: <linux-renesas-soc+bounces-7628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 408A99411D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2011F24B52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 12:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8F71A00DA;
	Tue, 30 Jul 2024 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKuWasgL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D00419F499;
	Tue, 30 Jul 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342386; cv=none; b=QgWSXKwU9RdQbqD2jCHiiFJGvi5z2ZNAghdPSudn9M2KmAQRkrX70l/hy9KyzxGD/L78+uHI7+lm+0opNEto8CUrWaBgV20+ArX7Zb5NVmarwTKemOyJ4hkyFm1xko043SuB2iB8GUEJGYsSv1vtygfN9vyHYviTJDFO76Dnq3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342386; c=relaxed/simple;
	bh=6NZfZiOOHH3iDMzeEzGbDiCh+w0CiiPqqpEt9vJNAR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oak1WqTHJkv+mt2+T2GCvgS53Y6ebHYsx+Q8ejoQA2IEau8ARZ5rilmwMRAXB9IyiY4+nETgkpjz083Vw7tfPmcRSVYXVZYMk5mbHjmQLqwiuG3tmMMGx0bgEADTwsJqnALyjw4G+GSxotR75L64Clm9/pAfnxlo3ohsVcxF3/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKuWasgL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428243f928cso5536725e9.3;
        Tue, 30 Jul 2024 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342383; x=1722947183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3n3epJfjE1lgSYn1yTM5AAl0w8NGm2TqqN3Ti+44CM=;
        b=XKuWasgLrXMqYHK3ILjNFVdggHufG5h36CfEMqg1IEtH3Vqrsk3KWzRijRIMbyTtlg
         kqHV01UPu5fpCJRHwISCQuqkwHXDxxD/g5yKe4iWteZBfC5K5bjic+xDAZUE244OBgs+
         ui2Xita+e455/CoGj4IoeqjftgSSy9dEFmSQetFFk7z3Cfy0rd21M48gfc4FSUrqgpgH
         3kRHfPRwIZmJ5VnKcQ9lO9DVQS51VXcm1hrD4saqbK5TUjj7h+9CK5TWOjGxPLsWaCzu
         dfVawDCU3C2mnuJGEvCclqGrpC2YOcYkG5FBHS3Rghs2fQylPLjcZrPT30p/icUpcSLS
         PenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342383; x=1722947183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3n3epJfjE1lgSYn1yTM5AAl0w8NGm2TqqN3Ti+44CM=;
        b=N1Oy1RW7y05ErOZBxkh2loQ/X3LtE697oMMPw2GQkOz0PZLGb9YN3V748QyjzL7rqg
         ZKCx91xKg2wSZLZ+fIRGoZxu5xB0Eeevunj198vVvVmDPmSgKDbamdTXGj2zO1XdOMdt
         kAIwgOoS1YmV7KySESEoMOToNB4ONsDtywYH0Pi5j8W8XcErisZOt2SSCd/eb2o/M9AR
         kBDmW3e5SYrgsFuP89ANFHXNJVYCOrOeA1PuUKz2vaKJgdp+2+vIFZktWyW2Hp3ePtOz
         6NsOExPzV8OnZCQcbY0/EvZ+1UiJbCm7X/AZhZjaFc3DyQj9MS8NAbyHpN3Pr9YunSpT
         bsdA==
X-Forwarded-Encrypted: i=1; AJvYcCX4tANIj5F13q7lm9EaW/mFQG38OX9F8950yMpbrgogcaugMpsP1njGGeO+4RByul6K/YYzgV1NIBLT11FPq61pmFAyy9RYfP9HouoZiktdTX2PjdKtySw0FtKBk3VqjtwtBKfqWqLuEQ==
X-Gm-Message-State: AOJu0YxMlmjpGY7czj+S5mFXSeAMi3gNhs+7W/Zu7LMaXl+01e+cV216
	5mODD1BFtk/skltsDku7QifNdUyQW9eMqyK5WAfbB94i3GUsoYQw
X-Google-Smtp-Source: AGHT+IF58FSiZdmGIXazxXblER9nlRuIiHiOhHpDNK398HF8joa+lt9X/giPA4WZxjVxeM1rBy27xg==
X-Received: by 2002:a05:600c:46c8:b0:427:d8f2:550 with SMTP id 5b1f17b1804b1-42811d9a644mr85475175e9.14.1722342383293;
        Tue, 30 Jul 2024 05:26:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a2b2:16cc:b7df:405d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42813a5b3f6sm125366615e9.2.2024.07.30.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:26:22 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a07g044: Correct GICD and GICR sizes
Date: Tue, 30 Jul 2024 13:24:36 +0100
Message-Id: <20240730122436.350013-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/G2L(C) SoC is equipped with the GIC-600. The GICD is 64kB + 64kB
for the MBI alias (in total 128kB), and the GICR is 128kB per CPU.

Fixes: 68a45525297b2 ("arm64: dts: renesas: Add initial DTSI for RZ/G2{L,LC} SoC's")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Updated commit message
- Dropped changes for single core
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index d3838e5820fc..c9b9b60a3a36 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -1043,8 +1043,8 @@ gic: interrupt-controller@11900000 {
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


