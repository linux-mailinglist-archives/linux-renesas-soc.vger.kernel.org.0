Return-Path: <linux-renesas-soc+bounces-1664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C624836CC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 18:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C28F61F23BA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA3A64ABD;
	Mon, 22 Jan 2024 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="va9zdhuw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81CB4D5AF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705939562; cv=none; b=BpIPauPbYCTQZdGrwo4XKwlQGbcWpPgWNkyhI85L2dgT+Eo8CihvzsnXDnpUhbDp4CFcY1nItlIgVuvkcvnTFgYZn9nz2+Soak4zYk9+qsvGrYdnte006LunRCX7UesIE2OUd2rfVgyhNl0g1GL9bd+ledN8IQS2XL2fENnJ2Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705939562; c=relaxed/simple;
	bh=0yNamDlWAt2UOp9EwrLfsQiqRHfQuVX+zMaru+neglg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAFcX/ZEtVvh2mxEMLgf8UyDKkQkSRTlBQSYbtXIygOI1uAzIXJevr1CIugbmgtxpMNtq0p6ZCC8QcxS486MP7u1CrSlxwLiQ+miydWRnE6NKeDFaT+nXRntuy5kh0xzW2aCYx+b65qr28379b5qzogEuq8ojxRV6XEQj+ghT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=va9zdhuw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3392ba29845so1819799f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 08:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705939559; x=1706544359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKGazpYao0V+LkbPgl3xbNn7Not0RSEPDH2BeUOoMg0=;
        b=va9zdhuw2uE3H9LAdYTVGjNxSo4wFBty1QuzWaQ8+fSCEtBu2phYosNdlY2rPqd2ON
         N2n1xeZ5RSVxJuqVOHKsNF1pwms8E5r9DFTFOBjul2i8mt27lxJs6YgDjwrIheY4R4Mq
         JyLND/vRiEOnDIg3eaCg8LGJlIMw7dHPfsvmS9EjeNudkB8GFNLHSAz4Xf8WFjbdJHXe
         64tHLGA0oEhc4wDwsGjk431iCIoqUJt/0v+7CtK1zVoWThdV+pM6z4PTI99pJDGmovRB
         kxKzaEDIJXCnMpD60ZofGLK9yBU/Wf0kNpL1dheENQuSfk/L4z9MujgFt9eSTStlLTaw
         KlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705939559; x=1706544359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKGazpYao0V+LkbPgl3xbNn7Not0RSEPDH2BeUOoMg0=;
        b=CC2icKVaLveAnRqdndo286PmjbLRS0psKUjA7jAygrw+LnWAKMmpGN07l1cE9Z2VMY
         m/bVBqlMeJ+DeMObklnCtPb3MEfMJT77G+UkpBGRg4CwPLH/t6LOFvxonGIZyRhcYODV
         PeerTQp6nBQ7nnmZIaK3skGYDS8CPFH86U7L+4bzBKvo17Lu3h+v+r6VbFUa0lYasfCL
         T1VtaeKKRl7EUWh/lpInjOr2HUhfvfIp2+1oiVQLS+DnCoI6wVWUTnYIRu3ys2AhTfiS
         oZzOJafa6WpS1aZA4UWJyM4OUkQT+8zwWYhmmyPiBhVE1MSVTfc3x1KnMCm9ARsk/zu2
         VE1Q==
X-Gm-Message-State: AOJu0YyCy2v0aEoVhK5uiTI7/bE8viiAVY0K6V9I5Tdy3t9+NhUdm2ui
	ToTG8YL9+ozRKcDhlKJ6oYQNX0t5QX8QkzRsTndoqRwz2ak5+wLlDU/AQKtYWJ8=
X-Google-Smtp-Source: AGHT+IGC6py6HvOpfx0Q4nOFXkYsesGuitcZIsYaTj4ILkZczEDQMZOu10hIsKPscIw2OFKjcEfrzA==
X-Received: by 2002:a05:6000:1e81:b0:337:c0de:1f70 with SMTP id dd1-20020a0560001e8100b00337c0de1f70mr1782445wrb.41.1705939559194;
        Mon, 22 Jan 2024 08:05:59 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id q6-20020a5d6586000000b0033921f48044sm8808860wru.55.2024.01.22.08.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:05:58 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779g0: R-Car Ethernet TSN support
Date: Mon, 22 Jan 2024 17:04:40 +0100
Message-ID: <20240122160441.759620-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122160441.759620-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240122160441.759620-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Ethernet TSN support for R-Car V4H.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index d3d25e077c5d..e64a204f1f8a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -538,6 +538,22 @@ tmu4: timer@ffc00000 {
 			status = "disabled";
 		};
 
+		tsn0: ethernet@e6460000 {
+			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
+			reg = <0 0xe6460000 0 0x7000>,
+			      <0 0xe6449000 0 0x500>;
+			reg-names = "tsnes", "gptp";
+			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tx", "rx";
+			clocks = <&cpg CPG_MOD 2723>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 2723>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779g0",
 				     "renesas,rcar-gen4-i2c";
-- 
2.43.0


