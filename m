Return-Path: <linux-renesas-soc+bounces-32665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKpyJkXoBmpKowIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:32:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A954C780
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 076233255D3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE5643CEFC;
	Fri, 15 May 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QxpDTze9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA643C076;
	Fri, 15 May 2026 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836210; cv=none; b=HDTk6cx5nj5ZCo3udxMWRX7q8953Embx4D381JyPOZb+sHzNDZZVPazBHqA6+w41bBsaETQhZ0UsMprB6NV05x05hKC/BXpW6fm0YPlIK+0aGjFISD4P4AQd+uJZUubaxV+k7YxDM45kThRxSbWxF0PLmCtTyz6b/7Wk6yHi4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836210; c=relaxed/simple;
	bh=Q0KK8Vnmn0OKEEcWFrpokO4RWx/VC1ho0JpGmPQEI5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Um5XhZ+PdTj5PpAgX/UD6PJ4WADN8mH9Hg9fUPs7NWKbaL3VgadIWfzp7lju/3wycqlYXKuSodr4PuVzWXTQ77vFY9Co9e9j5AYk3skEbO0VQ07J/bVJGFR8lbjusyw8UOE8Uu6MoGuJevf69Wml8T6cny/XskxSg3r4zx/PcU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QxpDTze9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDE3F1337;
	Fri, 15 May 2026 11:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778836195;
	bh=Q0KK8Vnmn0OKEEcWFrpokO4RWx/VC1ho0JpGmPQEI5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QxpDTze9IPXVXHJyWDbbaXDTI2JoVnhsZgvSYrEwX8mzwMitYEeRIlO3sdUMWhhAB
	 WkkNfRFlDM/IoH/NBXxeukRwzqujQgVVNrEQdbZzn3gPztkWHCjrfUdp4sqb6mUuDB
	 T/QDwgIlSrf7HFWkzuaKNHsFPLJmUVnVZl0B3kCU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 15 May 2026 12:09:30 +0300
Subject: [PATCH v3 5/7] arm64: dts: renesas: r8a779g0: Add DSC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-rcar-du-dsc-v3-5-164157820498@ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=LB0h2hc6Sj2kvghRC2Rip9B8urRMXGeEfCaq9x9z/6Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBuLiI9h3bVKCgisUxUZwYF14YJcg2kBLL3u2X
 Bluo9pkMTyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagbi4gAKCRD6PaqMvJYe
 9egAD/4q54Y9c6EsRHM/rWayxcTqLqCxyZYt8tosp+hQvuZmKiYBwojjQUPk8u/o9QniHV6Nolb
 zKP1JR5Ww/X9OglYMOejbwPtoKwPDVRoM9Y3Crs4e5Dafqm0KV3g9IRUVxCPwfpm0IBs8QiGkx1
 nFd4Dm3OQWq9JmHXzLt3n2MILpu3tCe+SYGxoJvuDqBZhSbALqztFEyAry6/RDKQPcO2EGUXEwL
 iy4nFUGFPD131rdxQCpyRmwrp+KLC/XJJ5+w5UiHr6mhioc6Al6anhC3PlZYCIXE8TiG7Lx4lxf
 DM5cnaarIguh80XubmHbR0+egF5uZYQCihEaWseTVIqsl6SLlfPAOo9M8f/WJmvGyWhubJln8Xu
 3qfe8U/Z/96xZXzb1/CNAtbePAo6AHYT5E3KHVYVMG/BWO01JB7giSySsPNXsOrLejLk6FRhseo
 C8A0XWCcLdiJIY+efL6q1esDzQjjjda8eOfo23eCAn5ob/Rey8Z69joW0WGvyiJPtIm0if3V2nl
 CQk2s0EjVxU9AZfoniWNR4uNwxQLU3mbTQhaBWYyYMoU7Vsf+X3ZMC62bK6zZHBvkfsxiB53tCU
 wc3vioEaUqze14rlToLcyz7DrrBLi/meYrO5YrYh8GsanVIjHTlsUHhdqj1IveI8r7soQfR4fxQ
 7HDMGyWBJvjIkQg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 343A954C780
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32665-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge is placed between DU and DSI1 units.

The current dtsi file does not represent the DSC at all, and thus the
pipeline for DSI1 has not been functional.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: separated the sparrowhawk changes]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

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
 

-- 
2.43.0


