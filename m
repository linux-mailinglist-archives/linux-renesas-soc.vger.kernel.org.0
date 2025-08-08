Return-Path: <linux-renesas-soc+bounces-20123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73FB1E21A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 08:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ADBB720D1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 06:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FA0224898;
	Fri,  8 Aug 2025 06:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kkvgosaJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A24643146
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633908; cv=none; b=ekKuxc+8UEY6JoEHewMGItZ7Ewi3718XU5kYji2U6EYeFZ9SwUQsOwrQB6LnCPSC5UK/6WyPdfPkD3nnJqwzP9Tosb7JYK1lEc6+Uh/fMLvZ70KY6g76Cw53lV3978wOXwTO9xozzhaXZsRa1UzJqYwDO3G4/VyNqcE9n8Z3/ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633908; c=relaxed/simple;
	bh=DV7qaSxkgQncKuv/GTzdbgjK+UuA/kfChHmdQOLS6kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSVXw+izW7DI6lrBZp5FnlIgWH1AChbxEvUhrxAvbL4zU3fF7JVe5Y7wq9lkuQSOkSxpE/RoOJIGeuoJKs5cDw/gzd3kLJRGP24BkEFpgtWuxYKdw2EKB9ugaYuKb3csJzRPXe7fqC5tONrlVh04cDkQ2XwqFdEqv2sI2m2ubvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kkvgosaJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af96524c5a9so241552566b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Aug 2025 23:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754633905; x=1755238705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fhbtdj94kG4NkUv432zTOJ/Zv8zWX0enR1AW1GYhXCI=;
        b=kkvgosaJAEmUps23nxR9V6gZEqubmaPBOPT/YlrZCUu10c+BtK7DlqmY58XwU5CFdb
         HadjUNU5JbD0i+cSlRmx2Ou5JL5MOmppi0R42Y0vqUgLle1hBfmaCXgnp/YsQGT25EoN
         tZ9rSsuvQWj2BWbn47z8tVkyJbiw/S2QK5nTS/+vkvTgmwR3hVE+tFw9EN7t8g1KBUyI
         KF1fJsMMoFZb1FFFg+rZvrpUpPXOKiUNUtQd+DFQgbJzYCpOFwJ53hBx6U/jR+iz1QnK
         T/L7tn05mkzLafeQeTC6VudLuT7rY7yFl1uobY3JLVQaVEWNm1yVrSMLXRsGQZrzN2Cg
         jy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633905; x=1755238705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fhbtdj94kG4NkUv432zTOJ/Zv8zWX0enR1AW1GYhXCI=;
        b=Koo2wrLMf55Qttptn0p+GXdk7bHojuXJAiNSQaNBt5D1x81CpjEqXghBjID33JHgGv
         RcQEGdH1AY/drSYzMBcpxu7eCLU431G0UJL1jGmukiYFpYwHRV/ov/Qq+LhH/nL1Z+Gt
         X5RuxeD880rfMuvoVfNLZLDT/V865zAkk6JEW1qwYiL2hQNX1OfkXDcWSPNqWC6jEdjp
         pplN/dzvlcyxXETleG8U2gwQt0z/b6k4WjcO3ni3NqnL8EkmW6WsjOXfbhlpvSaWyn32
         WzrBNX0YoSpUe++d2redMtIoYSaR58XgBLvQV1YKxThqrL+PXKxvmSAvBRqg3wnnsqeY
         67nA==
X-Forwarded-Encrypted: i=1; AJvYcCWnNfc/5WiMOaEK9txac/UDiHNGKtDO6XJBPJnnprba3tWbkhHDn/ECEktpr8bnXVbvwfRubzVqmX/3f25QY1CsCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqnT4H4HWQBgIJEMqkggbuDshI1Y1TemyWOl2hA9vEB62vs0T
	udHQwvDnT2UtCTdeUi+/GTR2WbsGFCjQon+d6V07zt3iuzgkbNdITJQn7PmJLJMBVmc=
X-Gm-Gg: ASbGncvt1iZkp6+E2uUeWHqhbDGkOJAmCcCsgy36/dzYHw36zd/3hInSLa0cvggaR7+
	LFGxPiN8KxGB5+GSUgvWFBAT1Re5RbUjOED1bxeE5HcI4pGngEafZDe7y7ypKxmYcPtilB47O5H
	gcueT3YsL4jJV8a+Z8PVZdu75WPfG1gexmEB+b4JMtG8IeQHsiZoZAo58UR6+H6QlX0v9ai8gof
	DK3QE8NOG8arSl6dCrkGm60CaFoDmnOR3dsx1TBzdsw7kQhmKRBuNb7h3PiRB/o5I0eDufwL9Mr
	O75DxfTh513qHrjuMdjwL31A7UMhySma3G/kgMXkE5eUU3umwR//pWmZ8YFW6PNXGjPoZc8E6Pv
	U3RPG2K8htEpBc9JZNs4vmKwc8DZFTJf1bBMmUKSbfE5Gbj22LOtg
X-Google-Smtp-Source: AGHT+IHjyrVfPv/9Ic5LGXUUAuL+aPH600lqb/NKnTolyX4B+YeUK5CzWrXMgb4RJiQ3RI7UIsodxQ==
X-Received: by 2002:a17:907:e8d:b0:af9:a53a:6b38 with SMTP id a640c23a62f3a-af9c63d4439mr171415866b.20.1754633905418;
        Thu, 07 Aug 2025 23:18:25 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1440488566b.92.2025.08.07.23.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:24 -0700 (PDT)
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
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/8] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Date: Fri,  8 Aug 2025 09:18:00 +0300
Message-ID: <20250808061806.2729274-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The reset lines are mandatory for the Renesas RZ/G3S platform and must be
explicitly defined in device tree.

Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- collected tags
- rebased on top of latest version of renesas,usb2-phy.yaml;
  Conor, Geert: I kept your tags; please let me know if you consider it
  otherwise

Changes in v2:
- none; this patch is new

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index f45c5f039ae8..52d777057281 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -112,6 +112,7 @@ allOf:
           contains:
             enum:
               - renesas,usb2-phy-r9a09g057
+              - renesas,usb2-phy-r9a08g045
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


