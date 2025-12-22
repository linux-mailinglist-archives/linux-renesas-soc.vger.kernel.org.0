Return-Path: <linux-renesas-soc+bounces-26015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C08DFCD6A5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 17:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62EB330365A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 16:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBB732AAB0;
	Mon, 22 Dec 2025 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9hY362Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FDA1DF271
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766420337; cv=none; b=ZTanFgHr7bSK+RJpH+92QHTCi0poFomAJvjc02I0lp+KWN2b0bOGr4GwSQ9VJR7Wn0xhkTttiDx+ovTi4c47LRIxfd8Mu+LIufetC5agaT54TbGgtl80/roACF2fZIo+TQUJW8LJ0awWlaNTzz4nG+0k+n7BqtPGnmTXmzTICp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766420337; c=relaxed/simple;
	bh=T1RNwuLYyNmJ+j/mip3aJ5UxSQC/Uf5uzOBFEfaK2lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQuHYwgRvOhtYLOuI0TQKGRVJy/gvmcClfmTcaeBgwJxE6hBCWRizEy+GVJyNjBGIewXokJw+qZpPJqh19wT13M3RhMAt11zdIN0yyGQiurJi9qaNrXLk4Cz/cn9p3NG8H5JdFPSR1hwYlhi5jroqE/hAYDa/nREBRPgk/SjIfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9hY362Y; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so26146365e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766420333; x=1767025133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Wn+1o5H5M2D3/1CjW1oNLSmHryy2WgYugla7KkAVPw=;
        b=e9hY362YWQoryx+dLZp2HPFm9LwSJ4iOD7PgZPEOqOrac+UIszEetjHpf0q1G99UK1
         p3wmN7wPWkviHirDi1U1AJFGJkbQnt6nNs9G2FhgfoUEILt2whyTvItvDJshtgKVtZ2l
         HKEq6n9uizaUPOvVHNKZEY7PPf556PCLG2akLD1JkLoKe5dleQxCtTRjyfYjGGwaT388
         VVCMu6WnKCSa4sZp71uFXYhvNfp2fvVOsgYciiQWUnBIcpVn5OLA6pWZwEk4SvAfXBa3
         zTnqlhZbzksOqxcBerptWmip4vKrLtEhLjnrnwtJyebg15S5rXBd6Kw+S4mL5vI95ZUc
         nTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766420333; x=1767025133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Wn+1o5H5M2D3/1CjW1oNLSmHryy2WgYugla7KkAVPw=;
        b=pPCWzgHrK9n9fpv51IeBEWDz97t047XNp4qdIEw/rdc0ip1Fe6Ta6S9g7dlUacWUtx
         j+D4mtHXZVghJqD6cj5AyckdugYTxccqDHbAMQ5ZFtRfg3Zpn7PnjPfjO8/DOLzeIVAa
         XaBh3Q5+4M+8qoCu//lzI7TTD66QNYvG3fp93VVPAoHcJ/pwOSVxsE8WYRna/PE8Hrz9
         Ettss2yNZMcEPm5W5fr9oEcLTnaE5PMYWTBnGFhY5OnU4mWBTVKfUVMNLb1KfIkhk6eU
         GUVQ5W1cDjqY83KsEUJdG/kO5K8hwCzawCpiXxGbiNr3bQ7noViVLNGkWoRCA+zTJRtA
         0dpA==
X-Forwarded-Encrypted: i=1; AJvYcCVOxx/n7j6H9V4thtwBJ2fLSuRwdSRw8sv6A01UvWph3hHFj1NDSsUDDPrgPmNcu+J8FOqCgW8rCR+7fXsBds7R5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKIa2MnBhUOZBBobGqzbq/2DfSJrFAtwVvDfzwgjZJkaBDb3zP
	sThlg/o3E+noakPP/Q5hfvYtGJwv+H6/q9l0dDm9mWH07Jy9a1nI5uE6
X-Gm-Gg: AY/fxX6jYinTgDufRo5kmPk8YmgnhDqFSyvfL+BJYxhsEV3Xo1HiLmAwq6pIQf8Qva7
	sOYgK44tKqEDxDHiHcj866EhudpiX9v292mUKGEdSYgLkffvKSU7O9hSBqdAeRGBwsFqIv18Zxm
	xn1UpTD14mDRrTzVqLLv2Z7faEiVq57vQe/penm8ukSnuoFyJrerZn3f4j5HEVZDzreyajRf2kw
	H53HsRGJh7sBf261YH1mkXe7HJSRy8Klv5eSQyrEEeB9HektA5P8u5RS6oKeVdiMvCa1C4UsGz5
	fgkViUwvQ1ztiYGlvAA0iIHkpLRdAyGfEBkeP2fDRmTmZXyv4O42/4YvIu6FC1XHHW68mAXjjbK
	muKjDt8UNXnrRAESdFBqI/hCI1vAa8R6Ewrf9xEs5SyapypuVfI+XLUjWynXBhOESeSze8MSWCH
	mmpa1Fk8f/ATDy+iysX2g5s5JEZzSe7ZL9f2AgkXaFSkKTRyK44h6Oq++ZHTtl9tBAlpg3whT4i
	A2KK3MYdZbs9wKc8IdE+Mtinr4S9o8DRg==
X-Google-Smtp-Source: AGHT+IG3GUrdE4PQHrsdSst16Dgk6RAbxwgJpO7Qwn77alrqhBYIPCIPtLmfjtOzLdRdyTl/fZZyVA==
X-Received: by 2002:a05:600c:35c4:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-47d195869e7mr135907925e9.28.1766420332821;
        Mon, 22 Dec 2025 08:18:52 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:4dd:df38:7864:a996])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c637sm238662805e9.11.2025.12.22.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:18:52 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] dt-bindings: phy: renesas,rzg3e-usb3-phy: Add RZ/V2H(P) and RZ/V2N support
Date: Mon, 22 Dec 2025 16:18:46 +0000
Message-ID: <20251222161846.152952-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add compatibles for the USB3.0 PHY used in the RZ/V2H(P) and RZ/V2N SoCs.
These SoCs integrate the same USB3 PHY IP block as the RZ/G3E, so the
RZ/G3E compatible is used as a fallback for both.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
v1->v2:
- Added Acked-by tag.

v1: https://lore.kernel.org/all/20251118180712.4191384-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 .../devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml  | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
index b86dc7a291a4..6d97e038a927 100644
--- a/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
@@ -11,7 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    const: renesas,r9a09g047-usb3-phy
+    oneOf:
+      - const: renesas,r9a09g047-usb3-phy # RZ/G3E
+
+      - items:
+          - enum:
+              - renesas,r9a09g056-usb3-phy # RZ/V2N
+              - renesas,r9a09g057-usb3-phy # RZ/V2H(P)
+          - const: renesas,r9a09g047-usb3-phy
 
   reg:
     maxItems: 1
-- 
2.52.0


