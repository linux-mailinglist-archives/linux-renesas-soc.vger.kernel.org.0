Return-Path: <linux-renesas-soc+bounces-15938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD0DA888FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 18:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36833189A101
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC84288C83;
	Mon, 14 Apr 2025 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1oJYeLl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9A27FD5E;
	Mon, 14 Apr 2025 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649537; cv=none; b=X698EJJeoV01qYN7fHf4vR/WONRvM4jgDYjLc2m+K5tetl7TDFZnsmdAqCJy3PyynrY0kKS8kT79jmMoWWzrZn8wiAj5t+m5b0f0vYK4Imwz5Ir8uyDysF4Qwf0HuoCxzbyrhfir3to+qhduNHfjD795TaDuJ1OopH0V17VrF7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649537; c=relaxed/simple;
	bh=XTVAFslg/BTszObHyPG+drlASXgr8DAGYyR/rlAdfm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/XEa4hSK4YO5XZtODcnY6v38EnlU2cnotdGWRMar+7io8DXqet6s73bDBjFBOi0r4ZNjMepTLVMIYF5zC3Bq4d8qT/UgNSOe0HmCvQbzeZxpdMGVpVAzryqIZ9REh3Uuu4Zzswxp8xlemj25Rflnet6rD6HuhAaNZJUqe6yZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1oJYeLl; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so4450046f8f.0;
        Mon, 14 Apr 2025 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744649533; x=1745254333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NaqaeO38bS1dfnb+XufrS6e3ce1N1V+fROEMewM8A04=;
        b=B1oJYeLluW0Nk0npNwqEkoCxM3hSlP8RsYYIzVjPqBMfgJY2B5mEFFZ9SlCKRymXKv
         NdDo3lKqtsiL2Fw/v32zTS4EaodHxPDNpoq3P8vj9CySSkBaTHo63AzsFqaKI7bb1BOa
         vKE/6HDOesMoKvYOlfbItC47y0B/zsP5n9U6kDvlqM5hKs2GftttO2+R+dLR8VdcxUfe
         uXST0KXKtCowScBvYDIvDcrq5EDGB5njqYst5AKllaoStWOGhI31aoRCigsUDt7BFGRB
         Z8d3tyBmYl4qX8BuS9u0rmc3wQnOmy124x3GsoqzgJRx90Bov7w5yFxG1svdgdyGNLRR
         ae2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649533; x=1745254333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaqaeO38bS1dfnb+XufrS6e3ce1N1V+fROEMewM8A04=;
        b=lskOGWhSG1TPh/le00zGs5VN/+93JZqDQCE2ylRbgOLIqxNKo+BorjMuxxehiNPbtO
         LuC5InnNMJv++HL9e8EQ138oGhW9gMbc18Yy2JXJCkwUBfFPWDpSoYyhgvJMO6V1ngy1
         ifpFzbnxmph+54vfsHiLshNRi9Jk9nRmlSkwqQg92GmaffRkuxGfMZPUTNPhtY/SbEpZ
         fWBt3DVuhCzp7Qf/pCC0l/BNs26l+eiTTZvEYGEcgSosyxy6oZCVZ7oE1G87dEQ9ITWV
         /50nW/8UnOsnJ1KWGPjwWtdxRGe4lEN6cV9jSx7p8nKEOW73tKLcmoP1EZ3XQT/iJP1O
         AlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiNZKPHf+gNv3xFfGl9eUkBDgS00cGiGGopRTeebHPhvHLFLanNgbk7iFawPimqYKELQf9RktFfrjR@vger.kernel.org, AJvYcCWkqu0jgEIRy0CTb4zPOfD9WUj3DP9adWQM5A2rYlR7EpkFjJIFJfIbPg5QqgcjFpm+n3SqltnK4l21ysM=@vger.kernel.org, AJvYcCWtqW5XFKYiYdDGZlWwpgJj8ykHYLeLY7Jr/eGdL69/Qtep7pPnOt/Y9b913XlwwjfY7htEkFoAfak+28z8F/UY1rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YygGV793gXvs9Tak3Zzu8dNbr7MHxEdnw/b3iHP7AtzdvvuiQaX
	HGstCpZwRh5wyaoiPClVGjEzXYjBu26ENB1e3p9FMjikUXThv21f
X-Gm-Gg: ASbGncveL4QEpzvI0ON5qp0LG1xxAJH64tADXfqCN2m1Yo8CIhP2a/oyoRwgeG1p23g
	X9rAKaWP6734q1uz3OAokcrBEEe3oxybzJV9bgsnDZOPqCyZRGz35fRe8DLMTG3FExsLx0QiDlm
	uBa7G45NiSZsTU4QHDgGUZHqiOaZVnl7e/lYEyCzLE8bHzs47vPU1xNPUBNCLBmZ2aA//M5mEG8
	RhAyW5OwwpJ5VS2htpqv4EOw2Sx6FHeeNaQgJUneKdbRQscDxKunRXidBy6XqZg4ZVIp0Nf6OBP
	8sShdknOU8mu2dCEGQ7s6pJwtTi9DVdGanEyNIBY1FSvks0uBDOwYoASKBiu5dx1ykH7lNfzfLk
	=
X-Google-Smtp-Source: AGHT+IEyzU/62Ri8jHDV40wefEJeSo8FFpnMZrS9xG5JP8a4NbwIw30W9wpBPgoEHPqPBNQSjg4bZA==
X-Received: by 2002:a05:6000:4007:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39ea51f41fcmr10952364f8f.5.1744649533139;
        Mon, 14 Apr 2025 09:52:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm11619295f8f.17.2025.04.14.09.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:52:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: usb: renesas,usbhs: Add RZ/V2H(P) SoC support
Date: Mon, 14 Apr 2025 17:52:01 +0100
Message-ID: <20250414165201.362262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Renesas USBHS controller found on the Renesas RZ/V2H(P) SoC.
The USBHS block on RZ/V2H(P) is functionally identical to the one on the
RZ/G2L family, so no driver changes are needed. The existing
"renesas,rzg2l-usbhs" fallback compatible will continue to be used for
handling this IP.

In addition, update the schema validation logic by replacing the enum list
of SoC-specific compatibles with a const "renesas,rzg2l-usbhs" as all
listed SoCs share identical USBHS hardware and already include the fallback
compatible. This will help to simplify the schema and avoid redundancy.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 980f325341d4..6f4d41ba6ca7 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-usbhs
 
       - items:
@@ -127,11 +128,7 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - renesas,usbhs-r9a07g043
-              - renesas,usbhs-r9a07g044
-              - renesas,usbhs-r9a07g054
-              - renesas,usbhs-r9a08g045
+            const: renesas,rzg2l-usbhs
     then:
       properties:
         interrupts:
-- 
2.49.0


