Return-Path: <linux-renesas-soc+bounces-33344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMjkOp2MGWpTxggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 14:54:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC8C602884
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 14:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 608293025F6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203172C3266;
	Fri, 29 May 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CchEurjZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14C32C2360
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059290; cv=none; b=ChJ883SJV8w7u/zET64yWOxWAtX3wBbXuXeVRCorWKugAbCaQM20y2C0tpFA3J1hdvA092XmgKL/uxPqq3z2Z3i3eozTyZ7Z3mSSq/pvCOhP4JeOCUuL8VV+OIxjktB1hNafQwZcMFloaxID3EpDvRDzZIJYD3j+F0nY427tfi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059290; c=relaxed/simple;
	bh=cLDLzfRzL/iWdI+EEKBcb/jXgTAtbt5D6sMaRuAwo50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PR0qjQSSu7nK9wecSHTbYJClf7f6GhUc8tpQufDBX3Utdr84F5p/yoc4sssO0gQdDela1zGXTI6fIPivPUpAGbGrkr/+pTtAt3oVTfmV7mbNILIga1in8em6NIRedpuBAeLkJk+ax6UQ6MgnlMIVE0ZhbzQH3UKOQNDRE18ca20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CchEurjZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4906238c62eso54462365e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780059287; x=1780664087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pP6WBbFR0rqelNglh6H5g+knQHo3T1xmXwPHqlFYGx0=;
        b=CchEurjZdwlSnimhEi0f0DoD901Annvw20HzU0sC9zDX5tqm4xKguYMfCImUmDzNMi
         40qad8+yO5PwBXxZEOH9tbu2CMMR3FVAPcY/La2GZwX4gUwFuvy1dvgYYArtDNQA+/Vc
         qUAYufIuV6VPpU88+MchvLOcz5d+DuKySiAL269yzPseYZ3MVbuzaqU+YYlO85b1vbms
         JdQs8lEP+JUOdDpFCdPZIWmviQJatlRN8WJus3P6j2FPDhUO5yRAAyVaLVHhP/ESJM+k
         2NQB2h1QgK9+Nd95MRN1fR6OFoju1OPNI1u7xKflcEaib69yA7QCA28uRTeSfWQuqwiD
         9BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059287; x=1780664087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP6WBbFR0rqelNglh6H5g+knQHo3T1xmXwPHqlFYGx0=;
        b=H9u/2hmhKvndEyogmqi7A/S4sx9V43AmKoX6YdxIlJiVcw5rx9XROoCmOgh1T0qb/J
         ZkaB7w/20uPGgfBJTpwZNEYKOoXqb6pEOMY7etgSy/828BQYvciigR8pP4bZf92cvV9F
         RI4bTxSnMystvdyjwzOKPk6/fy1fdZLdTjZWxQY5gVJ1W1jr784rsY+tfEDLXMPQE5SO
         xkQDKq5htDxk1/XNRDB5SCr4BaEdfZDQd2+wHa957e/DPCp+hx+FQDEOGEbiuZojq85Z
         b0bTQe/fR6J7DmjsLD7aUrpnK8CsQUQxxuHJLN2HLmAFuixUs4nteEWWToEk3f5nnvn4
         MHqA==
X-Forwarded-Encrypted: i=1; AFNElJ/J+r0UA5q8HomkoX3671lxVWOOI9IQnHdWHfXm21L4Zo7g/3uydagEIxj69O7SC/DjvIePtkhWN85g9bDbKERMdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGzcjgWGFf3CIzlv/la0JAORi57tPvYd5gXvm6fXR37nFJ5dAg
	eK/6OCFwTSRpeVlYW0sYs3anfcHZtQSy4r8d97Aoat8Q8/eUtzGrLW2u
