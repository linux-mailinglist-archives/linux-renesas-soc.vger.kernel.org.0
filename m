Return-Path: <linux-renesas-soc+bounces-27114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D+HK70kcGlRVwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 01:58:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E97E4EC40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 01:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70F52846B98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 12:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A3B43637F;
	Tue, 20 Jan 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP/wSfZR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4831831ED71
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913568; cv=none; b=I4IQPvqOUtqcUa7gv/PNwwcJ0BI/elUXLCzGYoNFFn8dUYVbZ3AfyXKDx679geNWMFlzr+uHyPW9AkKo71Ai3AeLCMmDcSePyVR/WLxfTsDcvVu4MP6MX3sUrWDj9Zz/y9w6wkKK7dHgizjScehmA18ZHZMB9BFzWWTkL7+M96E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913568; c=relaxed/simple;
	bh=0y9P4Uol4HIgbk4+cz6iwHkdzghQLj9ti5Di6Mh2y7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8GVn4Xjg4aPW4ekUXmTgPwcspb3Z5qz2MpmFaVwQSJIjdF6AvRQEmFFc/LMi2EyUAiI2jrzS6R12hLcfMhW15JTxpGq+dDW0/ML3ig9fACWgKyAfYCNgU/dlT+bmI6a2I4w0cIyC47w6ppnu7e1Uo+Ns/CQW5vsHImkbE6jw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP/wSfZR; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b87f00ec06aso234640666b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913562; x=1769518362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qL8xkBLDWQg0TaEXwq0QgvZjs42SE1DBI0R1nDd1O2U=;
        b=nP/wSfZRDFMAwYZx7CcbKjMuqhGdwvvXeyLDHPi/1+yZnWoddu40SiKS0d5LBvgnpm
         dBybyFH2EqrrvxjvRxeO7UBEBJvMKqxcn1gUm6WcguSMboeUX6hq5lftfqrFMChA7F0r
         bTmZhU3f4ouC7wxkMMeXoW9gIRtkwoeqVWxuK+wwHj4WbDeRrR7KufR7dvM1YS4cttQy
         uMI/wFcxBn7Q1jTItw6+CAYwHJ7Gg69SohsFlNtSLL8Nyam2s8FBekusCwwYBoHievyX
         9Jk3Io5iGSR1k3Kriu8OWM/yKcUhSCP0dpiNAqTrIJOFnZ7rQLHWAVkAJuontjE1J5OH
         vPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913562; x=1769518362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qL8xkBLDWQg0TaEXwq0QgvZjs42SE1DBI0R1nDd1O2U=;
        b=wQoRBC0xz9rKM9pPPPx/FujgkYx5eFonwHU3LGD89SWOSptFzokK7Pbdi1xhvBjwjN
         BnmxBV5HwNMZj4yPo/cdapImBdKx2N6ohejplY08/Ld74wYa4iOGOZrj31HWOmM4B4UR
         wuQ2zWjKHDVzh6Pk847Puhb2khtnt6Hrek3pBLatJSjyrqFOdtzDN5KaqCZiN2jFI7Ib
         cd5h3wzIf/ATtDO+2nEVostOyuPXLguavZN9FgNWgKqqyHistj18S3r2VUqBAUtcVvXr
         RsxeEdNTvAILF0PDpcUebrtpUIFW4WwgWCilFv08m2MwsehgMQaWpTHUVY0TyIS478xj
         Zo+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhr1c0lk5HADXEBXyQCFdrK61Col+9bmmV24GSfYkq0gWb3JI+UJvrVnSpR175Rr//KfeI3t/nBYJF2mLKG3HXUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ByeCD5PAMxIazU5zniT4GJzilm7FrZZWtg2bPopMcVvYr4gQ
	dbuS8pzq4IQ0UnF2HV26N4egbjGqZR7QLSfthYX9wlU/kTOcBPLzkFfo
X-Gm-Gg: AY/fxX4Mx1/s13l0qMguuurIr0QZ2wz+ULa56j1kI0srakJ40Wn8IPs7FVIdqt1f03F
	WZpsOKmEYUF8sLAVTdF6cyj1jGR2g128iPenNJ/QZvo00P1rQXZf45xLaVJXVqs+1IR/MM4gssQ
	jX8vkmkl0zLrEYW8Z29vbrncMF81TLgoc1GavFv1b2h1ypKgk+AjB8uMnOIuiHWcmRn2hdoDnRH
	Qy5x93a1Pnk2d+zXJWy7lr3ZzQ9r0L/EZZNUx+Z63VXN72oURFA5TKyh+rh+LduNaqRMckwyQAp
	murzDSNlv4WNnw0je7ei4y5iU2AR1YBxlSHdzrQWL1SOFTj8TmxIOONCx24q1NIHHpiAtLtPmKn
	Ffli3mIikG7os7qy1LPUK5LCT+t4QTjaf5b0cXoOmplZ4WEO+hzDe470ay5TbuB3YFB+CB/h1Aa
	gqwbsMD/3ZkDMmVbEXxAv62BppbR8xgNJcIC8=
X-Received: by 2002:a17:907:9719:b0:b83:3773:dd98 with SMTP id a640c23a62f3a-b88002618e2mr171794866b.20.1768913561960;
        Tue, 20 Jan 2026 04:52:41 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:41 -0800 (PST)
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
Subject: [PATCH 11/12] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Tue, 20 Jan 2026 12:52:22 +0000
Message-ID: <20260120125232.349708-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-27114-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1E97E4EC40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

SMARC2 board dtsi is common for multiple SoCs. So move usb3 nodes
to board DTS as some SOCs (eg: RZ/G3{S,L}) does not support USB3.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 696903dc7a63..cc75f6fdf7f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -248,7 +248,13 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&usb3_phy {
+	status = "okay";
+};
+
 &xhci {
 	pinctrl-0 = <&usb3_pins>;
 	pinctrl-names = "default";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index b607b5d6c259..69c0101ff7f5 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -107,11 +107,3 @@ &sdhi1 {
 
 	status = "okay";
 };
-
-&usb3_phy {
-	status = "okay";
-};
-
-&xhci {
-	status = "okay";
-};
-- 
2.43.0


