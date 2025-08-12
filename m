Return-Path: <linux-renesas-soc+bounces-20423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9998B23998
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AC3D7B6CA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17A22FFDFB;
	Tue, 12 Aug 2025 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNp2SGvV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D642FF175;
	Tue, 12 Aug 2025 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029034; cv=none; b=SOka6KCk/WF2IpHh5Lya2kJi+02E78q5LPOnqtJ4NOvsi3J3LbGHbrYc9qkP4QeCL6kehb5+RN4Jjdw49+u9R1n7OZ8DGKrKk21Bh4kdWbnOYiYn414JgePMhlu70WGaNXRQWIcsywspYijmexQTQHp36QauIvvam+p2DGA+H14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029034; c=relaxed/simple;
	bh=A0U1IqL0HUWahc+3Y1WqGLqYhOlaxxaOyFvxQ6oFsE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXrCtyAOBU/1DgE7svsVva+J6x3pTxv0AQu8qjDOSng2JGGEyLlblMa9PRy/YyolnJy+ptlkQe1tNSE9CBGb3QBE90UozDsV0Peu8nxmsSqxAmFpd4JPuz73rY3hLtKU5ZvjSH0GAQ/OCMK9zxtnCQlNI5cG1RulWPKdOL3Xs9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNp2SGvV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a12b3f4b3so8031225e9.3;
        Tue, 12 Aug 2025 13:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029031; x=1755633831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kXmY2xelXq8ZBpDvgolWsQfgTp8M5zbfRSHWzh0glw=;
        b=gNp2SGvVN8NEFyIQpf7nDeco85aWwppL+05nl9NvCrgkjEOe5+DChlu24PXMcKc1Kg
         cO9jI4PoJBptPtXeKcxgdzQ5n5yBV6dyX9pHhEyVLwB7OwLRPat/SDUuRPOVvm4L0WQ+
         xwuO40kAVOGT5AyRREEGmj466xobZoRMBXav1Hpg/dbdcuiO/Z+WbS+2w7HMYdZ3Xj9f
         R3ZWvxfe2VZdnU2Ype/YXUc0SNWXNK92Mpyob8kePGiXkrcAzKZ61ZesgCG5cbt/W5bq
         YYpgfcyt6pkqUbt4NbovvA6asTl17fsXimBId/J70mvTx9hZbDYceb7sHJ5+99L9OLnK
         QW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029031; x=1755633831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kXmY2xelXq8ZBpDvgolWsQfgTp8M5zbfRSHWzh0glw=;
        b=Rzu4LlgubI7bpENLaCsVyeZRn7YqzPMtkG5fOAke50xLRX5CNybugFf1J+5Se96IkO
         xjhXLj8udQ7+ZqKGUkfkxkaY1wgawqBIQ7cbgOfnL94ZiZ2OVO9y/a3g8A2/PzJJ7nlt
         f6zuesXND6LTOVpo5mv7DIq/Cmz49FA0Y4hxxR6GdGVOjlTUt0BVK+fWO8qpLcLvh7LF
         VJ0ltmj7GJz1Xz9UJpFi1NsKvSHl3sDKS0ipnyIttospilF1oJWmVjrYiYQajsXy6qZe
         4VPJSC8KF6CkF9TI+0uQnkv6IlfBgFLo9YKagBTQxBfwg7yLtQ3qQvvyazUMAlTtAhDW
         iuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlNkT/zNoj2bDqwJ5Bo3Z07vnMO+xdQ5zqGTommDECDi+9CUlfirLsKST4opHUpiBP2gDZjh/8ITHvytl6@vger.kernel.org, AJvYcCXLvs0jgrXlfMVtzdotNOp8j1CsHhoA1BNtfUoqvJNgZ7gy3NiiCcSp4r9YSe6XHPsBASgG5yFYngcf@vger.kernel.org
X-Gm-Message-State: AOJu0YxcVMyGvFLuj/1Pi0Rif6XdYzQpClr7ZNu+eaffTdXhCl1NZ7CR
	0K1ibHAdAFqU88PAAjGpyO0QylUofZ494gxnkGW+5tkUowgexLydVEYE
X-Gm-Gg: ASbGncuvE3HOOlJEgiwklduNrM8G82eJYwQt+83yMowo9Ft5luTdtBZnrWtdQfvntBj
	hAZEHPJU7dpL0517JHs1/3Ukfora08co7wUVgtueI8ef7zhMbVClY28EuGkhH7LK6LbEL0yaeE4
	pcPxvBRd1B+IJ04VsYBrHAI5dBZ7i9Jrd2uCBavF3wEpp/b5o1zZhUK2KrBvXmpuYYvUHPL+mjS
	tgIlO2HZh6VsNlRzVagoWjk4sF51FlqBv4uQFvZ/RfNCGeyxmPUpDp3fTCCnTzTy5t2ej3SvcDb
	Fc0q/5k9xa8dpHucRBQD94Tr/ypdz5NmIRkGOyQnhvx2zYSk95J6KBD3W40/kmG/UQtvBo01joV
	3lCEs571buWpP9rdFcvA4Vh3y7iJWEuoc6KqIQxMp2ZVpP26tK0uEq/IVFNXcxXRCrcpahyAng4
	x5l5JXFmmR
X-Google-Smtp-Source: AGHT+IFmgfdYD0cst+vKn8ApYuVmRcM8RLgFXoxHw7HWxghLR98GkHHSD60MerWeABKFV4YhSF4BKQ==
X-Received: by 2002:a05:600c:4515:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-45a1660d403mr2811295e9.13.1755029031257;
        Tue, 12 Aug 2025 13:03:51 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:50 -0700 (PDT)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 05/13] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
Date: Tue, 12 Aug 2025 21:03:36 +0100
Message-ID: <20250812200344.3253781-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USER LED0-LED8, which are available on RZ/T2H EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 486584fefead..a0cf01978f15 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -7,10 +7,61 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+
 #include "r9a09g077m44.dtsi"
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
 	model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
 	compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			/* SW8-9: ON, SW8-10: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(23, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		led1 {
+			/* SW5-1: OFF, SW5-2: ON */
+			gpios = <&pinctrl RZT2H_GPIO(32, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		led2 {
+			gpios = <&pinctrl RZT2H_GPIO(6, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led3 {
+			/* SW2-3: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(8, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		led4 {
+			/* SW8-3: ON, SW8-4: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(18, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		led5 {
+			/* SW8-1: ON, SW8-2: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		led6 {
+			/* SW5-9: OFF, SW5-10: ON */
+			gpios = <&pinctrl RZT2H_GPIO(22, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led7 {
+			/* SW5-7: OFF, SW5-8: ON */
+			gpios = <&pinctrl RZT2H_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		led8 {
+			/* SW7-5: OFF, SW7-6: ON */
+			gpios = <&pinctrl RZT2H_GPIO(23, 5) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
-- 
2.50.1


