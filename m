Return-Path: <linux-renesas-soc+bounces-29860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMyEF/S6u2mtmwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:59:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C04F2C8380
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10C22304C174
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE813B531D;
	Thu, 19 Mar 2026 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HnCZs3H7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60C93B27FD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910524; cv=none; b=AMLRtaA6rhB+cIvlDZmD1jjVxYs6hInDr2EOp0oEfdiTNRupKoxIOUwCNnqvWWJreylk2g/YaNwDI1sjpPjOtHyvfAYqlbJlCeaj0zGULOu24+wv3k1dEVGEuJj9KIJVh8jLNLGRggKA5LytWp/GMmYciyAliw2ohhHfLltMl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910524; c=relaxed/simple;
	bh=et5jL/cRibBAX3o0PIutVRkFF1zipOw+jNI2NRL7g/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIBt41X1Sam7ml8jVqdNL/zQNyx9Nr648hqEV0x4nPAo5aeJucWmNneshhoX6dklw6CxZpjrfjNK8YU6Jqb2It3xk49KbAKEVDbJGArc9ikzDINeZ9CfoRC8ffm1VoU+DBUnsii7xzGHOAp1sCYqmdIsOrnkAmg3MgJxrdqoxyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HnCZs3H7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b49819938so330895f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910518; x=1774515318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4mLmKINUJPPhfhLDFCYo8I71VhXuqQ75QKges3DxwY=;
        b=HnCZs3H77mSpq+ERysMgkNetKicirYZKZCo+jYZz8OsJSQs7w+XM4jtE8Ht67lz+0D
         FB3/PL+SffYUqJtt5lw7Nhm57O0LqhQi/zRPu/i45YzA17N7l5+5RJtzGcQjxYRaS8to
         4Ox/+2d4HbD28CQhGbZcwHmnwphzi2byQVHIGFEnJ0hUqHoSm8SD6xx5O91XgkwisQrW
         KSgJO8x2zRJ2Io7cJbOkHNOJNY9FVPEWvZITjgLeotxNsyejEbHrKnc23PSRFYFX1B0U
         +Lo393ptxCskccv15qUP1O6Owq3q0DxssgdLX8/3oagVNmVgfLZAGRVk3ZTWa61hYcjw
         eA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910518; x=1774515318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J4mLmKINUJPPhfhLDFCYo8I71VhXuqQ75QKges3DxwY=;
        b=mh/Zr3RG/T7bK95ip+4RGLMfeBzVUoTHfMVoir9jRxWFTIWjd+YsxU5/dz7KLgMb7H
         TnHjV+SdpXGhbJVCQ137rjazeP/N9xoGcNwIL9VmXWB667g+1Zx4ZSoZwhebjflPpsIP
         V8euXbTnzVbtiZIPO2eFpqsGXPMZcEAaJr6jpedOMOLsTiqXVfM1OFfZXWXr2oUZ7fNu
         j+s49gS10JRLhhKb3WkC9y9UaZK8Kl6RNOBY0CMy7tB/YcjLVf9BlKzN24d06KaF4f+2
         bNJgZ1fSZKns+G6FPSPmvzdq8iyiLFCgiMQLuyJOKawVrsukYXd7ZTzWwC431V5XheQO
         uScw==
X-Forwarded-Encrypted: i=1; AJvYcCVgMICRzQP5STqm0a9ob7aymVHGNrDiFCry+yCtdB6yIzOx90B8pMXDkPwEPhrhEpUxjp8+Trr/LaGKkxbCx0CKaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjElZXQesXOdRFOh0dDsFVqjXzl+Pj98YxYSe1fUGEhPZm+u2
	wA+Gs4Xcdtvc+vZPszytUfQuPr5H/zQjwvdLqKrXb6DTEPcNa0Yg6CBHT1r1iaoqABI=
