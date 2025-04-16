Return-Path: <linux-renesas-soc+bounces-16059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C9A8B6FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 12:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0067E5A07F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2503247298;
	Wed, 16 Apr 2025 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6pK9AzI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F158323FC42;
	Wed, 16 Apr 2025 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800032; cv=none; b=SOrek2BKubQSVxZGZB8+grSCxN9mTXAl+iUh3imWWsEyAf4trnGoi63vbALtcTB7nHZH/UMi7UPSgmp8AqSD9WU9u4t2p/XvV/0w8jKJyGPJqL+NnQE6tobAybmpkTNF9TnNuX1EuTslJKGXyoewGqEgDEw0dOyG4NezOfDc8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800032; c=relaxed/simple;
	bh=W0j6iaGLICzY08UwsMabAQsvmG4ifO69JE8mK7U9m5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/Tszm5Y+n4yJ+jLAryW04ddoRb3cVUkIgn4/TdzKB+6Hyaa1h3ilqdTszqgRQ7CJYx8EHM4kjAQtWhfrn+oQZUdJTtuPdWaSA2xFy5sGgmVtC3Pp7elpTxvNi3Nc8IxoDiNcrugoxCNtbWSwllwhAgSFt4tec6ZeqWb1ords8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6pK9AzI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso47193125e9.0;
        Wed, 16 Apr 2025 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800029; x=1745404829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=Q6pK9AzIuaCP2ZAXPf7RVPDxFNo3Tawh3enJeP1U2+uZ0T6hzcmTTwf+NRl00sfnY5
         8jItbEWLTNXsowzYS3poJZF+JAdfwpiPH078dhXJ5SbTSrA/zx1F2LfQix5eTlmhOQRM
         WExGuYh1eTZUZIKKzZLz+3Rnc08FqdxlSQYkd+7dW3FowJ7Hd6NNnU3bR2RiskYrYggm
         clOoWnQ9Jzg4+yWR/cjGvNs9h1b95YfukRRHxXSOoOkbSYSJ3MG0TIeCyiChb8AcGRbU
         5Rb9sBHIurqHhLkIkPY7e9kPKV8AHztsZR51+aB42q+KKyWFjIhpmN1qM2RlTeglZct/
         co+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800029; x=1745404829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=OLat5tNQCpDhR75iEhBj9NOaigC0pWtjaUTBBj/0MNLqgcZRpsjm2PCiHCehpg3CNf
         yu3HjdSK4qb9agMMU+LPx06BaXcAAQAGutXM0DM/RLtbUq8J+vyFH2YfFXneimufFYhs
         Z28KjV/p0NXLCEx30fm+x9c1lab9XcU040jME/qxzb92X5u2M3KqoMs9FFvO807pBvHk
         rigTLVoMSzwBiXz1PqmipcL6EjHuUJdP2NGnbsc+LLHeCUEojbyDq7u8hrO/ysRIauwr
         efxhT0BON6zlYD1xaRfud6vR5qsbViKUyQFT4Oq1/vjppSJRjpSwBKF8Y4musvIfQMbz
         /K8g==
X-Forwarded-Encrypted: i=1; AJvYcCWW9JPbET676vaKHEdeimkFJ844NiuJ3CMiMdPG3BuWByck8YPcXZP9tFaPy3z2SfZD9JWZjwLCaMofFKgd@vger.kernel.org, AJvYcCWYJxnvsax6mG2cWm3VCbYcHWBA4VMuf0eKZedv/s5bULZCmoucFvnRN4KOvOzqmBAArekdtsBlippw@vger.kernel.org, AJvYcCXpXrhvqKoL32SAA9UHDPkisNShiHgOcwLkpCXRZi6af0A6ctFDsPUtvzx8ASoc4nfNp7IAVV8AEyLVfGtwkr33ddc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vlW0DFf3qtLEhST10NOLq2u/Tdp8OlVxh+S650FtT4AgJxMY
	Uctiog+kHQc7LzrmSYrzl6XCnG9Qtn9/laImi2WM4alAVez/9l/a
X-Gm-Gg: ASbGncuVuOqxheUqY6DBfWqArydeQKj0OGQ4aRQ8SBvLAa/lav/eiXmiHsZIYnhzzk4
	KCgsaC7viN9X3jCrRHIO5S/Uptzp7Oz2zUA8fvfSRuKEbeUx+ekEqWzlNgnAmSFCqpqDV69k502
	OJcWnDo6mR6nx/ltZdBNORXjKf39FQy3RkNSLRDlnRaINWPYxKdd1XXhauzJfhORhh6zvSDg4AB
	nM2xA2TqR0PVYFfCEFzXN7UtuIjP/Dor6eFDB+w4kDmtkiTgpqqV6r6RxBwNp7H1n6jhq5LzJnE
	H7VD1unsSq462aLupRebScs2rXYmcTYUuT23TZ8LopElgzz5Qex01L6d/T/hnpkV+w==
X-Google-Smtp-Source: AGHT+IFXW+hiPEBM9LjJCwMXPmS22EARA29oJ/ZIpi9JZFtxhf4t17LTXmG2ii+PAuY6ozJtD3xfEg==
X-Received: by 2002:a05:600c:1d2a:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-4405d61ca24mr13567445e9.13.1744800028716;
        Wed, 16 Apr 2025 03:40:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v7 4/4] MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
Date: Wed, 16 Apr 2025 11:40:15 +0100
Message-ID: <20250416104015.47788-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) DWMAC GBETH
glue layer driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1248443035f4..f5141da4d509 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20606,6 +20606,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
 F:	drivers/usb/gadget/udc/renesas_usbf.c
 
+RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+
 RENESAS RZ/V2M I2C DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.49.0


