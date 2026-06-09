Return-Path: <linux-renesas-soc+bounces-33765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W+dINWEOKGrO9AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 15:00:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 752EA660530
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 15:00:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IR1ePokG;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB94B302D0DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 12:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A52240B395;
	Tue,  9 Jun 2026 12:54:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7A41B366
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 12:54:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009693; cv=none; b=gcSqwiNwQX15cfEUYyyoUl1+kVBe0a5Ql7RlZ1gXhNZP9N2bgANxfKwZdeaebaZhp/j5qsS4Tt5YJfNb4Wizs+fUPUZqHBy+Q+HuZ8M9UUzOBIu/2fUTB4FE3ctYuj667pSnDsVxEYdpRTT/BoZdvzpWkikJw3XRdQoCDIhbH3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009693; c=relaxed/simple;
	bh=VgFNiEF0ef+trC7uormB4Jp8xRciGveapgTE3rlnBCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgRLkmPsMYzYo9A96ClHmx88hU0IMN9/7gzTPVKVH+MSPWpDhC3RjuKIjnA9eocrGLs9utysz5FTGkD+YKj1xM4CWONwGUQb4W8f2n2MqsGTMuYvYJrFfYGoek0K1IjUh/LmJ+4VswKwEAbG1kYOeyZ5lRF65vystiKFWcGPubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR1ePokG; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so45613215e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009687; x=1781614487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa1NEGZZ2FfbTBnmrVGSbV2tYmK5duax/CfIG2yuC6M=;
        b=IR1ePokGnwGz+UlAYXMlWL3OSMUAn0YPh9g9XJTtkoDdv6IQ8So1HRiPRVWyYRrw8C
         IKMphZg8moZc2XjWunmHZhItypFWMsWTUzT6mDGPRJ5lLhR82tJyecTIU6mWg2MfyChI
         j73+L7Yi5jXD3ggQZ0OAHBUWIPefhWN+HbIUImK4ZcZnuXUUvH9Cl+TctMDrds0r8Ewi
         vw3XVvZPUZy/DsDeKAsikaheb6I8DmmVCdetV7C8mVtxSds7uI+4KiirKN/zO/ZpUxsE
         /902KAszHUPiorIDh2Mm8Rt7ERwaw1vMVDukDLVfKnReYYhZX1PnQznJOQpwqhw8LkP6
         l4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009687; x=1781614487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pa1NEGZZ2FfbTBnmrVGSbV2tYmK5duax/CfIG2yuC6M=;
        b=e1S9T3UpbvrAbR66GcwuTiXphNknkTHXdzGngph80TtNOhoOxHbnBNflEfATKR1fTA
         IINcu9kflFSudF86Vkhp4IHRCTKypUg2LP79+6boLf8KrWfGByb7zkXp2/6aDbjAOB4N
         JRWa9BMRTFnTl0sWsR359rBPoBA1yJX1f1/AXriTbltq/5lhRF4xsYSIVRqlk9atVaYa
         ST1e6LBkDpfw2cWM+gu3qUTcUd/uiYI5zy+rqJUrNe8q+FBved+4PhuagW7KwFhl9cNb
         1mUfhdR5E57/EIhwuhrW4xGpncFvmZVUViovAP4AsQzJivKeITw2SNS3WII4gsChzLlQ
         Yw7g==
X-Gm-Message-State: AOJu0YwRgiPhu+EFVZHDLfM36R4RM2SedPuMSg8XILIPCBLhguzk40F9
	5JQ1bhQzpFtjQOgT9d16yDhJW2W33EQkznGw8m3ssHcEjh95iBJtN6Gi
X-Gm-Gg: Acq92OEF7w9AXQn62H/B3GE6MxkIp6T8qbeSts4ZJDY1pk5lh7fAkMd1gi00u+6q5sV
	QZUQWvNzBuln+9S1lWTrpesmZ1lF3WYz8PL3ZdpKy8fb7BCTY50Lavr7c8bJ56/hSEulhp24K98
	i6uxi3EEiEwKQxmiyljJqFrSLnIrR0URL4iskKBBmwAaPWvZPDCC0XIcNtU3vPVroDjXOLEg3RW
	YABWwP2IqOw7G71eDSjM04Dzt8TQxTVtIXqm3OWZhgQqrFQQSjCEJS+PexlacXB8tCuOeZP1qCR
	D9URPbNOEox4NcpS765ZWAnYpymgl2/GHGvS+sXsZ4deFGx14W8bbxejcNqHaaP+9iV5EYXjNj1
	442rHDxKDcpxKHtrHRKeuv61LUmRkUHxtHDN6cXylCc2M1dusSKbcTGCgNTCKMq36GwvPDKTJgG
	lUhmqG2LzFdrF55k34DUYSAqC+jYieWCZ/JVcboDiKYjvwwUw+CrL2saR54/rXmyEGZA0SvdRh2
	HOWbfDafRqmkPY5J6Oj+GYXaS1Kc8G0Ne47vvspfbGCSyVK8YRJhb8TuOM1qpK2OK9c
X-Received: by 2002:a05:600c:4e4e:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490d7244543mr37984345e9.34.1781009686933;
        Tue, 09 Jun 2026 05:54:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:45 -0700 (PDT)
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
Subject: [PATCH 4/5] arm64: dts: renesas: r9a09g087: Add DU node
Date: Tue,  9 Jun 2026 13:53:52 +0100
Message-ID: <20260609125353.401124-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33765-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 752EA660530

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Display Unit (DU) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


