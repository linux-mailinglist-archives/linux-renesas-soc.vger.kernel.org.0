Return-Path: <linux-renesas-soc+bounces-17150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4906AB8F29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 20:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474683ADCB3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 18:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DD12868AB;
	Thu, 15 May 2025 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYyzODzj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA8128469D;
	Thu, 15 May 2025 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333880; cv=none; b=Jr1bKmeaMw8DJt0R4+vZODEthjdqOigndzI75ELjaf/fYR2jyes+4zENyUNucIFas0Y0gMZ1A9OkRV0yguT04z+o+j8B2UX4smh/ukBU1lK8p52IEqgtfNUW7TTygl+024P5zvGQtaBJavoQjPl1JGo+WNMAD6X7NxsQDgvof3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333880; c=relaxed/simple;
	bh=T7eon4OpgUttbHvJTaWhUuGKzckIsIXy0biLoHvltqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNzMbunX65zMCJr+abIsv3PUS176MfuPiItpSheg5b13vceDY6nF3ker1Mk+8PReWLAY1wllIHD+TROtCv+v9nCWzwW6Xo8GOskkHdM9kJ+Uj1SMDKYUEm/S+cGyLORKRVW5zV4tIhxdSS0z/qkQGeA/6OWqcH2wHpTqXqGQFmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYyzODzj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442ea95f738so9717155e9.3;
        Thu, 15 May 2025 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333876; x=1747938676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgt+UqRbzQMYGZ9gSa6/MNRvDv4gCtP0dLlpl9oMdxU=;
        b=lYyzODzjidl5n4xqfCPOstJCPFARyQ5iIot5DT705g++KTfwfh+ZQjhhbZIxsWyeTg
         Bkf3VwfEBo41CH5NEO3ufXzQ+I0yFBKCBDxTp0yZU7cc9foce+ykps0tYN+iwDZiNSwn
         15QDwiy5AkgtYkW/9kv4DgvTcJYlS0qH6hRcBfi5+Y/p6xozdRYZc46I5QkZbviF2bWm
         xadcR4rFIdZQg9PUyZD3zIC7kMcOB0vbfm1Rbburdbo16HciUVRxzedmx3+eZVygUaNB
         L2vRJJ4/apU3PhafX+OMnxFFj+j2vYTnhkxg/i3zVpX60cOesC+qdyS6gInduwVO6JSF
         D6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333876; x=1747938676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgt+UqRbzQMYGZ9gSa6/MNRvDv4gCtP0dLlpl9oMdxU=;
        b=sgXmVnHHVh6LH/+olL+OKqzSJZuIy8D7BiHHvjnfbdRvWZ2/ZmCJfCwysOKxNNol47
         6TjNCrRr4eVfm7HzsXueb2+KPPmTS4xa40ZxEV2QgEt8dscskW7INLNoLT27yYaFE86n
         c+yAth2PHdsxRc7OsDCqEcuc7LJK0ocXru5LD5yxtUk5NN0HTpzM+r47DY8s5Hm+jwFQ
         nICEnrpxPmE+ev5iqNhfuv2aAJPHkpnRexB8weFm5fGvySlZYwcYesCf25czhvGUSQPW
         bS+eD0rw7HSXZ/tq8/UsSUl1hrharcicHwtJFv0BKs3Bwl+ZwiH5Amxz6n3UvL1dc5wo
         ldNg==
X-Forwarded-Encrypted: i=1; AJvYcCUHrEKzw3i74npmfVjvoB0zjSHBlsS+UkcuqSyyYpBBLSuavntc5JQ52G8vuhdzGrXtb7ORCFEJd60o2QYB@vger.kernel.org, AJvYcCUgl0Sx23Ph4Un7ZTQ9Fv3tEStDpbjxivGy8zXiPT+2QxziVQm7Ms01xSsKL1Pa4beK2hhaZE7Q+n2q@vger.kernel.org
X-Gm-Message-State: AOJu0YyAVfftKob00vWgKpNsGqk/dEhjsiAZyAQLID0LbggqOLWBqAv3
	uFQbqXvowu3K6lbsNkyu45M18G9609itCcdcS3L2ULnnhWwdS8owx7PtE9gD2xim
X-Gm-Gg: ASbGncvU1C+nvHOKj9Ec3RqHSzrHXfkpNYc+VA+VdaIVF7WxDEL1B5qPIghkCcmrphV
	D2M4aC8W5sZMRgFgR72fSwH8GIRHuL4+V15QwRO7feV/5tWzI0tPdFvQjwWsRpv8FCtPtpIvmaQ
	TONmShok58/qmn95Wz7bItwE6vMapZwxv8Bzen5dliTNkseSokFG1LGlIYbIh+wlw6AeRmJiFcq
	Vfs1Kca+8MqHFny90DUoXA6G+bTwupr2mUf8S+PIkaJLahh7mfmUE967jpoAb0g6qHSM/8Fe/W1
	Sq9GaZ7uimPrQeWezEYnAk2cj5/p6ZPJAFx2q4dkLzxqzC9AFYsVM2yCOYeBtyeCEyArl9cIexa
	AvidJiajzeC2clwj8WUk=
X-Google-Smtp-Source: AGHT+IFE1OED2DfyrW1jYUdMwIboP6aR2gFb3LSJGdiiT5aKCIvAaLzAEz24Bc0+RwRLD4qqK7nUOw==
X-Received: by 2002:a5d:5b8a:0:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-3a35c845d64mr647489f8f.33.1747333876438;
        Thu, 15 May 2025 11:31:16 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d012sm262816f8f.94.2025.05.15.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:31:15 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2.0 support
Date: Thu, 15 May 2025 19:31:04 +0100
Message-ID: <20250515183104.330964-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable USB2.0 support on the RZ/V2H EVK board, CN3 supports
host only operation and CN2 supports host/function operation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index d6d2f689b875..f4203e7cdc6b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -80,6 +80,15 @@ &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
 &eth0 {
 	pinctrl-0 = <&eth0_pins>;
 	pinctrl-names = "default";
@@ -101,6 +110,11 @@ &gpu {
 	mali-supply = <&reg_0p8v>;
 };
 
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -195,6 +209,15 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &ostm0 {
 	status = "okay";
 };
@@ -303,6 +326,28 @@ sd1_cd {
 			pinmux = <RZV2H_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
 		};
 	};
+
+	usb20_pins: usb20 {
+		vbus {
+			pinmux = <RZV2H_PORT_PINMUX(9, 5, 14)>; /* VBUS */
+		};
+
+		ovc {
+			pinmux =  <RZV2H_PORT_PINMUX(9, 6, 14)>; /* OVC */
+			bias-pull-up;
+		};
+	};
+
+	usb21_pins: usb21 {
+		vbus {
+			pinmux = <RZV2H_PORT_PINMUX(6, 6, 14)>; /* VBUS */
+		};
+
+		ovc {
+			pinmux = <RZV2H_PORT_PINMUX(6, 7, 14)>; /* OVC */
+			bias-pull-up;
+		};
+	};
 };
 
 &qextal_clk {
@@ -332,6 +377,28 @@ &sdhi1 {
 	status = "okay";
 };
 
+&usb20phyrst {
+	status = "okay";
+};
+
+&usb21phyrst {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb20_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb21_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &wdt1 {
 	status = "okay";
 };
-- 
2.49.0


