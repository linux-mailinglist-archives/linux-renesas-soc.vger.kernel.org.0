Return-Path: <linux-renesas-soc+bounces-11196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8421D9EB7EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F7918887CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4148D241F54;
	Tue, 10 Dec 2024 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="H4Oo73oc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5914F243540
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850666; cv=none; b=WFaB2nnrXiBw8VEFFLpIXLh7Nf9mmhvxSG1BsIfxIwzNNExKLU1k2UOZF6HDCv06+12p+DFYeXrE5k+YqX6QX6sPAONu4RXMZgidVbyED2yCiCc91zWcToldqighDwJxnzIA9sPuytPI4CNZcJJlWTZquAEZR7LTKtl8EUkd20U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850666; c=relaxed/simple;
	bh=hJDCv1TyaQlo/L0tvA82G+IiLtzZURDjCsIXt6YWZzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GkBqIror7TfsDl0vVDO0Z4mL6DqbVhyPeUwXwaCp8wek0+Mx0WUrPsvH1YSmk9hd/H2/kQXog2Bq3xt6lIqW9wPyAs/aXiDalfI1inEyOE0R0rb1tUKcGlRhrhb+xtXAQajOeLKqOwWBkioR+J+AW/TgVXun/QLE6RzcoVpOpk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=H4Oo73oc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d2726c0d45so8939978a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850663; x=1734455463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwyXnruxyE1MIUM59wwP+urrQ2EdZ5O+ybJnem/vHTM=;
        b=H4Oo73ocUU6EO5L86bsbLakxd18SGRoMb/J2jzJtaIAmNhotmttFlW/TmdIeordbJZ
         Dq+bShklzmdfREDBwuxJjDLed5ej3M+XFdsU4eDmnuGhRUVNt+PJ40Ionl0av+NKnuam
         20kW6ycQNBXnYADF2aarxkcua1Z23wHlFv4RkB10Mzt9g4G4T1wVBNpetas+bTy1Y/ra
         QxlTvkMagWUEayvqovJIrXb6kvLmnSdz5LF+mTMRyfpXgNdPR5z4JALaPwtMfAI4Jqk2
         ssmNkWomPf8q8YXmUV3JnL5oqVsbP/qx81usGKG8bDL3iWU+IqMU+2BeYTV4XYrxA9yj
         pM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850663; x=1734455463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwyXnruxyE1MIUM59wwP+urrQ2EdZ5O+ybJnem/vHTM=;
        b=ZRWODKwWewH8ebvlWk/Qo8gq5bNGQLLRQrSKtoXArBMrFQYQxLo3ihARN+b15F028V
         OnSPKX25Csxfq6c5Ls84h7sOVkLGjXjLE+zc4nYQ8XhZz62FweYcR1Z1OJKjQfdZNLxD
         DpJMUOnAGM4+2QyTv9xgx8whhLvoMgSIS5inCpuFVe+F3RPU/Hsm1fN3dF+k1lpB3TjJ
         zq9Bp8bqP9w4Rd2O3Xy6kBcaMvaqc472JZBIsntd05rABhx4BocY14nrAIuB6QbZ1ync
         W6QReA0pp2uizwR+bhzTL0lebZthPY34VPt6rQZ7mq6bpZO40TN2FbO9XO7ZBcQzfQN/
         3UbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKkADXaDq4b2lYHDQ3e276VTrzw73DgRoGhr6P4AmIFxGG6MsBQt+g42199wBb6mC3+Dg5/CvYac/55FGtlk9r4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxprkomBkZFrHUfe/D6WDxYCImQtGUn3xy2r0q6Rt7MbW9hIq7a
	cdMbmE3KBUbM2LJcNWGKCgvZH9aWgZgc144VnjglnuvqEiu1GKmaTYzdg918qDk=
X-Gm-Gg: ASbGnctRwHdgPWDp9TAzkra/01uAjK5N8ih6WoQZc0v5l3y5ux+VZQ+U2KArnz8d8i9
	qQryGY3tNO+gYnEzKyTDFfQcVFnNILyfTBKVFtrtqPtkyFo4H0BmvgyIcMtbS9Pcgh1YqQ5JQew
	NylSJAKPrgHEtEEDV4vupIHKBMbD7qUQBh9nXE/UKwivQ44ZT0vwq8OBwr6PvwVdapHvlvZkRj1
	zxmsfot/FPxmLpr1nv7b6ry19aDSyVbNFmMvh36C7tGxFfzaBEC6Ue+UXqUdPNTyD+kZ0AZ6IHA
	MRCa3+Iy
X-Google-Smtp-Source: AGHT+IGQNruuJ2fmbhGEBR6v4EYtbwtUlKzpp82KdDiJC4wYZhl0SU6OosybB2Txg3S5RjOBSBjG+g==
X-Received: by 2002:a05:6402:3490:b0:5d0:d5af:d417 with SMTP id 4fb4d7f45d1cf-5d418502c64mr5890914a12.1.1733850662767;
        Tue, 10 Dec 2024 09:11:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:11:01 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 24/24] arm64: dts: renesas: rzg3s-smarc: Add sound card
Date: Tue, 10 Dec 2024 19:09:53 +0200
Message-Id: <20241210170953.2936724-25-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add sound card with SSI3 as CPU DAI and DA7212 as codec DAI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 1944468a2961..5329f3461990 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -44,6 +44,23 @@ key-3 {
 		};
 	};
 
+	snd_rzg3s: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&cpu_dai>;
+		simple-audio-card,frame-master = <&cpu_dai>;
+		simple-audio-card,mclk-fs = <256>;
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&ssi3>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&da7212>;
+			clocks = <&versa3 1>;
+		};
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI1 Vcc";
-- 
2.39.2


