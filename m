Return-Path: <linux-renesas-soc+bounces-31010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK8RCaRT1mm8DQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:09:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 116A63BC990
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03A97300370E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 13:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0646138A715;
	Wed,  8 Apr 2026 13:09:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD2F3CAE9A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653790; cv=none; b=KTcBBDtPY5ntnZ2XjVRs1nHBxX8MyUBuOS9q7zQO2Xixm8XqLxvOXNF1cfhjKb2nJlh1cZ/P30l0Rh0UvXe0K0q2xm+MQhhp8yC6mm7RrvQ4+rrT+U+EchATX7rE/I4Cw4dZPQQAP/pvx8DC46D9y5JYJLDxehR3Re7iqIIFjSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653790; c=relaxed/simple;
	bh=sQmw9lWDcF2d/4KFoX+2MzyqctprsKDF8SgNpypvZGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzS0wMLM1rL5Y6/a93/u8ar35m3uHJFLFf1SUh0gMYuUkUtsda3q/P1t7sEnQbJtfuEXM7ruD6LkRG+zPTZqIDC042GpjK9KjTyfhnObiWzFv0grdwgYUWTxza5NFrmqJRMmRYemrIBL/MeMMgj1J/Ul9NPxI6IQeMKJMiw+/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56d958880ecso1775799e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653788; x=1776258588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/ehc1JvHivWXa8+tx/BxLqhZP9bLnNS5TsQxkh+zto=;
        b=b5L5zjX23UZ+KUpxdxkpEv3cQ0IdqdmxQPhc2VOX0kY0nBUHf/eUGDhm2JNlzg8wdZ
         ZYf0Azpl+Z77bKCu2E4Vk3D128gB88GOXivmrc1JSRvBD5IKsvkfvGML4EvnDxlGEmLF
         kCWFv9q02XO68AdoLXDq9Y0/hVqefXVqlO1q9e0XTZ5gNrBY/Y6dr3iC+7i4BKqFDbTN
         rxouoTxd+Ane98Hk9VHu46HPX3UdAiiXiz3o/RCvVeFIVuXSoZI4E1cq2bPK1slwmPDo
         5xXqSDtYElhF7XyXDaqMJWQNwtFJVORVNlnDmf7hMtwbK6gpwgrYUMqbUr1hf4yieHIP
         VkFA==
X-Forwarded-Encrypted: i=1; AJvYcCV7UqeWooeGTtNBnYZgwqKbkvSWTLi2wq1yG4ZwmtMQjgSC39myKNKBrInshuBhizyKohBtDCGhWzC4Ym6Nfwx0sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI2eSlcd6E+8ShWJIOUk665o7a3cdqsQXMuViHmfzRqIGPT2Xs
	7tDYcoxnhd4skZcsPrOR7FAd3Qt4jTxSDstAf2x7GOho7n3ukjvgijt0i3LwVAH+
X-Gm-Gg: AeBDiesxM0REDz8e0G8GsaL/222RkovDiY3acmyVXiVeFKCdRovtEHcjHDKkMlh6HPV
	Q3aXNSD0zAmTvZ5HANNEulXRm29j3dxyPdlPXVSSAILJJPhl05cnX898l2AkBWNVxt5/5weeum0
	GaMZC79RIaP1HwkQbkmh/SKzLMwUjTbEAlegNX71HHN7lwF8Pqicv5uI2FU+wKSpsOy2kiAGc+e
	9YKC1DaOPpi9WwOq/NS5ueZyM/K37cFN0ZlgKzWVMcblh1wrYhOs54orLdPbIVgzaNoMuUnMcYx
	HNYyU6XERLXWpXzxHbivN/crAA3Lrut+z3ZRQBQgnBKL+EjmkjcJF8s6X6hTKuB19eXtVD7VEIL
	5poKtI9pXUz1ngCEUYRFqxcNyWXHrm1n2KU5+zJ6apnM1tLUb4aliavfUuB9V4phwVrsgMayDSi
	VJCyW6uH/48ygOLTl+Jpy3PPWNtYO5scm6Y36IjMOXdAYpQiiRQKSaeeM3UyJB
X-Received: by 2002:a05:6122:4893:b0:56f:1c32:bd07 with SMTP id 71dfb90a1353d-56f1c32cbc6mr925246e0c.2.1775653788424;
        Wed, 08 Apr 2026 06:09:48 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac56e3a898sm43657366d6.38.2026.04.08.06.09.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:09:48 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89cc797547fso72601606d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:09:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm5VcR7R4J2x9zg4Hpt+XCBW62PqfHV0rX0Fctou5S9PH4KAho7gkPvMG5NRUbFltmOw+bKSQjj0nuJHT1CmzCYA==@vger.kernel.org
