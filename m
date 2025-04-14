Return-Path: <linux-renesas-soc+bounces-15907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B4A880F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 886A9166DF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CCCC8EB;
	Mon, 14 Apr 2025 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URyGnStN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B042563;
	Mon, 14 Apr 2025 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635627; cv=none; b=bC5z1auSt8RMJevmlcmjDZyUEEh2PYGkCmNux+s4ks/8JPHNXklXSgxrw5TUZN1el2YWutLmrLyZsuci+vMcHkRXH9Rs74GZHjocfiPYjdj4KeqG8fecwhkfiDgFkVZcfH8lwcrTwfa3f+wI6yX1F+EK5LWwIuVcDwdDPVnJDJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635627; c=relaxed/simple;
	bh=kxhMQT89cblfTxhyzZotmrfRaRQzzN1FS+ulDyL3SRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FI9l9rP6vxVtTEDnx8Kmwp71znFseC3S4Kafo3/RE9/FcYfaSgvOhvTykwDo+NRYzA6c6gjrwRXOHyr+WpfaNtzEjYdu8F5qnuDzQtIK1UYQg02lf5KpWPBFcHQj7TxHynOPsSk81JuhAeSa3Vyi8UvrUfwKL+rbg9CRUt8bLXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URyGnStN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso21331495e9.3;
        Mon, 14 Apr 2025 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744635624; x=1745240424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/PADDJQ5jx6lytkcg+MwyiXvCQl+JVcNopjVMW/AGvU=;
        b=URyGnStNQon2CPTE6gsH6IK67U+wWMfYqhE1m2e5OAVgj37sXozYKZ3HZge/qwhoPK
         g7kBMwvdZPFVsOju83jbG72fbSsW8egWZP6AtDu+pH1ycf6mRfDcP+R+MRs6hBp70Mco
         GK5EvqBZrzEEtXF/+UMp3KGDxFeMcKjeIl62o0VsKTYlqYNuxx+aiK5/oi6RQlwV1hJF
         IjXMZlYDkqwIU/2TXx5kl/QK5dftEOphjETqKe8T9yC0vBc+8JYVMUzzsb+lgaG6Suvk
         Wiz4I6I8HtsCemAFoelH6VfY4CM/R5yEleuAqw6THXfBlyfM+dqk2Ev1K2Qs+2e3X+eY
         bF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744635624; x=1745240424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PADDJQ5jx6lytkcg+MwyiXvCQl+JVcNopjVMW/AGvU=;
        b=AOxShwjk15ZNuJTMxYpw2JNYWU9A/JBTEpIMsXh1IyBkBRcUNOX3/8S5BFe3GVGtkE
         vC41ULtBmNDtPz7lEtWYuDze6ItBTaGxRE5bMe/vE30hfCFEtT/EsEuSV7N66KnFdl6B
         bQr75po5HV+AAy7yem6AalUJ281UGWyT5DdWdWfql2IJpnmoqX5clQPGGgOLMroPskP6
         P46WQYoP4HQ4oPdma3IPXfkBX5u0xmh9vFjFiBXYZQe0JnUABo+4gWbgbMCZBIrLYEA+
         m5wYRmsP85BoS7kW+ssZvA8OdkVbpNSAy5P+YKFlnxgnnmgCfY2aY0/JRahl/VtFe89k
         Aitw==
X-Forwarded-Encrypted: i=1; AJvYcCVGNjrw2H/iwtkeExN1D67dhPLs+TkCj6yeFF5WoazY55HDBvgjIsr0vGZyJsxXyhSsSR3aeXOj/bK3@vger.kernel.org, AJvYcCXEsGV5MrMk0qOxikkLydoft0y2qBFW0muYzlkXIylq9UBxXqPX46W9Y3iL3tspxX8PSor+7SrBJZEwUMNC@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBSa/4fBXH28TVbdbn9Gc3ROgtXlRiGyhHI4A5YwHX+NrT5gP
	tkkO6tN7zeX66EfX3j3FN77xcVuE/uzO7KxkUbtlZTz2yxgES13WkFPPt0hn
X-Gm-Gg: ASbGncv3TNho20czHAk4xsxP7Q8iga42r1mzrrvBVJnVxakUqjbQpRfZXTdLfiBDQcA
	dEjVGi4KS4ahq9D/dvgsFXgn002kzFUXAeGYfnFsdnW2oTBOrFsRyCXJsegaDV4i2NRB/al2xM7
	60NkIWoo+A1z0JRQ9wsg+tXFG4u3qiqi4940B08Ooisfd9nXskbsdkRO0JsLah4q+MpZ8OQ2Ilw
	/3NQLCvNYxIatlk6rM91K8NXqygqx0XK5CqcJOZBjBJMd3RoTmvDpvPmJ3NWcx/2VgfJtMlhnoj
	RqFYNXDJx+LvnSQ0OtCdkbod96k6+j96mD3AB4IQJwOa3sbqSHLlj7gY7+bqovN3
X-Google-Smtp-Source: AGHT+IHkvdhbEoLRtJXbNr4yhhUbScaZlLezhYsuQK8q6ykHSA5O7H37Bh3gFNZOj2zly4JSisQJTQ==
X-Received: by 2002:a5d:5982:0:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-39ea51f5b18mr7863632f8f.19.1744635624050;
        Mon, 14 Apr 2025 06:00:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979663sm11214681f8f.51.2025.04.14.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 06:00:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/3] Add USB2PHY Port Reset Control driver for Renesas RZ/V2H(P) SoC
Date: Mon, 14 Apr 2025 14:00:17 +0100
Message-ID: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v3->v4
- Added Reviewed-by tag from Krzysztof Kozlowski for patch 1/3
- Updated commit message for patch 1/3 as per review comments

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
  dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset
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


