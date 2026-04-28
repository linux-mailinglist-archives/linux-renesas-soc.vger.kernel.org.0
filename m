Return-Path: <linux-renesas-soc+bounces-31717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCNXNAMB8WnubgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:48:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 539CC48AD61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 932E930BDD97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 18:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D125E47B43E;
	Tue, 28 Apr 2026 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZMSvImbf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724C47B432
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 18:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401592; cv=none; b=pfMIIr03eZj8lcsesknpV9nMhkVXCq+5xzwgIY0rk3BWOcO0SZLFb0D6Wg1EcwOGyI+hitPDEhSLpU30eSvtxb5vqMpW7Tua4pQwj5Qoo3QHoD91tO4A52ScSOQea+wp7BdkYx8kkma4XyFChU9hKixay6u4OpQiVItNb3Lv7jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401592; c=relaxed/simple;
	bh=IxrxX1BrQIc8BraBVBGMy3JlOpCxfRsPNpWphWVJfy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fmnBHnb6Awv03NiF0/LvCPypHoBACjRauHwlCnzlvBEml+Ypa7z0t/Ied33v3dLFz8e+jhCJD0/utf8Bw3h3QIoThGmdTnTp3d/idymnYQsDyAcATUzyt8XQKL8oiL90/tFeJFF4fuPDztenx9MKlRVEmlGsupe99AmEpG4kUkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZMSvImbf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so69540265e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 11:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777401589; x=1778006389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1J9ChVvAYhsNDwl0OoFtnw7HfmuTxcHM4sfxG0H8HRs=;
        b=ZMSvImbf5pQtpoxGK7f8b4ZeTPhJJuTNXQ9VH229K5tzhUoNrAcSOIo4l7acsnhlgq
         ioLoIt48gS0tlpxMu9ROm3gL5DoHFnY2I1ERV+wFGHx4JJlL5MjdpJMFpiUm8KrhQBbo
         XbQ/6p3UQxcXZsNBbkdqIXF6/E6MZfVSv9rIYaue3f7ke8ZIzuL8PCnnJcWbk3rKjlqz
         uMDUjB1phFzC3alUDepDXH1ILhlTQGTBMKsJFl7MaxMd6AGvOkJmDh0pVXcgMxeHeHxt
         ZMkyGc9SHIKCR/wtF70XA6SpaWJaQDeVPhu1LutoHpFVRCxPZgVG/JSdaeQImoL8QOvG
         Uwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401589; x=1778006389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1J9ChVvAYhsNDwl0OoFtnw7HfmuTxcHM4sfxG0H8HRs=;
        b=Frhi70fHKsLUwbPndtYp3vccKHdvRYQi3ni3Ba2meR3RDcZ2YUqCnppKiBBvTUeVRm
         HvrdnVvNCx7aFpErxfIRowIX274ksfq4KC4iVYdPlTfPhVkqM4s6oYCURpp7ONVRQzz5
         PmEUKowS6xPCi0oMO/MtiE2L4mgHU8VJzVh/jBTHhQwPRadpLKyo5ttE7QQMpYslEsbF
         9z3wzPKYEAmFjvN0V3zdptYyUsPJ6d77s4aAgLRH9mCChSqKedYTeDfF65RawbG4XJt2
         F2mTCT//CRZIp6TubyveFzcTipExHT74sMu7Qnyo4CnoOLHEMfQB8oCaijvw4mAvTMuT
         3s7A==
X-Forwarded-Encrypted: i=1; AFNElJ8Rpr4MAopNWUtgZl32rSOA3WX4dX9kFj58vxIhzw7o/Y/a5P4lH5oSsxnLUthcYSQCait5AcW8VSQSJhPfkKiO1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtKDbANM+stGn6cMlz9j6jIsRs+NJ50oZ3KACjlQV+bv6Gf1Yt
	vd8BTzsYjX/mDWo9C6Q6dKUpk+AQm58j6l/fmxU+jZEZOvlxHnyar3iOu2nQpaeIPew=
