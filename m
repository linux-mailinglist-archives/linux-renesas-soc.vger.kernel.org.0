Return-Path: <linux-renesas-soc+bounces-8049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6295BA5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 723721F242C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BDD1CCB2D;
	Thu, 22 Aug 2024 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EjQNyK6u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE81D04AE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340526; cv=none; b=XAHewMBZZaHqEeWUvktZSXfwxlSIHsP9CA5LfRE0gnFhKEvR6sGYRFCuFpQl5jQTo2EP0OeNdV120srBdrBjedaH8XMj/t67XWfiwFuxpKjORelZn1ihkBgz7mTS37XJQewMt0knMj9DA+gslSxDTlREoRFS0axRR7qTbHbOKNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340526; c=relaxed/simple;
	bh=Fdk5QGcF0Of61Ef45y7VdXpM+rCxir0BEowLZBYRpu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VB5r3ClvXZxds6AZ4QmiuLXRfh1h10ojzTT1JYBuQCBGs2tjSabUODnDxPIjwTR6r9zevidPQJiGOe3U8cRZYdXQbekjpyxogQHtZ55IbPZ/QVXiNeOTF3gbwmANDWYvfhcVaj+va7zSpMJX3x54evKU98o7iGA+WreZnwHf/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EjQNyK6u; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7aa086b077so113556066b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340523; x=1724945323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWNzbrWT4cjZwlbw/B+Ku5dXdfTILO3SL/AQs9G2I5o=;
        b=EjQNyK6uwTm57ffpzmcg2r9a+thZq4TEOL6Cf3vcKF/Ent6/ZvZvJkbkvnHWh61d1N
         K3NbO/SiWFsTG9+8pz5Jx/H+BKw7ft4qq1kJBUmnoXql7waQYC8zUX1FkHFPk22KttV8
         OzUpEw2SdwTJBEgQUm/shuAFN2onvEwRQNwtSr2aVwDJOdSnGyKeBf5K/MJwzswxN+LH
         0BrAaOj3sLKZ2tCEKZEwIiIZOqdpRQbJQeJ9MQ36xaCKTJShpemhUz7lsa4WJCA9521U
         esrrbHLwdXTxpkfO7dmG9skkMyAQxC2Je2atdaqNiprxy5IG+TIjfTyHNCjhwgqcqvoH
         dxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340523; x=1724945323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWNzbrWT4cjZwlbw/B+Ku5dXdfTILO3SL/AQs9G2I5o=;
        b=s+gY8CXn8n3hqX5N12/FqBhgqFiKK+XGOkPifOklLpNkOb9ZXO36P+lGZqU4SJCrjI
         8OkaLU11F/23ZcmAQk9V7inkfbZ02CLtxTHpc91qJvZzZYmI/cj23gO+QK0L2YyuGkqF
         3lC63NaK1p9t6IcrvksAaFYS5WMnhyJUGvSwUSrJegnIfYQPZ3Q4nFBnG78ZWhzc+f3x
         V1zRFqFbHHQ4BTay/4ASY3LuFld8iZFPtPDwF3bxpzjotxxN9dPtM5ctofFh2QR0uJnG
         XuxDT+MzivQtS/3D237hgqMtLES7kjzBqpgHI+hDeNe6qSn8E38Sp3iRa1a/B6mRFU3T
         6esw==
X-Forwarded-Encrypted: i=1; AJvYcCWxb+XEhstFysEvVn5rZaKpnVnkSg6eLQgmG5dpDrH2x4ReiwZvmSev+s7t2dvHICfhAPg1pBWiBLEcVSmuYIDeJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQI9tHtmqY5aakvV7ATVGeMH63H1ZKPUcnml4LkdmfIbFlbi9
	3c7pESYcIE1AXjIRXGQjlarpXXLVz1XfCSv1C1x4g40JtjNaK8fXZKWDORWUeMk=
X-Google-Smtp-Source: AGHT+IHil/3QLm3fW6hjS77rGDv48oy9/7q2NQAgMRaJIdEszcJA4lXA3RSoaEhwajY77aZMJWnb/Q==
X-Received: by 2002:a17:906:7313:b0:a86:700f:93c1 with SMTP id a640c23a62f3a-a86700fb357mr451883866b.60.1724340523183;
        Thu, 22 Aug 2024 08:28:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 13/16] arm64: dts: renesas: Add #reset-cells to system controller node
Date: Thu, 22 Aug 2024 18:27:58 +0300
Message-Id: <20240822152801.602318-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

System controller on RZ/G3S can act as a reset controller. Add #reset-cells
for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 0d5c47a65e46..cd7cefdb2bab 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -91,6 +91,7 @@ sysc: system-controller@11020000 {
 				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "lpm_int", "ca55stbydone_int",
 					  "cm33stbyr_int", "ca55_deny";
+			#reset-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.39.2


