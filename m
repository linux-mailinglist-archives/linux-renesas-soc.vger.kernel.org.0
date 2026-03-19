Return-Path: <linux-renesas-soc+bounces-29907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM3NEM4FvGmurAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:18:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B22D52CC9B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDD213078158
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5024635A397;
	Thu, 19 Mar 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1E2Poh0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B183563CD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929722; cv=none; b=bRK7Whsh6opt4Etp/V05r3dJG/Rmzt3IgeYvM1JmzgfggMb0O7b23Odh5NUiW3p92+8PHkYIcgqd0alkofUTMoYoH6hOMOa0UA+whKC8mx41Ab0qVqBI/vzIoaBWNVDQ2WrFgN4LKWs1lzHrOwaz8zsYGnkktX6IK7btjDDYAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929722; c=relaxed/simple;
	bh=AVqKV2koLL7ZlkRc62jikhi1UX4IiI5DvZw1l2ipQw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtSXe2+vv/9hzUvYKeLjZCABPDmC7FvN/zxRXIpVb4Fgkatl/L5bvrnug/aacj8IfNEbeQxlyY3oNjsNLc6tSiQjGYmDirFzsT8eyh6XDNNLqCsstzyCURibh0mbVkJvw7fPXlBp2h9pNz9Hlpz9ah1PdYhfuFHdXc6pMdxzHvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1E2Poh0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b41b545d9so1077175f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929719; x=1774534519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVOwtxYwKf7F+id86vByPrLslX0VOCCmqpIA6XP6qiw=;
        b=Q1E2Poh0Sgop4j0ZeuULYvsTCnM9vWucHJdYqXYr4Vd63rxYm/g5HsODEZkqMtRNdN
         1W91gwJYsY267BOY79c7XvY/i/5awpakgTaaWZgsQFw/HfB2BA7rVnGnRWsHCQeeLhhz
         Q/3u8Jd+v/YGR3qDKuJkJN6CDyA8/o7Ym1hXLCm/wOI4qX6Cx1tBEsebzWcPZlX/LHC3
         8pz3pvd1m+bH73g3Fy9R7XAcfbk/ycLzsq4ye72kNMbH5L+Un0zpYqyzG5JMl5LYCDxN
         1OtVOGjXaMyQ8GlR15mRFQybd0oV7Hr0CmiqfznjD3uPXJ6KJw/WvyciDQE0Ru0EzSNf
         2pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929719; x=1774534519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dVOwtxYwKf7F+id86vByPrLslX0VOCCmqpIA6XP6qiw=;
        b=kV0HDujsai7aikgpCr0nX9kVSySDHErgOep+spcJH74/6XpRdyeZ+pDq+Lqy0hggly
         7HfcQmAhkiBz2VKdbO30GlmTDx492EDHne2qL1+ynmhonheWrrzFI6hh2I0l5LqkbD+d
         6X2ATNdE01B1z0sM6/u7TDGwSxkOEuhmZVq9h81FlwkPsFuSFY6cWbRM4UmTXR2N30Oa
         c5WoHlwK1O99WUjuFYDui+oyiS4dwGSeEjAZJbU7CoR0vb7EfDHU0+TkooZEYsWqdk5U
         e9R17OYH+3ijZknmGHc7ZmQYResKHYnqXA0HDcj5wMJHNHj0CavfRmgGJ0JumehrITrs
         x/hw==
X-Gm-Message-State: AOJu0YyIXMErZMEIsk+fo/ahNB441/7Pve0/zmnP/pKJResVhZ1qVQId
	vILbUUGHlAPdrVlrC7oc2EepmFXj3LxSMTJ8NZq11BUL6jhZtuFyBrsf
X-Gm-Gg: ATEYQzxh1V6o6Q6jR3nPnyoPXsnJRKX6nzh5VpSiFSyXtWdr8N3DXQP1XroHiCWvRhQ
	RmVbNV6yy6h9t4JbpCx7gCsTcoV/NNgMigyLSbM/srjxM7mdtR/QWiA+99+8OpQ1HFxDAa3fYbA
	AtYzfASlYm1VwGOn4EPh5lb2tvTxC3HC1VMVSFCJF4DkV7h4fI0LSCnz05IcT7ULI7CMGfNhd5p
	LMF3U01G4OoZIi7PyOnJzUu80gNaG/8mgZJ4fegNdCPYw5QsrHPBBEuZqu34LkFK/wEDRDL6VRa
	OhpTtlf/u6d/89Aee6SZ44Jgu0Kv5DEmbeS87vVrHaFY/4YQaYGvaaEOuLUvAMhuvDuGlQuMLYe
	8E6/1pivxacKqVxkEbiUmN2jmf8S+YapUfkwvgWhu22FII+65djcyAn5o+Ztz8griKCx04IImIw
	8aw4DnaDspMh+CNl6G8pgVty7YkmT6sOAr6rk16miY/KV/0dpYp1SDqVa+B4TrqYKvVyKoNDywc
	LKyfVLnBXxClOwyS+44lokcx0Re7fk1cX0cKymBPpyYxGg=
X-Received: by 2002:a05:6000:2501:b0:439:c42f:10c4 with SMTP id ffacd0b85a97d-43b527a97b3mr13343032f8f.15.1773929718875;
        Thu, 19 Mar 2026 07:15:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:f7c0:c444:6359:4c21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm17824618f8f.5.2026.03.19.07.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:15:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin configuration properties
Date: Thu, 19 Mar 2026 14:15:14 +0000
Message-ID: <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29907-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.957];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B22D52CC9B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the pin configuration properties supported by the RZ/T2H
pinctrl driver.

The RZ/T2H SoC allows configuring several electrical characteristics
through the DRCTLm (I/O Buffer Function Switching) registers. These
registers control drive strength, bias configuration, Schmitt trigger
input, and output slew rate.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit description
- Switched to using the standard drive-strength-microamp property
  name instead of a custom one
- Added a description for slew-rate property
---
 .../pinctrl/renesas,r9a09g077-pinctrl.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
index f049013a4e0c..63993b20524f 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
@@ -83,6 +83,23 @@ definitions:
       input: true
       input-enable: true
       output-enable: true
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      input-schmitt-enable: true
+      input-schmitt-disable: true
+      slew-rate:
+        description: 0 is slow slew rate, 1 is fast slew rate
+        enum: [0, 1]
+      drive-strength-microamp:
+        description: |
+          Four discrete levels are supported (via registers DRCTLm), corresponding
+          to the following nominal values:
+          - 2500  (Low strength)
+          - 5000  (Middle strength)
+          - 9000  (High strength)
+          - 11800 (Ultra High strength)
+        enum: [2500, 5000, 9000, 11800]
     oneOf:
       - required: [pinmux]
       - required: [pins]
-- 
2.53.0