X-Gm-Gg: AeBDieuidA5c+PmE1uDVNwFP4ecJIfnVeu308JUQz7NKlBz1YeTjQQyJ3UBNNwQA/Af
	lZwbg+pvt8QRxJVmXI21YXSLPPiFBhWBTaeWskO+W+bDTWudmIA/27c5FZu+aEuoeDfUuH3sjn1
	MOFmkqvXstekmlm9vlRGwon304riQSSfX/Dk6q5KfUeUqfhIjr7Ohe36Pn0BwKE7fh1ApR615aT
	UGyo+S3+CLltqWAcgCoPL794Bu/aC4lH+vgcF58GXxJ23zS2w+LQ0oEDygr95xsKZ4KRUSaFY+0
	Tjb2cvxPouK1LqDV1q6CGrQX1B1Vu3ZBfhDvD2hRXnnIkTAf1bd/utrPDa8aaHMzpaovGaXuoIz
	YQR6tBdNXJhltg5UMv3lRbWoCjg3FJKtU05FpXamnqBRraIggNqHSdLfDF7MMrrYYGPn8JhVmJe
	vShajL0/93VkUmDlRple5JTGHVHP+CYe1t7Q7YKg4ccaubxM0XssbLTcc=
X-Received: by 2002:a05:600d:d:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48a77b1333fmr57804205e9.17.1777401589017;
        Tue, 28 Apr 2026 11:39:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c0ab0sm7902798f8f.18.2026.04.28.11.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 11:39:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Apr 2026 20:39:43 +0200
Subject: [PATCH RFC] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO7+8GkC/52PQU7DMBBFrxLNmkG249hOtkgcgC3qInYmxZTEw
 XYjoqp3x0CEWFYs/+jr/TcXSBQ9JeiqC0RaffJhLoHfVeBe+vlI6IeSQTChmBQGc1i8wzQZ1TD
 st36mgEtwJ8qYBA4+LW/9hkPGpm6t1S1ZzVoouCXS6D++p57h6fEBDj/HdLav5PLXyF6L9H4uI
 nnv/np01Y0W6TjVhkk0WsmxSIgi0a0c/j51O2zTujFYM8OJ9MhJNP9mRVVL3iJpIZUmMVg27iz
 bJ0IXpsnnrlr1PcfoOByu108ejoYiogEAAA==
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8473;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=NjCVZ0MUAxxtiNkAuOdkmoloIeA5+2vc/DvtYYe3mGA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8P7z55jmK99Lw1ZWLZ7Cl36b6DXaovw74PDdCfj7
 lVB1ZYmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafD+8wAKCRB33NvayMhJ0cabD/
 0WoqXKWQUPx+EeLuXESbAe6FW9Ygov2S52dhJNFNvMJs0eeKvDaY1PxvSR+5Xz870y8UE4JDAFRb12
 rqQdG2CdGtZc60TkqLSUfUw2L6/ruFfRrIspSgXbdW2W9Ngug9Wj2d6azHM5tAAZAYyrqABZ7KXrS7
 lnmPzYnh8gCOLN0T3rMOSPX36jSY4wjdtIe3KDVQHR3MyMQTLB1OrJ/yPIUJ2w1AUUL2NpsQLK8mFH
 sUoaOsOZgbVoO6/kznPzCQScdg5sDUWIRv/vmGRfXf56KV3zEcHD//Ko6qa7kVDe7qL5j54zjpPerA
 o+AO4rPGi6TEcFsG+2e4+tfhvwLDd7EX/SnyBxDO0qHedy+eBsX8Rj26xFo2yyhHg1n1jOGHRVww6f
 B98YBR2LbZ1bu/trxn/7EA4d1vQrhkPKzLaJxDR16i6hhWx5gcche5TGkGodQcDhpO9lFvtHAEanb8
 lqEOzbeH25LIhILI+IntPtiYknJXJgjZwVAYja9yh3XLaIA5QJHwCUqsfkBmNDUyvRnf66CsnA5BPS
 BZ9hHocpbv5oT9oulyJ90FNBhfN767zsVqIEpBKzFMTlAz4jh2+rJSswv+zY1rYOdDfTVP7bxxg+Nm
 knhA6nk1Wv9CBTuvlmCxahSJIGxhpRl6ZHv5jgbjOcc8TN/REr7W4bvMJx4g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 539CC48AD61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31717-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.884];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: KancyJoe <kancy2333@outlook.com>

Add nodes for the dual DSI panel, the SGM3804 regulator, the
SY7758 backlight controller, the touch controller, and enable
the GPU to enable full display support.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
---
Depends on bindings:
- https://lore.kernel.org/all/20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-1-1d8dc7620256@linaro.org/
- https://lore.kernel.org/all/20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-1-0caade5fdb32@linaro.org/
- https://lore.kernel.org/all/20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-1-981eb5ab5a51@linaro.org/

Sent as RFC because the sgm3804 & r63419 bindinds needs the following fixes:
Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
   backlight: true
   reset-gpios: true
+  rotation: true
   ports: true

Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
   enable-gpios:
