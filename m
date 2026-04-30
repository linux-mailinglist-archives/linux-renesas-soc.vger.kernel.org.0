Return-Path: <linux-renesas-soc+bounces-31777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMRSKboi82nIxQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:36:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A77A49FE9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA042303A5FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5911339B4A0;
	Thu, 30 Apr 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpKblg51"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AF33A4F5F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541671; cv=none; b=AbtmgEMIDpJXr2t+QAsmqVNeeUIkA1bX6BV705BtrtJRd4eDFOFRvRsTFVbAne2T6WhUif0Sc3/0gllIBpe9WKdhz4khXOXnEo4LPSCOnVuzau1QoGnJlmBYz8EYMqYt1RdBs4tLDxh1B2RP1EE1+DXGxdEyTvhSRDsPB6I7cDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541671; c=relaxed/simple;
	bh=2FY+4h7hB3E2g/vAnzM8D+ctfKyKw0UkzdwKveu8pvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUPZBlCmo+AyqgI2CPL9gKzVtScuhO+860Xx+C6VzA5v5Q7oybiL541nyk3/HycXEziEfTm2Vw/ddkehUs4hYg2d7gtnMBXyU1g/4FCnuXeWRM0u3njy7kaZhWRh+DVY7hTWJVPafae7Ybd9SC4xp4/o8vahb/3LsKeZFP8d+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpKblg51; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d7e23defbso401647f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541667; x=1778146467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdHsjRXgE4RkIPMJ+uwSXVihouNvsOsYu4YaJgqIAYA=;
        b=KpKblg51Koxm+Xc1dFb3h4KV0ebQLnhyDFTLRul+oWwQmZiXFpYx/dOndwGlIhjmJl
         ssdPorLDbUGLTp8K2XPiyi9e51e4F9O34+EUA4zgug7auAbQPAs0HpZsb+WY1F7+T8uT
         jrv8fdhho9dLV/uTBaYgiw8WJVMDjMTJlihBZpriwo7ncsqINwQADRv0qQqpc6xaWLau
         Mn25kgxHm10HZ3NlwJnyrFWTm6MZU9ZK9x1bSPVM996836xhCuZeahO8yQMY+sCD++cj
         9684OI6YSYaH0e2algPeMry6Px9hYpAgTw2aeLHtlykB5X/v/JE/zQiVEe9Jjb5HRMab
         HSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541667; x=1778146467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DdHsjRXgE4RkIPMJ+uwSXVihouNvsOsYu4YaJgqIAYA=;
        b=XGruenF9PfSXD9yLqqPc//9UkvB2HpWswMsyH/kXPmF8foD1tjSLpxpFE3LdopZUdN
         KJuwLDQNG0zFkt1Vik44Qas7Ub4MymgohsKrpQFvIpC+bcbMcCuecs+df3KSLizEf4LM
         C3nH/RPFfONMhzUEB9JtmAR6OynC0lWxTeu1jMLuG16YDvFfpuiIPSBzYrXJCBKPZFkC
         z6UNAjgOtU025w2z6n3LKBRZixnL6XSdXkrPw9yb6cywgrJPyCHDcxjvsw7NKWfTyero
         xjYqCH715anhc3mKsjRnNvQbK8CkdbsmTzNYsnjz5hvaC9U5wIGllvo/OT6sTHRj6fjn
         2abQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XFfp3fsgdqHofM0WEpZ5zJw+Q8ta0x/ZG6bzRND1IVEwUAY8bTTMsxq+ulf/EmmATw0SmkMRJ0NtdiMU3PlyfAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIktBPb7qBUMrpjYpMv8XhtnoXQ/oJ0gWkftK3iaS8YteFZHZN
	CvC1QgearljM5rVjZmwxmJmuvuF+BTKhMk0D6q1rCcjRW0aQ+VSuaoIL