X-Gm-Gg: ATEYQzzdhe4SxB0MhJn2zFIFiT9H/xr5Bklp2Y3VfgsEgetDj0u8T6+f+PpymQm4aex
	pPDfjQsJ8OHgThb7dTxN0PQrz1AJlQb1LnY4hYECshdfUOG70ywWSM0tOU5fLrzjP1hZxC1h0pC
	FAdBZU3Ym++jpZzm82VmaM0GZcYivbhBGGB5T1o1OAZlZ3R1HDLa+l87bvYPJXNxzlCET0FUtif
	PIy/ATr+BHObyG8bFGhdHdmOS+yyq5Q/GprWU9CpgCI/oModcN2gj7tXBzwMeov9X7WDc70FlPv
	e1my8aqJJzNMaD71b1QdyzqqwEWhaTlS4HWMqGNkyMOahFJAtqnI3H3xCR62gblKUXnsZmAuDee
	VlWt3ARpybJJyupvt6B/2ohj2fTW64J2jU3KUHX5Iku8BdB7hUxETHnrdGcaNuBC/NdXi4XCLso
	SFhAUvgw+/30S+kyLdkTkk/TWF2WER1HsOVXCLVdYdVLe5
X-Received: by 2002:a05:6000:2f81:b0:439:cb9f:d635 with SMTP id ffacd0b85a97d-43b527cd28emr10637575f8f.46.1773910517748;
        Thu, 19 Mar 2026 01:55:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:11 +0100
Subject: [PATCH v6 5/5] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-5-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=42129;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=WzyG+wq5Kjy8gliXf+k/7mpAi84882OAA4TyB0iQQSQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7nvA8QCxk0stgLsO9ilWF1E9IkCx9XO3jK7+64Q
 0dYJAIqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57wAKCRB33NvayMhJ0bCQD/
 4qP6RlVH4FALe3gu7X9xvjJBQRlFr0Y5FTmInbeIAjW6lpSYlQWbvHahrrAq0Bo4XjFIlGRN71Gs19
 nYvbp3QyAIM6uQ4Enqntzr0bOSsDlkXfIKx790TuV4/g+TCSuwEZ73yDYcin9Oe1911CFqlrB6iSXE
 m+79Mb3mjvt0ezxKnWpZHcgrNQxR/GzvKkWDvomAvlkJocXqyaBT2gAQjV7LrtynEJ5Trpwg6OJYkJ
 sbjn9KOb7qYQcuFiHx2QfioGUkdNnWCDG2ouIwKQqIaLFxoe0eiSfyJ8VXwbgwMgtPoEBEFkfuQ1MF
 7vxsyeBo2KnDfq2vuuWx3AdUGizt7aktJhHXeh2r9VtZxuo1vD/q3SFBhRyo+b/1LMBbkiNHUl+2yZ
 N+1d9phNBuzaJ7onkQmppvu8xuDuGCSDnHGBgYzb2KCjCyeDxGh/XBSEUe4jka43ubUi2INuyjR7Jl
 aUzIRccE3pt/XKgv7p5XtAjINuOZUg+/y2Ycp+HhZmhnvZC2nIfO4DZELpj+gwggS1NvzKwdVeajEc
 mJWCZpS0wDto9PZf6EjlQLA3fXJkIYHeuQcpBCWNy+QeZ7eCjgYrWcXjEFax+YHe6TaxFM+bq641RW
 vO3TW9NHeuF6n9764Z59o3ncaTgGw8iZR0m8NVTsQCPaGQlu6Vd6LTyPeFTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29860-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,outlook.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C04F2C8380
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: KancyJoe <kancy2333@outlook.com>

Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
on the Qualcomm Snapdragon 8 Gen 3 platform.

The design is similar to a phone without the modem, the game control
is handled via a standalone controller connected to a PCIe USB
controller.

Display panel support will be added in a second time.

Signed-off-by: KancyJoe <kancy2333@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1551 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   46 +-
 3 files changed, 1575 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 02921a495b2c..b0ec17907113 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -353,6 +353,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
 
 sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
 sm8650-hdk-display-card-rear-camera-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo sm8650-hdk-rear-camera-card.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