-    maxItems: 2
+    minItems: 2
---
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 243 +++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..162c46fa923c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -220,6 +220,22 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 		pinctrl-names = "default";
 	};
 
+	sy7758_vdd33_reg: sy7758-vdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "sy7758_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&sy7758_vdd33>;
+		pinctrl-names = "default";
+	};
+
 	sound {
 		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
 		model = "SM8650-APS2";
@@ -986,6 +1002,14 @@ gpu7_active: trip-active {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8650/ayaneo/ps2/gen70900_zap.mbn";
+	};
+};
+
 &i2c3 {
 	clock-frequency = <100000>;
 
@@ -1016,6 +1040,30 @@ wcd_usbss_sbu_mux: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <162 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_HIGH>;
+		VDDIO-supply = <&vreg_l14b_3p2>;
+		AVDD28-supply = <&vreg_l14b_3p2>;
+
+		touchscreen-size-x = <1440>;
+		touchscreen-size-y = <2560>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_reset_default>, <&ts_irq_default>;
+	};
+};
+
 &i2c6 {
 	clock-frequency = <100000>;
 
@@ -1053,6 +1101,51 @@ redriver_ss_in: endpoint {
 	};
 };
 
+&i2c9 {
+	status = "okay";
+
+	/* Screen power */
+	regulator@3e {
+		compatible = "sgmicro,sgm3804";
+		reg = <0x3e>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sgm3804_default>;
+
+		enable-gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
+			       <&tlmm 58 GPIO_ACTIVE_HIGH>;
+
+		vin-supply = <&vph_pwr>;
+
+		sgm3804_pos: pos {
+			regulator-name = "panel-avdd-pos";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+		};
+
+		sgm3804_neg: neg {
+			regulator-name = "panel-avdd-neg";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+		};
+	};
+
+	/* Backlight */
+	sy7758_backlight: sy7758@2e {
+		compatible = "silergy,sy7758";
+		reg = <0x2e>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sy7758_default>;
+
+		vddio-supply = <&sy7758_vdd33_reg>;
+		enable-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+
+	};
+};
+
 &iris {
 	status = "okay";
 };
@@ -1065,6 +1158,93 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	qcom,master-dsi;
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	panel@0 {
+		status = "okay";
+		compatible = "ayaneo,wt0630-2k";
+		reg = <0>;
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&disp0_reset_n_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vsp-supply = <&sgm3804_pos>;
+		vsn-supply = <&sgm3804_neg>;
+		vci-supply = <&vreg_l13b_3p0>;
+
+		backlight = <&sy7758_backlight>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		rotation = <90>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				panel0_in_0: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1{
+				reg = <1>;
+				panel0_in_1: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in_0>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel0_in_1>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
 &mdss_dp0 {
 	status = "okay";
 };
@@ -1390,6 +1570,20 @@ sw-ctrl-pins {
 		};
 	};
 
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	fan_pwr_pins: fan-pwr-state {
 		pins = "gpio125";
 		function = "gpio";
@@ -1411,6 +1605,20 @@ fan_int: fan-int-state {
 		bias-pull-up;
 	};
 
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	upd720201_avdd33: upd720201-avdd33-state {
 		pins = "gpio123";
 		function = "gpio";
@@ -1440,6 +1648,13 @@ gamepad_pwr_en: gamepad-pwr-en-active-state {
 		output-high;
 	};
 
+	sgm3804_default: sgm3804-default-state {
+		pins = "gpio58", "gpio59";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
 		pins = "gpio77";
 		function = "gpio";
@@ -1454,6 +1669,34 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		bias-disable;
 	};
 
+	sy7758_default: sy7758-default-state {
+		pins = "gpio164";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sy7758_vdd33: sy7758-vdd33-state {
+		pins = "gpio163";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_irq_default: ts-irq-active-state {
+		pins = "gpio162";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	ts_reset_default: ts-reset-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio107";
 		function = "gpio";

---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7:v1
prerequisite-patch-id: ef33f9e777480b807445b34eb84091ef8e5bfd41
prerequisite-patch-id: e58ac26057d85ca436bc58046bfa1117501f1447
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25:v1
prerequisite-patch-id: d14df8d3c4a5308e4a4ed6ac29d540493f3e828a
prerequisite-patch-id: 9236410c66c1d5eadc34c58b93fe76447c308d60
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f:v1
prerequisite-patch-id: 5b961b83be948deea368f5d2a9dbe0ba938c0333
prerequisite-patch-id: f87616917cce98b993cc61ca3086949852bd2055

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