X-Gm-Gg: AeBDiesVIUyYxbhDEDy4DpD7gExS01U2owP64/g4Amlwmbu9AAQs4Udqx2losrO0naP
	9arQ8C97IC8YXHrVzEFdw6YoArQTwlTn1KCx881PbIVn4OJ7ZoCgo1uP6vwhxnzJE+Icc6HS8f+
	bPe/cPsGCPdZWLDJNbx/V2wpRlhRlR3xV6fQyA4Msi1wq4LaNk0iIAKP5depUL504EEuovUZM5b
	lyI2leYHSlFOU9vYweYvtfN12v7NgKTeK17VJlBY9M+guvsFowgnR3xht1MzRvIdn45Q0rK8fM+
	VTeZemQi1OS8Wpes7gpIwMy8fKxOEHIUr3UD5pUh9gxyN3r3CsFBqkDYMW/NCb1UHzqFlEg9Rpg
	K2fKH2PjBwaD5N1hDOb2+ZELquk/HF0XclsH7C5eLLjQLd6BiUA6kZIt2O/y+iwgcRE7GKSLBl2
	JPY++2Q46rf+7N/vxfNFADkVPqcb0rim4U3nPU93Za/87yNZbRP4Q3z8cB
X-Received: by 2002:a05:6000:24c9:b0:448:e182:b7ae with SMTP id ffacd0b85a97d-4493d8f4194mr3306042f8f.7.1777541666717;
        Thu, 30 Apr 2026 02:34:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Date: Thu, 30 Apr 2026 10:34:06 +0100
Message-ID: <20260430093422.74812-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A77A49FE9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31777-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
more pins.

Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
numeric ports.

Document renesas,clonech property for controlling clone channel
control register located on SYSC IP block on RZ/G3L SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped Port P4 as it does not exist on RZ/G3L SoC.
 * Retained the tag as it is trivial change.
v2->v3:
 * Documented renesas,clonech property for controlling clone channel
   control register located on SYSC IP block on RZ/G3L SoC.
 * Retained the tag as it is similar change for RZ/G3E thermal bindings.
v1->v2:
 * Collected tag
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 20 ++++++++++
 .../pinctrl/renesas,r9a08g046-pinctrl.h       | 38 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 1a94e396b1b0..fb1fe1ea759f 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
+              - renesas,r9a08g046-pinctrl # RZ/G3L
               - renesas,r9a09g047-pinctrl # RZ/G3E
               - renesas,r9a09g056-pinctrl # RZ/V2N
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
@@ -88,6 +89,16 @@ properties:
           - const: main
           - const: error
 
+  renesas,clonech:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to system controller
+          - description: offset of clone channel control register
+    description:
+      Phandle and offset to the system controller containing the clone channel
+      control values.
+
 additionalProperties:
   anyOf:
     - type: object
@@ -150,6 +161,15 @@ additionalProperties:
 allOf:
   - $ref: pinctrl.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-pinctrl
+    then:
+      required:
+        - renesas,clonech
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
new file mode 100644
index 000000000000..5ec5bfc27c7d
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/G3L family pinctrl bindings.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+#define __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZG3L_Px = Offset address of PFC_P_mn  - 0x22 */
+#define RZG3L_P2	2
+#define RZG3L_P3	3
+#define RZG3L_P5	5
+#define RZG3L_P6	6
+#define RZG3L_P7	7
+#define RZG3L_P8	8
+#define RZG3L_PA	10
+#define RZG3L_PB	11
+#define RZG3L_PC	12
+#define RZG3L_PD	13
+#define RZG3L_PE	14
+#define RZG3L_PF	15
+#define RZG3L_PG	16
+#define RZG3L_PH	17
+#define RZG3L_PJ	19
+#define RZG3L_PK	20
+#define RZG3L_PL	21
+#define RZG3L_PM	22
+#define RZG3L_PS	28
+
+#define RZG3L_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZG3L_P##b, p, f)
+#define RZG3L_GPIO(port, pin)		RZG2L_GPIO(RZG3L_P##port, pin)
+
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__ */
-- 
2.43.0