X-Received: by 2002:a05:6122:a05:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56dab90cf81mr7244283e0c.6.1775653285855; Wed, 08 Apr 2026
 06:01:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <481fefa0c9f6f0629a663fe3da1fb17e7f4a1a05.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <481fefa0c9f6f0629a663fe3da1fb17e7f4a1a05.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:01:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWimH9kaOcwVx1LnujT=Lbm8cE50mj+YFxtBQMZCT0N8w@mail.gmail.com>
X-Gm-Features: AQROBzB38k87n7vfkgAHJ2zbU_998n7zblsjoYLjCSjeXBMYaqe_VAmcFna50bs
Message-ID: <CAMuHMdWimH9kaOcwVx1LnujT=Lbm8cE50mj+YFxtBQMZCT0N8w@mail.gmail.com>
Subject: Re: [PATCH v6 21/21] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 DU0 and DSI support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-31010-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.405];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3d:email,0.0.0.0:email,renesas.com:email,mail.gmail.com:mid,0.0.0.2:email,0.0.0.12:email,linux-m68k.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 116A63BC990
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

On Wed, 8 Apr 2026 at 12:40, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable DU0, DSI and ADV7535 on RZ/G3E SMARC EVK.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -33,6 +33,7 @@ aliases {
>                 ethernet0 = &eth0;
>                 ethernet1 = &eth1;
>                 i2c2 = &i2c2;
> +               i2c7 = &i2c7;
>                 mmc0 = &sdhi0;
>                 mmc2 = &sdhi2;
>         };
> @@ -77,12 +78,47 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
>                 regulator-always-on;
>         };
>
> +       reg_1p8v_adv: regulator-1p8v-adv {

Please preserve sort order (alphabetical, by node name).

> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       reg_3p3v_adv: regulator-3p3v-adv {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };

Why not reusing the existing reg_1p8v and reg_3p3v?
Note that reg_1p8v driving eMMC and QSPI are also not the same
physical power rail.

> +
> +       osc1: cec-clock {

Please preserve sort order (alphabetical, by node name).

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <12000000>;
> +       };
> +
>         /* 32.768kHz crystal */
>         x3: x3-clock {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
>                 clock-frequency = <32768>;
>         };
> +
> +       dsi-to-hdmi-out {

hdmi-out?

Please preserve sort order (alphabetical, by node name).

> +               compatible = "hdmi-connector";
> +               type = "d";
> +
> +               port {
> +                       dsi_to_hdmi_out: endpoint {
> +                               remote-endpoint = <&adv7535_out>;
> +                       };
> +               };
> +       };
>  };
>
>  &audio_extal_clk {
> @@ -107,6 +143,37 @@ &eth1 {
>         status = "okay";
>  };
>
> +&dsi {

Please preserve sort-order (alphabetical, by label).

> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       dsi_in0: endpoint {
> +                               remote-endpoint = <&du0_out_dsi>;
> +                       };
> +               };
> +
> +               port@2 {
> +                       dsi_out: endpoint {
> +                               remote-endpoint = <&adv7535_in>;
> +                               data-lanes = <1 2 3 4>;
> +                       };
> +               };
> +       };
> +};
> +
> +&du0 {
> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       du0_out_dsi: endpoint {
> +                               remote-endpoint = <&dsi_in0>;
> +                       };
> +               };
> +       };
> +};
> +
>  &gpu {
>         status = "okay";
>         mali-supply = <&reg_vdd0p8v_others>;
> @@ -132,6 +199,48 @@ raa215300: pmic@12 {
>         };
>  };
>
> +&i2c7 {
> +       pinctrl-0 = <&i2c7_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       adv7535: hdmi@3d {
> +               compatible = "adi,adv7535";
> +               reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
> +               reg-names = "main", "edid", "cec", "packet";
> +               clocks = <&osc1>;
> +               clock-names = "cec";
> +               avdd-supply = <&reg_1p8v_adv>;
> +               dvdd-supply = <&reg_1p8v_adv>;
> +               pvdd-supply = <&reg_1p8v_adv>;
> +               a2vdd-supply = <&reg_1p8v_adv>;
> +               v3p3-supply = <&reg_3p3v_adv>;
> +               v1p2-supply = <&reg_1p8v_adv>;
> +               adi,dsi-lanes = <4>;
> +               interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               adv7535_in: endpoint {
> +                                       remote-endpoint = <&dsi_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               adv7535_out: endpoint {
> +                                       remote-endpoint = <&dsi_to_hdmi_out>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
>  &i3c {
>         pinctrl-0 = <&i3c_pins>;
>         pinctrl-names = "default";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

