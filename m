Return-Path: <linux-renesas-soc+bounces-6701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A4915276
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 17:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A111C223B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 15:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE5519B5B4;
	Mon, 24 Jun 2024 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiyRn8Bg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BED513D51A;
	Mon, 24 Jun 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243183; cv=none; b=aYzNgPnBdbcdMMzyfODJ7aUADZ/VhigOH/fi+fvkD8UM6MnaJ6STI29rBXxhU/H9BErPF/vbeNdxOCTz4mUGb0zSQe8A5zYf4CgM8+yHfzjrRg01za29EPH4yVEApmv1KekB2Ud1a944UqrRjp5mm6WZtlZoyiH7Lxl5zNHAS+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243183; c=relaxed/simple;
	bh=DZmNeV5KMbw0fJFkmSqqwSQCu3vdZLMdmAW23xCADuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lZBsz+l8UMcWo6VLWVsk6IwLNsWpN03u4nVqrGBFV9dwmZVKQn8/4jY4ENRa/eK0JZ/6IXHk9w6VbVrrrN88N6gfLebdy/PUAQ3Ek1u6NUU/bu1BS5J9DgYKUDSSZBSKfVoPBREQSIVDqVyvJNm7fM2HlpHih2JTMb7T0r15Z+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiyRn8Bg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421a1b834acso36633995e9.3;
        Mon, 24 Jun 2024 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719243180; x=1719847980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6U//+RVgIeCqwJ3C0P4UhiQlBybFgyaT6cUeM3+sifM=;
        b=aiyRn8Bgcf3XYMUUare4uqHTqsL/3J33NcMQgyPrr7T0Co75uHMvVMOJvtJZlq04Ks
         AxlL8wrpTVZeuyCOc0R3NDoYWPbaucqFc8+0OrdPzQX0CaS+mRN0ez2581PLvgeUO23u
         ssoJ98aTpOjPp8SOXOVowz2xjdanlhTzkDncBu+e6+bYN4zMSZfuutjMdXT3qh5QYK8E
         SM6Yt2hqQEJqMRRI5TZjfsKbapJkqo1B8yGrbLe6QbjBYV7GZ2xWDFAXOo1IQZNHcooL
         UoyTP29YLmOHZV376sE3u30xn0dXSO1W4FWODk4ZyPq7/Qdp6/z35WKISzGkZmRPkFis
         Cv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243180; x=1719847980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6U//+RVgIeCqwJ3C0P4UhiQlBybFgyaT6cUeM3+sifM=;
        b=cESaVtgI6bAGSrxhgW8WVpRzULxJMutbVuGBZkWJ+7CLw2B228eVUubJNdB8DluOGM
         v4eGGZ8ElSHfZgHd6/SFkH6KIONOm9Qn2vNEaSoF1/rLPxzp7jxvGx8MWaCf9nfO7xHh
         bYCFlBFDPSTh/Xef0KOIkJ5sTBLM8kvYp2Ni2Qslwmte0lvmwuWYNFkakxREHOTVqe3L
         u4vaAhimAK7Ih2gPrX6fVCsl8+eMn7K/P9rUN84A4EE8ieJyDNS1Gmxg2K9oRKOr5skG
         VTnbnRhH1h7kmnhoe9+g3Anj6rAEo9SDEpIXHLFaqETYMbG45gSzitjkPifpLPXLmBJH
         aVng==
X-Forwarded-Encrypted: i=1; AJvYcCVQskUMXHFlFKm3rbyKqeALm/qfgy/MfNW8SiqDP0CWXA9JjQbGlYTIJGYFDRuxlczInia94DnQeRzj3XH50LBwfyq9zwZNV8fShh7Qqcm1ljfILZq+x2iKo6ua46NikcPptteDnuZPJgBh1WSVOEDaDH7kMIKRga15mjfc0glBiov9nG4IsMymaxA=
X-Gm-Message-State: AOJu0Yy7Ds1XUv0yIvWH8VboB1koC5W/pzu5gyDokk2kb57AKiH3aKpG
	WDNyi9B88WT0o/cIVKoh9LxbfWeoLuUlpCLbhjoCSh41t2GGKwM1