new file mode 100644
index 000000000000..0dc994f4e48d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -0,0 +1,1551 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2025, Kancy Joe <kancy2333@outlook.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm8650.dtsi"
+#include "pm8550.dtsi"
+#include "pm8550b.dtsi"
+#define PMK8550VE_SID 8
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+/delete-node/ &rmtfs_mem;
+/delete-node/ &hwfence_shbuf;
+
+/ {
+	model = "AYANEO Pocket S2 (Pro)";
+	compatible = "ayaneo,pocket-s2", "qcom,sm8650";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart15;
+		serial1 = &uart14;
+	};
+
+	wcd939x: audio-codec {
+		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	fan: fan {
+		compatible = "pwm-fan";
+
+		interrupts-extended = <&tlmm 14 IRQ_TYPE_EDGE_FALLING>;
+
+		pwms = <&pm8550_pwm 3 50000>;
+
+		fan-supply = <&fan_pwr>;
+
+		#cooling-cells = <2>;
+		cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;
+
+		pinctrl-0 = <&fan_int>, <&pwm_fan_ctrl_active>;
+		pinctrl-1 = <&pwm_fan_ctrl_sleep>;
+		pinctrl-names = "default", "sleep";
+	};
+
+	fan_pwr: fan-pwr-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "fan_pwr";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpios = <&tlmm 125 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&fan_vdd>;
+
+		pinctrl-0 = <&fan_pwr_pins>;
+		pinctrl-names = "default";
+	};
+
+	fan_vdd: fan-vdd-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "fan_vdd";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&fan_vdd_pins>;
+		pinctrl-names = "default";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,sm8650-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&redriver_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+
+	upd720201_avdd33_reg: upd720201-avdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "upd720201_avdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&tlmm 123 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&upd720201_avdd33>;
+		pinctrl-names = "default";
+	};
+
+	upd720201_vdd10_reg: upd720201-vdd10-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "upd720201_vdd10";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+
+		gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&upd720201_vdd10>;
+		pinctrl-names = "default";
+	};
+
+	upd720201_vdd33_reg: upd720201-vdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "upd720201_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&upd720201_vdd33>;
+		pinctrl-names = "default";
+	};
+
+	sound {
+		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		model = "SM8650-APS2";
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC1", "MIC BIAS1",
+				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"AMIC4", "MIC BIAS3",
+				"AMIC5", "MIC BIAS4",
+				"TX SWR_INPUT0", "ADC1_OUTPUT",
+				"TX SWR_INPUT1", "ADC2_OUTPUT",
+				"TX SWR_INPUT7", "DMIC1_OUTPUT",
+				"TX SWR_INPUT8", "DMIC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd939x 0>,
+					    <&swr1 0>,
+					    <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+			codec {
+				sound-dai = <&wcd939x 1>,
+					    <&swr2 0>,
+					    <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&right_spkr>,
+					    <&left_spkr>,
+					    <&swr3 0>,
+					    <&lpass_wsa2macro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		dp-dai-link {
+			link-name = "DisplayPort Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>, <&bt_default>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4i_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddio1p2-supply = <&vreg_l3c_1p2>;
+		vddaon-supply = <&vreg_s2c_0p8>;
+		vdddig-supply = <&vreg_s3c_0p9>;
+		vddrfa1p2-supply = <&vreg_s1c_1p2>;
+		vddrfa1p8-supply = <&vreg_s6c_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob1>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l11-supply = <&vreg_s1c_1p2>;
+		vdd-l12-supply = <&vreg_s6c_1p8>;
+		vdd-l15-supply = <&vreg_s6c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		qcom,pmic-id = "b";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2720000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_1p8: ldo7 {
+			regulator-name = "vreg_l7b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_1p8: ldo8 {
+			regulator-name = "vreg_l8b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_1p2: ldo11 {
+			regulator-name = "vreg_l11b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p2: ldo14 {
+			regulator-name = "vreg_l14b_3p2";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b_2p8: ldo16 {
+			regulator-name = "vreg_l16b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1c_1p2>;
+		vdd-l2-supply = <&vreg_s1c_1p2>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "c";
+
+		vreg_s1c_1p2: smps1 {
+			regulator-name = "vreg_s1c_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1348000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2c_0p8: smps2 {
+			regulator-name = "vreg_s2c_0p8";
+			regulator-min-microvolt = <852000>;
+			regulator-max-microvolt = <1036000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3c_0p9: smps3 {
+			regulator-name = "vreg_s3c_0p9";
+			regulator-min-microvolt = <976000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4c_1p2: smps4 {
+			regulator-name = "vreg_s4c_1p2";
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1280000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5c_0p7: smps5 {
+			regulator-name = "vreg_s5c_0p7";
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6c_1p8: smps6 {
+			regulator-name = "vreg_s6c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-name = "vreg_l3c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l3-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "e";
+
+		vreg_l3e_0p9: ldo3 {
+			regulator-name = "vreg_l3e_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+		vdd-l3-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g_0p91: ldo1 {
+			regulator-name = "vreg_l1g_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g_0p91: ldo3 {
+			regulator-name = "vreg_l3g_0p91";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+		vdd-l2-supply = <&vreg_s3c_0p9>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "i";
+
+		vreg_s4i_0p85: smps4 {
+			regulator-name = "vreg_s4i_0p85";
+			regulator-min-microvolt = <852000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_0p88: ldo1 {
+			regulator-name = "vreg_l1i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_0p88: ldo2 {
+			regulator-name = "vreg_l2i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_1p2: ldo3 {
+			regulator-name = "vreg_l3i_0p91";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&cpu2_top_thermal {
+	trips {
+		cpu2_active: cpu2-active {
+			temperature = <38000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu2_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&cpu3_top_thermal {
+	trips {
+		cpu3_active: cpu3-active {
+			temperature = <38000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu3_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&cpu4_top_thermal {
+	trips {
+		cpu4_active: cpu4-active {
+			temperature = <38000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu4_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&cpu5_top_thermal {
+	trips {
+		cpu5_active: cpu5-active {
+			temperature = <38000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu5_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&cpu6_top_thermal {
+	trips {
+		cpu6_active: cpu6-active {
+			temperature = <38000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu6_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&cpu7_top_thermal {
+	trips {
+		cpu7_active: cpu7-active {
+			temperature = <38000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu7_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu0_cooling_maps {
+	map1 {
+		trip = <&gpu0_active>;
+		cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+	};
+};
+
+&gpu1_cooling_maps {
+	map1 {
+		trip = <&gpu1_active>;
+		cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+	};
+};
+
+&gpu2_cooling_maps {
+	map1 {
+		trip = <&gpu2_active>;
+		cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+	};
+};
+
+&gpu3_cooling_maps {
+	map1 {
+		trip = <&gpu3_active>;
+		cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+	};
+};
+
+&gpu4_cooling_maps {
+	map1 {
+		trip = <&gpu4_active>;
+		cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+	};
+};
+
+&gpu5_cooling_maps {
+	map1 {
+		trip = <&gpu5_active>;
+		cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+	};
+};
+
+&gpu6_cooling_maps {
+	map1 {
+		trip = <&gpu6_active>;
+		cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+	};
+};
+
+&gpu7_cooling_maps {
+	map1 {
+		trip = <&gpu7_active>;
+		cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+	};
+};
+
+&gpu0_trips {
+	gpu0_active: trip-active {
+		temperature = <38000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+};
+
+&gpu1_trips {
+	gpu1_active: trip-active {
+		temperature = <38000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+};
+
+&gpu2_trips {
+	gpu2_active: trip-active {
+		temperature = <38000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+};
+
+&gpu3_trips {
+	gpu3_active: trip-active {
+		temperature = <38000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+};
+
+&gpu4_trips {
+	gpu4_active: trip-active {
+		temperature = <38000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+};
+
+&gpu5_trips {
+	gpu5_active: trip-active {
+		temperature = <38000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+};
+
+&gpu6_trips {
+	gpu6_active: trip-active {
+		temperature = <38000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+
+};
+
+&gpu7_trips {
+	gpu7_active: trip-active {
+		temperature = <38000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+		};
+	};
+};
+
+&i2c6 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	typec-mux@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+
+		vcc-supply = <&vreg_l15b_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_ss_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&iris {
+	status = "okay";
+};
+
+&lpass_wsa2macro {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	status = "okay";
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1i_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_port0 {
+	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
+	usb-controller@0 {
+		compatible = "pci1912,0014";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		avdd33-supply = <&upd720201_avdd33_reg>;
+		vdd10-supply = <&upd720201_vdd10_reg>;
+		vdd33-supply = <&upd720201_vdd33_reg>;
+
+		pinctrl-0 = <&gamepad_pwr_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l3e_0p9>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+	vdda-qref-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	volume_up_n: volume-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>;
+	};
+
+	pwm_fan_ctrl_active: pwm-fan-ctrl-active-state {
+		pins = "gpio9";
+		function = "func1";
+		bias-disable;
+		power-source = <0>;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+
+	pwm_fan_ctrl_sleep: pwm-fan-ctrl-sleep-state {
+		pins = "gpio9";
+		function = "normal";
+		output-high;
+		bias-disable;
+		power-source = <0>;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+
+	sdc2_card_det_n: sdc2-card-det-state {
+		pins = "gpio12";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8 V */
+	};
+};
+
+&pm8550_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+		label = "Power Status";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&pm8550b_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8650/ayaneo/ps2/adsp.mbn",
+			"qcom/sm8650/ayaneo/ps2/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8650/ayaneo/ps2/cdsp.mbn",
+			"qcom/sm8650/ayaneo/ps2/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&reserved_memory {
+	lost_reg_mem: lost-reg-mem {
+		reg = <0 0x9b09c000 0 0x4000>;
+		no-map;
+	};
+
+	hwfence_shbuf: hwfence-shbuf@d4e23000 {
+		reg = <0 0xd4e23000 0 0x2dd000>;
+		no-map;
+	};
+
+	splash_region: splash-region {
+		label = "cont_splash_region";
+		reg = <0 0xd5100000 0 0x2b00000>;
+		no-map;
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep>, <&sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9395 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010e00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
+		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
+		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
+		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
+		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
+		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5 9>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9395 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010e00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9395 TX Port 1 (ADC1,2,3,4)         <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 2 (ADC3,4 & DMIC0,1)   <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3 (TX SWR_INPUT 4,5,6,7)
+		 * WCD9395 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4 (TX SWR_INPUT 8,9,10,11)
+		 */
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l3c_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR3 Port 1 (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR3 Port 2 (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR3 Port 3 (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR3 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR3 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR3 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l3c_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR3 Port 4 (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR3 Port 5 (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR3 Port 6 (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR3 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR3 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR3 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&tlmm {
+	/* Reserved I/Os for NFC */
+	gpio-reserved-ranges = <32 4>, <36 1>, <38 6>, <74 1>;
+
+	bt_default: bt-default-state {
+		bt-en-pins {
+			pins = "gpio17";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sw-ctrl-pins {
+			pins = "gpio18";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
+	fan_pwr_pins: fan-pwr-state {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	fan_vdd_pins: fan-vdd-state {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	fan_int: fan-int-state {
+		pins = "gpio14";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	upd720201_avdd33: upd720201-avdd33-state {
+		pins = "gpio123";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	upd720201_vdd10: pd720201-vdd10-state {
+		pins = "gpio122";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	upd720201_vdd33: upd720201-vdd33-state {
+		pins = "gpio121";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gamepad_pwr_en: gamepad-pwr-en-active-state {
+		pins = "gpio28";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1c_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+/*
+ * DPAUX -> WCD9395 -> USB_SBU -> USB-C
+ * eUSB2 DP/DM -> PM85550HS -> eUSB2 DP/DM -> WCD9395 -> USB-C
+ * USB SS -> NB7VPQ904MMUTWG -> USB-C
+ */
+
+&usb_1 {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1i_0p88>;
+	vdda12-supply = <&vreg_l3i_1p2>;
+
+	phys = <&pm8550b_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3i_1p2>;
+	vdda-pll-supply = <&vreg_l3g_0p91>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index f172c78367c7..ff419255fef7 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3917,7 +3917,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -7847,7 +7847,7 @@ cpuss3-critical {
 			};
 		};
 
-		cpu2-top-thermal {
+		cpu2_top_thermal: cpu2-top-thermal {
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -7871,7 +7871,7 @@ cpu2-critical {
 			};
 		};
 
-		cpu3-top-thermal {
+		cpu3_top_thermal: cpu3-top-thermal {
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -7895,7 +7895,7 @@ cpu3-critical {
 			};
 		};
 
-		cpu4-top-thermal {
+		cpu4_top_thermal: cpu4-top-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -7919,7 +7919,7 @@ cpu4-critical {
 			};
 		};
 
-		cpu5-top-thermal {
+		cpu5_top_thermal: cpu5-top-thermal {
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -7943,7 +7943,7 @@ cpu5-critical {
 			};
 		};
 
-		cpu6-top-thermal {
+		cpu6_top_thermal: cpu6-top-thermal {
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -7985,7 +7985,7 @@ aoss1-critical {
 			};
 		};
 
-		cpu7-top-thermal {
+		cpu7_top_thermal: cpu7-top-thermal {
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -8248,14 +8248,14 @@ gpuss0-thermal {
 
 			thermal-sensors = <&tsens2 1>;
 
-			cooling-maps {
+			gpu0_cooling_maps: cooling-maps {
 				map0 {
 					trip = <&gpu0_alert0>;
 					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
-			trips {
+			gpu0_trips: trips {
 				gpu0_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <1000>;
@@ -8281,14 +8281,14 @@ gpuss1-thermal {
 
 			thermal-sensors = <&tsens2 2>;
 
-			cooling-maps {
+			gpu1_cooling_maps: cooling-maps {
 				map0 {
 					trip = <&gpu1_alert0>;
 					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
-			trips {
+			gpu1_trips: trips {
 				gpu1_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <1000>;
@@ -8314,14 +8314,14 @@ gpuss2-thermal {
 
 			thermal-sensors = <&tsens2 3>;
 
-			cooling-maps {
+			gpu2_cooling_maps: cooling-maps {
 				map0 {
 					trip = <&gpu2_alert0>;
 					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
-			trips {
+			gpu2_trips: trips {
 				gpu2_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <1000>;
@@ -8347,14 +8347,14 @@ gpuss3-thermal {
 
 			thermal-sensors = <&tsens2 4>;
 
-			cooling-maps {
+			gpu3_cooling_maps: cooling-maps {
 				map0 {
 					trip = <&gpu3_alert0>;
 					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
-			trips {
+			gpu3_trips: trips {
 				gpu3_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <1000>;
@@ -8380,14 +8380,14 @@ gpuss4-thermal {
 
 			thermal-sensors = <&tsens2 5>;
 
-			cooling-maps {
+			gpu4_cooling_maps: cooling-maps {
 				map0 {
 					trip = <&gpu4_alert0>;
 					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
-			trips {
+			gpu4_trips: trips {
 				gpu4_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <1000>;
@@ -8413,14 +8413,14 @@ gpuss5-thermal {
 
 			thermal-sensors = <&tsens2 6>;
 
-			cooling-maps {
+			gpu5_cooling_maps: cooling-maps {
 				map0 {
 					trip = <&gpu5_alert0>;
 					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
-			trips {
+			gpu5_trips: trips {
 				gpu5_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <1000>;
@@ -8446,14 +8446,14 @@ gpuss6-thermal {
 
 			thermal-sensors = <&tsens2 7>;
 
-			cooling-maps {
+			gpu6_cooling_maps: cooling-maps {
 				map0 {
 					trip = <&gpu6_alert0>;
 					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
-			trips {
+			gpu6_trips: trips {
 				gpu6_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <1000>;
@@ -8479,14 +8479,14 @@ gpuss7-thermal {
 
 			thermal-sensors = <&tsens2 8>;
 
-			cooling-maps {
+			gpu7_cooling_maps: cooling-maps {
 				map0 {
 					trip = <&gpu7_alert0>;
 					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
-			trips {
+			gpu7_trips: trips {
 				gpu7_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <1000>;

-- 
2.34.1


