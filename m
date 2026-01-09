Return-Path: <linux-renesas-soc+bounces-26512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC26D0A49D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 14:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7350F3316282
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 12:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FBA35C194;
	Fri,  9 Jan 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCw4zvaG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB7435B155
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963097; cv=none; b=Cdm760T+tTiMIWcoJoMJkW9Ba6R8uJl5+uLH098W6uQbeRnCTHKMSTazpfi5u1x7eKJtz/XmQ4/usiuHVevte91umk4csvAij0aQ2mIeVe8512Vl2OTPy1akw+lUt9aP5xDY4cDBfitb7NEYrmzN4tQM8ypwy8cCmM6E6w7dFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963097; c=relaxed/simple;
	bh=KXGqBVeDfc1rXLcLWdZTBpprFkeVcHDqelBR5sw6cAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0nYrdmoyDj+dkvYO8Q7QwsyxPA75A+ZNaOZYRYE2VdmxQQwq7jpUta7Ee71bkxpUI/um2rcjtusDVSw7M2WccUhigRCjZBJXKvm7buo4oeskL2xYw5enVaAFrZ7FqW2PD3FX/YFIVkBH1ZNj2txhWSu+mQE7llPx9PyLxT3pR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCw4zvaG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc305882so2209272f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 04:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767963092; x=1768567892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZ8ldHFgmUWO4zWY+hyfBGsPb9cEVp/RZUQSRdJaZeM=;
        b=eCw4zvaGzXfjy1cSd/NCADteh9Xz89VD4GFSTLUBFOWPzymm/46VFe9sYp+IOud/A4
         Hhe/7/QyV+LfCYxwZl9pD6mlHgbpYBq20NnJtLffrIgofSQceMBATwl5a8Gq3yf5r7Bb
         hZY2NwqFEqJLMTqLz5ZnXQXM7aCMIBHCKqQlIzrezxSRVZThXeyBZzLR0hyoyklcsIn5
         SFWXiMmiJkAEM3JNX6qussOMDFc6rllj/b16zrUiF2hmI1QUXjSeh0h2oelaRbCK0Acu
         S8aEka1gWphGl4ASB9N1SxMT4zXbOxHQlqE8KQp+bN/3tWGBksIVuC8Gi1U5nIZReqn2
         5K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963092; x=1768567892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZ8ldHFgmUWO4zWY+hyfBGsPb9cEVp/RZUQSRdJaZeM=;
        b=pzODlIf0vwC885t4fZtuey1muNmEHUuFS8cn1MiHuCMps4beIyOUKANIJem3jzBa7y
         wxuBPw8sD0OLLXqmzJX/ysGvCL5D2RULqQEGy8kADQXBW1OjYGsF1gHDgt1AShfWLkdB
         rlphV8C6PHZ6xBnMJcLUnHm2Z7+Cb1JoUxy4W+VGOjuxm01Hb1TDPsoyA+OtUSE6lGs/
         fnFvgD66um4vY1bAg2fYkeCtqjHCPTwhz8o4KFwjL8/UbXN8R8kiJE710YdUnsIFIWBa
         UUyn5VgxOaFBiQ6JwR0TXPnEyvIo+yg7ATMIXZYQSRwAoeUt3bwZQnl9a8xWMW32L/SZ
         rgDQ==
X-Gm-Message-State: AOJu0Yzy9Jitxek2wNKOx2LkJ1Ryrua/44pLhJyCAi90NmlS6iptS8UW
	OzwO0iy5nXEZgFWvCMp6ofZMDajlv+APzmRoMmTHAUcCdh1ADY2aKd+X
X-Gm-Gg: AY/fxX7vrB1d6QCvh2RDbe68zHHV8JxqjVSYRPI9QbbfV+Ibk29JAPm+tmaz1Pi5DId
	AZnojd43LNz1gE7pcZ0DJFGLPUqb7+h0Qwa0EL8Q9lREA4RTP2aYB43AelyyUAm928Vcrggkj5O
	HXa84Lt9RpJXbjZnkbvSyHQxrBZ4Usj3b6WOEpHta4wVS5iwUAZiwFTeu0wck8dajRM1ZUYQevD
	56QJurj6woceoB4UEigwqitn1fS6gZ2hY1luqK4FC3XrZbtjjg5s1K1KI0gr4I4HqdnvwJImSIQ
	Diglm5npvDwl4U2wg83InbfKnwMxwDWVPYxvJkMLQqyyzSco4NmZpPmWdpK1rCrXx6TzWQujqi6
	n+RYuYQFOb4T6wwf06kO77IletILXrmhF5GzQUte2P5Yb4/ZlIfB4zESq6K3sd5JvfBiW3d1fVz
	Ue7PviyaKI+bstsrVLTnd2+sGCD8eE22GI6ism9MKCXLtc8VmEu7ZVFKeIXAEOqoa0nXrHo29Lf
	R+mytXqskkCGpg9rYU0jjo=
X-Google-Smtp-Source: AGHT+IF1YU8GQfwrL09JpkEGOkpzEtbYDZ/ByC9OxXozQGdu82LVM+4Te983M5es4cydtywpH83ryw==
X-Received: by 2002:a05:6000:26d3:b0:431:701:4a22 with SMTP id ffacd0b85a97d-432c36436b0mr11887198f8f.27.1767963092453;
        Fri, 09 Jan 2026 04:51:32 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3d06:ce2:401e:8cb8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm22837291f8f.8.2026.01.09.04.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:51:31 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/4] dt-bindings: can: renesas,rcar-canfd: Specify reset-names
Date: Fri,  9 Jan 2026 12:51:25 +0000
Message-ID: <20260109125128.2474156-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109125128.2474156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260109125128.2474156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Specify the expected reset-names for the Renesas CAN-FD controller on
RZ/G2L and RZ/G3E SoCs.

The reset names rstp_n and rstc_n are defined in the SoC hardware manual
and are already used by the driver since commit 76e9353a80e9 ("can:
rcar_canfd: Add support for RZ/G2L family"). The reset-names property
existed previously but was dropped by commit 466c8ef7b66b ("dt-bindings:
can: renesas,rcar-canfd: Simplify the conditional schema").

Restore and constrain reset-names in the binding so DT schema checks
match the actual hardware requirements and driver expectations.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Updated commit message to clarify that reset-names existed previously
  but was dropped.

v1->v2:
- Moved reset-names to top-level properties.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 33 +++++++++++--------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index e129bdceef84..9bfd4f44e4d4 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -122,6 +122,11 @@ properties:
 
   resets: true
 
+  reset-names:
+    items:
+      - const: rstp_n
+      - const: rstc_n
+
   renesas,no-can-fd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -195,13 +200,6 @@ allOf:
           minItems: 2
           maxItems: 2
 
-        reset-names:
-          minItems: 2
-          maxItems: 2
-
-      required:
-        - reset-names
-
   - if:
       properties:
         compatible:
@@ -239,13 +237,6 @@ allOf:
           minItems: 2
           maxItems: 2
 
-        reset-names:
-          minItems: 2
-          maxItems: 2
-
-      required:
-        - reset-names
-
   - if:
       properties:
         compatible:
@@ -299,6 +290,20 @@ allOf:
       properties:
         renesas,no-can-fd: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g047-canfd
+              - renesas,rzg2l-canfd
+    then:
+      required:
+        - reset-names
+    else:
+      properties:
+        reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.52.0


