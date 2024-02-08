Return-Path: <linux-renesas-soc+bounces-2469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F3284E0F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 13:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08E111C26057
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0707602B;
	Thu,  8 Feb 2024 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Xp8nbnL6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AF678B6E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396239; cv=none; b=LjCCdLrHEVqgaF8g+1slugdKSV47mjnmaenpNx+QesXxP+/orOG241GAabAKBfcf862eQhvYjnX+o/YGTtPiaSGRb+t5oAKh9rLdjxhAcxTwzppPuJENXm5v0V2WCPEywCMRJ1Wx3PGMMWzJv47Qr7hP5GqiJR5utRz6q1kR7wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396239; c=relaxed/simple;
	bh=v//21KnnDrpqx39OxUt/lqL3cNOdm1jgjiI36bhErsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oCMhsEZgxYp3ABMXXvoSShldb1wsO6UvYQfxhw+mV5yOEKzal0TSxHRe+yp/1nMQbeJ4gwm6UCnhoUfz3gJKGOYTm/EDd2QVDZ4xO/oqJXLTG/jnlWpp2+1oV1Mc5gFTg0ahYVX2oLKnTUajVgYr+yQcp39EjOTCT3gl8pG4NVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Xp8nbnL6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41008ab427fso16154145e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 04:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396236; x=1708001036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ryh17vkvT9rK0W07k4+YFM6FrPWL3ef1PYzKuNba8sI=;
        b=Xp8nbnL67o19u+sNe+HrLLxRdoXz6kuwP1cNB20SZueg9926xxqxRmc9vH2SPKcs4c
         J8u9O0uLlltCgW7saB79WMq2pOBQsv32FQfa4pOqJlLpI3EHej93ot0QKlnuCBt5abCE
         2cNV8pyGrxaFzX1LD+UdZOyOBmFnuABFY+zt1sfubowSX0XIQnLX/CtlQ415LdVYDx7h
         nuOWrrYLptYpYAChgLVNsfryreXxubVQp8m3bc/4KdkukVun4ZYxpo3iqVObR1knLpcm
         0R/CpV3VvhKrq+iv89Ou4NW3TcLXPySZnFlhXN6irXlTHdywglSr1VdsOmCRE2Q1G8S6
         /+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396236; x=1708001036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ryh17vkvT9rK0W07k4+YFM6FrPWL3ef1PYzKuNba8sI=;
        b=f0ZHb/Np7MPZw0ixD3jZw8YTVt/6ThSIKacrX6RhUq1ij2QCM7Cvrc4U7khmOP7Fqq
         oVlht7ay+Wrg/cyWrDG2u5XIN9srfs9+JjiHueICxHJrCfhr7Ii0hJzz2tWtyiwRuWab
         lk8nfFg/EsU57LC4K2r4LUhokfYNT15pQBRnr0dtwRxaExYbKorbv1mh9SbpbrStoPO8
         MN/sqvCwgjD1lz2s6d5oUkOWh4Dr25vWKfshZxVoPhvyLXzSJQ83fVj3+OKYhwhMWXii
         UGDFMXWEdZ0soFhVKwzNa9qObIjRbxG/dNV01uQI+2qQAm8030NgBqOnih/adD7/8S+a
         O2LA==
X-Gm-Message-State: AOJu0YybERpJLFDU9GA4HDSghRWMA+ZceV2GciochA2jHU/SdiLqw5oo
	fxs5Qcb2InaMByyVGGVa+Ynvn4+o8r9WYNui98rG/73zhhFeGB3tAjs/McqTjXo=
X-Google-Smtp-Source: AGHT+IHunpYJbYbBjEl+8Rn5E8DhUzBiGFBc6/YTorX+D5VQ+y5VLngR+jFaUnHhz8Rw+cH4nUY4yA==
X-Received: by 2002:a05:600c:548e:b0:40f:ba01:6125 with SMTP id iv14-20020a05600c548e00b0040fba016125mr7327127wmb.32.1707396236421;
        Thu, 08 Feb 2024 04:43:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaVxKvgjdrUHMcn+vDtcSzWaDLuDkKGG1MKSWLY3PNZ0O8PwbQ/8uKSqKMrqsQyqbOXAvtKOsO1LiBcuVvKeuoJx/oI6dD0l+RKX2QOWKdpr1o20p4aJVnt9tdtQVLVnhgLycsbb0MxgH8LB4WbTuAL2XDwzB5Zl4Rzg1ujmlof7uMPM4JuCUmoaQjhm1yeySRXnRdu0m7SxyBzq4hhN7AUVPRnkUG9Od2zTGWQWtP3uzmqD4IOp99FGsKRXP2RVqFf/7rsH2xbwC4umSG+DsLKMgAYh1jBS1cVLJ8reXQ95Kt2dZyD+dqaa3OZ2TKL+wd0TaHTvsUF685HHjxJmb1MFPemn1IMMFHQ5SDchoPTqUuEtydBYfK4Bna0OuO43zXHHHDpGgJENqzdos6kbRBndcwPaLKecp8w+qSOlcZeun+FZn5SOSL9hG2I0UghoAdsJjm2wzRQvyBGvK45w/YznQaw0mhfYpvHJHNwf+VoRuJTR0X+SwDStf+YxKzZKBFvcUWqE/eH8EKHSLN8tzSHCXW8KKjCt7vT47cvh0+bQ+Oa4H96qsLHH3XRAJGMOg=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:56 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 06/17] dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1>
Date: Thu,  8 Feb 2024 14:42:49 +0200
Message-Id: <20240208124300.2740313-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The driver will be modified (in the next commits) to be able to specify
individual power domain ID for each IP. Update the documentation to cope
with this.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 80a8c7114c31..d7de3ddbc613 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -57,7 +57,7 @@ properties:
       can be power-managed through Module Standby should refer to the CPG device
       node in their "power-domains" property, as documented by the generic PM
       Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
-    const: 0
+    const: 1
 
   '#reset-cells':
     description:
@@ -84,6 +84,6 @@ examples:
             clocks = <&extal_clk>;
             clock-names = "extal";
             #clock-cells = <2>;
-            #power-domain-cells = <0>;
+            #power-domain-cells = <1>;
             #reset-cells = <1>;
     };
-- 
2.39.2


