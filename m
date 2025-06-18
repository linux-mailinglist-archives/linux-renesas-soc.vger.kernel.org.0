Return-Path: <linux-renesas-soc+bounces-18491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E7BADE731
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 11:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6304016A211
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C2A283FDE;
	Wed, 18 Jun 2025 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQeQdmp5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7B283CB0;
	Wed, 18 Jun 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239624; cv=none; b=pBX09sy5LMQxzH4tQkCVuNnJ2HsloioYrP9YAmmq8iQtDPS1RD6AX9s3Mss0GiS21e/3RG62ca0OfYwQSCRr9rihQ4HmciKqTmeZfDc4BphJXBmZpyL5atwcGAzv8O2ALiGPzhnsE8LS+WQJuSj4K+AVqVILgX+TGnRqZG1zU00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239624; c=relaxed/simple;
	bh=OTnlEGQTaKca/djlqzs4ZnMpNa+lx1vDcpsU3Ydt1XU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dDSAqeBaczlcYERb1mdVr92c4Bh3rbSGr+bypxLKGhWYzcPwfc2FtRBGklYoQ+/YfyphYTou8ekoyL2+DPSn4DHLUyd1sY90jKphSDAt5Htzq8aaNRNfL+ns9UN4/EdX9KjJNC1ECfBvNqH/Xvg1B79BRLDt/7OboesZLsUVFsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQeQdmp5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748da522e79so912476b3a.1;
        Wed, 18 Jun 2025 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750239622; x=1750844422; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6V40YgN3JCSrvwEwSTqFhPuQ1J7Bi4GuX5wKRadAVp8=;
        b=SQeQdmp5DkPdsZePAuQeXlR5LhfmyyqSjXJGyE8icoLLpbcvKy/J9ZA3YBCcCRyW7R
         VwVZnt3sSd3TjQIkQP+ogZg/YzZei7Z1ddRZaoXeRiPWCoFFyG5UcgegRnSfJM7FBGyY
         VMih0ggHmWs6ddQvS86MkuXof7RFSVSmN+17T1EELTQQXmy/ydHvt0uUPELpwZqfN79b
         Gx9cRhpSjSyqYvXeLV1QVRNM3Z4uegA5falPiSzLmez47/L9WFzuTkQ+OvoSQ5GwAwYW
         sQf/0psFzr9Wvdx7NwWmPF10tb1uX0JfQcY27/7bUgyDu3MK9BTe1IVTJsrYiihEyMYI
         pAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239622; x=1750844422;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V40YgN3JCSrvwEwSTqFhPuQ1J7Bi4GuX5wKRadAVp8=;
        b=HvWr+FCRqWQ1y6yChcePKYJ/2UUg4x6ucO3nkcFrUm4FMjVka+vZ2dD2aQYHr/6AJ5
         WDTCwfkvSI0FE2gsFYJV0k+V89/QiYWmFtTea47N03tmAsuyQ6cbcNNGf9lDzt/kNL83
         N9tgrsUDnp3jjf6q+6+t0fU3W8DQVEjjxyBdtbP+mvyPuu9mnSIvlItgYgfFkiu3iYoZ
         zhJhNbY2BuipYWDL56IqwbGKRpbxWN3PJYvRa0oIahrW8U5zCijJB0y7gUz1BW2uv0/g
         x9UI6zyDpqYwWsMjjrlF9roN3DYCmN7Ruvmxie9DeYGxTqLdf8MkhMEX7iBnVgHOcujm
         neqw==
X-Forwarded-Encrypted: i=1; AJvYcCVOPIlOmjiV8A7B2a0XHw3MqdoiE8COZuvx3PSIggBITRcfJ/j4Ds7GR5f9Rhs515RkGppr4Dt0//wO84AexXZGsYI=@vger.kernel.org, AJvYcCXSlCtYmmmeW2b2veQQfIFZSQ+Ahphix8g/F7tlho5bPk9BLOxMai+eAAeF4Nxga70E3Si/19GCEs6E/87l@vger.kernel.org, AJvYcCXvuW94VX2MlgYUoHC1K8DXRIiiuB3K1i9pGLxxKywRK789WwK6VDAnALH5Y1bhABKpj3Cgu52r9y4THJMCtm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ASSqhWcIjzoIURpjpxHzFrFdkQObVe8zhTYu/vze4ceNdu1N
	RiHDST+b+RR1Tf47U2Dopr5dTFJnQ4xZlwmXFarAalzrSWSPaoah0U2V
X-Gm-Gg: ASbGncvSnEC76XluPu44+oMu2Wx20rXwg/5fq7b5TE8DyQA3oE27Qx92T+xSg5tgZA1
	LcajX5pYqUsqfmGQJQL/q7pgp3pWyWk/7tCpmHxWqaybDt2l7/DMxW+K4xd4Rw8zp1K+c+kKjec
	Mi7Fti3ONdHa5dUXik3bRPvXh/T/B3xck7Dpvj+s0qr+H9CuQZVQ/xJFvcmqOt5EvpIJa5XA3xL
	RsACDXoYZbHxx12kHvZ6AmHbHSGFNezxiTp1xlPSXHyl/7sEvacodBdKwXIjEL74F3vvYJ8KuDX
	laXdQR+ExbH3d1Cts8MMg0Onpbg8xB0k6Ed78ut8r3LcRORSpP65VAjkF84UEVmLZSGvqQtjbfw
	4nStv3YB42Zn5ufLUExN8sA9uisL0qCo=
X-Google-Smtp-Source: AGHT+IFmAvBRfvLjEgPAy4QPPhzpRWWfiaUQs2yaKoSBQwrcGyeXathdmws3LB4L9psUMRmX0wfWdw==
X-Received: by 2002:a05:6a00:b95:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-7489d006780mr23000088b3a.12.1750239622126;
        Wed, 18 Jun 2025 02:40:22 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffee2aesm10527123b3a.24.2025.06.18.02.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:40:21 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Wed, 18 Jun 2025 17:40:01 +0800
Message-Id: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHGJUmgC/x3NTQqDMBBA4avIrB0wqYr2KtJFTMY60PwwSYsg3
 t3Q5bd574RMwpTh2Zwg9OPMMVSotgG7m/AmZFcNutNDN6oJjXOYvylFKbhFQU/FoP2Qp1AIV29
 x7pXpx3m1g35A7SShjY//Y3ld1w240TVkcwAAAA==
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
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
 Leo Wang <leo.jt.wang@fii-foxconn.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750239618; l=815;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=OTnlEGQTaKca/djlqzs4ZnMpNa+lx1vDcpsU3Ydt1XU=;
 b=1KW8ySCD1lwOEWatymBInvgFZuKSAzEDiUjjNsKMpzBXo3w6/oThvGLzJ+lhEBQwV4vpQyNeG
 x+aTVtGRByCBMpJ7qfGgfxJFPMKDEVTnYCfzsgOMohBlUUAbl+ku1p+
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
Leo Wang (2):
      Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1254 ++++++++++++++++++++
 3 files changed, 1256 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


