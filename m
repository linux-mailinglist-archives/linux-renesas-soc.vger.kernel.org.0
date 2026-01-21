Return-Path: <linux-renesas-soc+bounces-27201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNf/E4vkcGk+awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:36:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8835883A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 708C4A41D8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510ED492180;
	Wed, 21 Jan 2026 13:48:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056448A2B0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003297; cv=none; b=sLP4nWFrlHPIKndfs8n5BQwbYQRVhZJzjTa8ChTaYHSZLM7+Tm/6zp1wTPWsqFvVXqRIixadg9ONuH8zFc3XTit0dvZOLEKDIZPniYZJQonLbnWgKTJwK+rFltwL6F8UwRWbGDSCz8znlYNjZ9pDF667Sc44wk72cI4YKlzM+AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003297; c=relaxed/simple;
	bh=nILMXFRRKbSWRtkWBDrdGe9Su2xonO+3lj3Iv//nTxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvIjmuqpp3B8U+ZYmyp9zK997T/g7HyHfVrF58h0vyFNL6jpoCx2fj0VpZOM3fyDUhK3hTrCk5SXuJh/3UT5xhcNDznuonOtOxREK3Ly0/0mNGJd5LMuBR9zv3gnXPiim73ICZyk0QbWHVU2WeODUUj/naIm7fN5Hd4TiFJwLpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56367b39e3eso649702e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 05:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769003295; x=1769608095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDhI8tIlTzFkDL9hKs3tIMe24M9SzYYyQ7hRvEJ46wo=;
        b=wgEtJctG1cJcdOY8JrUsMoXK4iTowp38/0EGfRZ+4h5V6NdQTEGAVRjat+pxv/liIZ
         CgAv2KgQlxZaHPb3k8dP5EeUpJmy1kodS4F/KwJlrbfWqS5ssaezEPVQbYvPyqfoWJ5G
         K6qn3SLDe3uocrGvacBrtPPNiZ/pEByAk3oHA53OgHdFt6M8LnqMJpdKygQbO0O6i2gd
         CL1GlOllXv7d9ahgumgpmk2r6zM4xPbk6Y+k3rBWDm02z4MpjzYwcoFRba/o3o116zPN
         yzyNMhEmoaNhqeBz/zvhmuEGXUeOEUbKrh9nkCJc5As9wMh66xZPfIWr4imZBuRXh3pm
         Mx2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeXowHEQWxkqWoIaWiPj9beoaMffejLLtlyixUEr13kqvcKN2hSC0mJ5b/+YG2Ib/lCRGlgQvG9njwIq2ijN3OYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKmklE9sJYvcq++89vtUlfUr/+2nurUgK2QvbqSssKgBdSB4h
	a2zp4cTXc/kvQBK9T+5ybY9xufAs4ao7EddYjX6VThRxHH/9ekxHrjZ7MYkaXFKt
X-Gm-Gg: AZuq6aISAHPAkpCCh4U/hkafmIlr5yte9JcajVdS7bRzMQ5bC1WqAMgrZxHkz19TxV1
	PpAV8RdrUrOXJ4zUWIBOa8QgOg5JdjJZ+P3PIfGEyEHRq0mCzRZE3aqmdHjaW20nG+4xgez7UOX
	yh0UZDc91WM+EuNb/tzpY67t9nv2gdxY7oSxCjuzOd9XrwcuEQpnpFn0WFJ1okHCzB11mfoGvqv
	11xWt1nQdtIZ4ejC9DCDo7WsmjSIvYUZ+ew6mdDgoFgwMKKH4Q8ahsa+0TjkRaHGZ7Oet0Yc70Z
	c/uyyT8WNghwcA+RbOly2dec9aYD4PmirzBqTIezZFpI969c0UT+BU2EjYF6/OfRv+ELY+caDST
	7fDIjeveXjUEIMsybFtyCv/kfVUaNDgwuHVJs9Nn7fXdR8OVoNRByHsjfE79j0BJVrhNiXTuZFK
	nscDi8oGKuEnxB3Tx1vjPwOzgbP6oKmK/TCYvY1n1pMXEJItFk