X-Google-Smtp-Source: AGHT+IH9lAE3Ie72o1Yzk5aEFfBESLdttaf7f0TNeWYlZKqM2Ef+bfLUVu9ISy+M7sV+m2VuJmxGSg==
X-Received: by 2002:a05:600c:49a5:b0:423:499:a1e6 with SMTP id 5b1f17b1804b1-4248cc585d7mr35037265e9.29.1719243180149;
        Mon, 24 Jun 2024 08:33:00 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c315:5cc8:bc92:639])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b6121sm138294675e9.27.2024.06.24.08.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:32:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-mmc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] Add SD/MMC support for Renesas RZ/V2H(P) SoC
Date: Mon, 24 Jun 2024 16:32:26 +0100
Message-Id: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add SD/MMC support for Renesas RZ/V2H(P) SoC.

Below is the sample usage of using internal regulator:

SoC DTSI node:
sdhi1: mmc@15c10000 {
        compatible = "renesas,sdhi-r9a09g057";
        reg = <0x0 0x15c10000 0 0x10000>;
        interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
                        <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
        clocks = <&cpg CPG_MOD 167>,
                        <&cpg CPG_MOD 169>,
                        <&cpg CPG_MOD 168>,
                        <&cpg CPG_MOD 170>;
        clock-names = "core", "clkh", "cd", "aclk";
        resets = <&cpg 168>;
        power-domains = <&cpg>;
        status = "disabled";

        vqmmc_sdhi1: vqmmc-regulator {
                regulator-compatible = "vqmmc-r9a09g057-regulator";
                regulator-name = "sdhi1-vqmmc-regulator";
                regulator-min-microvolt = <1800000>;
                regulator-max-microvolt = <3300000>;
                status = "disabled";
        };
};

* Example of SDHI1 while using internal regulator:
** Board DTS:
&sdhi1 {
        pinctrl-0 = <&sdhi1_pins>;
        pinctrl-1 = <&sdhi1_pins>;
        pinctrl-names = "default", "state_uhs";
        renesas,sdhi-use-internal-regulator;
        vmmc-supply = <&reg_3p3v>;
        vqmmc-supply = <&vqmmc_sdhi1>;
        bus-width = <4>;
        sd-uhs-sdr50;
        sd-uhs-sdr104;
        status = "okay";
};

&vqmmc_sdhi1 {
	status = "okay";
};


* Example of SDHI1 while using GPIO regulator while internal regulator is present:
** Board DTS:
vccq_sdhi1: regulator-vccq-sdhi1 {
        compatible = "regulator-gpio";
        regulator-name = "SDHI1 VccQ";
        regulator-min-microvolt = <1800000>;
        regulator-max-microvolt = <3300000>;
        gpios = <&pinctrl RZG2L_GPIO(10, 2) GPIO_ACTIVE_HIGH>;
        gpios-states = <0>;
        states = <3300000 0>, <1800000 1>;
};

&sdhi1 {
        pinctrl-0 = <&sdhi1_pins>;
        pinctrl-1 = <&sdhi1_pins>;
        pinctrl-names = "default", "state_uhs";
        vmmc-supply = <&reg_3p3v>;
        vqmmc-supply = <&vccq_sdhi1>;
        bus-width = <4>;
        sd-uhs-sdr50;
        sd-uhs-sdr104;
        status = "okay";
};

v2->v3
- Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
- Added regulator-compatible property for vqmmc-regulator
- Added 'renesas,sdhi-use-internal-regulator' DT property
- Included RB tags for patch 2/3
- Moved regulator info to renesas_sdhi_of_data instead of quirks
- Added support to configure the init state of regulator
- Added function pointers to configure regulator
- Added REGULATOR_CHANGE_VOLTAGE mask

v1->v2
- Dropped regulator core API changes
- Updated DT binding
- Now controlling PWEN bit via regultor api

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
  mmc: tmio: Use MMC core APIs to control the vqmmc regulator
  mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC

 .../devicetree/bindings/mmc/renesas,sdhi.yaml |  30 +++-
 drivers/mmc/host/renesas_sdhi.h               |  13 ++
 drivers/mmc/host/renesas_sdhi_core.c          |  93 +++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 150 ++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 drivers/mmc/host/tmio_mmc_core.c              |   7 +-
 6 files changed, 293 insertions(+), 5 deletions(-)

-- 
2.34.1


