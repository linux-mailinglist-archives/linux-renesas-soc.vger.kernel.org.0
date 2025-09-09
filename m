Return-Path: <linux-renesas-soc+bounces-21622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591DB4A712
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 11:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667F9543A7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 09:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772252877DE;
	Tue,  9 Sep 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZhnDyue"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3994C285C9F;
	Tue,  9 Sep 2025 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409156; cv=none; b=OQvq3DCN0fBQRK01Qo7r29evtMqrpXt7bAfVRVPvKqwgpK9Cc0KrPu+WwQF2jcBo6YvI5rgyqYk7/1G2zxkrm9ZPs4JWay8tytsQGT10wKVgr2XQGqx0Gglwf+W9gtjvuJfMEd1P4TbwtAM/gUqya61yX2dwRLU5o5fSo5QQ3ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409156; c=relaxed/simple;
	bh=m7ZZU9h5JvGnkZ8Ir264p71bTvlUeQhh0klKyWcPma8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Guv2DvgMi8nfRb8TMK75w0Hdvzhqdd+Nmhsb/mubPkOJ8YPzXfaRVf41tz2/RaqGbLPXD4oBwnA13Fhx7Ia9UCQDbv8eL32ITYS724aShN8d6OxAJIw4EZgseH2AYbaQeiZ9vc/8s5QyQJ5puQygMuHovE99jq+syGA3vxZ9Yy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZhnDyue; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so33789005e9.0;
        Tue, 09 Sep 2025 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757409152; x=1758013952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjwRHCbUSAxI/MIr5daqIRr+6lfMsaDKyPmMi+Nun2Y=;
        b=TZhnDyue1SwoOKUJuovzX/SBAhRJ6j5vdzGLwnKg3gU/XrWzwUEmY9IpRxOist4bPh
         PZJXl6qmS42S+M6rpbs+YmJEdKZWi6xI+EvKGqpE/Svx8rPaQrCGw/Ndc+kSUqtUpLCb
         4iY2cHvvQhl+xpkOwm8zAnOs6vRd/XlPnSPNiKW/tNI6XKEn8sfJ0cIe/thLgSzZcMwV
         HwfH2/eAfxobrFb9Lb7M+bKfSMJ31QabfBoHEKrfETVspel7SmYIphbm9kafZLSdRzk4
         +CbETUFtLHs8k2Z3zGYPRnrSs42PtSVNxqyp8vHdXimtGDhG3SuQnMwb8lUhx4fEoc5o
         C3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409152; x=1758013952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjwRHCbUSAxI/MIr5daqIRr+6lfMsaDKyPmMi+Nun2Y=;
        b=taiD0OKaKMn3yVsT6kPmz49KJyOea2JX0pSWcWYtXO29bRETcxeBaIboPmPm+80ZNg
         RI874eStKXUD+kSWWNxUkkf5RrpMDwm8M9Xz685LwZWki3CUTXrjg6MVZSHACI0IwaNa
         w6STXNcsfr1bC0seceXlBZ9JTbDPp8FMMHQ+xL5saX/7ljVCDm0UQqmBj7MZjGJjeF3v
         IZd9R8HAjFsIJdTh7z6s1GGZKESvmNkJ7xhmqJED04kNHGVTBKwjrxKQwj77jih+aviJ
         vB1/lc1Ljs+QIm+TVXvP3RP81CXo7IgJLHopFZVKyRblQ+SWUjhd44iZ/bnEme8rVJPH
         zc1A==
X-Forwarded-Encrypted: i=1; AJvYcCVChq67eKIpXpy6YdgHmxki2bMgxgi4vVZ7AUmCgN+XKPxJCFu6JY/L8UsmDYdLJ4YhAUdOT/3jSulfJy8AYNz+BNA=@vger.kernel.org, AJvYcCX6/2eojtPydKMhWI/N0zryUk96MNdxTaXw1YH7aM/ZdfK5m+JeT586PGIM/0s40aiHKIX8OxoqwaoI@vger.kernel.org, AJvYcCXqZ2Vef3eJISunnPc+12yI6zvqIk4u0F/CqtSsw4q6JSGYAmxjgxe/wWUJUi1dUSuoqpBtYBySDnCbzDcq@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMSjNr8du4qxgs8qTfrN7yDO3Z8QXpj2UwU56VLZKMKatE2il
	AfN4VnMpB6HBntQA32VXcjMn4INFWCEQdj4wqHeHNP9IKx4zeS8BCe6f
X-Gm-Gg: ASbGncuG7nKGOZf5cz63sFAqPj6bP+RKhsBNRbqX2amXu4uFYYxuNQ1+OIJ20mOzbea
	GPEgIj6SBZMX5O13APr31wdJ8UiqFmgE4zLOf6CVHYEBAysDryvxBcvIda1h5Qrd9dxbTKsSA3G
	QP940fygws5psjs3bBIgvAUMdG2sgM3Ic3Q9LkrcX0R0W1koksiKJjZHy2m22DmT7aFZbgZTCWl
	lbC3JGHUINmBdIFg2fcthXEVKWFtK+Bg+aE8Ar3dUVyBYhWMYE/F4YCMD+VxARAU9eB9KXwYKki
	Fj537hnR8H+fPuFqJNYvHDObWgmFiIxd8/SOMZtBDZhQysajMB0C21HoJz4s9ZMKpfpzkGC/9G0
	qHwAnqGNq2z8+h1+QzS8IJ8G/FD8v3fNneWol5gy0ZcntwHMlNddI65w0LCN3h29WunWdaDlwER
	Ea6pDYEajOyDBk
X-Google-Smtp-Source: AGHT+IFfWk/Eze8IwCj+UaGpMYdyJt+r13ZaXzuakT3YZOumtGt4NsFrm/H5zq5jPnHuMVDrmNs0eg==
X-Received: by 2002:a05:6000:1a8c:b0:3d7:f363:2f0d with SMTP id ffacd0b85a97d-3e643274b76mr8993948f8f.28.1757409152424;
        Tue, 09 Sep 2025 02:12:32 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45deff68b43sm6975685e9.2.2025.09.09.02.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:12:32 -0700 (PDT)
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
Subject: [PATCH v2 8/8] arm64: dts: renesas: r9a09g047e57-smarc: Enable GPT on carrier board
Date: Tue,  9 Sep 2025 10:12:18 +0100
Message-ID: <20250909091225.128658-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909091225.128658-1-biju.das.jz@bp.renesas.com>
References: <20250909091225.128658-1-biju.das.jz@bp.renesas.com>
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
and node on the carrier board dtsi file.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 08e814c03fa8..86df67e9230d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -84,6 +84,14 @@ &can_transceiver1 {
 };
 #endif
 
+#if (!SW_LCD_EN) && (!SW_GPIO8_CAN0_STB)
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


