Return-Path: <linux-renesas-soc+bounces-13996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4EAA4FECF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 13:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 598F33A557D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 12:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD3D24502C;
	Wed,  5 Mar 2025 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7dfnPzo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693FF205AB0;
	Wed,  5 Mar 2025 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178370; cv=none; b=EIJvHCpxKd51im1A6HwdLWc0oiACwMW44d/Pqg/B8j2Sjlo0aBuNZHZPcrK1/QqrTPG4vOsjK2zgljU1sUTE0NEjFfy8bGTyKP51W5Xpw3tRZkleWf1wd0pmyldNQwDax5UiIhLRJZxYie9T9wqt0fpbRkz+WTh3RTXFCPj1Lws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178370; c=relaxed/simple;
	bh=HmoqT/18etnoxYWhN4OADq8WV7QOm8ma1y2ZrwuaUmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q2BKohYhFSMCFR6bsxWzBsfilBZVGbV+k4w9dWSv4Hf+6r5e94fTi3nzYrjahLFB+Tx7KqzX0uPgcLiTMbPPeT4LkkDvLjIdpBvjEimpPBOLbxfpZwf6RLFzW+0TebhAAr7OLX/1ZqanJK+Kn8XgJ6e4r3Pl5BV702RICSiobtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7dfnPzo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948021a45so61414405e9.1;
        Wed, 05 Mar 2025 04:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741178366; x=1741783166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrUocNz0G2bLbjXW/MWqDPhEbG2yBFoa6AFz8VZ+w4k=;
        b=Z7dfnPzoVxgUnHuW+ma+rulmQLIZqojB932FCRWybLwet9v4W1jmPorcVRWqy37UjB
         XvgyLEegD29cZ/DObRvjnWPPYnF/3ietZLtIJ865+thYiqNtiwLpRfvzU3PfunaOgkha
         pTbk5KTvMQb+ZDK3nZsAAS8Gn5q9iA2mvnA7UUz4f0RIBeGFprVD1Au1gBXkkEy8y4N8
         4l0Npn73KrSgmPPdufD5hArEvEiCTiOH2VmIH3po5l/ogKoCN/ElwelOmhRehwy5V1rg
         chamI1aJkeCOZCmJz6czLVnpPYNtuKiZZzoI9UQ5Ep2d64uUuHT9Qd8ItwbdCdo8/X7t
         67uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178366; x=1741783166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrUocNz0G2bLbjXW/MWqDPhEbG2yBFoa6AFz8VZ+w4k=;
        b=uuSYgVTI7hIDTFHoDTJUAHxm6dLNSxL6pcBHN28Fe2MIwoCw+tzYMYoV6nwDNb4HFp
         39B1lnP3a6nkPffw7icw9I4u2782GlRK8SZZ6RcvDgMsKb77E4Fr3b7a+9pqA58fae+6
         3H9npsHQnXPKFIZL+QI39rbCuvuNA+1FiuEFNNIhWgYFlXaDSRkLq3++Sy7hHTzOcw1i
         ShRtLTWYZWTT2AXSshog4mNgB10V3j2y+/3G19Xh/zmPneTMWwwmoeG8cVAHaixp45U9
         AbRUyP30GHwuHZJ8w7UwPTBDsfzdnZbGTbC2EFOVzmsoY7tkAksFRdU/XBx7MhTWBMbv
         938w==
X-Forwarded-Encrypted: i=1; AJvYcCUEP+1idZOLbiGlqN97j/nXr8VSn/jdg6Hzx6dHDsUyQxa86abTHROwdluEDt6YbqAdI8umb1ixGFu4PrA=@vger.kernel.org, AJvYcCX3CmPKQV4nub7Km5rq+XtqznTpVWp0OlkA9XdIPVgP+aa5d+Pfcba5hFm+UcjwKtqaBqEF3Iv+6ADdo0n8jsy0pko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhs3Sx/rq2n66nyepNoSX/VLK2HtYf8lb2OzQhKUCJnOGIz27g
	aI4VaOsMyWzqbXmJ3Kxx/XnWOB7M9c9PAfug2Rz5SVgnBdyoELIF
X-Gm-Gg: ASbGnctBRDbd4m+Q4mQPj0FKeswIaA2LMh1AmXtJ4hYwqsuT6znwSDwI4uruBTea71E
	nl4WAKywEzb9kZIXfEBmBMxQho2LhZa+HM8mxi7i2cHBymvlEaCGinuELIkYuF/KhPPxTjusx/T
	/wOyN4O1RYlYLHUrij3RVPd6F4goy29tSqycqtR86dZ++du9mN+mXZrCT7juH/onGdLDt8ppBqz
	VdXEnoarfaDGYG8HZ/K9E0o3k5dflLuQr4MZ7EYNlf/jRhDLdNElT3uqnmFondTGlQTuTGHXDAt
	HzcxRHJT0IIBU6Q6uJVpT5i0NVbqW2uwQWhcD8X+/x3WGQXxHiUzfDIWBmxvkoNYa5IEbZY=
X-Google-Smtp-Source: AGHT+IF8PD5y5BgnpZ0JrRcPo+rGn7vUPbSiNAvie1+rA+Nfg3LEigC9x54boXDrqBoWTbs6uLMllA==
X-Received: by 2002:a05:600c:3b17:b0:43b:cf12:2ca1 with SMTP id 5b1f17b1804b1-43bd2969470mr25742575e9.10.1741178366174;
        Wed, 05 Mar 2025 04:39:26 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:8fc2:ef5:605a:34d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426d32dsm16851495e9.7.2025.03.05.04.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 04:39:25 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add USB2PHY control support for Renesas RZ/V2H(P) SoC
Date: Wed,  5 Mar 2025 12:39:12 +0000
Message-ID: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the USB2PHY control on the Renesas
RZ/V2H(P) SoC. The changes include documenting the USB2PHY control
bindings and adding the USB2PHY control driver.

These changes are necessary to support the USB2.0 on the RZ/V2H(P) SoC.

v1->v2
- Dropped binding postfix in subject line for patch 1/2
- Moved accquiring the ctrl2 pin in deassert callback
- Updated ctrl_status_bits

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control
  reset: Add USB2PHY control driver for Renesas RZ/V2H(P)

 .../reset/renesas,rzv2h-usb2phy-ctrl.yaml     |  56 +++++
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-rzv2h-usb2phy-ctrl.c      | 223 ++++++++++++++++++
 4 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy-ctrl.c

-- 
2.43.0


