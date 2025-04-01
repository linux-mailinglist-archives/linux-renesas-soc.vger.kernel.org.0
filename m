Return-Path: <linux-renesas-soc+bounces-15264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A8A7813A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 19:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38654167452
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 17:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BF620C480;
	Tue,  1 Apr 2025 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNQKGv04"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B579FE;
	Tue,  1 Apr 2025 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527726; cv=none; b=SvzXUn/WUYrGQk/dpk+CGDabU55MvWOPeOYfy27XPi6QxeUPZ9WIZpwS0tre0OtjpHJyxq+Ejcfq/l1SqJ7xXeoWCUA/8hfb71x0yPvIhHUvyaoZpYbJhi1DEhrEmZ1euaCUjtuIKB692RmzTVXymr0yqlM+g/C9g/uZ/bTpWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527726; c=relaxed/simple;
	bh=L+lX9r2dGjKNHuzHN5V9IMLiK1nkCcDKUfsavGMrDrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jB3Wk1PklVusJq6PfkrEgz0MPx2lkeg0oaO8bWqBLyBI0OdwutKnxHty+n3Xs2X4w/wUKEbdMIHAEugVoMDPlFdX3az5rHOxYdIVoAU9OlGgRlSjQfNlPZXai/E5Dq6bzj7m5NFH2yw4PPYY+YV9F1NSGVfVN6GOAQAcANf5H08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNQKGv04; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso291455e9.0;
        Tue, 01 Apr 2025 10:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743527723; x=1744132523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YizoLm8lCDU9nUyErwnOyBU4mdGwFqcXbzX2xycyd5o=;
        b=nNQKGv04DIDFdmXRgr2AEPP4BOMAdklRL2ljn4tfZ1rr66C50EjnHHR0xcKVVMHfYr
         9CmuIhBCEWWwVD4d+jyH+XYaru8jwMUr5GX8eyQOW5m4yPm2Jqgolh7879kD90tNyeQn
         ymxWYNsNtTFDG/x9QcTVXMCZqYB5tWSgRFNa9aALHZ/PSe2kYsp9KKBNJTAtXCB1KRHd
         xf+u6v9prD90yfaBLf6AbMebOi5aEft19STLinE9W/pnTF14lOL5T2lsPnIcOsNBsgWp
         LDACDL6hx+HeiobfR5PUCV/jcGPWuDF1esAUnt6SfRFAxZBmM3OV8UL2MpT3W1H929Rn
         A6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743527723; x=1744132523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YizoLm8lCDU9nUyErwnOyBU4mdGwFqcXbzX2xycyd5o=;
        b=L5Bq3DywlDd7GeNlKONpsa0drYfHVsbRQco20VVx9nWhGffqrGtcTjhIKIwlwVydj5
         Nh2c8QPGLiV7rbtcZtPuFW4a7C4eL39ndY+DcHtqHS5aPbwArTZbRwbSm8X4Z9XyoOhq
         tUwqmwJ2+5Qc7HMzUM27Nw9wTjcehl/yBSE6PRvwGrc1IdXZIl0fGKToUdTDVqQeceQr
         R3JqbhleSAvHz7TdjhhULEbD33qlKLucPQ1DOx0LPxoUIHMrSLygNdgDZEXJ48xByPt9
         N/b0fxh/KCvhGAHuBzRaai5HFvv/g+NYv5KREtCBDqLHKbClnYqdthtz2reBsPAftiuM
         jUzg==
X-Forwarded-Encrypted: i=1; AJvYcCUnchVqmTVrQy6HjMjoyb9vQg6ASbVwy1CME7pZIXawZUHc2iomaPaQ9O8DwE/xBg3o8PHtm1TDQuKN@vger.kernel.org, AJvYcCX3cJn+pzCME9rMKVpLeXRHV+8cC/Wctl2rpf1LMoDFB74zHwIwVxi5ebx6jSlqcP6+USdC1puv7wyAOUxk@vger.kernel.org
X-Gm-Message-State: AOJu0YyR2ZXUJNMJlHIO4alsIn0peRbBpff5r8nfCdLGhnXNbeV+R7lD
	2zTUxqIiYnwh39rmg3fbT5Iiq0HKMVE2R37Dz29jS1chxi0Z6iwY
X-Gm-Gg: ASbGncu1DZRlkRqj6s13HKk9j/BShOeEB1CAnHfcpD0gZiBVWXnIGwWQiKi4qqezolW
	GHONnTCK65B0st6ShmDMyZpnOGnVMyvhwLPqtCi0Nr+xdtWS9yC1rvVPtj4CSbU0ODXSMgtkjts
	1cXDypWBoFnOZc2QjQ6PLDpZvey0qqyZm9dcL8ugkiwTmt/7QRQDowOz5QW0TIH//6QZQKcY1VJ
	B2q1QhtNNbPfxhSw5IPrEhzQwnV2SpfXqQmZAoRhyIX88DGiB5eaxEm11r+1pEZhuc4kL8U4iFQ
	cPJ++s5MOmlmjqDdvJEVZvbIiZ4HZ3EOdr7OWTc4eNnQBYEC+cHBhByhu3GNVqmNS1F4JQ==
X-Google-Smtp-Source: AGHT+IH2c0b3l/+cWUUWrVUvZ6cf/ge1SmqsdDobyM1BvBUGo2wXYGSR1OKbEeDKuu0DtMOuF698Jg==
X-Received: by 2002:a05:600c:285:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43eb055b4b9mr5663385e9.2.1743527723078;
        Tue, 01 Apr 2025 10:15:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f6ce:ff76:f4b6:b6c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfd9bsm162583555e9.20.2025.04.01.10.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:15:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] Add USB2PHY Port Reset Control driver for Renesas RZ/V2H(P) SoC
Date: Tue,  1 Apr 2025 18:14:29 +0100
Message-ID: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the USB2PHY Port Reset control driver
for the Renesas RZ/V2H(P) SoC. The changes include documenting the USB2PHY
Port Reset control bindings and adding the driver.

v2->v3
- Dropped Acks from Conor and Fabrizio, due to below changes
- Renamed binding renesas,rzv2h-usb2phy-ctrl.yaml to
  renesas,rzv2h-usb2phy-reset.yaml
- Renamed node name in example to reset-controller
- Renamed function names in reset-rzv2h-usb2phy.c
- Kept the reset line in asserted state during probe
- Added comment for rzv2h_init_vals[]
- Added entry in MAINTAINERS file

v1->v2
- Dropped binding postfix in subject line for patch 1/2
- Moved acquiring the ctrl2 pin in deassert callback
- Updated ctrl_status_bits

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset driver
  reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
  MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset driver

 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |  56 ++++
 MAINTAINERS                                   |   8 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 241 ++++++++++++++++++
 5 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c

-- 
2.49.0


