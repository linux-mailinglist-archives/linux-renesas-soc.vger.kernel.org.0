Return-Path: <linux-renesas-soc+bounces-26113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44847CDCFAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED04E306292E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AF7342CBB;
	Wed, 24 Dec 2025 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7iMFGNc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1AA33D4F2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766598745; cv=none; b=E110vVljqhwrafhmC3BLDTNvsJJyQUQwFqhV6pFuE5GnH26kl/9CJE/PHpdiawhPVcsk56GSxbbvYThWeA6V/pQtQ9KQUbpDUN4OjHUCy5BEJnFOF1hYe+NCcNXDf1hLR9pjJM8XuChguH+yRYv8T3aZ7MbBJQPhyXrsOAE2br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766598745; c=relaxed/simple;
	bh=KlmvVYidi/b+GF8gj7jC9Ui3l0jxyM6Tto7halMyMdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8LJWBT1n0qhiGwRb7FbdKJOFEImiLpHmEVxJbs0OYHkxyO6dZ0YzCsb/U9kTv2ynh3BQs9RN8hVtauXDnZUxxW3y8+oShgDsCNMt1dVYoTYejYPskny9HBRkPbu2HW/smYqEHnZRfd9KxmPJs6dqzp49vgRbWc/pr25H+idDd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7iMFGNc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47774d3536dso48052795e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766598742; x=1767203542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaOIXxrqQCngZffYscFSrUnSSaaW8h0KY7Aw0tMh0SQ=;
        b=U7iMFGNc521A575PHnsitwEUeFpDRvHMZ+4hi/nbzvrCBa1GACmNBiJiTpCY0ScDim
         urTydiX2Xx733E5LylnXy52sHfCTaeiW52Brm9IgbNDw8mchWnNziN6QEY+XMuwS+fJO
         BEXq/wMvj/OM4VQf0Y7PNFhAvZFXLmk2MJhULRNQbfSx7Upk+GjPu4Icl+z650zK8Ol/
         J4FerNPJKrfppfOTpIxRCt0friCdhVf8wJ5N60VSghVU4MZiZmKbn9K52/Cgt2m1zDm8
         9eTCQmtDF73+v7pvnTXxTJQb/gqAucyipHKsm1wCvnZiK+Ii5HkEBjmdaNGMzlM0Ywz+
         sQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766598742; x=1767203542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gaOIXxrqQCngZffYscFSrUnSSaaW8h0KY7Aw0tMh0SQ=;
        b=krpLRR1EeE/cV0kjxjn3IWqjuA43U+CXAdeFPqqBnOj7qlHR6R9hzlG9uTfjqFFAOZ
         P/J6MMpXvJxfeNwaPjJVKNnwXTE2l3CYMSWaohH2XGsObQA5Pj9WIpq5I48Qnsf1aodc
         VwIr7l/hN+KACGSFgFjkYtITBduKy5yEgktPPAMlOdfWI0gWbF2t0KWG7vVqYBKkmKts
         2R3RMZHSoNJyC3tR3xgjcbmYOCf0ySpMyrK8wQUJEyUEDCNt1W3rkDHkTzF8HhOAIsvc
         8CiQmALylV+hms2axj19nzqLwlc7M0Uk69HlY+fTQlrBOwY6lPGHSVhF7sRkgWf96xpp
         e4hA==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZLzXLT6O7xUl5OYkxp1R4aO7TkjmQDfUH4H0FlM5jQyQZ/uAmF9RGis8bGdNsf5gsfIt8poUTi2uC4z82yjoNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKsCEqPLmjEbtCbQ/D4BpQkcnVGKE+ONGJWBPydi0JYDfaGhsU
	CBGyBBR1eVMuNqVkCujgCnGCHnUq1RETJTAQRKgY1s4or3pgbYxEzV4s3wNwtGTPrIc=
X-Gm-Gg: AY/fxX5soidilvB3iOzcUtjCOHn+hQni5QbtC+PjEa1eKvOTuAB65sDxOol18Uf2YSE
	jxlYZrYOFt9lnjP8BN65yCfqpEqg5Jonv9b3cuxTD1Q9WIUoOp2NzVarNBLE6WSq2naKxe0TEek
	0w8TbJ1awuetbHzw3QM0tfoqX/6uaoJZEOpxmFAprN/hKKjpiJC9jqRfmZxwnEbDykzoy2Hfci1
	B7V2LuAINarlK1D4fnO/CvKrarY7SqSmtIy78pmdf/A2/u8uj6NP8D8XI8M1q/0Uwis7fY6c3Ar
	9D7klMOU8qDJVbXK59bgKiKCidI1HAiT5SKUG0rqOY/jXOq35J6uBN/3BCqgZ6iRdclAuA4BVyS
	a76Yt4bGiwzW6xfXDauqkwCAqPCwT9SWRsNI08AYk22lBPzSeK+k081iXl3W/zUkXruesUbhAzZ
	/qC3pZAx6SDgvDqrOxIwD67wisYGZFCiHtDUeocqTS99enbAKzh0PbO8I+nKtaLyu/DrxAZ4tud
	dmdc4/itB0Q33OBWwnyF9/m
X-Google-Smtp-Source: AGHT+IH8xpipIn0XYIQGn+wpBcL0Tro/gfFbgAogNdzCAHfKgQSv/rfI6oWpY03P3Y9XGAmaRo4w+A==
X-Received: by 2002:a05:600c:8b11:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47d2d273999mr133650515e9.15.1766598742312;
        Wed, 24 Dec 2025 09:52:22 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a4651bsm140167935e9.7.2025.12.24.09.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:52:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Enable CANFD
Date: Wed, 24 Dec 2025 17:52:02 +0000
Message-ID: <20251224175204.3400062-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable CANFD channel 1, which is available on the CN35 connector.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index eaf73868783b..ff18632a4214 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -27,6 +27,13 @@
 #define SD0_EMMC       1
 #define SD0_SD		(!SD0_EMMC)
 
+/*
+ * To enable CANFD interface disable both eMMC and SD card on SDHI0 by
+ * setting SD0_EMMC and SD0_SD macros to 0 as pins P12_0 and P12_1
+ * will be used for CANFD interface.
+ */
+#define CANFD_ENABLE	(!SD0_EMMC && !SD0_SD)
+
 /*
  * P17_4 = SD1_CD; DSW5[3] = ON; DSW19[1] = OFF; DSW19[2] = ON
  * P08_6 = SD1_IOVS; DSW5[3] = ON
@@ -173,6 +180,18 @@ led-11 {
 	};
 };
 
+#if CANFD_ENABLE
+&canfd {
+	pinctrl-0 = <&can1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	channel1 {
+		status = "okay";
+	};
+};
+#endif
+
 #if I2C0
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
@@ -209,6 +228,16 @@ &mdio2_phy {
 };
 
 &pinctrl {
+	/*
+	 * CAN1 Pin Configuration:
+	 *
+	 * DSW5[1] ON; DSW5[2] OFF - Use P12_0 and P12_1 for CAN1 interface.
+	 */
+	can1_pins: can1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x19)>, /* CANRX1 */
+			 <RZT2H_PORT_PINMUX(12, 1, 0x19)>; /* CANTX1 */
+	};
+
 	/*
 	 * GMAC2 Pin Configuration:
 	 *
-- 
2.52.0


