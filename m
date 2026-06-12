Return-Path: <linux-renesas-soc+bounces-33908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zTM9OfXHK2qsEwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 10:48:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D6677F2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 10:48:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AD873036A00
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 08:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4887366570;
	Fri, 12 Jun 2026 08:47:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F31432ED27
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 08:47:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254073; cv=none; b=a3PiLmeWb2XVE8usKYNKFaaCPWaBXnjNd3TYqJ0SLWhjUSEGIcWIVu8Mq/Il68DAZzcMgvgWZfVurwqmbCY2PNRLI+QQTI7S0L5kShZs3HuS0FX/lZGEi0l9mZ0S9V91eIIVIjJ5yJ+d/2arvNOAwE0SU6qs0MwQn4WjnhlvNJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254073; c=relaxed/simple;
	bh=65uwZgvej5il4TwgSj3WG4tlATD19TKgvXSd8rKCPgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWs2FAkseVdCrOfIDLMJOKO+va6Abvu+FoGV8/2A488mLG7e1KBRSQKLzgZJNOFUKfoJZvc5D3lnqzFONKA27S39is9Yvz1Sxe07U6Gy2DJayEzJuvNJ67cw6lZIXdWge3oAAjaXFb+obGd2LoDEEUM3Hm5rFPD46Kwgn2E/I08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59d07df448bso456403e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 01:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254071; x=1781858871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQlK0t9ztcQvgDtgl79EcKdVjd3bkrWM0eY0EPTL4QA=;
        b=cykyInoU03xH4qF4uQxUFyLjDL9xZyRliiY3Q66i60tEZwxAN5WXaFSP7zkyCOM+WV
         mnyyrG7s3SGmanqohPnXVN+4tnJOqYJocaFBTcnIeckzVw4ki6Ay66gHWTACK2ji1PVC
         6HD/w1fVAYeS5zKulVB0bBZx9ZNRL9Mr8nWvQDp45b+uW7kuLgzQivBwcECjPXmEjrH3
         v8ACiBszq6OcenS+/O9uC/yokevjr+P7465WyRsc52MBFniwf9+f+2OuvE91S0uCfl8X
         87BaYUunfa99SbVIGXJ6tSqHfsR22DM43MJWf6OfDgDWewiBMoS10uvTFkgi0O5aE8kq
         MfZQ==
X-Gm-Message-State: AOJu0YzQvri2Uif9OAx0D6J5Y3D0amIRrTZQYRdKEoGCdPGV8VTaKnmE
	Zu2v8GHitERbC/uKbjdcuq9k3GNzuUvcg0jWZVdp7W60i9FeIlrbelUbmfAwSLCe
X-Gm-Gg: Acq92OFamstVZZC/rYM7g7Im67xZTgLTGfdQ5aFWL5T81u+2cdos/h3S3GAypqGkOtD
	3ExKF+1WGncxhc/1LXs/Uizk9x4uWpYkLoDRjiqhqrcxuDbm5ALjV/dyIuTDwe9GrzDgOr6/Eyl
	+DAEEcn5fS3F+A7G4MpMVVjHJs7T+FiQAhmw4AvQ4IXqaEWVbLa81vIInCUeA26nzWtrphg68j9
	NpJlSr2kxMZtomeJpgf/yhoZ/m0pf5j8fqeUm+l4LtsLvYCocAMcF0iFKJxEmCHlTxZYLSKiN0H
	qT8Yn8TH5bL9UQMyWOwxvU71/EFGgy1w3x1zjuMZlbdepGHepIwfeCiHgopEtYBVruupPnVvoGE
	Zxk81jBQuLrxPOKfTNkFqN03WcMhmIy4CGij+pDwthuH3a/5T6xh9oTmkSCmQtqCWwnxN835oiP
	nT2ri29W8JwH+sYbnlIhRkKIl9/E3IZsMEDTYssX7NVFyVjUE159THmmX1ntEx
X-Received: by 2002:a05:6122:660e:b0:575:2072:54d1 with SMTP id 71dfb90a1353d-5bb6c086545mr760990e0c.8.1781254071098;
        Fri, 12 Jun 2026 01:47:51 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69010e23sm1944310e0c.6.2026.06.12.01.47.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:47:50 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6cfb0a137c9so413954137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 01:47:50 -0700 (PDT)
X-Received: by 2002:a05:6102:2ac3:b0:643:80f1:350a with SMTP id
 ada2fe7eead31-71e88b99e6emr940155137.2.1781254070220; Fri, 12 Jun 2026
 01:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com> <20260612080354.57459-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260612080354.57459-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 10:47:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEJT8JYuSGQmNsbUZuU+zx7prwMHVikOuOS-iXYKenbw@mail.gmail.com>
X-Gm-Features: AVVi8CffWxOPh1eaDcqwf9PB86jCpddX7GaCPj1O4xWGWk3HI6WTfQ9pJBKeEFw
Message-ID: <CAMuHMdWEJT8JYuSGQmNsbUZuU+zx7prwMHVikOuOS-iXYKenbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-33908-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 833D6677F2F

Hi Wolfram,

On Fri, 12 Jun 2026 at 10:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Activate the FRAM and the SPI bus which it is attached to.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts

> @@ -152,6 +156,13 @@ pins_sdio1_clk: pins-sdio1-clk {
>                 drive-strength = <12>;
>         };
>
> +       pins_spi1: pins-spi1 {
> +               pinmux = <RZN1_PINMUX(156, RZN1_FUNC_SPI0_M)>,
> +                        <RZN1_PINMUX(157, RZN1_FUNC_SPI0_M)>,
> +                        <RZN1_PINMUX(158, RZN1_FUNC_SPI0_M)>,
> +                        <RZN1_PINMUX(159, RZN1_FUNC_GPIO)>;
> +       };
> +
>         pins_uart2: pins-uart2 {
>                 pinmux = <RZN1_PINMUX(105, RZN1_FUNC_UART2)>,
>                          <RZN1_PINMUX(106, RZN1_FUNC_UART2)>,
> @@ -168,6 +179,20 @@ &sdio1 {
>         status = "okay";
>  };
>
> +&spi1 {
> +       pinctrl-0 = <&pins_spi1>;
> +       pinctrl-names = "default";

Please document that this depends on SW2-4 being OFF.

> +       status = "okay";
> +
> +       cs-gpios = <&gpio2a 31 GPIO_ACTIVE_LOW>;

It doesn't work with hardware chip-select?

> +
> +       fram: fram@0 {
> +               compatible = "cypress,fm25", "atmel,at25";
> +               reg = <0>;
> +               spi-max-frequency = <12500000>;

The actual FRAM part seems to support 40 MHz, but that may
be limited by the board wiring.

> +       };
> +};
> +
>  &switch {
>         pinctrl-0 = <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_eth4>,
>                     <&pins_mdio1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

