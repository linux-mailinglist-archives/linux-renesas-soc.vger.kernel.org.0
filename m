Return-Path: <linux-renesas-soc+bounces-3562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EAC875174
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 15:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770F11C2445A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 14:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB58E12FF81;
	Thu,  7 Mar 2024 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LoQ5FucE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9332212F586
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820480; cv=none; b=CJkyyfvlmQ3BYsIEbxCM87DgTmotuDMzGuwRz3PMuCDdBqvdeXgqVFL7wrx7wzmMkjmmsOs+Itkxv8JolbQzehSd3uchNHeoRMQO2KfgIdQeuU1XyUc2dPpcVHFNJc4whMj2xxBw0aPjOBERNGWtxR8C4qKkpcmo5HFdshfxA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820480; c=relaxed/simple;
	bh=nuP8iR6n4tjbNw9I4rOh+AhUGQC1ujLuyQM3qb1k9pA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bexw/UluUM7DCci9EYIC477p+4wxnTb4uc4eNWHOomaZynP+G4NYOtamDH7cxDS+1i0lPLh3iErJ87JrEwKrqeKXKoi6AphaLPx1LE89LJzNYyUatu7GDte2btXWoYz/sBwAoLEdQFitka69vcxD2iZZ4bq3ndSjuknaPe2E4bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LoQ5FucE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so3814772a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2024 06:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820473; x=1710425273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBHulM5tgA9Yu4QDRPLiTWrU5crZRQDlADBuEJV4VhY=;
        b=LoQ5FucEPH7FNhZqIn8gees2QK5x6Iq7ap41Z5jt6qEEumczVDO98pAhZwb+7cI46P
         tPyZxGatbuIwUf9qCLAEhvMvVVwmOyh5ib6bZon36xO68iFIXAqgmmW0v0oXwnMet7nM
         de1/Rn3O1G1v76UDg0t8d4JYavBww1M6d/NuQk3U9T+ehnaq0Q4yLsZJTheLFD/HeSWP
         3YB7a7N1xNlGCFHXGfrbhPSpew+bbJNgGU+NP6EZzID8X7JBuQJwth1btQpjWAHVDWN5
         pMiVVJ+6/3iWfp54QZK0OGk04b3NVmVq5JzwVzO0xXLPulyFadmSmX4DUFKEQqc+hnnh
         jkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820473; x=1710425273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBHulM5tgA9Yu4QDRPLiTWrU5crZRQDlADBuEJV4VhY=;
        b=WUKrgiHuErAqJb9LQtgf+HlwfHCtt3cIQFCnn5dmIRztt5nFDfyy7sSX6ZEuluJMUu
         l2lj0G3AGiq8TK8Weo8SsMlOGeEsJYb8Q45aaOzfgpJZKGzpCO0I4c82Zu5TFsoPid9B
         f+dzYGCYEQHQ3Yo6PQl6lKHFGPwusvWEHP2bVGkcUp2yGrFpZhcxFIN7gnrosxDyO3aA
         wVqpGlE8WGRddN+iRFIJvAyMSydC0FQtxHV3O40Gp31fi5bju7JTP7D58bfaHSXIq7BA
         3B8TuskxSKvALNnCWi/xBvycM3uIdY9+G8MjJQG5iu273RtcV4WpnoIptdhFn8mOv4B7
         433w==
X-Gm-Message-State: AOJu0YyYYbR5jWhRqRGoPdEFEET1abXZh8/tgwwWitZTsfgvY0qA0ZOv
	4ktdyiRbawJcarjhn/RtyVakPPAZcRh3O0X6+SUEnSdhrsvehIs+t1EagNH1ynQ=
X-Google-Smtp-Source: AGHT+IFO1qzZI4vXATKgcIXml+TT3amKFBy42cnqOC58zMQxN5FKCP88n3FmIdjFGol396HkLTMb4g==
X-Received: by 2002:a17:906:589:b0:a45:163a:c08e with SMTP id 9-20020a170906058900b00a45163ac08emr322255ejn.0.1709820472972;
        Thu, 07 Mar 2024 06:07:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:52 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 05/10] dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S
Date: Thu,  7 Mar 2024 16:07:23 +0200
Message-Id: <20240307140728.190184-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The driver will be modified (in the next commits) to be able to specify
individual power domain ID for each IP. The driver will still
support #power-domain-cells = <0>, thus, previous users are not
affected.

The #power-domain-cells = <1> has been instantiated only for RZ/G3S at
the moment as individual platform clock drivers need to be adapted for
this to be supported on the rest of the SoCs.

Also, the description for #power-domain-cells was updated with the links
to per-SoC power domain IDs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- updated patch title and description
- kept both 0 and 1 for #power-domain-cells as not all the drivers,
  device trees are adpated with this series
- added a reference to dt-bindings/clock/r9a0*-cpg.h for power domain
  specifiers
- dropped the changes from examples section

 .../bindings/clock/renesas,rzg2l-cpg.yaml      | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 80a8c7114c31..4e3b0c45124a 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -57,7 +57,8 @@ properties:
       can be power-managed through Module Standby should refer to the CPG device
       node in their "power-domains" property, as documented by the generic PM
       Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
-    const: 0
+      The power domain specifiers defined in <dt-bindings/clock/r9a0*-cpg.h> could
+      be used to reference individual CPG power domains.
 
   '#reset-cells':
     description:
@@ -76,6 +77,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-cpg
+    then:
+      properties:
+        '#power-domain-cells':
+          const: 1
+    else:
+      properties:
+        '#power-domain-cells':
+          const: 0
+
 examples:
   - |
     cpg: clock-controller@11010000 {
-- 
2.39.2


