Return-Path: <linux-renesas-soc+bounces-34641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ssVPOjMzRmqYLgsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 11:45:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C176F56FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 11:45:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=dGX84rRB;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A648B304D5CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 09:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D1E42B32B;
	Thu,  2 Jul 2026 09:33:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2191365A14
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 09:33:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984803; cv=none; b=jnfqQOdHeAbAaSgcyJb4j+OEoSgxi26RWZJ96c+u/7Hlp7a3slPe+xNNTXtP1aaLAxawiNgv0cijuIX699NwU75TXDAdob99SSXobeHNO3PB+rxkIzYzuMuVP5oN1+zk9dQcsDbr1m8mzGN/B1nI6tRlh/DJG8nALMzIirCR9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984803; c=relaxed/simple;
	bh=9g8rfBLzhKJqnNT5YxLMw808cqWQv0IfTcODTINMQ0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jDrTPh8se57vLXC/0Umr8nt8r4RC94ZAitJaY8iloRQzZOT3C3XpkUlksARu4n91hQ3MzoUQ57SIFvZI2+ufcyc9IeTA8kxsO8fOVgxrelrO6ujAxWhHy8umGR01gvpmQmpqb+Dzz4IE6AjPI+aQNNNACsgWG/yK1wVmvnbJ0OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dGX84rRB; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c59f740cso3074535e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 02:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984800; x=1783589600; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xy882Y8GNds0v7W+NXQvp4lrh5LG/ciXurGQqDIREsQ=;
        b=dGX84rRBL+G6wYpi+aipkuPY7YAkMkKoHU4kUUdOjccDxV5bat8eFpuzH+ICqQTxT0
         THOE8eGF1PwIJEuZUwZZiIUfNLC2J4SU5J8kOQWaDNbo1mRanQZhZ2CGv6fOxWsglR6k
         qJqfWoVPNxe6RS1Orps3sUVnX+UA9cCfKM0oop0NZ8f7nyHrjMrQDqPkN/BhTBdvlG6a
         rrjh0yvcDMFlOzGL1/X6Q0YD/zrnqpxswiP2eO51uwI+60pgqF0qjLNDcLu4avv99JbE
         Pl6XzXI+eGPJoW53wMTrS85LfpY6gRjnGVDr/AfLRWXL9XYejFCLtrRPrZ+9+kjLVEhP
         2jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984800; x=1783589600;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xy882Y8GNds0v7W+NXQvp4lrh5LG/ciXurGQqDIREsQ=;
        b=QCAWf1kDa2VrNKtfJx6pMIVVi9NCwDjCRJyBoMSmf2mGZAgz7TZ+YRTW2kdJlhaRf9
         KkkpwJ5ZfeXTGUWnjdrkRGE6gYeWsdG5XBlbMPkZAZhayOFSS2/1V7EzyPpn8IC9ceY+
         sucv7ts+UDubBkvy0x/HqKEXcFEQ9fYQEht5bMS4oxyW5qS2geSgHKMM2f1+X5yvpTKJ
         rifw+kw9LpO7yYkOavJrWgstKMxtySyQ8jQOWAOXLHczFkMcP78KEVboslKSQZJiPdCS
         XIMwRNahDFRDgVMbk5EI6P/s4hMI0Tj4OvlCE155Khz+kO87jmC29soYA5n1P6ZXKGBC
         rxPg==
X-Forwarded-Encrypted: i=1; AFNElJ8k2A58X3uTyae6bRSvUD37SSKOqT7v8aEXfQ0M94nE95aBZaS+F0510rgxmpyTx4I7Rcj1NOvuAntQDEnKTWfjdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7HCL3DhICF943cDaxkfbAU6Y57m/ywWwJXcwvRqEiRGd1fD1B
	wn3KXDMcGEMbRWfmTm6NbUCIvjkRWACz0JogUuzeKS4peSZ3L377cxOtKRwHReHhBCLCB9BbLfu
	OyUDz
X-Gm-Gg: AfdE7ckw7ZA4h8TGd2nkIQ4tAOsdeCzmAlpB9RZZp6nFDECXJldurkHYWTbLjXpAxe4
	IzG81YUcvyoL7XeAfdf/MenjERO9ymyDwGwRyqVZ6kp8lgLvkRVoU2Mv95787wMkgHtU8/Wuegz
	pNKtY4mxvAFBw88A6syt5X0ntVZKT3NuUu4tdwF/gGMOKelhyiKeva244+fRyW2UJj0YdZkHd39
	87kje18Hesu4nUGgpWnhVtTTCmbsrk/L7DI9I/2Ggo0ALz4oiOIPN5hzr9kpvt6NWR9nGDuRbVS
	5Hfpo1CNTck3HztsX2eWksIB90le2ySiggcFOmFcCgjibBLRTF7p46zgITunDzL//TVqraOBafX
	pvIAEbhsfKDChUjS87ikT7sBiGBdKoHRcI622wiHBobb62Z9un75Ro+2+2GbGLXJBc7VKHJsQJH
	75CTdBAla2Fvh+l0t54ALUHpC/kmb+tdfjJQ==
X-Received: by 2002:a05:600d:6450:10b0:493:bdf1:fcde with SMTP id 5b1f17b1804b1-493c2b7c8bcmr63837185e9.19.1782984800206;
        Thu, 02 Jul 2026 02:33:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ea60sm31135825e9.3.2026.07.02.02.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:33:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:33:16 +0200
