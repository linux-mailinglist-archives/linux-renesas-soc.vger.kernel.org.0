Return-Path: <linux-renesas-soc+bounces-16706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D287AAC168
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C3784C762D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0A027876C;
	Tue,  6 May 2025 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3aUfzZZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786F027815C;
	Tue,  6 May 2025 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527523; cv=none; b=a1bFivhZj89IOUYqlCOYOCTaiLC3ooTSD8BXmEayQY9+U3tqd7ZnvSo8zxjFIotcu8VVaJOPADlSXB13H05dxxxuPIhhKV6E0lzyaKH5vX4BRXwvmIAznhfug09gMbYFX7A0/IrvzIf9ktgU+RdAi9O+JXI115q3O/253V12YLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527523; c=relaxed/simple;
	bh=5qiqXaopFvmxbZTgRiUDQniJhMM8ebCkVlIR8OYNNHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbcjLvwBNRuLcnf2wJq+M0D4u3bKH8yIO4yeerhfeMkosxzx2CZva5/i8bCvpOkL+cJp3r5s3w9fyPTzpGVGZ8+QL3+0++fwv6PXSHcwQy/u3WQE42XoipSzz34e2Qqr26NeCQbX9nqFbqYS9hD9bS9/85DSTjS7NkmJYIcrYzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3aUfzZZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441ab63a415so54457945e9.3;
        Tue, 06 May 2025 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527520; x=1747132320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTckXKQzpO52Rq93n5jbcZKVQj0iYTZfc9032uakYfc=;
        b=K3aUfzZZVeoO9qGo6JXe8ciB4qV0fkEzoHNV7RvTiah7q8etNRr4PpaL76tBvZOsbu
         2YPnfSMvFvF71CPdTTHMQjM0M+JtFNBtjKr9OblUCS0G4Tkd6g0gwYrZW0j64eZiOxrX
         pbyeucfgJaM4p9qc+vf9udQDJS7hjX1lYUQgkMy/4sht0oaL/dj/tqsCMbqDsqVoe+f6
         6g3RhGwPM9pOqCgQ/rlYZWOPnHu6tjnj+9WRs+CeFN3xGkgiOBR8vKNjRrYM0eW2ahh5
         KmrTHemPpjtBGIIbbVJ/1o/G1M7nfZSz4Wk4gM4FrR14s682b/m8eO8jFC7LPwib91fE
         AHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527520; x=1747132320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTckXKQzpO52Rq93n5jbcZKVQj0iYTZfc9032uakYfc=;
        b=PHIL837nqnnwjXlQW+BSENbmbJI0bhAOgfuYXc18cgOVYxvhhdGzpx4NLR+qz9p5Zn
         XkzWlJp1mfXxaZvNpc1SRpt9Te/s8FjLwZV9o73wOA18SBBI3I0AJgd43M7+eG0v8ZgF
         DmCPZSjB/1GB+xcdYeKMhzGY9Fpdsnwop4OLtXc4+hnPVrxNk9bZUoX9fUxKrMSgJfSV
         pLaK5yiF9pxb2TcZVXwyKC2B4pib+xRjUsKFe2YRsqXDkq1CWsoa2pBfF2C1StQetc9b
         D67Z/Vc4DeYEI6ivUtnCOUxuOX4BhpBQWqAjzqVwprY9za4h2OuzKeU4V/BFnNdbNI7M
         IhcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK++oPQIATitPwMNoEzKClPBjDw7z0k0Y/AHeehlY2VcP0FsyiJRV+L0PQcoNvT+pvY5eWbQUn2DK+FnhSQfioFyI=@vger.kernel.org, AJvYcCWh0mO885DMVpP3wvkC90/5gxsNO/KQmZGrjXYlebn6c+rQLkjO7Ii1RO69rzCb9E2+xccuJlBO6jS7@vger.kernel.org
X-Gm-Message-State: AOJu0YxdoecVLe5NHnAQYMtgUfZDfAu5R8r4y8Tby+Mfmyq37tBqIkcv
	nZHcjDgkTsl0M7PSR7U49pqUSgPgH2O6ivRhGKhFJ5tOkCR+6rOb0o3SiG7Ezz4=
X-Gm-Gg: ASbGncu61UuFRn36QeqO9Hs9rdb4BHJf73qXoO23FVXygLzoTA0ed5EFIAReEX4cIN3
	eN8k6J3sc2DMoQgp3gTqbyqa6JhSCQrwfsdpLQ+T9bNeIbKfive0ddJVBy9DPBJcq6crYsTeNtr
	AlDCCnWwGqSdiGXogUtYSbsOEfipUPkuEfbElhuAZ5nNd+3G9jAFyydmrlm5caiMhxf3F9TliW6
	sCONKRagxxAdldvp0kKY5rGZJJTVBIKMsDu6TEBcgKQHtRE5fPenBG0/8j4bj/cQ+leXgg9hISY
	XhEK1N9n4NBFZbJT7/6JNIMnw8BCxxxPGchwHxaxUa0pMoaIbEpE+eHHvuz1vRGg6w==
X-Google-Smtp-Source: AGHT+IEYF4ebhPDncCPOeVL/QRsWIn7j6RZs5f79o8NL0NOsY/ZAcvSRparMypRROyPTgVAEE7v9qg==
X-Received: by 2002:a05:600c:3ba2:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-441d0fbd5b8mr21811635e9.7.1746527519383;
        Tue, 06 May 2025 03:31:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:31:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
Date: Tue,  6 May 2025 11:31:51 +0100
Message-ID: <20250506103152.109525-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also update the bindings to require the "resets" property for RZ/V2N
by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
the "resets" property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3:
- Added Acked-by tag from Conor.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..0983c1efec80 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -54,12 +55,11 @@ required:
 if:
   properties:
     compatible:
-      contains:
-        enum:
-          - renesas,r9a07g043-ostm
-          - renesas,r9a07g044-ostm
-          - renesas,r9a07g054-ostm
-          - renesas,r9a09g057-ostm
+      not:
+        contains:
+          enum:
+            - renesas,r7s72100-ostm
+            - renesas,r7s9210-ostm
 then:
   required:
     - resets
-- 
2.49.0


