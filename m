Return-Path: <linux-renesas-soc+bounces-25664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF2CAD907
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0953730141EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E182A313E01;
	Mon,  8 Dec 2025 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I21Me1NL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE53288C26
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207307; cv=none; b=S6gfwFBZLXPKmnyrL0WnsXQ3S/5aEZozT37BCxqvpvn/2x2bBQd7ehQ8cB2csbKNtLLgSQ2TydHHeKW7Ii1sqEybBtgwvU6f0zuaWsYFrvSU9/08vD2F3Qw1L7NrN0gA0JIDsXeExuDxh1xKleU6gqwKgSVyGp9AdnvP7eU86XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207307; c=relaxed/simple;
	bh=gN4Lb0y9n07eAukUSb3zWgpxVym5NJ9gs7H5PBdfOM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnndLEruuKinJinSlj0sJSNmFJJ6bZFb0SSMV/oHGYpgTBpbLAtM4XUqH96QqfXpDEwe1MUCNz6asiB2Vo6l5QFc0ekFnTC8jm5XwrvvcXdBB3Bu3J1rMZem2JYunvXFdozCjz9MUDTaVdtlAFVzhDsvntym7oT/gbVd556/rAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I21Me1NL; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-644fcafdce9so6958118a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765207302; x=1765812102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfdD/YDC33QlvJadKSObtdJ/4VxyDtgNafuBr/k27aE=;
        b=I21Me1NLt+dtfJi1GUDfAG95hJZLvI8VHMM1ILpM2x0QzLuI7xUACzciW3MLcADcUf
         3h3Y6KPQqK14qT+5dnnRRJhIUAeSq5DwsXgfgA41htdYurWFI0FCb3/DAVVD1TT+fyYC
         ApwqSdogdXoi3UEuCv2CYhXlfDG3Y9xpB7Vm9sw2ohNmHcI7Rh8TZLRqJuNmpOE1nuMU
         r35hFp3gFpaGW+ySu1/TZ3MxQq/JtiMl+E/yRiDIlyQLDzpL87KbSkoIr7tNZWbEUa89
         g5HnbpgqHUPLsSJMbK5m5eCNZVMIJ+9ydMFk/lfZKoe51kfXlMoc5Yisc/Ef4DqJOsR0
         nOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207302; x=1765812102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfdD/YDC33QlvJadKSObtdJ/4VxyDtgNafuBr/k27aE=;
        b=GUQNGYPeJU2bhIPZLLJphiwNSI33FGyi/XsINmUsb7kAwITzW3ljRgflzdt2QMIoUM
         3EUyij4P0dk9UlhLLrnrPaqBvC2wgFtwMTAYKRIpXs1q+ROqJicK9rztCssgtXb9vdq8
         rB+16zK2xbLVwSQ2bA9HWbKKjw3SJVQf1vObbKtkx8ZI4JTStTgIulsJKUxdl7Op08xB
         f6id8bcNxd935TBiPRQWU5q2SrNmTvvKgkfqOOrH9KOzxcmliAaJ1YB1t36N8nA88O00
         /wcwVFcEtFjwPpztjmNYD00TUur0sLtZtO8Cc6f01ILdZ/8Sq9IebLqtJK07nkmirTdN
         JxPA==
X-Forwarded-Encrypted: i=1; AJvYcCXqL/Q+y2c4k0miC1PodT0vXzPLITbQB4xj7eeG7s6HffrVYMC9IbXzvQ1/Db6b4QIenRA1Hk64MYBLQyHLRa4D0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfTttM4fWnkG9YhlpG4PZFuQidkI1Bo72dmJuAgjIGZbmemn8
	0lxNwXaOy+7XkUZrHb2SDjf18cjvvN5wVLDJsFZMNPbiFvQ0RtBToXJi
X-Gm-Gg: ASbGnctJhjkgEuiiCB97toL4T1zjdrCqoJ1rC3iRWI7T4NeQFpbIeVnNRtRlfuBC43Y
	txhIZMBB+7Q/MI7N+IK0+usrrw5fknCZFpW79UYPupbk3xr6shrAMYMRbcuCz5n4Dkrp73kilKd
	c+XNXCfpE0ukRkSkgACWyKbAljYXCE+fRk2buLX5bG+FQXrdOOWfmhRKxkCzsEXeTCxWNGjzcM1
	oUSj+kEVog+qH0size818I2SdYJhSYYEFrAK/no0Jxf/bmhvYeVGSSnq5eOSGTUF/xeiUcBFQUb
	cs4sl7h9H8pSV04uVrjjMoFTgEdnHdVbiP1/IDlCbm60+rR4Q7nvcoCVALUCdvjeJQEfcn8JxC2
	8TNi/GiNOP31/FvXUxUA0SElkeLlTvyzGNH8M3sNcdDArpb4woVVNozg4m+sUSB6jfcM6uf6Q/s
	aIDpEeEBpK7ZMN7VrmL+wCTioIc28y4tbPDa+7VTTHVPQAuWWTsXMZ8U55KYQ/d5kkw8g8rJCeg
	eEkN8QGKS9UcQvy
X-Google-Smtp-Source: AGHT+IEeIV2A0KiRT84xitY8kCT+hBcxwCHMfiNf3nPSUpux3S6fzyyFAznoZlJsgLE8JeaJ574ztw==
X-Received: by 2002:a05:6402:26c1:b0:637:e271:8087 with SMTP id 4fb4d7f45d1cf-6491abf210bmr7063920a12.18.1765207301937;
        Mon, 08 Dec 2025 07:21:41 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412deddsm11547484a12.31.2025.12.08.07.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:21:41 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v4 9/9] arm64: dts: renesas: r9a09g047e57-smarc: Enable GPT on carrier board
Date: Mon,  8 Dec 2025 15:21:26 +0000
Message-ID: <20251208152133.269316-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
References: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The GTIOC4{A,B} IOs are available on the carrier board's PMOD1_6A
connector. Enable the GPT on the carrier board by adding the GPT pinmux
and device node on the board dts file.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Added SW_GPIO9_CAN1_STB check to gpt0 node.
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 0fd90d79b020..e4d2902ca4c8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -84,6 +84,14 @@ &can_transceiver1 {
 };
 #endif
 
+#if (!SW_LCD_EN) && (!SW_GPIO8_CAN0_STB) && (!SW_GPIO9_CAN1_STB)
+&gpt0 {
+	pinctrl-0 = <&gpt0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+#endif
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -125,6 +133,11 @@ can4_pins: can4 {
 		};
 	};
 
+	gpt0_pins: gpt0 {
+		pinmux = <RZG3E_PORT_PINMUX(5, 4, 10)>, /* GTIOC4A */
+			 <RZG3E_PORT_PINMUX(5, 5, 10)>; /* GTIOC4B */
+	};
+
 	i2c0_pins: i2c0 {
 		pinmux = <RZG3E_PORT_PINMUX(D, 4, 4)>, /* SCL0 */
 			 <RZG3E_PORT_PINMUX(D, 5, 4)>; /* SDA0 */
-- 
2.43.0


