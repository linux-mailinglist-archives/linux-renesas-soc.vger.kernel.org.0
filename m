Return-Path: <linux-renesas-soc+bounces-33230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFWNKOEYF2pR4QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:16:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E85E7968
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60F953071C4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19B440B6DE;
	Wed, 27 May 2026 16:14:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C989D426D32
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898478; cv=none; b=k8Q26cEzeMrhsoMmjh96g5qIeaZx13YjT926aDdNWtEjXoo5E7rvuR466H9naoKt2hkpGPdkGKe9hPCckxHiRthVYTx0I1f/QhK88DIlN4nwNj3MCul/AP/1I3peHusjF6xsZLG4xNOv1kDKof5ZbW7mhnR9MHovGi48jXg0F3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898478; c=relaxed/simple;
	bh=XYayIj2bcoUQ45OGK87OeopF01WpTuC4QqfWdPm3k6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvHCo5BcbZ64rC8tSWi90xNISoMM8GhEkAJyHBlB8tYtnSwelBcEwkxbT19hrYSImy/aZkYYbWmPuWiFR5DLDgtNgaprdwSIv5IYJhUG9v1zEW0/BRE4ynuhwEqZhjPNupmJcgHOegjLGk+g+VsSnRqCToNGKzFZYl5EfV3vZKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6314d2e31d6so4095817137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898473; x=1780503273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxGsTvcdtI7PYt4KC637Hd2zpBAihaHwB8QPjSFnO0U=;
        b=HeYlQVF6OZAnfv3RwQLw8sCKDX8Mwl2XA5SZdwaZlhrw0pLPH/Dtldjh3rh393reFu
         7cE8ytb8UF+aZaZImgc8knkPa7ZwQBcdi2xS/Qtrdr7HZ+5gl4YHfMe4qBePK0usS4iG
         YEettS2qUPT8haIrl8ld9Kmd/wTEUNlWE+2EzyqnKJMVnhcDvtEwiZrGANdrHwyCbY/P
         3NuEmJ4xoGrdDSQN8uH1I5sIiRSl8KobBZaGMYlSBvtH2BlQybWABIRQXhTkJ6Vmttdy
         z40WUtf5yuAH23FtjKpRBfYmBUNySRWN8dn0TCigbAOBZLW1ezZJoniy9SBl6knxJxhT
         nzCw==
X-Forwarded-Encrypted: i=1; AFNElJ91+yjj9hV+GRC3I4Mh8pbwwtHGRokodsLCktdJ+JfiQLowqC35LjY9YBKf/qJ42NVFQ64MPUF1pGlNOYohtudQ3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymvrjz+hwUVKQciKn4yFoHcuKy2YyfeFblhkVvDVBZInVkAd3E
	cqRIr2lMWUHR80TbGWNNK0/Ap6uJb2Wvbq0f1fK2vF7bryGhvSewX7Yzebr4Bk5hma8=
X-Gm-Gg: Acq92OFI+ooBRzFedBMPrgs1J6m/KoSg2w/QLLAUApJOyU6ivZwKeaMcRcIpJ5rYOFW
	v0E3zhDcY0lFFpRUC+M9r1FbSjHl9jXNW+aN3KTxi+WbIwkGpEn7gSPRxZkJrqCInfGtv2wghnE
	IUkQZK7vaphSwuRVi7xw7OKk2OJEdsY9SO+JJdjhEKsFsGZxJLEpdxGI1nhLnL6S7lMtyK27NKA
	i0EUQ8F5ColcLLzhJpEZzPNpblcTtQnnY/SB4VC2cc3uEiypIC6fOba8oX4ipCNyetN7YrA0SG2
	n6K3hbxREemDId8ov/ugBjMYhDoXM93alHOthaLYTWWx5Dzagc2z+uU8ejM1QTEX9GY/ZVfHo33
	V5KWx+zQF2SniF0gzrf1M369Ywirq8ltFTmilQNbV+apJ0GjG4UV70pjIoVdGAr7msIaPGXcHX6
	xz7ZIaieNXAyzCXpS9owaTLgRXI68T14YtZfvqBUQRqMzwC9UyYnLDtCiIumrFiV4Q
X-Received: by 2002:a05:6102:2c16:b0:607:4fde:1921 with SMTP id ada2fe7eead31-67c83a858a9mr10930986137.24.1779898472539;
        Wed, 27 May 2026 09:14:32 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8850c32sm17627949137.2.2026.05.27.09.14.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:14:32 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-57513a91514so4016219e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:14:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9kk/iFkW0Srf2780Mgr3i/fIO1C/17yxef+GiXm/UmxuWapOzCVhLRTsH+UhSomBeBD4L/JUFauTtS285SsdGILQ==@vger.kernel.org
X-Received: by 2002:a05:6122:1d4c:b0:56a:9841:9f81 with SMTP id
 71dfb90a1353d-5865f81d411mr8287657e0c.6.1779898471992; Wed, 27 May 2026
 09:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 18:14:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmZuoMaF35wBAtMqB5R7wy6ei2fV=bcvdju3AFQ_DZjg@mail.gmail.com>
X-Gm-Features: AVHnY4JrXSmqNZqmujlKDflqJnu1Nl8gCkfriUHTc0klgy__a4lXTYZsbOBs3IU
Message-ID: <CAMuHMdUmZuoMaF35wBAtMqB5R7wy6ei2fV=bcvdju3AFQ_DZjg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: rzg3l-smarc-som: Enable versa
 clock generator
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33230-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:email,0.0.0.68:email,2.220.108.0:email]
X-Rspamd-Queue-Id: 459E85E7968
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

Thanks for your patch!

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SMARC SoM has versa 5P35023B clock generator to generate the
> below clocks:
>   se1: AUDIO_MCK (11.2896 or 12.2880 MHz)
>   se2: RZ_AUDIO_CLK_B (11.2896 MHz)
>   se3: RZ_AUDIO_CLK_C (12.2880 MHz)
>   diff{1,1B}: ET{0,1}_PHY_CLK (25 MHz)
>   diff2{2,2B}: Not connected

All of these are listed in clock output index order...

>   ref: Not connected

... except for "ref", which is the first output, so please move it
to the top.

> Enable versa 5P35023B clock generator on the RZ/G3L SoM DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -40,6 +40,12 @@ memory@48000000 {
>                 /* First 128MiB is reserved for secure area. */
>                 reg = <0x0 0x48000000 0x0 0x78000000>;
>         };
> +
> +       x2_clk: x2-clock {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <24000000>;
> +       };
>  };
>
>  &eth0 {
> @@ -75,6 +81,20 @@ &extal_clk {
>  &i2c0 {
>         pinctrl-0 = <&i2c0_pins>;
>         pinctrl-names = "default";
> +
> +       versa3: clock-generator@68 {
> +               compatible = "renesas,5p35023";
> +               reg = <0x68>;
> +               #clock-cells = <1>;
> +               clocks = <&x2_clk>;
> +
> +               assigned-clocks = <&versa3 0>, <&versa3 1>,
> +                                 <&versa3 2>, <&versa3 3>,
> +                                 <&versa3 4>, <&versa3 5>;
> +               assigned-clock-rates = <24000000>, <12288000>,
> +                                      <11289600>, <12288000>,
> +                                      <25000000>, <25000000>;

Why do you set the clock rate of the (unused) ref output?
Copy-paste from the DT bindings example?

> +       };
>  };
>
>  &mdio0 {
\
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

