Return-Path: <linux-renesas-soc+bounces-17623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95DAC6A71
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76F2017F90E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF88287508;
	Wed, 28 May 2025 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzIl/V/y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC78328641B;
	Wed, 28 May 2025 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439041; cv=none; b=cuDF/ACwDgygVZPrjgoS99XdAi05ofAo4pWKHcI4fKuG55/yqQhOjXHpOAFUyEZeuhfO3h38vHZJDFMqYoj9OafTSaS4Sp2HMcBuVFE6SVyv1jMxRkO69OE3VhGYCWTvFCop0SuaqTBAmlI1NmrYK4kK+i9Mqa0hqQ+hJAsCXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439041; c=relaxed/simple;
	bh=3u2Qw3HOw0iC5C8vTgWluP0FOEKnaGzNEAyur2Cmlqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UQH4KrpfX/NLY4NLueGCJ2wYMb8QDgyJOa3Wv8Sr8y1fjg3pg+ZKCqOzV8P9G57WNLLGax2FLyfhlPuh2jbvWlVR8JIW9fB7A0q6Mv6Jn14DGmOyo4jPOl4GanoUiAAR03P4QWlFj+O38UlBx0HSm2vx9QIkR0rSVLfLZtX3suo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzIl/V/y; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so749227866b.0;
        Wed, 28 May 2025 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748439038; x=1749043838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8wMbq77IiXjEJTnbDulm6U0IolIMNTt+1mFsUjgJAs=;
        b=DzIl/V/ypVVVJhPK+IwwWDCY0ZMqxALrNG6prDQb6gREMs/KjI4IcjUiBtIr0L/hN7
         n2e1VSUdja850drsADJpxMh55S/XWwBsK3Hok3e4DUEyF9cY9J/a9wkBVguzJnqEROdE
         eEWwOGC8NteGGjYkFhHcTTCw96JD+nhSjOzhCfTd6BfLTrDJ9HsmmDKiq322l8tDKpP0
         RaQiL4GgcAeUqEEPIpNffGNNxhHpuxEBdVR+xEfhL5MigQtinI0xCmXirj5cCYvaDCOT
         aek1QBspnlm7Z3wYP9iCTSSapl1lftQpDh9yv3ETaXUx+kNLc36ums9JKS0jIPA6QSxg
         ToFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748439038; x=1749043838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8wMbq77IiXjEJTnbDulm6U0IolIMNTt+1mFsUjgJAs=;
        b=ewIb03dNjr4K6qSSu1BfnwByohTp7y2QAXxLA1NtGl5Od/mpONwTrpjkU9Irhbrisu
         c03FYgKfbWtcV4145Bnr4ztZ0jgJvqrGGXpR0Ig4K5oi1gDg+KxX7QoflcgH/20c8ig+
         GKVo67noNZyzdFUQtCBRrXEpbnCKwj/9GfR5K6ZJKEte33w9AGDxy0JmdOwO++YjzPGF
         Fw/7A221PXh/29lbnyQbI5xbrJIGGqHy5UtDCqlWN6aL/BEKACsUhMqn2L1kTA8eY61n
         2MCjSKR0iJRIsTJGO/o3+t0Sci5jX7+K2l1S7XTKcgqnuFPyyLRb0yusF68grDZho4+O
         yLhw==
X-Forwarded-Encrypted: i=1; AJvYcCV7XbL3rvN94/16jJhe6OYT3+4wbku1ZWreagNcad0gegGMoPdCc0RcTWP9S3KINs1mpW3pNF9iYRJO@vger.kernel.org, AJvYcCVOEeZO2ARH6inG1wKdTkwT5XjcSi0zED95KVjHV0UwBUBR2tvpjvSe7TaaYJhS7eDVY+FGzuX3cqEC0Zx4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxvas4EjwzvLrVpa/2ceegME6E1rBFUq9L+ZSFKLbk5W8RkLLG
	x0CozWT0fhpBLtGdM47BBc4ddGQrI+5by3pQVTs3MQPdEZ+TNoCAzOEL
X-Gm-Gg: ASbGncvyUmOaqb+Nh/f+NcIP9k8Kp7g80kqwlS/FWNqouts10flRJohl8Qruyk/xtgs
	qBxk6Lh+Ex4KVP8UUsSvdk/RAsAj4C/4tZdghnBSXy9zjEAjdlDdHF/LekC/dUr0mIWuXmOpGAq
	mC177daBnKY9U5gpbO9np+6GKlBAJ7v6UktNYvEeK2pfP5ZD4t0JUzVa2P8hXBNzQTNAW824RUb
	eJ64ZZAz1rZIYLjq0w6XXVBteLxK6jK+PRAAc5JPb0Tp6RRgKHcc6EnHBuxoz8fFQZkAFIFWafM
	9XtegcDyNvOGYuxJ3XuhRX66fIX40aANWJzYrvyWsrP6rmhVL8faqOwRZdQ8EsJ0T5PJTZpKlpC
	X
X-Google-Smtp-Source: AGHT+IGmXfR+303chgQTvSMbIO1FLMjMjgBIXw/DQX1tU3NwAwIjXBVkZyauZLcXX0fF26IEp3H2xA==
X-Received: by 2002:a17:907:2688:b0:ad5:a29c:efed with SMTP id a640c23a62f3a-ad85b1de649mr1508189866b.33.1748439037752;
        Wed, 28 May 2025 06:30:37 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7078:193c:ccdc:e2f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b477casm107207666b.127.2025.05.28.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:30:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/V2N SoC support
Date: Wed, 28 May 2025 14:30:31 +0100
Message-ID: <20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the USB2PHY reset controller found on the Renesas
RZ/V2N (R9A09G056) SoC. The reset controller IP is functionally identical
to that on the RZ/V2H(P) SoC, so no driver changes are needed. The existing
`renesas,r9a09g057-usb2phy-reset` compatible will be used as a fallback
for the RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c79f61c2373b..c1b800a10b53 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -15,7 +15,12 @@ description:
 
 properties:
   compatible:
-    const: renesas,r9a09g057-usb2phy-reset     # RZ/V2H(P)
+    oneOf:
+      - items:
+          - const: renesas,r9a09g056-usb2phy-reset # RZ/V2N
+          - const: renesas,r9a09g057-usb2phy-reset
+
+      - const: renesas,r9a09g057-usb2phy-reset # RZ/V2H(P)
 
   reg:
     maxItems: 1
-- 
2.49.0


