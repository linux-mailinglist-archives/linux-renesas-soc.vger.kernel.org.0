Return-Path: <linux-renesas-soc+bounces-34014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7YPFMTroL2pbIwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:55:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71F685DF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:55:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T360t0bg;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAF7E302BFF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3B93E5A20;
	Mon, 15 Jun 2026 11:55:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DD63E558D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 11:55:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524505; cv=none; b=lHkl7w5TkszFT3jjozkDI6aaDbhZHLhhiIAT7Wh8+wXaoKY6g0wNxwOBdZDoC289H7FbxBnbG4w5EqaCyknHHFqlBVR+RqzBNkExhMFbMcQIlXDT6EeReebZOtt2+ii6iCTxHhtXGSYTJOXxEnaXWZsVOdNry0C3VTGLEZOp5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524505; c=relaxed/simple;
	bh=dOvAhyLeHPBxGKHxf6UwxyFzijgxL/aM0Pz0STYAXLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNL0QO5gBhTtViNIHpAlf2GJunlxc4hW7U0V7nCkolxJK5ksUtepNAJiYmXS03QXgYVB19ohq+wjqp4Pcw1dkADBAaLhmfKRZyiNKCoUH44vRc3CZaC+luAe3ATd0YjEvpN6tRTFyTJNyZkaLpggPsBdhAzxVpqt3oGmgEUdbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T360t0bg; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso24021925e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 04:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524502; x=1782129302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xC0wRTFMsREKYYVmQ4XdIJ67Rv22JHsPEOcdgYiJ+t4=;
        b=T360t0bg6MinfRTAId6CYTgWrcRAVbiGSuYtCPFJgUsoY+GnKheEjECCgpZV2juFu7
         RuL0yFL2Z7fXK1gaQjzc19rlev7vvPPUVcd49bPrAWpZWw/eI48z+81p+KiyQy3ao3OY
         doSEc8PFewQJLJKA54/JfaVIndqPMypU20DGNR1D9tbp1ABJllk3ZH85obwCjSwLXq7Z
         SpPk81Yr0aGhSqbEQxqOGMgwSfnKtU0gsR00s7sm9gOmyUxsCugnLJXhFv2tHVww41bo
         VQqCyCA6SPdYypRGvJZgKff75VhvjL5uUbF/uK8CLy1n9YjaenvVzadLlPnYUSFwcwcd
         LVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524502; x=1782129302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xC0wRTFMsREKYYVmQ4XdIJ67Rv22JHsPEOcdgYiJ+t4=;
        b=DPTL3Cn/kArOIAZ/qpMDZ57QE+86URUGOLGxDK0RS+mWuYD5hcsWV9tCXaG8ol9wSp
         L1OEs69CuEvBHkG0ndMPhYDr4WcOfbwFmLBTvxB9rcOBxRXVxqxUStiHyB8vHMBz82BC
         84PwKHSPXy9KCusKLc/9JMmLsdzgQOkCKrxvxMui37kkjv3bYCw16l8GcjoXBWUx2Jmi
         OQKcx+pm7FnGQxOU4rwe/O64t0GlNibjov/EFyFs2hWR1a3/e6snl1vUvXoLp4iONXqP
         IapJrQ5np4EgI+NnI8gsaSwfxANB8+UdPSoVWiGetqQ4CWyXlEjPkSrNhBWURJf5gpid
         QnZg==
X-Gm-Message-State: AOJu0YyBHoTzpS7aKmdXQmNbcyLqN9VOfY7AhVZy8SxnkYJ3BsoBZ3nS
	Xc3bJ4i3djxXFgGQocfpmqVvXfAO3ej8jJPSSM1T0plWeZZBWYE9OppJ
X-Gm-Gg: Acq92OHn0UodekTQ1KSi0oCNQTo84C4DtUK+ewUhtToVtGxtiJSI7O5ij4k/7qhFvBX
	Z2xRaNwoKQJCvPkuBjIBCJRpmqH3Eg3KnBViDr5Hztf4KL+lWPAM5zwNKXmlYp+VyHhLksGOBVi
	PgfOzJIOi9uH94aSanjmlK3ksGGn5rJE70VzuhmPaVo5pMqrLoAgRYVGsQ99rs95PVlpYNg1b+j
	ia+ZIQy7wNtVkq7D7LjWiZuCAmD3pVXqv7NV4OrzEd8ycu13vYFFKxpw+z60e7yy9z/K7X6JtXJ
	TCuVOdpbE1O1JaV0H+UfUQRWLbR9hAarGWETrPZTtsk5V2ROvJpKbbqnC9WPOpPIwx+C5eTJqnw
	5evRaz+akbPnUp/m/WrD8nb+0ocaRLbL6I4Cl3ElHeeKNhNLtO0BojK7tp/HV8B8fsliZBuXSmq
	bVgbHGX66OeC6zN0BPv2/daYhhCnUZSJhhQJOEOQjiLF5RHkezOS80ur3kzNuda/J4L2N0sInQZ
	1ziWg40tNNybTa4NOhZZn/Z267SuS1OA3t9vGxbzBGfsrU=
X-Received: by 2002:a05:600c:c107:b0:490:c2a3:1782 with SMTP id 5b1f17b1804b1-490ec50ad27mr206081755e9.35.1781524501706;
        Mon, 15 Jun 2026 04:55:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:55:01 -0700 (PDT)
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
Subject: [PATCH v2 2/5] arm64: dts: renesas: r9a09g077: Add DU node
Date: Mon, 15 Jun 2026 12:54:52 +0100
Message-ID: <20260615115455.1412098-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-34014-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A71F685DF9

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Display Unit (DU) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index dda7008acdd9..93e792d0c4a0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1377,6 +1377,30 @@ sdhi1_vqmmc: vqmmc-regulator {
 			};
 		};
 
+		du: display@920c0000 {
+			compatible = "renesas,r9a09g077-du";
+			reg = <0 0x920c0000 0 0x10000>;
+			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
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
 			compatible = "renesas,r9a09g077-fcpvd", "renesas,fcpv";
 			reg = <0 0x920d0000 0 0x10000>;
-- 
2.54.0


