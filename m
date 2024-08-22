Return-Path: <linux-renesas-soc+bounces-8047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769595BA5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 218D028467B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E211D0499;
	Thu, 22 Aug 2024 15:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BIZZ65t+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465D1CFEC2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340523; cv=none; b=M1GsL0g/pWIcWEhkKOxdJqB20afGG5TSFLpYvyRqw9A1GJNiLwL8VeMpbSycl/ggSvXFP4uoA6e4C8+fQcsqGMiMSqoi8fYjm+ynn9qxoeUx6JqEt07JsSiWOqsbv02Yc4OpW1EAKSFUqzyZY5IoUyh0s/D1jchHz1tCq0VDx0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340523; c=relaxed/simple;
	bh=yuidYBMLBf2+VSQJ110PhBMZfyJYFJPb3Vp+ConTnzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ut4hYW7SJkZolSA+2rFUVNz47iquEyNhYeZ81NTtOMbbA1RSV8uc1OUeoFjcE2Jq063l+tDRCDM5PYtiwFey4WuHZQBxKT93aZ8zahZr8ohSMLefdrxc7ift7RyjzHYIzWEqAVmrMOX5rT0F59dE8P1mOmwTQP4022z2os3boMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BIZZ65t+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3f163e379so15125591fa.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340519; x=1724945319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EG858HP8in5mb9F5t+mQtv5qilS1TpleLRM5JdIQFA=;
        b=BIZZ65t+EBCwelqZxt7RgTyWX051Z6YOYkR8N7yRfgSbXa3xS/KwwTb5a90COE4XYU
         SaamMYZuyLZt7wLewii5p4LHIY5cRvR50pOgr9S1ycUU08xOXOvrC3gtyv0p+MQBMsD8
         XscARBcGkSNto4N7IeE6K8lxYSalwrJ7AD1qqU2S+cbrUiOVji3Zs1QW4cAE0d0ZcYzQ
         S5jKxWiy+M6y9fM8PoRc3owa3t1hyc0O4BjguGpzfVx3zDprxtpNTKSi6GtDa8XpLIwu
         IGIOmMvk0MhM7HuN8fr9EE2p7T/+Yf+1mhy+WvIDwRYPZEcuTXs9BbbZCldtC8Bs1QAg
         uxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340519; x=1724945319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EG858HP8in5mb9F5t+mQtv5qilS1TpleLRM5JdIQFA=;
        b=PAkXCCXPFsBtnec46G/xfpdW2OSGTPVsEeCyAdt01SuU6sHGMVGlrpcPl98Ji8NcFS
         OlKDf9tlVAjYK0eWaJTrbw7TKhGwRdMJvTZwB4xr/yR7TXjR+Jo3fh9OqSbkIxzNxG+/
         Y76luFqGmun9m6fxPyqjbemAt8BzK3Y3QmAJkPP1zuJuHBqlVViBmwmvSnUC6PYvGEVx
         7sXUaMsU7JFU15bjZYFiidmFae1RIZB3Kct+T9TmQ9LEAbfQmY7PfThjbd0p/YReOY5K
         AXe7ugwlwMEKMQsdCX/TwRGI6gwwFM6dUisXE0AJqTvWOptACrfpPY1asaAw6IEH0IZy
         zIZA==
X-Forwarded-Encrypted: i=1; AJvYcCWRDDjKW0gHTJCEnJAL/kQfkzuicCvQKgPkoxNNY+BHu7J/oN0Ipq7F6OOmgujTKQDZJ+tPDfZin9clerNC1sIjfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGMKxMOflcjwxTDCpU2BQK+nC5Y7ZbgywvYSSwrewvCW3A/aC
	bC9iR8M4bitGZTzNLQSJNZlncbq7tw8RdYu0TMtZ044riWp27RCeqpOsyAyzbt4=
X-Google-Smtp-Source: AGHT+IHayguZj8Wa8CKYZZKYCnPQ7ddSFCBCknAgIFfJUW2xU8Ead14TNkyeRYtLahQze0o0yKHgSg==
X-Received: by 2002:a2e:a988:0:b0:2ef:2677:7b74 with SMTP id 38308e7fff4ca-2f405f0057bmr21390771fa.41.1724340518917;
        Thu, 22 Aug 2024 08:28:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/16] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings
Date: Thu, 22 Aug 2024 18:27:56 +0300
Message-Id: <20240822152801.602318-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the RZ/G3S PHY bindings. The RZ/G3S USB PHY is almost identical
with the RZ/G2L USB PHY. The difference is that there is a hardware
limitation on the max burst size used when the BUS master interface
issues a transfer request for RZ/G3S that is configured though PHY
registers.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index f82649a55e91..af275cea3456 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -13,7 +13,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,usb2-phy-r8a77470 # RZ/G1C
+          - enum:
+              - renesas,usb2-phy-r8a77470  # RZ/G1C
+              - renesas,usb2-phy-r9a08g045 # RZ/G3S
 
       - items:
           - enum:
-- 
2.39.2