Subject: [PATCH v3] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFswRmoC/52RwW7DIBBEf8Xi3I0AG4N96n9UPWBYJ7S1cYGgW
 lH+vcSplPaW9DjS6M3szolEDA4j6asTCZhddH4uon6qiDnoeY/gbNGEU97ShitIfnEG4qRaQUG
 vekYPizfvmCBysC4uH3oFm0DU3TDIDgdJO1JwS8DRfW1RL69XHY/DG5p04f84An4eS4d0td0q9
 NWdBeJ+qhVtQMm2GUs+L/l9FuT3PffDVimFgpoqhihHhlz8mxXaumEdoORNK5HbgY59VhfWoCO
 C8dPkUl9luWPk8p6Di8mHdRsms+0bj2+QGTAYR1ZzQ6mlsn3+cLMOfufDfkvJ/EYWnD9A5oVsr
 G3KvCg0+0s+n8/fqJJ6vFoCAAA=
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8749;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Aw9la9+tGSm5Dx/RSVVnG/hB97dDKA8ifxBXaYrP9Xk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjBeTpA5BQBqTR/aFYtrJdXd+NHoRqOfkrvLxFLX
 yBYWFmyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwXgAKCRB33NvayMhJ0eUyD/
 4hdbVLkBJJaF9cUdpNJ9iq4P3S5vFQZwMXD2cgHlFCNWtTqlZCpw4VUJXbtYNO8/Q6jAoklHSZSlXY
 nkvKdXbbiJTo8AapBGWwF7k7nbHRHJua+vvozDB9DVyfI+Bel+e2GZYtQo1L6BtCL0L/MQ4ZyiefHb
 G1EavBx1acH//pumIDYFhspTuSQrl/EWwFg0txmZS5xfZmVNf3r3HLaOT9VxpmGjQDxljjAfdbJSLe
 BWxvp6+UZehEm6lttKY3Jlk4eEAoOGFzVz+wcuvBZWpPDm1ykl8oJijZ607sRGAdleutdzcJv+Rid6
 hnL/jr9A7icpw36/Ig22+KN1WvNBMXlR/or0mBuI+AKCUa47wr94JO5kTVtYVe5z0qtwsUbkJt22C2
 8DwgOAHgYECipjbJ2K3nXG9oVDyfBf7r7xy8SfV/aiMMBWZ7z20IPINVJDqDcsd/iwVFKDRh5MH2li
 CsYi/2oQE7pCMLYY4LTnu17/aj7Wvs73SbwccEDNnVGX7TqlEcHCqWnB6rFCb+dCoGFDeB7UPR751l
 50TKMXZ3554N2eGtqHMz9TR4ypTlIP9XzW32fmFg36XPP0IW8WoKYidbshYGczbsDpMVLSl9Ej77GI
 BEej0FDQ15QZyORwgUQH0cCRt8/H2NSYlCsr/KpZs2q9fWWsgwSsEDqmCcuQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34641-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kancy2333@outlook.com,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,outlook.com:email,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44C176F56FE

From: KancyJoe <kancy2333@outlook.com>

Add nodes for the dual DSI panel, the SGM3804 regulator, the
SY7758 backlight controller, the touch controller, and enable
the GPU to enable full display support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Depends on follwing bindings, all reviewed:
- https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v7-1-16edddda9951@linaro.org/
- https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
- https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
---
Changes in v3:
- renamed backlight label and node as "backlight"
- reordered pinctrl properties
- added regulator-boot-on to display regulators
- Link to v2: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org

Changes in v2:
- Update for bindings changes
- Remove empty line
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
---
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 244 +++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..56818fc9edbf 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -220,6 +220,23 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 		pinctrl-names = "default";
 	};
 
+	sy7758_vdd33_reg: sy7758-vdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "sy7758_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
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
@@ -986,6 +1003,14 @@ gpu7_active: trip-active {
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
 
@@ -1016,6 +1041,30 @@ wcd_usbss_sbu_mux: endpoint {
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
 
@@ -1053,6 +1102,51 @@ redriver_ss_in: endpoint {
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
+		pinctrl-0 = <&sgm3804_default>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vph_pwr>;
+
+		sgm3804_pos: pos {
+			regulator-name = "panel-avdd-pos";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
+		};
+
+		sgm3804_neg: neg {
+			regulator-name = "panel-avdd-neg";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	/* Backlight */
+	backlight: backlight@2e {
+		compatible = "silergy,sy7758";
+		reg = <0x2e>;
+
+		pinctrl-0 = <&sy7758_default>;
+		pinctrl-names = "default";
+
+		vdd-supply = <&sy7758_vdd33_reg>;
+		enable-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &iris {
 	status = "okay";
 };
@@ -1065,6 +1159,93 @@ &mdss {
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
+		compatible = "ayaneo,wt0630-2k", "renesas,r63419";
+		reg = <0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vsp-supply = <&sgm3804_pos>;
+		vsn-supply = <&sgm3804_neg>;
+		vci-supply = <&vreg_l13b_3p0>;
+
+		backlight = <&backlight>;
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
@@ -1390,6 +1571,20 @@ sw-ctrl-pins {
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
@@ -1411,6 +1606,20 @@ fan_int: fan-int-state {
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
@@ -1440,6 +1649,13 @@ gamepad_pwr_en: gamepad-pwr-en-active-state {
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
@@ -1454,6 +1670,34 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
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
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7:v5
prerequisite-patch-id: 901a0948e1afbb03ff78a063d4f66c17665588ef
prerequisite-patch-id: 5ca959a92d05c86ae7a77400d5c4c9bb8bb214f4
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25:v5
prerequisite-patch-id: dd1c5acff71bcfe0730472051c0a5c7c339e2116
prerequisite-patch-id: 30e1bf23756ac7de0e29e4c30e7c9737366cf856
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f:v8
prerequisite-patch-id: 53130195c1df5886a953f3eb1ffea6e5b32257ec
prerequisite-patch-id: 016545217702b15d67b3ac48392c2978fc04b000

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


