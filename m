Return-Path: <linux-renesas-soc+bounces-19238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD2AF97D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 18:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8B4358922F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587C82D5A0A;
	Fri,  4 Jul 2025 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m8REOPak"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE1D2DC326
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645693; cv=none; b=tTrwGU42obwE04EeMP+ShBUMsjQ3sx8/53DGesPi9bKjLTVLS3k2aDCShy8IAEShtm8KGkJtfi+Nt5t4XCFpHzh/L3hdJyKvLsf4sdmDkl9zenHWkqcFQek+/Wra/AFWd5UL1PZYkvjc+HBJ27m5NF78Fpy8F1m+qjcRMFN2M6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645693; c=relaxed/simple;
	bh=gR9Wn5lFTL1dH5LwfqEgIlxPVfhpUTsJpw7A7wwQ7mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAiel8vEc0id8BbgBrmVQZIyFBHiMN/e27lWcp1q7y8GmRNihOBBefdLMACDGa8pwxvke6UuDXxJWDoQxOMDzNGPRwnKtYfWcKo6jv9+n+lp743pMaFhH/VazC+/i9Gvrh76sdzOfGnWnWncDJzuJ3rb6ZwclzfXc00I+C009eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m8REOPak; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb5ec407b1so186011266b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 09:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645689; x=1752250489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkNu2VPdZ05H1WkOeVUqdreqBFI4sSTNmK5wwP9pjsA=;
        b=m8REOPakEYChY/mVGl38GgbbgXq8xyhEg1Or896sgrIw5Qzg1QW8elA6BNjvsChfYT
         UFLIQDjY1bXM3NbgpofiqjFzcJvWpJEsIzIZelVjooXtoBfKkHKY7FsTCHKeA8mwUpu/
         NOCQDWBd1vrZy61n8WxjirBvbk05J1Z9qph2yinwT/CdxV9eNucZFu7ljm3+nKXoZh6n
         J7XFM2c+NHh+B3QPw0E1fTXCbQvUQRuSHCxqmZRlfXjRZwgGNmdR9XKpo7kc/dv6GZ+e
         oXyMEpHgqwH/F7u4wbRgpRyW6kLmblDiseIaCrPuIqtWC7Ec4Sn9EVV0baoJ1UYM9+JI
         uukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645689; x=1752250489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkNu2VPdZ05H1WkOeVUqdreqBFI4sSTNmK5wwP9pjsA=;
        b=Az5XbY/HEkIF0bFP/NF1Uumn8PgxGV/zUGNW2xDaq6l0hmwGupav4tlcOnvnaAm1a5
         xnkAfRqbhfukNjL/MU+lkqRU7cXeFxkmRxHk3ujcQjELXQ3Vcy1gFAAj48mRRCzYPuYt
         Oe8a/cikIquFNBI6MZqh5Mt70O8eB7td0oA9/vZtvunSyiw3UVhdYH0Tq046kUS79qlV
         cIckncB+XEGxSm7CKbI8sxJRTR95FlQFYlIEo7eaak7GX1eVspdaBmM32rOZyeoPpyiV
         ISPsyJKhGwWQPLFK45nX0wPLH7zdR6PzuDgaDEKxTZywwKkp3480KowNvhRfHe7swQVH
         xH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL9mC6jEEp4e9llra6HKPg4Igxch5v1auQYAW1PvuR6jJ6a/WBgKBYgnJya8b66FMvZoAydsgBW16aseZFyXCUbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaIwPgvnx5qHeYjMPSWoT28t1SRyIRCfZsXLyBBAlopx6LByd
	+h5yeUufedOMUFGJjIig/Vc8USieIBuG0MZZaVXOA30WJiESDoHAwNABnxo9p1xVWz4=
X-Gm-Gg: ASbGncutr600Uw60UEIVHVCW8SCdKKTwsT8mEvpx5SprNdH2h6hRGxmKVN8uZjDymNl
	djqUUBN85uRbXDMuhp1/m/extkhakvEpkty/Nr66j5x3e+LaNeR0K/nZjYLzcglXL1BcUwdeJ7+
	UsCpeQeIa4mqGiWVehegc6rm7RjYxefzCdaLsW+eIEZEKNtySoO/M+uQaLRQ7Y04rpPtr8XeNyb
	taQ1pVQWX5x9GqMMm+C4poJhEvwflCvWExw5CBEASMNptkUc9sQqQDJorn/wLlDvItC6TDT6cEM
	jRmaH7kEvgpTgW5CH4y9LdVS4VpqNcf4ZtoBnfejispA9pI1NUJmnMEqkTHv5uK2oPMMin74Snu
	HF+MPsX1964j46ko=
X-Google-Smtp-Source: AGHT+IF8OBJYopz78uTu4zjr9M4q7cZs8YsJ5lxwKzH9GFcsxUYxUdsvzpbrV/sgFDsSrcOtLDUf2g==
X-Received: by 2002:a17:907:3d0c:b0:ae3:163a:f69a with SMTP id a640c23a62f3a-ae3fbd13e86mr283273366b.33.1751645689346;
        Fri, 04 Jul 2025 09:14:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
Date: Fri,  4 Jul 2025 19:14:07 +0300
Message-ID: <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
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

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

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


