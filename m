Return-Path: <linux-renesas-soc+bounces-23019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB3BDA6D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 17:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3E4F3B472A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 15:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670A53016E8;
	Tue, 14 Oct 2025 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cy7RYE11"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF5423BF91
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760456006; cv=none; b=qfgs2+2awYdCGcfIxZLh3QWkdvA6hu70KC/XNsTL3ddrk56eDWQsQPRkSL19GnLYcwmoreAdtqXR8ZigX0X+kWFDZU9+Pfh1aM+052bJAPIY5wq5zug+Kaor24AQKRRlhlbTh/OGIHuAlvuYaHZ58Ev6NrB3CEKQH5NxTUdNHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760456006; c=relaxed/simple;
	bh=bC1GV6kIreezKVVT4Oj9oFgXpMI9X56TUHGj+xw7qV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLNHXf6M6otwZ/isiJipVfidpSG9R0W6qUBBloIfBig0LE6bq5Jxaca21NB/YnmANUoj+Ilosz7WwSGaYI8CbMXtxz1l4yhTDclQlXhT+/j46bI41719FPL++L2GN8uog9dCXzX62Gji+cB45UuuMr9frdtZSQQ2M1i4Q7wyvDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cy7RYE11; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2680cf68265so43102355ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760456004; x=1761060804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOTwbs4p+L2U1fW4J3vWVmcZdnxexOHlXg5+8IeB40E=;
        b=Cy7RYE11xqevbUkst+jpjJ+H+fH+gYdUvBUn5JA5wrNx3wzbIe7uEVC4pNUd4o4eEF
         2KdKw03AzluaUcE64JHg20ZsOZhM3y7vS8dvqqX5TtF8n+UQ4YKQY7THbnOOVw+rFGXb
         a5MoS3J3Ik/uiFJkzXW3C6kz+Cbpu5n6Mkz5xes4gHQ2gsPO80XIhfQGORpeuzrZBnlp
         kgwLF3nbSY5sa23vvDk6GwBYDbkBtn64Iz2K8Tyq6dPgSzGP4vgBg6uVx+NIIQJZYI77
         gAug+Kr5NtEaAWf57oEyX35uGbVLQ4q2q9Vid6A0hzpyw32p+r7L2gqHhgQe8pkT9Wv/
         xsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760456004; x=1761060804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOTwbs4p+L2U1fW4J3vWVmcZdnxexOHlXg5+8IeB40E=;
        b=Y7CIzhNM/15S3HfC73aI/UUHj+OTJLVFOSFgxPHF7BcjaDSsXUSfSsSlkwSabWJSfE
         NloG/ETD5zvE+6vXuvIBIxncJdevZ20ey+b8VnViGuegY4lHeILR5d/E37+eRy0E/OCr
         K1SHPaoMdtluF7e7YF2Z5H17hzMav8IYgIIFe+otQUE3Y0lgLyMDyYt1SDM/apPDKjPF
         zh6b6Bb/LDwbLX2BdLtVqRfuF+k6KU9b4OfawGC1lkST5YHPws2/1MWEoqVwlq66fxuV
         GQ46Y79weBOf8QkhUl6cICY/aonXGXFfF+dJ1rM83pG1TQOUpdZT+QRbvHUroxYQQLQb
         QOzQ==
X-Gm-Message-State: AOJu0YzA8vHW2jmI7rx6CsmkyqpOGz/9U27D+JqlIId/dYrfLR3Z5yRu
	XYEruHKfOG1VA8kOZY/Zd5k0cYYNzz9KRcZg8uIzkYOyyA3rk335+Sii
X-Gm-Gg: ASbGncvKa1hhcBIHbye+rqlm+v3Xxd2CeiLmyttV+1b8Cfrdb/5oxeUgJIsBbOXefHu
	lePbj+rmuuc5bpXINwfa8le8CHwqNe8dBIS5T3NIMHhXSMe47Br1uiZk0DneARNK39VFRcMWKj9
	2g7/IdtWhF2N3v9PCUkIfLjdxA2J5AOUa4iAJPkN88Apdkrs9axFWmmuH4AoPqY6T7dqMlCOCis
	h62wrtG9t2H+WdA+AM18jc48jkcc7W0n3pIAJdiLsSxgeq0BMIzYAD+f9M4smZf+SScGzWSBOsA
	8B7xC7LwjgpRZtaCcBd5uTy+iCAC0XATcrGrg5sm0YrcBj9gL87W2NZA/qwytANDJGcZIXul6Fp
	VQ2/8lEuIQ5fhaUxs0BWrq3elsIik8auBKnbDPRxOFSVdTPVZi8TolnZaL4r4bHdH0DTw9AV4OQ
	==
X-Google-Smtp-Source: AGHT+IELj7XESXcNTKFyydH9ysU3D3yEIHHtBESIIuXVyNUNifJ3Hkcupco+7VjAtxuCHL7uYEOCqg==
X-Received: by 2002:a17:902:ef09:b0:27f:1c1a:ee43 with SMTP id d9443c01a7336-290272c2564mr325594625ad.29.1760456004106;
        Tue, 14 Oct 2025 08:33:24 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:6d70:c338:e681:47e3:e797])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36cb1sm166927545ad.100.2025.10.14.08.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:33:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Add VCC supply for EEPROM
Date: Tue, 14 Oct 2025 16:33:14 +0100
Message-ID: <20251014153314.177300-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The R1EX24016 EEPROM on the RZ/T2H-N2H Evaluation Kit is powered from
the 3.3V rail. Add the regulator phandle for the VCC supply to reflect
this in the device tree and avoid the fallback to the dummy regulator:

    at24 0-0050: supply vcc not found, using dummy regulator

Fixes: 0176c9e82e10 ("arm64: dts: renesas: rzt2h-n2h-evk-common: Enable EEPROM on I2C0")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index ceecf0c30072..a19b2e289aad 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -160,6 +160,7 @@ eeprom: eeprom@50 {
 		compatible = "renesas,r1ex24016", "atmel,24c16";
 		reg = <0x50>;
 		pagesize = <16>;
+		vcc-supply = <&reg_3p3v>;
 	};
 };
 
-- 
2.43.0


