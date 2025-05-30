Return-Path: <linux-renesas-soc+bounces-17676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7943AC8CDC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 13:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6E344E5CFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 11:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E46322DA0E;
	Fri, 30 May 2025 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BnpTPMmc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076A122D7B0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 May 2025 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604000; cv=none; b=J5XkkbyX2yxtlor42fEkME6tOmrOZ7hDyu2poUFrZdagevtKKNkt2whyPdQn2nydkoWb4/IH38t4FPmr86SAfa8vFll64/JIDMRUOy411x5y7EawJp+5yOkeHzNeOunfwGCAARvYqcGtkOthwVWh8x4FmZ7K0j1DD9J+i7atEPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604000; c=relaxed/simple;
	bh=JTrdaAZ1ROVl7a1oj4t3COHx+ERflhdGhlJk2YHh1O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CU4M6TMf9GoQP0F0/aRTrchvNkbtpf0VcuoNEeaElYCVFNdzOAXqzIskzSW7aAlObI5BIOBdju05dtsZqRUDo/YFZiMxU694Td93MazcRxZz2KhJO0qxmolWERF+fX0P77cDq1zybeD9Fvjgz9RJBiKXF9Bw98GO1xxmNGy+92Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BnpTPMmc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so15890945e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 May 2025 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603996; x=1749208796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrSNXGfd1043Q08w0S469+QeaCD1uDQKPuIZl5ROhFI=;
        b=BnpTPMmcuog4O0CSnJ+ayesc1LGoZfog+M5zTi/2AgahLxrysziU5F25UhpD2fcB5h
         gW7ClGnXI+2yMo7W/zo5idxb2t3Dhwo/Ewm9ZjbpaDHFWem1fVsu6xaT3wazo15N5UAf
         QOtFchKf1u08qipINvqXT+mp9o/+7SWzSahM5mL9+hrh8efxzK3xVRvshbGKhbICNRm+
         TzGcpoz/Yx4jZVIYvggBwlhdtnZcXvf6c/CDKJwhXnNWrC2ZKGpLXkOBiNl5qNYO47+L
         Fd2m3O7Mt72zcZ00fxG4XSv5ID5UEd0Z7ExR5Fw1jfUYdMYJBtlYsztgHdGAej5RbzbJ
         RCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603996; x=1749208796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrSNXGfd1043Q08w0S469+QeaCD1uDQKPuIZl5ROhFI=;
        b=w9/E5IgdH/M6sFBo4BiFuMQBFl+9sSt1XR6FDNzKeV3/U1GjsYxysdcPM9VGfZUsId
         q2646MjsjwwTB+2rNp+BhAUBnL4YxYDf+JbX0w+jnqvUgdcNbbxRX7f9cIUP+JvTzfcU
         9sezaCaTDsSlXTjOMR0hZPR1A5/A3xyzLXvyI5GDuDX6sNY2PGF/D/B6XoxNmYkrwJnG
         6otZC+ohy5vnG3qKaaA/rzjNUYrL3JgXZdnsQ7vY1QvkFHOxA93nfk6EaHtOCK9lMPHm
         /ljpmw5jtD6RQlEQAo3+fE90shIWLfCVllm1iUkzXUYMHweMvBC3gGydHnO4AF/N+ST1
         xaRw==
X-Forwarded-Encrypted: i=1; AJvYcCWiQhZPiSapiSdLPrVPVa/C0RirhT93DNvtJGCSyeEgDD9wKO2CaL6BKtXnvym9jAH5rzNyvA43h0xZAzddZxzKrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfU6ndFzgoI//vUzDEk9r7fAyVOCKZUKDnipJnv8CgmTBeyUoa
	AI5lhwEe94K86Bezb2xPo+Jp1DZfhkgeBDy6kspCSSeI7Ar/WBCE93iIGs6Iqye2OZU=
X-Gm-Gg: ASbGncubNzifJKRa0JhOaheI+sIv4ukXlJCMFdWBJVYvhkcvp7120j61Xs+J+1lWg0e
	urBCOrrG0q0J7eqMQH7w6TqR1RLv+f77q/vAkGJ4zJSIiBNV+5P86b1ZIGQTRSOCIk7FA/LhlFO
	OcEZpkn8SzEXAzQEHLRN0/zJ2abtcJmCIcI3XQgtqeU1jVlfmuKWtfL4hrG21BY9w/o3NREUNEs
	Y1txji/jvfc5Oi3EiDKs82s5ckhEZ7xcCd8gfGJvdXSBcanTEywDsZ0hFjFYI6aifXFXs05X+OF
	A9EjWwLm3SHv4K2eourA6zlevVrrI1hF4gqChlP4rbuyn5U+lp3PEXA+m6uwh0teT/9VAB8sf+j
	sXEvRtw==
X-Google-Smtp-Source: AGHT+IEOmvfgxDBSjQyjTAsEbb9y2Sc2/DFcebPrTV7oNj2NnWeeNPPvSc2ZCRmRQYNSn7XQ7be7vg==
X-Received: by 2002:a05:600c:354b:b0:442:f44f:654 with SMTP id 5b1f17b1804b1-450d656016fmr22662535e9.33.1748603996269;
        Fri, 30 May 2025 04:19:56 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:55 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 6/8] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
Date: Fri, 30 May 2025 14:19:15 +0300
Message-ID: <20250530111917.1495023-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The first 128MB of memory is reserved on this board for secure area.
Update the PCIe dma-ranges property to reflect this.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none, this patch is new

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..1b03820a6f02 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -214,6 +214,11 @@ &sdhi2 {
 };
 #endif
 
+&pcie {
+	/* First 128MB is reserved for secure area. */
+	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
+};
+
 &pinctrl {
 #if SW_CONFIG3 == SW_ON
 	eth0-phy-irq-hog {
-- 
2.43.0


