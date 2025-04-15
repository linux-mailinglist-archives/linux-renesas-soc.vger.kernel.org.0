Return-Path: <linux-renesas-soc+bounces-16005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268AA89EC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDF40189F917
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B53229A3F8;
	Tue, 15 Apr 2025 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2PSR8AF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FE297A74;
	Tue, 15 Apr 2025 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721817; cv=none; b=n3TTsCK9RLxIghsjW3ZTJVe8TfzFIOo9Ra56bgQvx9JNEBkrbaNQfg1aeYE5KjyWYlBVQk1eh5e+j5b+UPylgxmAJwbAEyAHEI8mZtFCosW462wCZDYqg1XRfFnEXl0kL2SzMwHe2BvN2YJ899vrIw7iM5Z90J/AtMJirh5bf7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721817; c=relaxed/simple;
	bh=W0j6iaGLICzY08UwsMabAQsvmG4ifO69JE8mK7U9m5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRqcROfUWIa3rURMBw8DLtxqKtUbWW+DiRPIU2TjEkqTZbgxD3Ln87RrcUVdp1KIbVrSRDphtEg1t/K9SvlkuQM63WT4EoITNEyGnDjVr5hm3WG2MNCm5syZ+nBBH85yHhCwaGOzPmmxz4m9XpTQmbl3gmktAHzsdI28ZD/RBkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2PSR8AF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so26428585e9.1;
        Tue, 15 Apr 2025 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721813; x=1745326613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=Q2PSR8AFHwDbfuJi54hhPfA2qhF41DZjEGFsFQSXLH3+tm92OIUx/m9Ldn0yBK4+I/
         kQluRTXZjSdiqYlBA9BXx7+lGA0Hl9qTgSw6CsOLdKKCPyIhiQBDnffXU8tODivuhMVf
         fAr3kCuCBTd2s+yHdz7cDUZR0X+oRdpgsD7+7aIg9J80GfYqMM7KNIxTtavNXGHe5mFo
         Rg9MVvWBYn3u0azK42fKgN5VWY3agz5aGC9VBnOHUxUpVgGwimj+K7/73u/cP8VUgfxw
         aXoR0uHROCmua5I/rQojN30tLDeO7m+Gdrsxx+dyMdbY1m0JI4TbWq2TWXsIEwj61tSA
         oesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721813; x=1745326613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=KFhFtsk4f47AdWguAJcPpJ+H3VRbwp8hj/r3ketaAmE7KDhpw+kvhMJphj4kyn3nps
         5ZNQ4wHhroyt44w+6D5dB2S8iSUA7yb8sb41J4XPoSew8OJDyHKUNFaRafTMxXxumvHN
         7CzBImIUR7r5DLqkLuwtnbqb3Em2r1RevitLEieElc3UTQ1p9jlxDoe4KbhSZgf3Ps7y
         iOiHtJJvkS+tfYMQ40YzggGQsrlfQFN4bhrckeV3XmnFOyjHDLNvsY2iA8wGlD1CGIYj
         GVcaFBKMWPmg4oa6PsT43tnpAYLY2r6jAr9W8UAdylYycEukpItx+1QlhIm9diCiPnph
         U+/A==
X-Forwarded-Encrypted: i=1; AJvYcCUr8knR0wI+AQXtPQ32zasTTxnc3ET7vFyEirUgDvkIe4kbTBLhwHlUlwLOyEmD/jEZeYfhx+MKS552D/4sBeceCkY=@vger.kernel.org, AJvYcCVvHsnuqevn5LchQyXUOTxixWKGZoFpelqiP7mBkIE4Vrqnmv7Hb1BzAmdCcorUlPU4Wm40pcSgbbi9@vger.kernel.org, AJvYcCWH+mpiuctLvyBUW8V9+pp3+BmUyurowO+CQk187X7ULyAQ3pCyDgMn92RXilk2JbEpv9lYvwFbg2Dh/1h5@vger.kernel.org
X-Gm-Message-State: AOJu0YyHDhGJwXfEQcfL53UnJach7lIdUJHetkXERsMOYJRNoLQ9yKBs
	VKvKYNZokFFQGX0LFCEnzzCTeYSiuM7vb7P8HlBG6b1ctgfYaed+
X-Gm-Gg: ASbGncurFgGJMwL3SxuCWLYw9tnvjgXUFufRarBmF/9HfMBsd0BIoEIW/oiox2WCqKm
	vpBZjLEywGLeOui4fZNMNGrqlF6RkNzCRr1esfcVh8TZfiF/iNgWl8CDgIFmdRlIRi2+XYM5gSW
	1EkfUU7nVvEV+BXL/7HtoLhSFZ+leEyhVqpAvf0WI9SNo9jtmg962Hknd8j1v1U6+FQx+QmNZ8r
	Ju1fa0S7Xn7kcEYHZEdEDnUAMi4lgUb/y/hnaTnw/9IgsXpRM0OcAa6LxAlDfSOXnsJl4B6i4hg
	CnyZB0aktQPKK1snh2dvHLKJ21MxqPMxGiuaFTLzS27IIqzEs+QPh/+gSB4O97rV
X-Google-Smtp-Source: AGHT+IE0KqK5XyLGhc+pfdESGQ0FrYBws4qU9UQxP3mB+l7Lk+YFfa+Xsv3uUzwSyeT2UvIbstj7vg==
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43f3a9af837mr171329065e9.30.1744721813467;
        Tue, 15 Apr 2025 05:56:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:52 -0700 (PDT)
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
Subject: [PATCH net-next v6 4/4] MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
Date: Tue, 15 Apr 2025 13:56:42 +0100
Message-ID: <20250415125642.241427-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


