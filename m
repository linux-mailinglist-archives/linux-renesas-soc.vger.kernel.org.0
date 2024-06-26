Return-Path: <linux-renesas-soc+bounces-6807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D459182A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 563E41F219EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DD3181D07;
	Wed, 26 Jun 2024 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3h5Wwy/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA27181326;
	Wed, 26 Jun 2024 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409083; cv=none; b=K6ySi3J3vQdnWx3bJcsvc2JDNn752iz0SiOnYBtLpxy5cI+dfVNGReVy0/MyaHstfwJhmyb5nFfvBWgSoGN3G0lDLizFArMA+OUVuN2ykBLTEoZZs5wIJjn/ayFuMKGceJvX9zok7ZVTT4rdrRb0xMRJZbcyeEgOCrRHp6X3Jm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409083; c=relaxed/simple;
	bh=MBcmOktFzi2KafDLiII6/KSgobp4c2VdpS/gKLWHAN4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D9SvIY+frJN6DZJRxEvyxd7OIb0aHsZSeNOK7/nY8sEyyw2o+YZ7m7mx6Y16ysPuRR2QVROS4fEPiol7nq8+ir11Sa5ArgdEDMyTmK59TtYzjxvRNwXoymEjAhP98PHeI1de3jprF8L2bXk0AMkrUYsn47/JrrGyxKhgfoKu8gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3h5Wwy/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so14373605e9.1;
        Wed, 26 Jun 2024 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719409080; x=1720013880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYo3qlKyAre1DGOMVk4WqSmwqyEhroDDDLjT2zWFoKs=;
        b=J3h5Wwy/SIgJL7gBBr4vIPEjr8izACknb1ggr7J3UbVDkKPZDrp4U5uaZF1E91bHIa
         UQRfTisAfJF+Vl3U9WoAFgIwa4dp29YGde/jYx8jvXiLvpE2UpFZcu1yIWiYA9qk31Wk
         pF3CNOO0dA00KYb29XuJ9MVSitWx2cSz+RpzkVDTmgkb+vRu5kTl8FvLjnwvj1QpSNHz
         x6x5WaXh0q4dF31cd3zJ8EYcfvJCKHZzJ78sHwED0SIINMD99n7X8Boi7v3X4GQZ0be7
         sWhobTG1k8L5vpTsjNvIyHy6+zvoe36r34I3DBOYaI9N/xnY5OcMm5PHbCvb8G3kFDn7
         6QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409080; x=1720013880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYo3qlKyAre1DGOMVk4WqSmwqyEhroDDDLjT2zWFoKs=;
        b=mEcrYhaR8TK2VwsPYVYxvK7fLkDWAavIxukxe6JuyqKD6osl1V5kV8D8VEt9h1hqiA
         iwexSpXIs66u24SvKA30pNtu4bP90UZjznrc3HV6edSa5XzeiOA1FhuCIjG2iWe1oulM
         dTX7TxYThghDmlB3TRTJ3vtQGCrP/+AKon7PR1wo49z5KWKb74woIe7yjIdf8lJCOQsx
         5pTR5jcdDabkBfH1QAKchkUratwz4He1/NpztLqXtoS+YsSqaIyyVzwzd43Im3jQTcLj
         HwC41AK+s+9ZWjK5OO/6TLEHhTFYu5imBcQOKq5ADB/+Fxkqon8IJXhRtWBMSKHyyMYV
         /CcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcfkeAmVl4g+8jHZYuTTk4L9VRZ1VBC9DnePONvYyHmWw6IG/m8HEj4t57Ij89slMsXslq70YL3o70lP4j1lqxn8M8etkPkts9VYXrbFuJSwh11puz+pw/JihXk5BRTtwoWDXg2bD9AB/qiLIb1LeHIHTm/kaWAkJDOldYVlOU62hqJ/gp57WS/94=
X-Gm-Message-State: AOJu0Yyg1XKMrIPmHIY/gcdx6913pttIeMUAVzEkHrfOoqMAMar5xrEx
	mdFKbaaJjAZAWtyr1hAvKsVe07sRsufBc+qQoVN5wzQPOamb52kO
X-Google-Smtp-Source: AGHT+IGdAeO73+Cc4D+Z2jsH4bvNwXJFnwYcxiijNgEb3AdpJerHkUMlTE6+nuHiThkgNMANQP6PDg==
X-Received: by 2002:a05:600c:2154:b0:424:aa64:e9ad with SMTP id 5b1f17b1804b1-424aa64ea56mr19062145e9.2.1719409080034;
        Wed, 26 Jun 2024 06:38:00 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8246297sm27107225e9.8.2024.06.26.06.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:37:59 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add SD/MMC support for Renesas RZ/V2H(P) SoC
Date: Wed, 26 Jun 2024 14:23:38 +0100
Message-Id: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v3->V4
- Dropped 'renesas,sdhi-use-internal-regulator' property
- Defined vqmmc-regulator in top level
- For special handling of internal regulator now using of_device_is_available()
- Fixed comments from Claudiu
- Rebased patch on top of https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240626085015.32171-2-wsa+renesas@sang-engineering.com/

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

 .../devicetree/bindings/mmc/renesas,sdhi.yaml |  26 +++-
 drivers/mmc/host/renesas_sdhi.h               |  13 ++
 drivers/mmc/host/renesas_sdhi_core.c          |  98 ++++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 147 ++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 drivers/mmc/host/tmio_mmc_core.c              |   7 +-
 6 files changed, 291 insertions(+), 5 deletions(-)

-- 
2.34.1


