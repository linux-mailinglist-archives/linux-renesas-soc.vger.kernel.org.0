Return-Path: <linux-renesas-soc+bounces-18824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E52AEB01A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 09:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE074A714B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 07:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E6521CFFA;
	Fri, 27 Jun 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6iLdObo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0950821C182;
	Fri, 27 Jun 2025 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009500; cv=none; b=nhoZ4Db4JYf35Aq+T6Hp4wJs0UDd5fBKtta9bjCC3ivQ/VjYTYbtLt11fnASe31Oo39Dp5rQJSHLvd7enlKXlHxtQbGAg606md08jDWKbXffGa9lIo9ScZkRxMFS91zNMPVKdj2TY1p29k491YjOcdf0SIBDorvkjD31xZ1ouuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009500; c=relaxed/simple;
	bh=B5JXGZGmMiWSQNghFqgfsxwqKjADuBDCng2oC7GG9V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y460CKKw2Oo/diX8kwIzEJMjnLhdEsyE2pvMnyB3xmlXVOggwWX3p7ixMCy3QS2agLAzswxUY1vTmSPAFoCUQmkazlWEYCZH6in+LLo9JBV3cDDN3mKydrH2SrTWJZOCQWkH7ueM6cXub3tZr7ILm3NQiEicu26jGm1gS6TMjRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6iLdObo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748feca4a61so1187083b3a.3;
        Fri, 27 Jun 2025 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009498; x=1751614298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=e6iLdOboNC+MPRnAJ2c0zgB12z8Ww1Sp8MSZ5tYiHl/LSYorzC1V6N337piwePtmE1
         WACu13Icm3Be72jDBIOUmbB5gO1u/f2y+G7smY1jFvmKNXdhFGRkIvw1kr42kmkcVC5p
         KoShJ+TGuNp8RfI9cZAH+sB9gDOWzg7Q32PjnOILS3e6OzeSEBh9hfQl/R51aSapb4YP
         lIyHew+2O6l6ES2xnToqYDQ3yx1dxuVnB+RIB17gDhMmSGIQqSbqcc0MHDEKegWewahe
         JgzXy5zY6RGT3O9xJZAILGxAwGgFR0E1cn9xCnCRPtBKRsf7M2So3Phx0RmD6aia1DBx
         wO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009498; x=1751614298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=AUTycWmegpEbh3rhhJJtnaOjTzPZT4hTGNqlcjlqJIbYZzEPP7dEAh+MvJBYJKzAM6
         VRn8xbNrvZD/7T5fiV7+M7kgf+zbAP/0Qx6A8iLOZOwQvDgyXUFYUXyK1629ABGXzfIL
         FXjo9xkd3hFd4aEqWJ4hod+WnNoIwBCWy6/TPdTE21Jdb8/6r9Zpb0XC1+dVmoxvV94/
         vcyrMeGfIg6pqpoWqhJiSf4fZuy8i3i+uuHqDdPR3Na6c9jCPJXFer3iAC4ti9LqN/gv
         o6lQi/kV+AsJ3b2cIOtj6vlgZJRNhXri1MPwTtpiskZd5fIjRdy5WhfAq2KDz4ho2STT
         hawQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwuVLWOQS9GePsmEEPXxTnqKCDKzJ9xRji/z0jDGcicxlmdD6/2g5Rg1+8tj6uV70PsxRKvN2eEKoBSknlfB8v/R4=@vger.kernel.org, AJvYcCXQwLvSvEjaFfTXofLT0rYslcHOHWSok/FfDi/KNmwGu1xjkhLU5Tp3jWhLE7/X7yNgguZPaggOpkyA3jLB@vger.kernel.org, AJvYcCXlnekyPbj3R288um3E4tT02WwWfCfisbRQ8K+n4Hf6Y3Z7VFy+739cvxBgakhf2/C+1Wl0BdAMGUVUMrVcaV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSvgyVRg2vkLjoXshVVeeUcyGwpB2BJeeEA5Uec8dPIJMh58K
	dQ2nASm4Se+dBJFLMXyJk+BtR6/5f7J5a30cxf8ceh5I8bxBA4sa3keL
X-Gm-Gg: ASbGnctLoEcX2V/wqAH0fhHrigT8jUouaAiyeVgRh8g7HFFkcwBaJHdofccMAGmYpBA
	GCgmBeCGDff4M20+Cs8MSTy57nOdUu7epdc3SLKcmJO8StMZK4t59+wBKeOeEx1Zqhjto6VDUsG
	VysdWz3tax2MBamZKwPdW3ez1u1w/ZAVjzyxSeHjGoW9hasiQt6uGQU3xgWRUYeW9rWmC3DUVnM
	Uh1RD7KSdhP9A8f6upvwlFk0RFkqeLPzoN9jaoH1M0sP0vnZRyK1EXvfe84nQmXxtXn3iPQrf2x
	c6VT5R3JrqroBHQ63D18duJdhZQa/soQM3x3NJkG+HKkV52HX2qx3SI3YpQbI8K6AVRf/q1aor9
	leJXAMToFxUq5aw3lwA0SZ6/HuBQnZC8=
X-Google-Smtp-Source: AGHT+IECsc8On/+R7tO6ST+8PJjvqWGuxkQi4vIgQwaKYmKT/4qcJMiyQapkOxql4fr0M0zlc4QUEA==
X-Received: by 2002:a05:6a20:394b:b0:203:bb3b:5f03 with SMTP id adf61e73a8af0-220a1251b79mr3468887637.6.1751009498175;
        Fri, 27 Jun 2025 00:31:38 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540a8f6sm1628646b3a.12.2025.06.27.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:31:37 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Fri, 27 Jun 2025 15:31:21 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-add-support-for-meta-clemente-bmc-v5-1-038ed6f1cb9f@fii-foxconn.com>
References: <20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com>
In-Reply-To: <20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com>
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
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751009491; l=886;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=jaJuRFuiQIpQeCgkDZC/ZckoYXAyyJRWtir3QL+VwYw=;
 b=D+RmPFLvbiS065/bwt7uUHl7ONdOQY8Dg4MN24Za+XYvfv5b7lQTjMYSt/GoQgrKrbrwbmw/z
 lnWZsZwQ93ZAQoOvOGe5TVdbZyQ6eGeDHb2qogbq/yEyGijxpWo7enG
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
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


