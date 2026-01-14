Return-Path: <linux-renesas-soc+bounces-26771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C3D1FE8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F34D13051597
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD16F3A0B3F;
	Wed, 14 Jan 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnyuGnhc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A2C39E6FD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405532; cv=none; b=a1YXcwabyYZCkAt92vEh842GwRUcQ7WnX7YNPgnlRK3uYXNUqNObHnPhltyTj/tYquCKvLrVN6MXWw78qQZU6zG063IPh3n6W4nudiznydmi1HV0fdGL38nfLqwJWnrEifdvNTrDMKA17DESbvez5MdPTP9haW7tlITH8sIHMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405532; c=relaxed/simple;
	bh=qSCl/eFcYORT2xOr9C9aVf5NIUqIXDn3ZLWt6rVQW6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5JioA9US7jnKsSitxcIBSfGdG7l/TdW1RBfnqzXmKma6SvAoSTzqpShhYvLxJqE8xxpX0IPWkzFHrowc+jNppR8ZHJxHHohCbkmK0sEuYTLKXjMvEiyjfdD32FF/OL8Aj2sXmQWCqUCD73vq8gh/DUrSqKfMtNuxdYjKLVFpyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnyuGnhc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so1210835e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405529; x=1769010329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omQbD76IKfBCNHbl78X1AUCJmtxXa2tDPyRYxCm9lbY=;
        b=JnyuGnhcSed2xRu1S3JeNU1nRgEMKTPvZDoUo2nV8qO6U9dioZD6IiBg9MB4o6NteT
         ekhZIhyeDyr7neBgPE+xnXH7rVZw8AO7JO2dUYFeHhn63VqM+MAGIa+z/0LXI3VWc+C+
         3cO0Eo705kyFrhaWdMfmLJsB/p6TZiHSn7QXNZGDv71p6nU8734TjG4I4CgnKP5DiYwM
         6UcsXaNyU+IMXeijlqW+rKPMapdfdyjgE2sVuYp0KXzPl8avHD+WxKxUR0QPZN5QL0y7
         XcmjHWQF9gtWqXEvW1lljcarvVZSh3QWfJcST+jXVe5UzU3E9ZxNioX+RpyrhYutKdfL
         u5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405529; x=1769010329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omQbD76IKfBCNHbl78X1AUCJmtxXa2tDPyRYxCm9lbY=;
        b=arl5v2DmnjlS9vv7SLFJjx3pVzapHkDT2PB5TS7euqUqvEQ8kcmqRW2EOeZ/r8lR/y
         OM3/DQNkD+78w8jXAwViC8m4hAgpu4knU46gpSgwV1wLPVkJzv444Pa4Kcm2zTToO8nv
         RWFA8rx+r/245S55fJwLXGtb0/9MHIYs+ERV9Z6N5hNHbSisqNc8VIb4bSNg8bU4KBLE
         C3lbE5jV+M+hUW1eQqmQ1Xt2c6RuIjfcyrQ6dfXXFpO2QQZdYq9vl9AjK/VTvXeck4gj
         y/LFeigvZCp3C5yzRNAwMzTWNePawmiFhyDTXn054bW8KQOUW2RGWmoLjo4btfzEAzfn
         MZjw==
X-Gm-Message-State: AOJu0YxSUKuJYeJPb4GE2BIikYBS67MWxp76i3f9tpzi63LOeeh1AqtA
	/jn4+df5mn+KOaLceO9mG0X77heQ8MQUw8s0atnA+C0CQpSnW+Uvvrk7NkS33r8CbUrfWA==
X-Gm-Gg: AY/fxX71ILrHRYbEqVQJehXeRXcQ383a3+m/2AhYJjVXyP6ITPmlv3wu8k+3zzH2dqk
	aMY7bOIEVLgGGy+8sB93l6vCejw70AX3A3PXd2UBmuCN5K/yUw8gk3V5/axhS11VLIyy3Nq1KkD
	9rwMOYsit5nEyLu3jTWsMMHJiZfnVcq+fnCGLKx+s/cfPbdn4pe7o8avK8pu+0J0BLBCX54tHYo
	MMhq5BEAjuGVc6GMG7uNEOigMBYtouTarGymOrm6/ldytIs2eoie/8hfOi/eCojuC29O67UP3Uc
	K+fTxboZzdjXITAArgUdXUtAIGWGk+vkpUgV2lntzOT2FCXfnivVV/FOcNu7ccyU6iLGwbeHja4
	6rNE2yceAnNtTI7d9nqyvUM9GUZzGGdSvnsd8SOmNAh39KKnEhkGu6AIvHwyLfUNMCr1H02zibo
	xZmsGPVnlCEI/zf5gW4eaCJRbkL/h870E1PiroKDKj0kYZFnRXiZZEShPgltOStnO0Jg+n8PHot
	rcJnN+5Y7SFdpUIV3Xlu0kZ
X-Received: by 2002:a05:600c:3586:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47ee32e0d5amr39228465e9.5.1768405529026;
        Wed, 14 Jan 2026 07:45:29 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:7f20:df14:ac2b:3d74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee544387fsm33867105e9.0.2026.01.14.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:45:28 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: can: renesas,rcar-canfd: Specify reset-names
Date: Wed, 14 Jan 2026 15:45:22 +0000
Message-ID: <20260114154525.3169992-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3->v4:
- Added Reviewed-by tag.

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


