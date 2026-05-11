Return-Path: <linux-renesas-soc+bounces-32406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEeHMKQlAmqEoQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:53:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C424B514B3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04DD2301A732
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAF94D8D89;
	Mon, 11 May 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQ8UzaFG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529784D2ECB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525477; cv=none; b=iXRBfKfJJli1Nsf0CM9JgzxUU/iSEE5JH/RMctdvFHzEU35q6pJcwwrZ/O38QVLevgk7SkX2CfOmonn+le+YdfW7SL/45iCNIrvVLtv9THCDFuQ4hHH10exVPg90YuAqwhcpEthqVDMJYhi1XICkVwjH3B2gNuXr0YYL9PXvQR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525477; c=relaxed/simple;
	bh=+ZlNkR7spELdy5rta3MWuuuHKLZDU4cE9pIZ5fGaMXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3tKPjgzJ7SCS9fBNwWAR0Jt+v+rMhOx+K849bqtdNmTlSgTnLbl4MXOlbhIP3y2q6Bf/om03vSVYL59cLBKj4Hf+ybjxr0c3ZpHZr4CvHQBkomgk13hZ3/JmT+fQg5PaL7pBJ3ESpw4B/CCXpN5bIdy8ffj/LKR0xpG55mt3FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQ8UzaFG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so42650305e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525473; x=1779130273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzCVEzCMrh09jteK/hP123LS90DexPwV52Bk8ftNMuw=;
        b=JQ8UzaFGtjsty3PDLpVYKzy1Vyoe0lEjnHekxQ2k8NyI/vuQh47Py0j44Ia9ET4RzX
         uG6wWxkoiKguBI/iu+6HRr00QjXek+HZGAHvX6ZGH/D5cQMnjFb1OP1w9Y+N262kXDVD
         w/wM7pqK80gvdNpgr/IX1x99B56wU9uWFa1xQA+UVqxPk7RWkyq2o6MhT42VGhCGij+g
         uj81ZcxSp7g4dLrz3pS7xGhPObFUadB56TW4R6uil6i33EqUJVXbJ8A0l6jPbxX4Vlok
         XAekIkoHMySiwHgONHFpAptpVyQQU9nopOkCUVDlrKP+ApbERr85WsHnGpfVFQdWx6d4
         sG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525473; x=1779130273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzCVEzCMrh09jteK/hP123LS90DexPwV52Bk8ftNMuw=;
        b=J4wpp4lotZ0NHG+1CmJv67hDdeyiTyfHCHp7OSEcbe5Iazd9/U5HBlLu4awk2MxCUL
         6fsYy+mshMAcFM99Uc/KzmaUJZWqej344uzKICQ5zPwNe+46pKrAMiAs7C4kEODZqkYD
         9keGNBbcmzT3LKHG9W/y2qTUQRQX93hfKalXhGoYURHOQs0N0CRS6SYaLrwlxlZIO3J+
         8r6KOEEsdvqHaFlo9+nXsqRJJzs7EIT6aWQhU/ntIvJJtYw9IQEuaGqy2vLeLp8lKf4f
         waYKeV/0MiUz/EhV9lRwQnAy8iGxucDIXy4E7egmUWAwrt5EPsb0uBCRZAJBByk6RrFJ
         NHJw==
X-Gm-Message-State: AOJu0YwN3y9jSAdz/PY9I9xK8c3BEWk7C2rOcXAK3l0iqDaZuEljMhE8
	R3ZmtMIgNZJXe9ELyXIvDaFP+VDb5fjJJfQQso00p91MKWSm9KmbyZCv
X-Gm-Gg: Acq92OHLCnRDZK1P8ZcszIR/uRKt/2VSZX/ebUSMFhZG7bhk6YSigJTJwGRIH/qDmNe
	pDspuH7AzcdG5L2E2FkODyIWlCXMukgyMpIH9fGOn2w4L4xVxidjJcIi/fC6tOrliuy5dR5RyVh
	0HQrvHRe15EwHng83KZ1A0DIKP+X6A9969uJaD4zV8pby1KjXNDIQxtJfEUFI+JKtN8gyEL0PHq
	lQ/RbNxRfDsJOyuxDWtdCuWoqcLdGK2vO+pN+QA5gvtFqdAq1VzwFIgTrRfdgR04sInpcEWNOoc
	WCxu/mJ+cCJoiQ3+u/Dj93cS5dIV5dlZJ3vXihRpPdNdgvh2yfxOmnYnDmNLFPYCXFNSkilNjWP
	iMp38DAxS2J1o1SZFhJ1CSxR7Bm9mrKhERu+qk/md+7ycwcy4VI/XDnezvMS35XXFCWqiE/tIQT
	BJp2dUk1uiChp9AflK9J/wCxbBt+eVmK2TUovgeDU83LAWwMjp/tLWnL7g9PGWxml4c4hXSSIOJ
	BHbfwIXz1Twa+Wz4eS3XLkqMkjj+oVMMSV8pKW0tIq9pw+d
X-Received: by 2002:a05:600c:45c6:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-48e521e6090mr400063665e9.14.1778525473393;
        Mon, 11 May 2026 11:51:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 9/9] arm64: dts: renesas: r9a09g087: Use SYS syscon for WDTDCR access
Date: Mon, 11 May 2026 19:50:58 +0100
Message-ID: <20260511185058.1926869-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C424B514B3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-32406-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[4.197.244.80:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.983];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4.197.247.112:email,bp.renesas.com:mid,4.197.245.224:email,renesas.com:email,4.197.249.200:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,4.197.248.56:email,80082c00:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second region of the
System Controller (SYSC) block at 0x81290000, which is now managed by
the dedicated SYSC driver and exposed via a unified syscon regmap
interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sys" phandle property pointing to the SYS syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 170d033dcdb3..c6597c8402d6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 5>;
 			status = "disabled";
 		};
 
-- 
2.54.0


