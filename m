Return-Path: <linux-renesas-soc+bounces-17146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9718AAB8EC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 20:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAC3117CF70
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 18:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96AC25C801;
	Thu, 15 May 2025 18:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVwVZXPh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0095A25B682;
	Thu, 15 May 2025 18:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333336; cv=none; b=YvGZVAgx17wXJ9xQFaW9/uwGR9h9Pihac66p7HbLuL0pguFhqyV0gIvCGy3zJhinD8EkorOQhiiOEPQ4xvb9/759e/8JQy3AMT+GRVg0bDAyCRzLDQcDKqcRaE/kL+8+4Th6alENmdtTJDQI8XC8WstLt7KdsV3TC6+BZWbMZYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333336; c=relaxed/simple;
	bh=m9/ix9xnzzKp66Z7DlMMt5uQXEuqxuJ1rU/uEQsbHLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X02dGeKre6UivQqJFPtyK8mTzaGRoDj7RSRIE5mQl7R/W4UpfU1+YdacsJuC3F2thaZz/X9yW7t5NFQW7iX+zWVLixCUwbYR7QGpt2G0pc7N1zFOrp9yH1ojxX1yYj4nlYm3o86VOD6IVgtHDBc7hgH318cnfkYVTRAzNXlNsH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVwVZXPh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so8406285e9.0;
        Thu, 15 May 2025 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333333; x=1747938133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swfAGC4QXM6SdJxBuAXYcYtJSUnfER00xbbX38/PS04=;
        b=MVwVZXPhcSLuW5cdeicri6agPXHqOe0i/qpDdCznVSpiqeVvS0OU8Gn066EjSkZGyF
         kDsCuCX5J75Fz10VzWXzzR/w2D8TI2NlaKM4GHrRH4Li9DekwbAMkSk5pQr81A1tsVB/
         KwpcD6hVsZ0hOEEdscuRpjokDDXnckvouNEVvdGE/bZmVICbKvctXihJF3mCnS0hfGhI
         6iJKxOxPx7/tnYl5VHN7klleDfP+SBPPn3x0HZsRLirKBNzJ0HFci3Rzo1O65SjJR0DN
         m8SK5eDcpOILT4YEV25Ju5HYYtL5TUafWzrsyySWkM0nYwMsjc5b9gqeHZO8qKe1n01U
         WqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333333; x=1747938133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swfAGC4QXM6SdJxBuAXYcYtJSUnfER00xbbX38/PS04=;
        b=urZAJ8Gn1WtNVobiwF7oNeanEyGOZGd09gHtPAIsGdijvYbt1CBKgDlPlSzGwMtgag
         7GIwnz0yqrsgVFFBreASLoHbBMpNb4ZyzX9RV+hz7GG+Q6rPgJV8T8v4/FYDJBJYl5H9
         H53NAL45ZanmPrZ9PwioQZasFpFqwEjmRDMiDanjN9QtSAwldUUhxD19vHKbFA+1yb2I
         4JoVsgAKKdjFkkpm/2OB8MvYDxqoxcevs05pHwytLXTcY4Wce98eycTxv/5iaVzrjh5j
         8My2MFI39UPSL+jtzGqgB6yKYOfQs+h/0XM6xAekEgTUlTOjHTKZmvi1KMquhZP7zKQQ
         eVig==
X-Forwarded-Encrypted: i=1; AJvYcCVGsHBsAgKLcIx9wtglNSaKqC2msaguqNmS9dtgUhBKI4uP40zCUYCgszotmzxirPF5aql4VOlK34b8MMaSFbou+50=@vger.kernel.org, AJvYcCX4rYr/+2QqGfvk8C0+1nAfBaK02f60yOzWk8cJW7XVNcVSH6ahirFGYFPDl+4f8JyI828cdNzHeESW@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/wXIS3iaCcgDBtL+HEOB9I09CZgkF1vrlx6FTV+86F8+NVji
	c7wkJtiH9lXZHUo9NmTXJRB47tw2dz0Vq5srDFrfG7GctGiSUtSXG6oV
X-Gm-Gg: ASbGncupFIdOdHw1Wmc7APito01F2E6RMblm38lYEBdo69NQoxV65A4u9/yZtrTYH2V
	LqSUkyUi8JPJJzHi2zb9+6WGvq+dRnbl5KlYLD6pAsXb08bUNXV6CUhZ6gzDTXgH8IKMf89lUVP
	Fiu3iT4gENW7A9pbjAFstoSMPgKGKtk1A6Nzfu7zvhX8+sEFglfQMLy8sLM7h0+4vy+QjuEj7Mn
	DGNyFlvd42lcd//CoGHjITteUwoteRqqDt734G/+eT7aMjEf5QJZyJ/nfQzMP3BxPXLt3foSw+T
	23rot/CrO/Du1KVZZIJbLbcG0YGJWlyNKQArUCv+3NZtulGQmk6d3XoxYmpvv6cJaJB09bmLnjX
	BvcATOYXO
X-Google-Smtp-Source: AGHT+IEo58ibA/l+aKG0G6THwqe7QoJuwHRWZ2A96BcETwONZXqlfQqLt9nEPKLoc22UgilDjkoIcA==
X-Received: by 2002:a05:600d:19:b0:442:7c40:fda4 with SMTP id 5b1f17b1804b1-442f84c209dmr43756135e9.1.1747333332872;
        Thu, 15 May 2025 11:22:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm5828155e9.0.2025.05.15.11.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
Date: Thu, 15 May 2025 19:22:06 +0100
Message-ID: <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v3->v4:
- No changes in this version.

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


