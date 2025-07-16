Return-Path: <linux-renesas-soc+bounces-19559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C0AB06DD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 08:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3D5503DD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 06:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589192882D2;
	Wed, 16 Jul 2025 06:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0M5rGuC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42562882C3;
	Wed, 16 Jul 2025 06:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752647076; cv=none; b=bVE4xsBQ7b6cSTnMfq8+FEYguqAFcHSRSE7XASkGiVPX7lkuzye0A50n0QakKZIlbrwszxBGsAHZgWS+2b2KnIdhq1U9BGm8tY5zMh/YR/AGDcBlYG7zcotsmq8OLrkaINxCvWB/tga8tq7Mm4MWjP0eRpN0Fr4z4BADzGP8kqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752647076; c=relaxed/simple;
	bh=KCpXj6Mz1QhabDV0JOlE1vdS9hXftfEarZKdC+0yOL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiJxZdY+8skjXN7A1qL/pS4Cm208bKcDhWV/l12wHbk2Q2yDLntzsn8nr4xL+QzQkIefQ95wbtshCLoovsUpVlL/N+sdlAEwsYNGYn8IpbTngxXYHpIrji1sxknIAuX2lJr7tyC5e9XeEX0d/jldxnhqRnmhLmwJvmcKsd/kSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0M5rGuC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23508d30142so66271935ad.0;
        Tue, 15 Jul 2025 23:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752647073; x=1753251873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=c0M5rGuChZf/aTHRtTeVRJkXObb0Z/CY7OlZaWmv6aoolORl5dV4ekm9P4Ys1Dj0/V
         S0IgRTrEZ13gznpaMP4JrSyGAj/Bd02jVY2l35TzJdwBWXVgCuQiIHeBiMcTYNQc9P/6
         3n89cYwkUXGLm4aGlUV002hvTWTxrQ0L5G+euGlT48c7tr1ddKG/rxZMGorjsfe+IsiP
         UmZBj20FZKRvvfY916aHBE9jOT42R3uS5SlLKXaR6F6Kkyi9YFXWkiL1LbR/otoaLOOF
         yAPEEnb8mI3awp+lt+LlSojug5zgivbwGlfjs6d4iw/uM8h9w2C2pIw48XzSrUjZNOjR
         cEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752647073; x=1753251873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=CtU7kg2lDPLTJ+5hc5YpnCfjX8vJjC2mtG/xoYsN2yO/WNbA0qLNSliyfjIyjtFeXP
         aFM2lzut5SimMJhJ8rzhDfYnrxWVFV/jyMNlaoBI5KWwyRDYQin8PGpPivQDfzBJHb+6
         OH0NEkgwOiNqtrcJyV3QSLJ8YIKUMu2Lpez8b2sQeckjbQ94N1Ya1AjrXooMjCfI3rnp
         v2KxK6O6ys/88m/7SylzRbQpi3Tidl3oK01o+1SwqYAR3OC3uWyBS7akrPxxyzWK009M
         4F40fPnnWCPUh0bJEDcvKgCwNjqo+pxnDhcQjbxEFAuGMH0ne43m57fBn3Dw/sov0lRt
         wp9A==
X-Forwarded-Encrypted: i=1; AJvYcCV3cgfVKuvxeAJv0RAzo/8uO5GdeV4xOkcywwK319KgQ0ThQ+czXIZmvGwzF53SzIN7o5D7oktijrSgMS/obPrx4hU=@vger.kernel.org, AJvYcCVe6Pm0d7yX37woiiXFqbZAfGUnvE6cWSFywozFztE318C+NIwPY52cQOy/nunnBks8IFOEQhtDrOHuL3fP@vger.kernel.org, AJvYcCXUlyLPDggdED6m+CQ2JT6gM1NzLqEW1i7hDMgeUK0nWwYFkPQYKogDxQdLPUYvdiu5hPiFY19tUi9tEhisBlg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0EZDZwXphU1cTdlrxrmJyk4u5LS6fDTfKuloJB9r5FEQPiIC8
	hXOVpIjXUesyN/d9CwOXrU/w+uK0IZ5g1PDVQSNz1x530I9qXXVwvEY8
X-Gm-Gg: ASbGnctsR/z3/K3gMcv11OtSDgrhjFZfKcr194dsAFGfiOlcL3yizlfowqYmT1NROut
	xMglibITD21587Vm1TNWQ3Xu5EFp3VPIyA1Kz+rH0z1LFb6fO0PITJHxCjaMpYCMrRAS1rULsvT
	WCbGLrqGEa6poWcJsYyZvSSY3n2Wuu5n8PeP9Uq9Mu1qyl6SpE1ZdpgmoNvXj2j1Gpd1/8R/Ked
	4HSB/k1nIlZaYn6kITddrQhKedT4nMxuRelYw2FR/IyoqT2Qu4lp5NZklCrrk6+V3QFpQeVvgM3
	IBpso1RoYf0KqL1mTCL92aAb90izvocVTJgvahg75gVwySytvDX8V1mXJp2m5yLDz0OgWMByIEb
	PDg/rzL3efqWFTVs6Xm9OU2JOmCf3wE8eCiwItQJ1qkQOIclaVb2UjROpBH6tIPuIB9M=
X-Google-Smtp-Source: AGHT+IHc5NRKT72vFJzQaq8CRt6yzwQTtLIRVCztcB9Pta9EPy2rcxZm3nlBUajC1g6t9FPJlhNKzg==
X-Received: by 2002:a17:902:da91:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23e2572b0cbmr22515885ad.29.1752647073057;
        Tue, 15 Jul 2025 23:24:33 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4286081sm119060955ad.1.2025.07.15.23.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:24:32 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 16 Jul 2025 14:24:14 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-add-support-for-meta-clemente-bmc-v7-1-d5bb7459c5aa@fii-foxconn.com>
References: <20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com>
In-Reply-To: <20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752647065; l=933;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=UnfBA/U+nB3GVshcJhQl74M74uA3eyzQykqLq1TeLXk=;
 b=uAGS6CnELOpU6XAlzzaTHDoipk4QLYLE9trQrVHONlb/CLuMwRHB4D/O1SVydCks4Rl2mJXTd
 /g/SJfibj10D0/IMv3qVW0N1R6r8ze/SrE7p++wIzy+wGWphNbb2J3j
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


