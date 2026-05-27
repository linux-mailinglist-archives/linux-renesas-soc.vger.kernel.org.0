Return-Path: <linux-renesas-soc+bounces-33231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BjcLVIbF2ov4gcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:26:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8565E7BF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 475B43024289
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5B8429809;
	Wed, 27 May 2026 16:26:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9872B383C97
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899163; cv=none; b=PPVA6JB3TQEx+3rJRtTLoRPAjCr4jTkfZTDGZYhDBf3hcoCPCQrKg05jlGAoJCmChr16CIgNZmdFELcxqgiK8o6op4bRDya2xRRH4IwphPOrlh6W646TDH5gwyoIisqgXjIOGnedhXYaWLYS/7zuxYZdmgztoyet+WDQSTXGAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899163; c=relaxed/simple;
	bh=SnjR+18E/woBqLFJeFD+ah4X3sbuE63zcqqLF6ObtTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOxzioAZF0zVTN6gIRkebYR3a2fA8tS8VGQpFbptkTnk5EkejMBGvdR9fCP0w893LeqQi8Ic39xP074VL+6L5E9aJFukOxQtKPDoOPoxQILx/YjmBGTKVR+wsrKtY6uRCCRYcZX2M67zYRthLVMFXTNnimRYqRVDK0xrvstpgcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5751136c561so9835272e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779899161; x=1780503961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnuiomlN+3bt21g7lET2lZDG8m6jvnNl0Hl3T4tvwkM=;
        b=dtjA0zwhneQfcYonGHEzQNFsiFgp6ADyjtjpaWjf1E8zim3qMzDbHbZTA8B4MQ4tEl
         bJBk1WvrdHau+TsAbvGybEePJ1H0yRx+mXDc9lO3mSmvVEs+NUcnFRtwf3deKQUWjCco
         8sS7VSMGJSrmW4nEtIMSQ6N+IOaD8ULtonCP7aEHp9WvYAX5+bjYMH28u3D9RQ/KWqsq
         V36RVGeQnHCRhxJ3CI0OL54J2hMUsIWJJ7D3M+numUfMa3xhnwWJ0DGTyzhZ0EJ7T1cL
         VJRRrQPGMr+4QwJu1lwFoMhB7Tg/6tMIEQ/rOCpu0OUow5YoOnWmEbbB/RDpi2+iFKQB
         xjoA==
X-Forwarded-Encrypted: i=1; AFNElJ814dObT/y6RZAIwJylo5hOJ5HNg4KKYrMwjhm4GrSwJYfO6xzD43p3/DtJlQAl2b2ZHYhTIAvePlVx4zKPr43f2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvsJXVPUObZiEm5U4hrUPILcc/CvQ3wpNyjDX3zGGToNJju/ot
	WfDzJs+3bTHOuf5ov8pt5IVwPkrCEvxD8l8rjz8QAYEi2zQHqnkvmnb4jVPfZwgKUkI=
X-Gm-Gg: Acq92OEOiU8b6kAbc7r0pehC6nGyv9D0LbBuCNLSkY2QYo3b4Q5cRktqEi1LH+UElP0
	7cQgwWVvnLcIszPX9jyIN2m949t/q0tCx806DAwyr09RZ8aT3lbF5+ULhZ8ewSla4jM+iyyxRxm
	tCfatf8yU56gNmuigZym9lz7DBzIl81oF3CqrK6+adUxCG4h4gOq7+htbi4o44G0BftH4qIbss1
	OQcwAw/u4BeK/H2tsa8VJWPVWA7L1sahbXapQmnxsgngsKtlRYpUmS9/0vfVpjIrQeSQ+JaxYla
	lzQmPXmykh/4tqN1ar+/Zp9YL75bGlxJV7Oi5mJrosuSBN8LXMKrNvQnPgfpk+Hi6mtLLrCFfLG
	+fY9BpBQYVbLWvG8XVrjAxqC50Z0oWNoEKhXAcuymmBjulNyNvvTfSCF6oOFnvhggH90PRbYyQR
	vZDt/emQAAPibOATWrHxi4gZBsN4dop2aWR6MZjJbrhucFjqkmsurd5Nj5BedLimpR
