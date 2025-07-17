Return-Path: <linux-renesas-soc+bounces-19580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AAFB09007
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 17:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 414FA1C444B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 15:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407252F8C4D;
	Thu, 17 Jul 2025 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h++A4sn5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FF2F7D08;
	Thu, 17 Jul 2025 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752764369; cv=none; b=g3bDVxw2zR3u2F/6vqOLlirVgGooZO2newd9uqC91luOg3fFP5ITEr6awf2lOFEaHqYNhimZbImB4cBtEtdTzkRfZVkxnRdc1uBc7ASKMij2DSke0OlNEuPdPHKblUILZibjVeSEcaGU1CPtwRo24/3JbpG1tYU+/YASiDXulyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752764369; c=relaxed/simple;
	bh=KCpXj6Mz1QhabDV0JOlE1vdS9hXftfEarZKdC+0yOL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmLKDstupK2/YjqWf6SY3AdWhyAS3hEECJpYhG68tjp2DRQ5a3aDTKZkPOQxyDT2eDYK5bIbUybYkrsC20ZkUOE4iwGAJ5s7FGBjktXvHtmzC8ZZED57PzfgwjCXssyHmNDVyIsXQ9Dojy28oW/Mldb2/iOC1QAM593SvTzuHVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h++A4sn5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23694cec0feso10495305ad.2;
        Thu, 17 Jul 2025 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752764367; x=1753369167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=h++A4sn5+qFJzZaWg99xnMVv5/kcc0Mx2Flt90vSK1Kcvb+34HzatPPGFzySvk89Tc
         UaN0ijsYDGP60+gxrk3PPGIJG8a2HqNtlI1zrz64zQ7Lm0CDCQehuOXGyYsWOT7Urovo
         6FBl2/kHqe9QVl9zuCFTxCAPBOUJGB+JzTsfiP747gMsAFU6g1fnrxYpxP94cGoS5Lq1
         fg8QX5WBEw48LhjWSeSwj+f7fJdrFBkiqJ3R0b8BAuRxokQZ9m08KGqZ9lzFdHxh3i8p
         dxdPB0OKjJOknxw9Q1GfhBHwt0btm4SuL3nEZrg+boX8+xImu5fadl03myZrqkSbFFXl
         Hr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764367; x=1753369167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=drjwT7ow1/QMyzlfFUB6nLYEn2KwQYLoyDwvBpVehw+fobWbkVk3Or5BBlEtT+Ejcs
         VBFMc8Pesy69gpQneJJ4rNJFOVUevO5bw1rq5pZ8+0/7OmxJBAORq8IN1FDW+x1w79wB
         MS4KtuJyOdJtqDPEEmEalJk/e54Isg79+sTCv01GHGcsjs8VYXxEMfBYDKvyvUILHwl+
         zGOvVpt2twPvPDPzKQyeMpDc2NwjNY5ZV1acriQllVrvKYIMx8tmQid3lej9d8ssCgdG
         EjDGK0LbRZD/n23QysM+E0z098cO0YrJtNrfCJfd98q4HtNLhh99bMhXwoVrBdugi0ih
         fcVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBOamYxUf4TjG83oOJwNGUeg7L4BE4U7pk3oEGnZ31gidT8qBiCUc/aJcfrvpirdse+EfTTZrkjkFC3uodD8Jf5SM=@vger.kernel.org, AJvYcCVO9e9q/4X975euWz5q0xqy90zUXDt9p/v162Nb7PaBevbjkAsRubo5Rugou1j539XRRdrw8yzvmZAzMkOA8nE=@vger.kernel.org, AJvYcCX8nEhwPIzZqSWJM/3BdyPLCEzze4tzw7xuBWEOoBMvfex7mdA/qc2cabT179vRU6sYfwDA5doW0hwjEmEm@vger.kernel.org
X-Gm-Message-State: AOJu0YymI03YyHQmhrktF2J3TmB3GskHJLnsh+6Aom60REgaWEwSTCeV
	gCRojm8k1+KNf85k1GT1beRFTfjXBe7JTjXioa4MEDAZCY0IfckaL+sC2v1DeQ==
X-Gm-Gg: ASbGncsvNvBgmBcGZOBRCnFSbw4x2wIVGRticuWnLH0PwJsuodtWEzACxMYJgUF7Uae
	e0yW1ngjkUS5UFUjmfR53j9wxjd9rnGfYS8NoAb6IHB+okgNuBQDPwBT3LiqiwZOHdfJS1xFCib
	AemEJcnNYHLIDnFWTGJ6/44WPqz1fkYDKp4IzeJ0+T7ZrDqPK9ugdQzoceURObaz8cH87BTQlRW
	memEFZRLjF5ALo/IM9PlrfXzcEpGZMxieWL/EG6Z7SnPSane6NwxFx13dIZPXv/ViiodPZw4xQU
	Apz2ibLE0+25v1vf6Y4UL9ybV6X5m0/Bcss4izpffFCJvB/QrhEBa5N4haVTiT+bMUzUIOwd9C0
	u/vQtPj//PF6YNfaYEHgL6Pe/lYhlAGpVRHIZqbv8XD8hsD+5iJUxwkUEgDicikF2J34=
X-Google-Smtp-Source: AGHT+IFH71SO9TWQIjWcDvGZVaf8c0bfz40+DZK0ynM687AwY01e4hF6qPVMkaNoG3Tz4KEJj9XPFg==
X-Received: by 2002:a17:902:cccc:b0:232:1daf:6f06 with SMTP id d9443c01a7336-23e24f94735mr87868625ad.47.1752764366837;
        Thu, 17 Jul 2025 07:59:26 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aea81sm144603915ad.82.2025.07.17.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:59:26 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Thu, 17 Jul 2025 22:58:59 +0800
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-add-support-for-meta-clemente-bmc-v8-1-2ff6afb36b0e@fii-foxconn.com>
References: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
In-Reply-To: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752764359; l=933;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=UnfBA/U+nB3GVshcJhQl74M74uA3eyzQykqLq1TeLXk=;
 b=IJJvmEuw0NMsZbR0pvDfxaXzgRUhvDfogvZ87vBwQarC5NYmD/jvO1en40LOFgsjikc3duK7Y
 KQ4xpm2evtkA/KHguxccp4vll1YN5VIB5UoeBTJf1adwFrZSpItUR9K
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


