Return-Path: <linux-renesas-soc+bounces-24982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F2953C7ABCA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BFFFB36163F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5C33451A3;
	Fri, 21 Nov 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeeweYOo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C99D2E7BB2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741330; cv=none; b=eLEf3HZ5GJU55oR2PEeF+39L+iFaIhjSCNx4FYxc8M08LDHaS0q1OrVSDxvN7QEoeNFjAy0wF69o8Cz977u4ZROkC8SPM90v8aGO+L0V3NYKuPUHxPA81gHlV8UknQJCWG9RjAFBQDHfeVWmEHUq8fr5aamufWjCbEf1hV4/A+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741330; c=relaxed/simple;
	bh=1EIACcHpWREBKBrExvsNyR4kt5pjQOmBDnFfqrLeyYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBVtFfNVkbSTUh7WiQY0U58S00AZg7ToIkERYoq7WAJWbemOSxN2e4PY1Fiv0w0lLV5nkAB+cY/jX9EFzZhw3S8jOiu1VFTWvqysurIFTt7tPMkMHAZpjXOAnFOpnW7PyTA8rCOWSGE0YMr4GVgXrWENbLmM+CLJFTt/aJqn108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeeweYOo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779d47be12so17364935e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741326; x=1764346126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJfD4VZqi2ZHQfXt2nHUaVIuc8hv442d/bl7fR6YDO8=;
        b=WeeweYOoDbtKxtnS9JDxavJEZwh85IxQgCahVjUT5D7mVE4nF/aKg3D5e2rLCB73/g
         uyPa3aNibuDwgUzXbiJApz8iUdwSWggZWmbKMCU0iuvk6u0eBBJdURfgmNloPV7BW8G/
         EajkAg0sqOG5v3fuDfMVbN5Jx1v5BWcVvcuy9R14iYYna8dUMvrkdiWRxEuVa6ygK4bE
         6eIHntd+vvyfucsnTWUYykUMUsvgWnc6r5ROFKU213cgmqIHLjLayQ0gWyM9W0U1kttb
         y6O+PaaXgDyiW+cANWCqbUPx0XcT4p0who3tUVsDG3p9z34y0JX1T2CMNOD5hcLGb+PF
         WRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741326; x=1764346126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJfD4VZqi2ZHQfXt2nHUaVIuc8hv442d/bl7fR6YDO8=;
        b=CDHefQRLi/q442Tx8vcjJH7Va77k1Qlvq0gP9g++8LzLBNQX1HoZdrPvWGLycVLss6
         c+4whD7Bh1Pd/MtBcJGZyWd92uxEPQXqt3alGlWpJybe8zbVEXkQzqma7U3INPzzfL7A
         c8beq9BWELulOM4RRfX2s4lGbVOyxnwCOMHN/yIoh6vCkivZaTOWLwoBUv/kaorYVQBq
         rA9p1DlxrTuCT2IoUkuRZ0PdcFWhHMZalshIOz5AnW9AOQB81/ChSJrmtjinCiEwoGZo
         oUwf6nLg0NJzAj5i2gFrtKCu8gG6AFmK5rRRCpsWgyX2TitKVdzoMUDEYBqgIsCYz6XQ
         l5bg==
X-Forwarded-Encrypted: i=1; AJvYcCUueySnaryDLp6mB0snV/k7/+Tvz2Miq/hm22rnx2vGMNIKD97tGNp0/ZPKXyXWyZ+TY8VQqYa+1noVoqQGaUhypQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WU77iKQi4MfBsefb3OqLZwsh+lwSmRUiMIAxYmOLAp6mRera
	MLZvkuxccS/ws4017lvdq5WkJvOVl9HNeFtwYimrdRARwM4TrsPZgWu/
X-Gm-Gg: ASbGncspL4xuucjU98VY/lRaz0fdmfMv553fKJyxfMi4Czy44YWkWJgGii40EU0RbHv
	8/xt24MytnuLtVQYJ+vebvX1rt47XZ/pU3oMYY/mqYEpxxZRNmAq0Y/jr+JHcW8eS7Q2g4AAPSo
	Cu8WNg8z2lew7HwyA2M5/Gxn50a+i5rh7scDLwuvOWsb5ZJF/Q9Ykq+/wmFKP7Y0OuyBCq72NXM
	HTdUTrLnAnh1r8q7Umq4AK10taIjpSl33WqXQBDbU126gppilxhY2x9xZMzH9eiJWulMqivKWp9
	NbzKxkhJCF8Bs8ytHBhBoi3kERP3rjF0U5fXLB0QTXoeOSXv7Y7COvLl9VLgkPFjPaJkPdaK8Mo
	vJkb/HAa8hyYjuFrNprvyrgNZWNRhq5nYoguRKJt8E3mUaAkXmzkOish/+OZkowq9PHxjFGAck4
	EhcG0zM37b1JSrZsK5q+BRCCmr0RJ6V60ZEs0Pov+IIu7bbRF6Llj+tSYSRvLzcaneREhzQ6c=
X-Google-Smtp-Source: AGHT+IHvF4xthtd7HqrwnrOiEMX4kqJJqBTuRMV48hSIy3dGjW2hVW1V+c8zM2P+s0BZEIrkjyNsiQ==
X-Received: by 2002:a05:600c:46c3:b0:477:6d96:b3ca with SMTP id 5b1f17b1804b1-477c01743e2mr30865075e9.5.1763741326204;
        Fri, 21 Nov 2025 08:08:46 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:45 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 01/15] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Fri, 21 Nov 2025 16:08:08 +0000
Message-ID: <20251121160842.371922-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L GPT IP supports output pin disable function by dead time
error and detecting short-circuits between output pins.

Add documentation for the optional property renesas,poegs to
link a pair of GPT IOs with POEG.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V24 from [1] -> v8:
 * No change

[1] https://lore.kernel.org/all/20250226144531.176819-1-biju.das.jz@bp.renesas.com/
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
index 13b807765a30..98bcde755fb9 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -245,6 +245,28 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,poegs:
+    minItems: 1
+    maxItems: 8
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to POEG instance that serves the output disable
+        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+          description: |
+            An index identifying pair of GPT channels.
+              <0> : GPT channels 0 and 1
+              <1> : GPT channels 2 and 3
+              <2> : GPT channels 4 and 5
+              <3> : GPT channels 6 and 7
+              <4> : GPT channels 8 and 9
+              <5> : GPT channels 10 and 11
+              <6> : GPT channels 12 and 13
+              <7> : GPT channels 14 and 15
+    description:
+      A list of phandle and channel index pair tuples to the POEGs that handle the
+      output disable for the GPT channels.
+
 required:
   - compatible
   - reg
@@ -375,4 +397,5 @@ examples:
         power-domains = <&cpg>;
         resets = <&cpg R9A07G044_GPT_RST_C>;
         #pwm-cells = <3>;
+        renesas,poegs = <&poeggd 4>;
     };
-- 
2.43.0


