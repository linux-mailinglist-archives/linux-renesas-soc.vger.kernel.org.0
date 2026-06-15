Return-Path: <linux-renesas-soc+bounces-33988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ek+YIDqcL2reDAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:31:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C4683D71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:31:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=BmBRIiqc;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 848A53025A5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 06:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5EC3B583C;
	Mon, 15 Jun 2026 06:29:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025703B47F0;
	Mon, 15 Jun 2026 06:29:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504948; cv=none; b=owJFf+4aFO8jItjtO4WLcOC6iAdqksaa25FJb8tr0ptlnqwSu1BMI4pL3uxOc8FYph7xVRnJgtNjPdQ51DP5cc0XzAALP2qVcguvjY4X7sWW86PYFTGsPNcDYMLdldR8tpXuMk84l9XqtGhLB/n8Lp6NtFbCCgUAsFcqp5xyKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504948; c=relaxed/simple;
	bh=r5QjrFAZtSkTFwOWAs/qFvVvo8FOH/iWvMtmoLDe4uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwcmSt/0M0CRfSQq9BrEfuuXFWugQM1yFLBzUWv/a9vdKPSxRcT2Y2cZ9OM4po8rsdvpO/IIGyBJ8Ng5PcKDKEpwhbrLB6zHWnnoG5nh3yN7aFCGb0N3JSYuDVTEQZXA+OjffYRnv8u0cymk1KQpVoM9aZi32EU58AeqpsWBAbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BmBRIiqc; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29F611E1B;
	Mon, 15 Jun 2026 08:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781504905;
	bh=r5QjrFAZtSkTFwOWAs/qFvVvo8FOH/iWvMtmoLDe4uU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BmBRIiqcgRyTWCLRM9Ow4YB/yTSRn9iYzVq9rAtPEhTbUCcw/nd1g8pTa3B8KdcHO
	 ChHTU2jwNR6W4giyuQLacstXEiv+4DomnOpvNmiIHPzAGMNbUg7SAKjuY231hRLnkq
	 g+JSvg9L86SR/ukXlHKAIny1p8hzvr4oLHXMSJ+0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 09:28:12 +0300
Subject: [PATCH v4 7/7] arm64: dts: renesas: white-hawk: Add second mini-DP
 output support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v4-7-93096a1b56a3@ideasonboard.com>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=wbg5CCdU/74bk2tdhUnSaOwNMuA62RxSenB5kl7Y1u8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL5ud6STnN/U1KiD6NS4G3qbE5qhPUY/YGbUC1
 jHa1E9fYuyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai+bnQAKCRD6PaqMvJYe
 9UqSEACoxXletuL/qEEU3YTKo8LkWkyOAx0gzQHqZx0Dk6MQ5GEZauDB79vO8T2hvxExDL7ec2d
 dZvHgIqcBvu3yZWYizN5Lb7erL2e/Bx7aJ+eK8hxJDDu7sT0+NUQv0AYDywyk/SWFSb3nR/B3Jd
 hBYScbGz6e434ULrpLSsfwGIhEeoEhCgWgzAOSDh5151dJuI8UvteW/Fxw93bf+Uo34Q6CRmhMD
 xo5Na32mUYFcFgBEAK6edJVL6jggFPAp7S6VSxzuYD+XLYcZOUDVvGun/9hMX++ZcpiFUw3HMFe
 lOyXsfHgFr3eKXDrdbDp6ApD19Py+M4OToufiicYtY+Now9wsT81bFP3eEtY0ExVYAs5aXGNbFI
 4SqRjsvj7Vc+NGQmJ4uthvBBZRys3CQtdOcBeD23Cxj0waWoxmIk+HCrFIGUNOuJBWhwtYWxJac
 MdINz8lSUnLo8vLsjl9SVkulmy34VKz+hMpccxSea4bxEJCJqgE2HGgvuFiovYkmhGBPGLL8VJX
 o+wavKm9glAeT7sKzj12VJL1jnpoZUvydLEdlQn8Jh7ZaIcCKGCK7nEllFRMJDRN8qAWNbV/8dG
 f3TYyDD/p0Srod9W2SzOp2NaNwLLJhJ+qEczfa2e3+OVsNw8/HD6IUeEyKKsfWhNy9R5ETjLVfQ
 DBkoXQtwIiPbsjg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33988-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m
 :tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 035C4683D71

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add support for the mini-DisplayPort connector on the White Hawk
BreakOut board. This connector is driven by a TI SN65DSI86 DSI to eDP
bridge, which in turn gets the pixel data from the second DSI channel on
the R-Car V4H SoC. Note that this port is not present on the White Hawk
Single development board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[tomi.valkeinen: added status=okay for dsc]
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index 784d4e8b204c..89d60b83ac4f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -12,4 +12,98 @@
 / {
 	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
 	compatible = "renesas,white-hawk-breakout", "renesas,white-hawk-cpu", "renesas,r8a779g0";
+
+	sn65dsi86_refclk2: clk-x16 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <38400000>;
+	};
+
+	mini-dp-con2 {
+		compatible = "dp-connector";
+		label = "CN15";
+		type = "mini";
+
+		port {
+			mini_dp_con_in2: endpoint {
+				remote-endpoint = <&sn65dsi86_out2>;
+			};
+		};
+	};
+};
+
+&dsc {
+	status = "okay";
+};
+
+&dsi1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi1_out: endpoint {
+				remote-endpoint = <&sn65dsi86_in2>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	bridge@2c {
+		pinctrl-0 = <&irq1_pins>;
+		pinctrl-names = "default";
+
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		clocks = <&sn65dsi86_refclk2>;
+		clock-names = "refclk";
+
+		interrupts-extended = <&intc_ex 1 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+
+		vccio-supply = <&reg_1p8v>;
+		vpll-supply = <&reg_1p8v>;
+		vcca-supply = <&reg_1p2v>;
+		vcc-supply = <&reg_1p2v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in2: endpoint {
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out2: endpoint {
+					remote-endpoint = <&mini_dp_con_in2>;
+				};
+			};
+		};
+	};
+};
+
+&pfc {
+	i2c4_pins: i2c4 {
+		groups = "i2c4";
+		function = "i2c4";
+	};
+
+	irq1_pins: irq1 {
+		groups = "intc_ex_irq1_a";
+		function = "intc_ex";
+	};
 };

-- 
2.43.0