X-Gm-Gg: Acq92OEr+i3UqNNaH+ooWmQQya3E82vmruQ7EeIIq3pu6+B9pKZCEvDBWg41mO6RdiS
	g/8vmDeF8nP8fe/3xc5BIiRmcFWkqPpzd2ttPfuXNvMgWaRqUcRDXITYKlISL9cL5CTl0eP5lqu
	+cdrxY+5akJTvcIFa4rwdVtY5DJoxz0Oiycn28R44z2FwGlPe4C6PhYmjMXtpQzbx2WKvsIysWB
	0XyTxG+6N/MA8Lyg9w0D3ut/iZPMxjZ8yxbbM7WixET9kwDqor70CIrBdzeAWhdFiu32j01hNA7
	Oy5fe8bXpVRLEyD2VWEeWyo5I0oHBYOXKG2vBYllgQ0HzHQS3QQX4T4QIPg2fd3S9Qq81gXjb03
	cMqPj1cNBIpEQIu+E+97CnBLpX54TzkgUm57NWS2j84F7vFAlLzhueIJGl5HsQa7lmIV+l9Cmj7
	AfAOVOV9vvZHu7q8xIIP0cPUS5RL4EkROGQNAJYpVwanL41iqaF5iRwnKY+RPXz+fRCK9Ncg==
X-Received: by 2002:a05:600c:4e55:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-4909c0a7eeemr55869565e9.16.1780059286890;
        Fri, 29 May 2026 05:54:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:df4f:8f31:69aa:c094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0aecdfsm14200725e9.13.2026.05.29.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:54:46 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2] arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes
Date: Fri, 29 May 2026 13:54:40 +0100
Message-ID: <20260529125442.327290-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33344-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6DC8C602884
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable rsci{1,2,3} device nodes for the RZ/G3L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped SW_SER0_PMOD macro check in rsci2 as it is always available
   for use.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 32d3b08a3cf3..3ce24b66cb8d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,7 @@
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
 #define SW_I3C_EN		0
+#define SW_SER0_PMOD		1
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -37,6 +38,9 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		serial0 = &rsci2;
+		serial1 = &rsci3;
+		serial2 = &rsci1;
 		serial3 = &scif0;
 	};
 
@@ -134,6 +138,30 @@ i2c3_pins: i2c3 {
 			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
 	};
 
+	rsci1_pins: rsci1 {
+		pinmux = <RZG3L_PORT_PINMUX(D, 4, 5)>, /* RSCI1_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(D, 5, 5)>, /* RSCI1_TXD_MOSI_SDA */
+			 <RZG3L_PORT_PINMUX(D, 6, 6)>, /* RSCI1_CTS */
+			 <RZG3L_PORT_PINMUX(D, 7, 5)>; /* RSCI1_SS_CTS#_RTS# */
+		bias-pull-up;
+	};
+
+	rsci2_pins: rsci2 {
+		pinmux = <RZG3L_PORT_PINMUX(7, 6, 5)>, /* RSCI2_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(7, 7, 5)>, /* RSCI2_TXD_MOSI_SDA */
+			 <RZG3L_PORT_PINMUX(8, 0, 6)>, /* RSCI2_CTS */
+			 <RZG3L_PORT_PINMUX(8, 1, 5)>; /* RSCI2_SS_CTS#_RTS# */
+		bias-pull-up;
+		power-source = <1800>;
+	};
+
+	rsci3_pins: rsci3 {
+		pinmux = <RZG3L_PORT_PINMUX(8, 2, 5)>, /* RSCI3_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(8, 3, 5)>; /* RSCI3_TXD_MOSI_SDA */
+		bias-pull-up;
+		power-source = <1800>;
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
@@ -147,6 +175,37 @@ ssi0_pins: ssi0 {
 	};
 };
 
+#if SW_SER0_PMOD
+&rsci1 {
+	pinctrl-0 = <&rsci1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+
+	status = "okay";
+};
+#endif
+
+#if !SW_DPI_EN
+&rsci2 {
+	pinctrl-0 = <&rsci2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+
+	status = "okay";
+};
+#endif
+
+#if (!SW_DPI_EN)
+&rsci3 {
+	pinctrl-0 = <&rsci3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


