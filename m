Return-Path: <linux-renesas-soc+bounces-18476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B49ADDA80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 19:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF5BE3B0664
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 17:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29A32DE1E6;
	Tue, 17 Jun 2025 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nE/CpX1e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D94028505B;
	Tue, 17 Jun 2025 17:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180805; cv=none; b=fwRkO2RAi8B5hzzpYTX/bPbm8ITa1yMvuQ7VK/ipNv3HXyhgXINMHPmdvHS850y7B7bC+tcU7ikaqSAaXiIcJ+7VVoq0d/1HapIYjYifxAQh0zE586oNjQKrxKI4JHLK0JHA2SrPklwpxwlavFcZgozzgdrz8hdmLoNIjO5awPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180805; c=relaxed/simple;
	bh=IBbouER7Tna05El32eCTU1byWxuM6toOte+tJiAbnfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pp/KDxl3/9SBNDTlOLcwh5EgVJlgjxb15YPpXpMzqoFyKQTXRbriLN3Owr+y7XboKIc7AGv76k5PsPOnbJlRhCXJFCKlvaDQ6f7PLRjVdL5P2zIDDwMKwhUMg3AfVgUbbfgOv+qaBRTE6VS6f+l1nNOXSLS66NmCtnafIAvrd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nE/CpX1e; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so670572f8f.0;
        Tue, 17 Jun 2025 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750180802; x=1750785602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HE8vpOdfAhE+glBkVrxpzRml/p42WUy/x+PZYR5OQU=;
        b=nE/CpX1etnH06Awx8O4jhNdt3/C47n5wgWd/uxbUfp0JpVX8EQXVoopMwyMkDFa5b1
         afcc05Xi5/ryft9r6aVE2yysRboTMXA/uNZB3a6qN7d9GT1cYTRj+H9v1beGIw5Ssejr
         nxsAg2TdBUkzPCvrn/k5hL9DmKoK4WJCK35Eq67nXWSqQmqcEib98X/7Wgn6NWW+2M+4
         7cgLTpFTZ0/YHFJyX+DcLM3jouEAVu/uKubiB1CjwQW00qgCyJ/3dB53dkUKM74xqypf
         eMRlA/3CSg+Pjbo9w01qzU4aW6WfjW8546fXfh/l5D16swat4b5Q+pv9KEm5lGH8emFi
         0jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180802; x=1750785602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HE8vpOdfAhE+glBkVrxpzRml/p42WUy/x+PZYR5OQU=;
        b=PaKUvRf/CVs8GVlVXa5B9zWkZ2TToxU5CbBy67GmJTudNbXmaNbUukICHaiPZRDYnG
         EuAcekolFQ8gIfHbWDGxVgy/yzeyVOSHhoVLoMYUZ3igiySdiZlayFCG+ADgsFaVvh4u
         WZ85RMmUAE9X0QGayCnapfPJcHJ+Ml9PuIjPiUCl9PA404SuJTqP7ATkxskQ0fiL/PX/
         GV9G8IPhy7J/9FMPavt6uGHUXgiM+gcnDCWJaAmNW3d1RDbT2WqdLzQh/iB/ptKGYyoj
         JGwCqKs11Ggc7jnGhMp1/D/mWCB0c0X/Rc6HcorIvKV6fgxvsN00r8j8TI7e6QJQLfpY
         IrGA==
X-Forwarded-Encrypted: i=1; AJvYcCWE0VU4h7H3hWkOXqT5oasT4JPctfKdRhRzKBmf5OsdNGYpMlOGxafziGqJcbbUSNJOUtjo1vLFHRB8m8In@vger.kernel.org, AJvYcCWZsMOofb1jlmD6wquJqY4fSNigVnPNYqLAs3qLXKaamErgZu1UmqGeBoJx0klRlVC+nUj3VJH5f0py@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7BX2MoT9wBDRiKg4+e1pZoHBsYCyiRxWNtSOaeCZnJ20QVfB
	SZqrXye8oioTEla/WIKubf427dCUPiFeel2JKrYzr9WoIIpos3MWT08Z
X-Gm-Gg: ASbGncv8yTHQclgMf8hVlVz+AhvT5leHa86HJ4F9imCVYKzHmOL7RTuj8JdL1z//7XE
	agSoLMdt4iWVvWVSxNh0zKWKzzPS/6FwcHPY0esa8tYxX0QRvelXdwPnGNn44R4K1dCORo1X2Hh
	3kVjywUnwFcWA0bOgOw6VNVKLf0wbhzGYzrSvVF6QFOlAL+x5QMqVFTinAU/NRepw56vQgzQvLF
	Wrfiv80riY/E5xeik+p7lnY9lAIJh70H27jqu0eOvMako8gbnXKyZlg6KBdQclgzQqTFH8IL+r9
	oDMrAQKsv74Mk06m5fRXJWC8aqqhtCE6YiYTscZmHxuM9yN+Tgz/a13ky5O/xcuU6d6+1pTnfRn
	1H7nMrdBo+SM=
X-Google-Smtp-Source: AGHT+IE9UsTwXdKFg1AEPiyiDMseK8bfcMwGFqdslzKuKNrRGMASIamYF8Sp6voRpzIfcP5tCs8vOA==
X-Received: by 2002:a05:6000:25ca:b0:3a4:ce5c:5e8d with SMTP id ffacd0b85a97d-3a56d83454bmr13912613f8f.20.1750180802172;
        Tue, 17 Jun 2025 10:20:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm180875415e9.35.2025.06.17.10.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:20:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: Add DTSI for R9A09G087M44 variant of RZ/N2H SoC
Date: Tue, 17 Jun 2025 18:19:56 +0100
Message-ID: <20250617171957.162145-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

Add the device tree source include file for the R9A09G087M44 variant of the
Renesas RZ/N2H SoC, which features a 4-core configuration.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added reviewed-by tag from Geert
---
 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi
new file mode 100644
index 000000000000..ef0343b53309
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/N2H 4-core SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a09g087.dtsi"
+
+/ {
+	compatible = "renesas,r9a09g087m44", "renesas,r9a09g087";
+};
-- 
2.49.0


