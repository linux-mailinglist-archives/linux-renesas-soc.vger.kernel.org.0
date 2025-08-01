Return-Path: <linux-renesas-soc+bounces-19824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F88B17E33
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87A07584844
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 08:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82751220F25;
	Fri,  1 Aug 2025 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPaRHtg8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC321FF5B;
	Fri,  1 Aug 2025 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036599; cv=none; b=FDDoNQeRjCs15+Mp9Poj6iDnS9/qXCryEE4AMoiLUFDTtCHWHJ5otoNY7eY/cDeCYGcwb+qn3dmc+LlHULjkT1hP+DG4TnxzoZf3yB+UZxkUm2LVskMZQxMtFSqrrnlp+oWD3bSa0qfApM9quGu6gO2BGGN8JMcnrmhetAUYJq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036599; c=relaxed/simple;
	bh=KCpXj6Mz1QhabDV0JOlE1vdS9hXftfEarZKdC+0yOL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDj9EN/6W3ejUa1Zsa6dUAmzFEcBtuvd+/S1qnJXCueCssiXk4uq+25fL+gHZ+IH6Aph+0XSusnwWkoHG+f5zgpVB20tjZZUkpj5+yF5fjx/4rUh7G77RiQZ6EHl2fU4Jp+CxGJ61n669//4SOMFWxs7jFME9q6DxfHYn5LHj8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPaRHtg8; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31f255eb191so1653185a91.0;
        Fri, 01 Aug 2025 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754036597; x=1754641397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=QPaRHtg8icYlI0jdEuRMpm3OjRqr5GjQhl5gfEOBDwPDIgLlm1DemkGzU3X6VjbOuq
         siQymQElbCfNiYIgd1GUmBy6zT/nwWMmrTTIwzZGVyfw/p1O2iqbvXhZ/zK2lMMJBNGi
         IMXA1HI7xZ+cVsJHs3/4/kf3eXEsGMjmA9V0kl0UW8ASqjO9VeDcZHm8x426ct0FjLVg
         /8jNOr8S7Sf0y0la0yrRYx3GtdZTyIZwVZYwRjnoql5EGsvJoH+2pu5/gmGXJK9TckDH
         OtbtOQsbGRkMxkRWQ7RAbj4xethTnx6yTI/Bg5YqKlYxXKSkuMxmtVmZIb3rBEyIW+kS
         pcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036597; x=1754641397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=jmKn1q5CaWvShZ9fVOAUNUpFUxmb8ENYakrR2wV9u/RVV00Hi3g5oyuTIIl4iAq7it
         Ux1SG/AJBVirUHI8DD1BXOv7Tc38kXcGJ6jqPg0SG4Of8/8Ur2X0inF3WlNUxU3UDprc
         o+eoAuScAlCXqtDQ+dc6YJlZF0DACSVY2DLY1ayAnJyxkz7c4+Pg8JoNmplBBYy387Q5
         i5ZYEpVn0WVq94y+lRmdmcgZ0GbDMxvynzhHs461TsQ20+XDUBKMe9GBEmmsiDy9/2vy
         H24JxJpo97qQflMVDhfEWEFmxCMDzfz0EyOWsR6LR54zze+dL3fs8CrWTGQejqIMarzu
         vong==
X-Forwarded-Encrypted: i=1; AJvYcCVGehfB+5y2SdcsI/gKTSpZvZKtiuTor2HcxZpjDeY+qyy8ZEDotCaHJ4/wgTixBdyPfgjH8mwji34YGNvH@vger.kernel.org, AJvYcCVLJJhKW/Cp6Yw8f3VDGX1tFEhbvVv6r02qiJBoAiPzWvWBlDp9gEpP8g/CfttBGGtd9Lz6+iqQfNjNBYnThJQ=@vger.kernel.org, AJvYcCVbyj/Fc4jgKJ19ByNVkxZ3/XWJKtxPBBSJ9oRxP9HsRXuwl1i8/Thqg0BWtNNVZoxLxMIsEVlCIQMyPTnWL47hS8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PeBerSqqsg/tI02dm3DPdawWoFK09w8TBNNnbJo2V7pqxLsS
	mv/bGIZ5KQZCYXPDsatHuYplx6YYoqZazwIzVsI6QeS2+eOCgVIoO86G
X-Gm-Gg: ASbGnct5BiG2ywcZkkBa5IXqdYaPoqPp6vNP/Ab7/S8oIBo/imSAIkOefLsJSJGI3uz
	LCqANhA+1TzeIOu/uzA0teTS6f69sj5TiDrLkULreh2StKhXpDVW2Bpdi1bBTdHDWBGNq4fjm8M
	F9qoQlfVY03ruWPuU7TW5VnL0S9dxxbfzs2Aj4FdupqrimGAghdWRhwCtISkJjjm5tX9S1Y4KI/
	6EQBMiYU+QUgvBb+d+0DWgDmxL+psdkbd0+V6+cT2wL48lMpyoFrHFzp3D6WoNsrKz2qDKnAK/M
	BdOdTbPecYTy/9LmFRsVTadriqFbbHWSs2iHx/jlJQdaD8YVT2Ua5O3pvJOkeUyFZwD3+n2oPgC
	ZM2SqlDlE4mGpGYWNrAm6ftTy5lkoIW2vR2kEM2QFCG3wIlU2Ck4k3KEAdC5I6sq241Q=
X-Google-Smtp-Source: AGHT+IHLtttObr6RHLUMlfSn58gWBnWQ8BzmxATeW5ja8/S767K+9n/KyoKQzTRXAXlfXE6gGtutXg==
X-Received: by 2002:a17:90b:17cb:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-31f5de6b82dmr13898114a91.24.1754036597066;
        Fri, 01 Aug 2025 01:23:17 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3209a850417sm3992725a91.35.2025.08.01.01.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:23:16 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Fri, 01 Aug 2025 16:22:48 +0800
Subject: [PATCH v10 1/3] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-add-support-for-meta-clemente-bmc-v10-1-c1c27082583d@fii-foxconn.com>
References: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
In-Reply-To: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754036588; l=933;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=UnfBA/U+nB3GVshcJhQl74M74uA3eyzQykqLq1TeLXk=;
 b=b1s0dY3wOYlRo25bgL2yW3RNY+qHI7/86y7H7T8KzTP9Zb9gw8I3bewSY5hsNYMx+JHrCQ7ZZ
 9KoQpnFuP5HCVeQ6ga8sPILxNRyQvLe3FifzvyCLDcB+V/LhtjPANo2
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


