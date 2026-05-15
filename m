Return-Path: <linux-renesas-soc+bounces-32653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMJ6KQbSBmqKoAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:57:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B6C54AEB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48E13303A4F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 07:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB8C40148F;
	Fri, 15 May 2026 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aCZlCXTk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA05D3FA5C2;
	Fri, 15 May 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831814; cv=none; b=HQ6d2rar7oANjwkqeBJlLBHq2sDMduFo0A0JTv2Y2q+A7eDFbdxn2Djxs/s/Wy1jHfRf+gTSf+XNbJBOQsrQ0F6LCqWEwIEItmmRNIztHx2Pja70Drs29R54F2auUTAlDit0YPQ1EnO1rVUd+tf22mVq6K8WbFhxlpN7ucTvC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831814; c=relaxed/simple;
	bh=CIep6fJfVAhn74HMjDE/V/v4KeGkg+5aWPNFXSJzT0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTXgCZNNodf7eYhm5ZnH/GuvCsT1vCgDEzu331rLmscrW3vrrlz6FF51qI7LV67x4iZauDnkBH5UJ3BNRJommGPpPZNq/Y8C/KHdKTzZ3OywZYau1EuMIPDuvQHzl1MfMFQtKFXfPx22Bjt6dUhAyFufddmjHyZogJuzXLQj8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aCZlCXTk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F793149B;
	Fri, 15 May 2026 09:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778831799;
	bh=CIep6fJfVAhn74HMjDE/V/v4KeGkg+5aWPNFXSJzT0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aCZlCXTk+ribB7Tk1Q7yeYzLxt6LMShlYBE0PNZyH9MfLrLLjqizIWyfcyltTjwDV
	 1DLhqzDIDgRs4NgeIhzut3F5OI4rDJzfrxxShbry3GyU++jFgWt0OsTOXc10uNIN4B
	 yRd5Z0NO6euV75McqAheWzuiMQH5UyL5RF8uCtVE=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 15 May 2026 10:56:18 +0300
Subject: [PATCH v2 5/5] arm64: dts: renesas: Add Renesas R-Car V4H DSC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-rcar-du-dsc-v2-5-f6b9240a1240@ideasonboard.com>
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=zG6hvH8cY6/FnPokxtHg066A+36wEiN+1/jJynaivt4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBtG3V2D0sCuzzvIDDLjNaQOoP5/uI2Jk+MiI7
 i6zYEAqkLiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagbRtwAKCRD6PaqMvJYe
 9bquEACSnIb46pwik25cjMRUVn+aEm5XkfmxwAfDli3vvEHCOplKE58rCCuu1iBkYV12VEljdC5
 aonBbYx+AAJIIugqaOtB4nklDSvTbb8y9m6Fr5kF/dFF74tFGwjqSve0GlRjOxrAc09fu5RptjK
 eYvWzAT8ANlqiK4brTDpGjict2pfpzIb5uNCwAtGGc0sdZova7Lj4gHMyJfXoR/8YNTrhSq7ApB
 8lyTIE7z8jzWDTXmSkCYgTnVDU4GZoVVATVihaTyIwtGGFwCQL/TIG0WXP3XjocZ00KRKRnhTAH
 LLBSbLOi2+NwgLqJElDhZljOh4dmd5KwE7aUyDbMIVd4GQI5Hle7IPR2365cr6K91QgGwffRRji
 LV/1BVeH0nydxP3R6l6ECkP4GAJV/5yGJy4GMFazsxUbuzWY84dO5orNBvN+d8Px+CC9pCE7pov
 Je8tSEp97vbZ5bLkjqVYdM5hpaW75jpFJvcZEuRq3A6kkEAEUsDPByHEc2sPeoMPIYK46LucW8v
 WEd7gudjM1p0hWx7Rbik39hPuuxeuNxQX9HFV9UNpB4Ta89eenZKMF1BVYY+ilPK75Cg3thi/gk
 7Woz7WZpEWQ6hshKvfMvyBcMEfswnVKNHPuzVJlGCxPfRBk/2ok/q30rttslGLZgmJbIjquIsge
 uE0ssPXJUla4i9Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 73B6C54AEB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32653-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,mailbox.org:email,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,feb8d000:email,0.0.0.1:email]
X-Rspamd-Action: no action

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge is placed between DU and DSI1 units.
Describe the bridge in DT and enable it on Retronix Sparrow Hawk board
to keep DSI1 operational on this board.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 31 +++++++++++++++++++++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |  5 ++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 82a7278836e5..52a6176f9fd0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2298,6 +2298,35 @@ du_out_dsi0: endpoint {
 				port@1 {
 					reg = <1>;
 					du_out_dsi1: endpoint {
+						remote-endpoint = <&dsc_in_dsi1>;
+					};
+				};
+			};
+		};
+
+		dsc: dsc@feb8d000 {
+			compatible = "renesas,r8a779g0-dsc";
+			reg = <0 0xfeb8d000 0 0x400>;
+			interrupts = <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 2819>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 2819>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsc_in_dsi1: endpoint {
+						remote-endpoint = <&du_out_dsi1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsc_out_dsi1: endpoint {
 						remote-endpoint = <&dsi1_in>;
 					};
 				};
@@ -2534,7 +2563,7 @@ ports {
 				port@0 {
 					reg = <0>;
 					dsi1_in: endpoint {
-						remote-endpoint = <&du_out_dsi1>;
+						remote-endpoint = <&dsc_out_dsi1>;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 812b133cf29e..f418998c6b05 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -288,6 +288,11 @@ channel4 {
 	};
 };
 
+/* Page 27 / DSI to Display */
+&dsc {
+	status = "okay";
+};
+
 /* Page 27 / DSI to Display */
 &dsi1 {
 	status = "okay";

-- 
2.43.0


