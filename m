Return-Path: <linux-renesas-soc+bounces-29584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOe8KggquWkAtAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:16:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6202A7AD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 457C5301221A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E963A3E97;
	Tue, 17 Mar 2026 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiENfRnf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6503A451B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742596; cv=none; b=EdTO1vT7EXHNSmwW9ZmeChOCu5ywK/FQtwPENPBrlHW82lFzkRheAXpXc/inbEGovsgHCgAMGze+lnb4Cipr3iSf444bOt8OP0Rn0XBU2Kf36iO2RqUkIwhugddVNPDQGZmesexKsPaQnQLv6zPvUImFZrl5iYGSxQGHmaltVPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742596; c=relaxed/simple;
	bh=se68fAGuB/j8qlO1u+fnKd186GWgmOrI8uSRY2A7fp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxXJcO3McEKfPiGPQ6i0twjJZVPOp/7JqNnJrvCUn9M1bBndW2U09+zk/OX8uP4m5yW9jREc6ZB5YLtHqPjv9FooQn/cjBiDzYPUBT9CM6N8oy6VsJyy848/3E047Bf1N4xGb2UwleIZ79CIo/81iQDp8V8xXV3kg4MNKtCF/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiENfRnf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so33759235e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 03:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742593; x=1774347393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqdh04d/N2PVxo1lQ+gjA+vu/NkwjnKwwKhdoYX6Q4g=;
        b=CiENfRnfAjRQLrTiNTrFqONQ4s4smpqFb6gpPaeO/NmIlsfV8XdMCj2beqYubIw6St
         ZhWJHVJ0ilbx8NDMInWbKTdmkIEXd2WTf6ahNzqpgKaUQp9RAfT8c9Qj51oGAOWDCPNM
         KfGd/Ige6XQuTsrWOA8OPF83zDZZ4rFSj/XBHbZvLxk6rl2KF8adk7CHn16U3OVYH09c
         5URDUzRayEojDZa8hhENA/iOH1Fbu83KST6TI3Ki1mIefsL3p/uC5qDNPvgLRIPqWijc
         TElMjRDzct6OWfQ8bvwJjVsC3P+FSscjHqu+nnKHJci9ZM/LJfRGj4ELtO7BjyUEO0Nv
         BmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742593; x=1774347393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bqdh04d/N2PVxo1lQ+gjA+vu/NkwjnKwwKhdoYX6Q4g=;
        b=g0rBQy6fjolF6YbKI85YvLo9c7gm9DjzJfIkNxXZBFIQQJYm5Omr+BTf/5ktRvJdGI
         4ZoLGXpJJra2ytccv7RSIPTGnATrdLBwANOSbctSLC79d2GhYYXVFfK8ZEX8X9W6fACk
         FnauESIPvi/tJc1BV/QgL/hPW10kVEq8YvT4NkaPt6WRTkGohvBDtnWaGluXCr5JCNol
         x2iE6XKbFotpDTP0v7ezL1iLyR3v+s/HuCi7TDckN56ayjCZLLUD3fRw+kRCMK8SNPFY
         jin/lMgwBlLEkGupJ682AhAECdzQR8fSffmy08WLaXKsBSvGrVkdaL7v9ocjw25PrB/s
         ENcA==
X-Forwarded-Encrypted: i=1; AJvYcCUclaHogYJwW+pgHJhHZNqiZfXbcUQzz69cTqQ0PvEXqowDL1lVvlM1nBGuJ5QPWhf/THawbIvpZzTkWq7MYMCm5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR83Skmf5JuLRuB9MNMZCzVSDtlhcZAOXYrbr3EJdFJ10jjfAm
	AvRcHSqOEEFUF4X4Ef8sgKxDrxr0x+IeMX1alTJsUT0r8aLJadmrVp7f
X-Gm-Gg: ATEYQzzogmHNzuHXabAjyZVU7WyW/sfMlNgj5fHRrPEsT4WrLIyOXHqydcvsQTWOhs/
	K/NsB+zUNRwpAkSieRoJauns6hCUxHwC/T5s8Ylm1rsL/7hv8eHHL8Q5u01Q74mIywU7vIckg4P
	YOhyVf+4F+hWYkPu1NoP/0YTgLsPnVZw0oQwoK3Tf3E7Hj1XJlegLHJErbbyv+BEJC5ay8aOebX
	Llqwnnbl+rV43BNGIrJpSt5lg4r3iN4C5ztjq0ukReNv3mVk8qELf6qVIjd54b+RnoEIK5/G1kW
	ketFkuc3r0IgcFWtkbAE4NSjZlJmn331HEYrpD1SXrm48gIDOKYrolaCgDATwXjQs6Ks2nikXf1
	ZkbO3X1ndduzMc0xBC2UADYU8F4YES6bN5odQFT4aerlo5s/RRi55dfdKrM3oFHfw/TqhnDq823
	L+mBG7B7aTvtk8ZpKNviGV3nJe51B3YNWAKxiQdo9pfuqG4HWX
X-Received: by 2002:a05:600c:468e:b0:485:3f58:d9d with SMTP id 5b1f17b1804b1-48556714b67mr269050695e9.32.1773742592645;
        Tue, 17 Mar 2026 03:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:32 -0700 (PDT)
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
Subject: [PATCH v3 2/8] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Date: Tue, 17 Mar 2026 10:16:15 +0000
Message-ID: <20260317101627.174491-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29584-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,microchip.com:email]
X-Rspamd-Queue-Id: 2D6202A7AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
v2->v3:
 * Documented renesas,clonech property for controlling clone channel
   control register located on SYSC IP block on RZ/G3L SoC.
 * Retained the tag as it is similar change for RZ/G3E thermal bindings.
v1->v2:
 * Collected tag
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 20 ++++++++++
 .../pinctrl/renesas,r9a08g046-pinctrl.h       | 39 +++++++++++++++++++
 2 files changed, 59 insertions(+)
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
index 000000000000..660c26477d42
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
@@ -0,0 +1,39 @@
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
+#define RZG3L_P4	4
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


