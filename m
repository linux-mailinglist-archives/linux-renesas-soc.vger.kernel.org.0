Return-Path: <linux-renesas-soc+bounces-18446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25EADCE13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DBED3BB871
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A41F2E4279;
	Tue, 17 Jun 2025 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1CvGwbm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE502E06DE;
	Tue, 17 Jun 2025 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167912; cv=none; b=MXFZGE19/MfV2EnDggLudSXxH5NE7i5NM17Kmu9kup4bDeb/bwmmgR94KE7j4BzgClp4prGNuZPjKKnGwq+1ugELOH1dRowlsszV9BnQlpE/Es/Xj0qXlj/KPjddi8SkOvdfdjUaJt1AWmM+kT/C8UnB/3c0lt4wmaKFojsh6hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167912; c=relaxed/simple;
	bh=+rhHHxGq9aLHFzqgaRAsuYIS2MmR8DESzZT4/MAkKUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0KIMAmyi+LxlFoqtVp4jM0posDqfTJRToxH5kLjtPfj63ATndm+TTSWAt3XAPAOm3xIVmb6EpPqoh6Hvx2+CpjlyAbVREONf3vFL09ouP5Y+dbEtOkcLD0t9DCeIHh+BbFk9WIfrzXbIVv7iWGCCgw6FrJ/FqcI5GaoQt4VLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1CvGwbm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a588da60dfso561209f8f.1;
        Tue, 17 Jun 2025 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167908; x=1750772708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8JJN4D88g5LZysAtEHW8oNqIwXChQoCpcV9xwGdAP4=;
        b=W1CvGwbmHHsxAFHERvdZWnG0BvywhkoGs/XhKABGNiHJDyrVXaYc6Md4calU18qBvt
         cC4xe06h4qcfxpchTNrkO9JN3J2al0cLzge6AO13mMZ+rXSe8hvIVRsze/OamOuh4swV
         hd+Z0fJtK/oXdNrA84ob0dDo+li3G9IkfA6R7azAAJU0nvytDo4FrQJ6pf1xYpFxTDWI
         Eq5/T80AGnCQSTuxMAq8+rPBG/5bjFd6++vAtQEMJ44nnvwfqXm19C4/B9D6Tw9rgOhV
         sIniQelaJVkdzwgv9t+U+FEbKJXPKLv0ukOTcq88b0beWzAFDVyf/oBZ5roVSYb+qBPI
         Z50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167908; x=1750772708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8JJN4D88g5LZysAtEHW8oNqIwXChQoCpcV9xwGdAP4=;
        b=aD9Iw4k4kNmCvi2HsxM+Of3HpqqVLJv2jtFPtaIGex5JvFkCd/T5MyRsxhayHFrmJv
         MH1RDc8TBWo2KmsR6nLr6ZVzMo94uwY2dcudHzKM4um0PTu4f71L8DL+BikXPUz2TCTw
         Pugq50omXOqFXqn+EzgYZClmFWE/8PH4Sdz0Y012K+2ws0DJpHv7IHkFp3zr5b9sduAT
         SROOTwbY/pR6x5e0WEivH54IWEZ/ygm2EmsHljceGF5S2KDF6coQkC4x/euRPdHOjjFH
         GuAgSFk+2G/lrUbpDWJK/IpmZVUOdkANooyX4oivnN/4CAaga9lF3fF+XVSr9zFBiq4j
         mjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3q6PMnIfnxpEAuHjVJj0H27NorXmsmv1HlQ6QfapG0Scrt+FO7jRaw4YLSeG8g3xmufxSlmP+DB0F9zFeNexx+QE=@vger.kernel.org, AJvYcCUsF7btWy4T1+N18Sedzqp6YcuoERVl3sybhg0SkpMmeaNw7t37lKIgFGwkjmf825uAnjGPWzuNpjpNe+08@vger.kernel.org, AJvYcCVOevUvAGBqY3/oynhb9g3AIR1FffKt1Licj8mcsa6ZBuOTuWknbvMO27JhEKaMApZvq1OrvevAqG0dGuRR@vger.kernel.org, AJvYcCXW/T2yAUlEFD+Da4o4JqvimYhCG2HluofBPCN3Y5X3zLClTChYIh0dKTlYTX7v/SGOfypydLphC5mi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl4ardCC3CT9uWcWhLplOlKrnTDntBVwUAallHk8HGG8/thAxu
	eWKaVod9ezLaaU961gJsnGTsj7Hsue5vTCS/OhYTsuPmgmftg8BBX7Yr
X-Gm-Gg: ASbGncvYWzFjkrpStEoZbetWbvRuSSxSgd9f2krJjoBTpKt8t2u+hfnQcvt6rTMkvho
	cZ3RUagZCWzswvK3DjJJld8vGhVm1g397Gux81s16joNYeh6l7JjdDY/WEn5O0ysZyseXyrsIrW
	KB7l6exU9joDxv7DeEHhD7bWKltDSCxI6utDdj/eBbSJvjwi99/z8eULabL88U8kH6uo92YY9b3
	evDlD9yo7jmPSEGVn0deAjXx2AzffPV1UFnJWnJOe3GhSSmzm4RBPyLFK82GIsiQSsKqaz+s7DW
	KYmbP3LhgTcZfVwTgDvbdYh0AW5b2eBsxysCqgyxKMl5LYoYvFqfh7mel5eexhkWUl2Q+60iCgb
	IQw0zqzyJRFveLgbEDxd2CQ==
X-Google-Smtp-Source: AGHT+IHx7+MxOtQIlo3hCXb9uKaWLaaMM9I4c7QG+YXyxr08bo4gUYk8w8HO7kGmwusFdh08dsgFpQ==
X-Received: by 2002:a5d:5f4e:0:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a572e79d6amr11446870f8f.35.1750167908305;
        Tue, 17 Jun 2025 06:45:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 2/7] dt-bindings: serial: rsci: Update maintainer entry
Date: Tue, 17 Jun 2025 14:44:59 +0100
Message-ID: <20250617134504.126313-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add myself as the maintainer for the Renesas RSCI device tree binding,
as Thierry Bultel no longer works for Renesas.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 1bf255407df0..548225e509e5 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -8,7 +8,7 @@ title: Renesas RSCI Serial Communication Interface
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
-  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 allOf:
   - $ref: serial.yaml#
-- 
2.49.0