X-Received: by 2002:a05:6122:4685:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-563b63dc48cmr5743607e0c.6.1769003295074;
        Wed, 21 Jan 2026 05:48:15 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b71009casm4155811e0c.16.2026.01.21.05.48.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 05:48:14 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso572484241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 05:48:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqKZLPKWeZnOkaOCcGqI+Un77MXBihbVF+qhVyTkoKyfd4wM3PbgIkoXvC0J8+bdXmw+t9/5OlSvCjlEPp22WwAA==@vger.kernel.org
X-Received: by 2002:a05:6102:d92:b0:5ed:ab0:e5d1 with SMTP id
 ada2fe7eead31-5f192539f6amr7680722137.15.1769003293334; Wed, 21 Jan 2026
 05:48:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 14:48:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
X-Gm-Features: AZwV_Qi-WLBK0O_q5kA0yh25XZR3hcQUNirELFZFoxr2VQqkUKi0-PPk2Bs3v1s
Message-ID: <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27201-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.68:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,linux-m68k.org:email,0.0.0.70:email]
X-Rspamd-Queue-Id: AE8835883A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on Ebisu
> board. The clock generator supplies 100 MHz differential clock for both
> PCIe slot and BT/WLAN expansion port, as well as for the USB 3.0 PHY.
>
> This configuration is valid for SW49 in OFF position, which means the
> PCIe signals are routed to the PCIe slot and U11 9FGV0841 PCIe clock
> generator output 3 supplies clock to the PCIe slot.
>
> In case the SW49 is set to ON position, which means the PCIe signals
> are routed to the EX BT/WLAN expansion port, and U11 9FGV0841 PCIe
> clock generator output 4 supplies clock to the port and &pciec0_rp
> clocks should be changed to "clocks = <&pcie_usb_clk 4>;". Once the
> BT/WLAN port is tested, this can be implemented using a DTO. Until
> then, assume SW49 is set to OFF position.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -53,6 +53,12 @@ backlight: backlight {
>                 power-supply = <&reg_12p0v>;
>         };
>
> +       pcie_usb_refclk: clk-x7 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <25000000>;
> +       };
> +
>         cvbs-in {
>                 compatible = "composite-video-connector";
>                 label = "CVBS IN";
> @@ -439,6 +445,13 @@ adv7511_out: endpoint {
>                 };
>         };
>
> +       pcie_usb_clk: clk@68 {
> +               compatible = "renesas,9fgv0841";
> +               reg = <0x68>;
> +               clocks = <&pcie_usb_refclk>;
> +               #clock-cells = <1>;
> +       };

During boot, the rs9 prints a warning:

    clk-renesas-pcie-9series 0-0068: No cache defaults, reading back from HW

which probably shouldn't be printed at the warning level?

> +
>         video-receiver@70 {
>                 compatible = "adi,adv7482";
>                 reg = <0x70>;

> @@ -871,7 +902,19 @@ &usb2_phy0 {
>         status = "okay";
>  };
>
> +&usb3_phy0 {
> +       clocks = <&pcie_usb_clk 6>;
> +       status = "okay";
> +};

This does not work, probing fails with:

    usb_phy_generic usb-phy: dummy supplies not allowed for exclusive
requests (id=vbus)

Adding a fixed regulator that serves as vbus-supply like in commit
fec2d8fcdedaeeb0 ("arm64: dts: freescale: imx93-phyboard-nash: Add USB
vbus regulators") fixes that issue (and my USB3.0 FLASH driver is
detected, yeah!), but a more accurate description would be better.

> +
> +&usb3s0_clk {
> +       clock-frequency = <100000000>;
> +       status = "disabled";
> +};
> +
>  &usb3_peri0 {
> +       phys = <&usb3_phy0>;
> +       phy-names = "usb";
>         companion = <&xhci0>;
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