X-Received: by 2002:a05:6122:2988:b0:56f:696a:4fec with SMTP id 71dfb90a1353d-5868e72464emr10483254e0c.5.1779899161251;
        Wed, 27 May 2026 09:26:01 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-58d6412d8cbsm12657097e0c.4.2026.05.27.09.25.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:26:00 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso13110256e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:25:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iJ+6yf9hdFtAGYAXZkyE6pmaHxD+AGskB+QptYiUylCJKmJKOalOAIOHtKa1lLrkzmi7xIGh2EhRrxTQfAkYdUw==@vger.kernel.org
X-Received: by 2002:a05:6102:6208:10b0:64e:3424:cd45 with SMTP id
 ada2fe7eead31-673c3721467mr4815172137.9.1779899159467; Wed, 27 May 2026
 09:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 18:25:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtSJ3U=MrjzxHtpgO-Ft=kTboVWxAJH6kz0hK-KU1rSg@mail.gmail.com>
X-Gm-Features: AVHnY4ICQLP0jO2jEFhcBh5XmFSnxbx19hs7FwLBMbR98i6jT5eSMp8jWc6rv10
Message-ID: <CAMuHMdXtSJ3U=MrjzxHtpgO-Ft=kTboVWxAJH6kz0hK-KU1rSg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33231-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email,1a:email]
X-Rspamd-Queue-Id: 3B8565E7BF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable audio on RZ/G3L SMARC EVK by linking SSI0 with DA7212 audio CODEC.
> The SSI0 signals are multiplexed with SD2 and are selected by a switch
> SW_SD2_EN#. Add regulator nodes regulator-{1p8v,3p3v} to SoM DTSI for
> reuse with eMMC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -9,6 +9,7 @@
>
>  /* Switch selection settings */
>  #define RZ_BOOT_MODE3          0
> +#define SW_SD2_EN              0
>  #define SW_DPI_EN              0
>  #define SW_GPIO4               0
>  #define SW_I3C_EN              0
> @@ -38,6 +39,32 @@ aliases {
>                 i2c3 = &i2c3;
>                 serial3 = &scif0;
>         };
> +
> +#if !SW_SD2_EN

"&& !SW_I3C_EN"...

> +       snd_rzg3l: sound {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,name = "snd_rzg3l";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ssi_link_play: simple-audio-card,dai-link@0 {
> +                       reg = <0>;
> +                       format = "i2s";
> +                       bitclock-master = <&cpu_dai>;
> +                       frame-master = <&cpu_dai>;
> +                       mclk-fs = <256>;
> +
> +                       cpu_dai: cpu {
> +                               sound-dai = <&ssi0>;
> +                       };
> +
> +                       codec_dai: codec {
> +                               sound-dai = <&da7212>;

... as i2c3 where da7212 resides is protected by !SW_I3C_EN.

> +                               clocks = <&versa3 1>;
> +                       };
> +               };
> +       };
> +#endif
>  };
>
>  &i2c2 {
> @@ -53,6 +80,27 @@ &i2c3 {
>         pinctrl-names = "default";
>
>         status = "okay";
> +
> +       da7212: codec@1a {
> +               compatible = "dlg,da7212";
> +               reg = <0x1a>;
> +
> +               clocks = <&versa3 1>;
> +               clock-names = "mclk";
> +
> +               #sound-dai-cells = <0>;
> +
> +               dlg,micbias1-lvl = <2500>;
> +               dlg,micbias2-lvl = <2500>;
> +               dlg,dmic-data-sel = "lrise_rfall";
> +               dlg,dmic-samplephase = "between_clkedge";
> +               dlg,dmic-clkrate = <3000000>;
> +
> +               VDDA-supply = <&reg_1p8v>;
> +               VDDSP-supply = <&reg_3p3v>;
> +               VDDMIC-supply = <&reg_3p3v>;
> +               VDDIO-supply = <&reg_1p8v>;
> +       };
>  };
>  #endif

> @@ -85,9 +138,28 @@ scif0_pins: scif0 {
>                 pins = "SCIF0_TXD", "SCIF0_RXD";
>                 power-source = <1800>;
>         };
> +
> +       ssi0_pins: ssi0 {
> +               pinmux = <RZG3L_PORT_PINMUX(H, 1, 9)>, /* SSIF0_BCK */
> +                        <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
> +                        <RZG3L_PORT_PINMUX(H, 3, 9)>, /* SSIF0_TXD */
> +                        <RZG3L_PORT_PINMUX(H, 0, 9)>; /* SSIF0_RXD */

Please sort by pin.

> +       };
>  };
>
>  &scif0 {
>         pinctrl-0 = <&scif0_pins>;
>         pinctrl-names = "default";
>  };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

