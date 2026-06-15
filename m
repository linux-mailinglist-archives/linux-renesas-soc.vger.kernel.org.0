Return-Path: <linux-renesas-soc+bounces-34016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gs2pEWboL2pvIwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:56:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FEE685E2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:56:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fOcy4ker;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F6D83037BFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA11D3E557F;
	Mon, 15 Jun 2026 11:55:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F43E5581
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 11:55:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524506; cv=none; b=O0Z+WGOM6fxIpEXvbGbJIjgAGQjITlVbNPW2jkebHtw9I/17pX14/YBWpJ0mAS5Dpcd4drJQE8FDKFj7Qa7yJUHwfhowCnEDJKpncVQdqKjR+tGpoWmId1VCxUV9MB0XysGqnI0QutqXXH37SPQGdmz4rm3OGOENVAquTN42VW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524506; c=relaxed/simple;
	bh=mIJVPUkgfg4MMxI2Cs8v6xUmKD0KtB98ZyJBvoyGOfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5KIOjeh3nX9m4xMxnR1YW0lUxmCJa/t/tSNFV1AOULl/sz90tNOubU7Ormz0MaAhZfJjfCXPhvAFcALFIxUPQKtjBLFpkcUbcliIrZEI992qKZ8/g0DKKVkPa8ujDqwt5Eo2umPNl6wuGcjGRGVefbmGcRAb5X4M59JSIVAxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOcy4ker; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so36233665e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524504; x=1782129304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNFLzTG9iKRvPTqTppGrlV77KOrClBQvD7QKto2rcEc=;
        b=fOcy4keriFA52YsNzWXMSjIG4FgkA7o4Wv1Do3tsAYetdXaAzeRtqE4a5U5gIU5DXO
         D15NXqOKaOFZ9y3UqhbFovY5JlcV4uuqgkeX1f4Yo9TJoVelNcUI3Iux/mj2a9ovY+iX
         eh1ukvA41Zk3TTpuQNk8l8P9o2uUHcKp/I646ShklJONalBbLVmxqE2zGrl1uSco1AvT
         mUzK8B5m974I/MWHFLw+xXM2zUriMPNeUP6fJPgcAyajkKBcehxSDAOK7TTz/OBVMIv9
         12Ddkb8xjBAAJ1kE86L4PMIuFoPdHobXurfv7PaQ28VvpR5383NrLm/PfTyaJ5DFd4El
         6HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524504; x=1782129304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SNFLzTG9iKRvPTqTppGrlV77KOrClBQvD7QKto2rcEc=;
        b=m+jHtqymHTNHlw26LsO3aJd8DaJm2ePNbieQS5i4zZFhTUGi7ANg4aC28zxPiPxicl
         yIB8G9BK9POeU1QRwzkqzpaubvYIJnHzx2q4edcPJ6UzcchQgP0aUUy5cFzwEyVHqv6K
         oT3uGAV0OXhAt7bjFmJ8ylzG4QYEmBirgJhhyQCZscxbqkwzvEJth6j2bt+Jcl4wfU5U
         RIgWdjy01W408Lx48Sn+x3agT8U8aHl1WQREWG09LnRPXzleZxb6FBN0FW7y4YRfka58
         4fp8HPeeK+tKEvWWYVr4SPuQc/5e7AnqThufUOlwNE3vi5eZ8M8iGfO+R1sRFLTTxpuu
         st0g==
X-Gm-Message-State: AOJu0Ywj7dnc95ZOEOHpob/P+CxUQI2yVHD/FxaiT3+ulVAoAU+IDwvx
	Bday5/cGNlhDdRPElK1penwZ7CgT/LDGLtwL7BbJOiMCT+p0qxRUSbkv
X-Gm-Gg: Acq92OHz+XuG/fiQLdDn++nju/mxgLd17Ed2YTp2HsxlXabf9e4e5h9sGVbzoT4tOy/
	pkWU1htfEZbev99rKa/+7Jr9NQ/H3MXHPjtnh2vWbXYuKnsHRCK/dMpR0pJpsP8fjrzFamRczow
	8DeAQKYUyaXTszzP5fNrnkGO4ddoGfRipksYF02cckuuGJURw0h6NgUJOoZ43tUpocpr0DB1xn0
	0fpkeRNyWz5MgGDGs/mi7bioj+QwiOpPZmrFX6iwTPIGunsbuvX9TUvJp/sPvMe56irBShScyTk
	Bsp6hwN4kXjEXsLrwSRGONhIkeKHhsV/rJsJncgeYWHC/B4wOvFjgkmta3zj2YP6Rbr5e7UD2J4
	eL9lPk+NIMoxlRMUPyRFy4uWCw5ipdoGukFRNDugvUymskHti+fWGXSdzT7yFRbg4gUfw7sPEk7
	HWmQma8P3IbGEGXoqH6WtYfRcDQY05Ea3DcR7HqpXnUqWAn8rTkT4d6tDoPlQil33ShES5P6B4T
	hs6fPb/QxNGT94T0+OJzINSnjUhqqqt7ldtU/uJt7WFxwU=
X-Received: by 2002:a05:600c:83c8:b0:492:1e36:d16e with SMTP id 5b1f17b1804b1-4921e36d1a9mr139483995e9.36.1781524503360;
        Mon, 15 Jun 2026 04:55:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:55:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/5] arm64: dts: renesas: r9a09g087: Add DU node
Date: Mon, 15 Jun 2026 12:54:54 +0100
Message-ID: <20260615115455.1412098-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34016-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9FEE685E2B

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Display Unit (DU) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 174f683fa68d..308d3ccc21d1 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1380,6 +1380,30 @@ sdhi1_vqmmc: vqmmc-regulator {
 			};
 		};
 
+		du: display@920c0000 {
+			compatible = "renesas,r9a09g087-du", "renesas,r9a09g077-du";
+			reg = <0 0x920c0000 0 0x10000>;
+			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+			};
+		};
+
 		fcpvd: fcp@920d0000 {
 			compatible = "renesas,r9a09g087-fcpvd", "renesas,fcpv";
 			reg = <0 0x920d0000 0 0x10000>;
-- 
2.54.0


