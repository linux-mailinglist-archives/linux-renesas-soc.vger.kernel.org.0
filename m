Return-Path: <linux-renesas-soc+bounces-28892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Lo1O0uaqWm7AgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:59:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7EA214078
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6921831C9823
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8F13B4E91;
	Thu,  5 Mar 2026 14:54:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E103AE1A5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722458; cv=none; b=RxFU6ADWcVL7RcDsD4cpZWiAiDjsPvxRC9OX0ICH0fef2ba5SZQ2lEqdOCeskak2Spcfvnbr6Ilj32qZU/4rkS8Ja8Aq6bE1Cn6Vlg+L0yWbZT1IgYLxVG36ep5OL70xHNRIQaHyZSugZklNH1QIoGLjDA/6uCXtQvlWgljn8h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722458; c=relaxed/simple;
	bh=sqFS7jkvmWko0raJbLD+jIlJ3xHTUXzihuRenty1Nbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1fVydnE1sE/fqh+F8QRbf2nSG5cZwFmcC9FzoXyGWDYR0C+02n9zV/+GFETpvgBgkS+bkvTQCa6uAEciiY5QwJFKjOLFwDb8zxvDBRZSTlxUpi0ozhhrEZQG7JYrwLvG4pv8iL25xllwZ/Ww406ayC+VBcR2SdMKkDMDVIjIvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ffca37efaeso525219137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722457; x=1773327257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSuHbHDrfHncDN0mo7GU5amj6QcQduXAgP8+JsZLJ9A=;
        b=smSSdAkJeUbgoMsoo7xg+TUz+IqqgKGoeF9SmfwKMxFDtfPxUWIzV+FKabM7ZI3OYu
         WVm2OvoykYLTDKfSzirSxZV0ERoOUXrCPLbC2KbmJFFRxZ30G3Kn4do26yrZaUKt5n4b
         +6RPtGz2twFDu6pJyA325udqP9UZMtOreP7H1D5NqnAIEtgQxwXFwNtRBoiJH7VfIcRB
         AqDOhCCjTGqTya4edkDCJpZmXyZsSqpcLVZIsaI5F/WVL32ia4CjCdfhD+jlT0BwJCkx
         UZd1aE0cE+da7zLeTjj+J0+acMfNXTB78NGaCz2MmbATj+QZQOxuLQWoJCz9jPdIuLEm
         FW7w==
X-Forwarded-Encrypted: i=1; AJvYcCV5mWh0hj8afB43PSmDHpcelDX8rYa48+MGNOSlanIhEVUjJ+oCp8lMOgp0EYXU6p9iJBbJeB1gzez2L6j8lpUnLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWVC0aiGoQ/Lq7xcF13swbaqFVDBuXdCFkstrk9sQP6NrTDTg
	kcJfStsx064pCjiFhX5JWtWNG3fBC/mQUtFqwcmCWeMRi2n/chwUmosUWhmVwCtINa0=
X-Gm-Gg: ATEYQzxBw9UT6MDRCp25aO4Hsxg7v6p5vegQYwwhJqt7+8l0M4/qr1UThWdXXcrbqRY
	aQq1LPbyXb2H//1mcs0thfFysHYrbhcOdM+Qh3/mE4rxIILs2V+OO/uRz//4Q2f8u7s+ZtM+F3/
	FnakNsE50FFsW+UF982JuvsH6dnEXq162Tg5AiV9H67+oZT3YAVqjcjIswFS3rGJjdUyPRMsC4s
	GkDgWWakgWHYR9G9lcWnVko9rO0qNkzpmMsuKHjNbejdwJcc0InaIWfnfx1B3GFPqQrMZZVJx2d
	6Ec3S5QDU8wQ6YKTtGJJtDE7evePUeIFjM9cPaCMP+hbMnTTcjvl2hdB9tUTxdvMPGP1pzTMKg9
	wOB99jErbWxTLs6rwd1uTOnqI2VnjcX/YXEWZUHXZKBITILEuHFRx6+AsMIa8TYA3z9xFxwRBPC
	21MJoTVW++PLxRROCO5oj7YPgMAqabi0xW0qPia4Zlw6kYLckjFjPuzIVERHy6
X-Received: by 2002:a05:6102:3a06:b0:5e5:6360:1f60 with SMTP id ada2fe7eead31-5ffab26ed12mr2568646137.41.1772722456516;
        Thu, 05 Mar 2026 06:54:16 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df641e133sm21358041241.5.2026.03.05.06.54.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:54:16 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5fded42aa7cso5523582137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:54:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMAlb7HXjmnuEDpFxeQQZLVex/YaYK4KGM4xCrd7qXGZygUraL1AUy+EgxMd5qZFJvtcoPFplrf1PLZQUz4UjKBw==@vger.kernel.org
X-Received: by 2002:a05:6102:a4a:b0:5ff:24b4:8992 with SMTP id
 ada2fe7eead31-5ffaac15453mr2876304137.4.1772722454877; Thu, 05 Mar 2026
 06:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 15:54:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
X-Gm-Features: AaiRm53bqTWke9KaVtnJ84J1a0a9Fq6QAkJRkm21cTTLv8kzepb9P_yYa_WTyJw
Message-ID: <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4D7EA214078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28892-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.214];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,0.180.91.224:email,0.168.77.240:email]
X-Rspamd-Action: no action

Hi Biju,

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the initial DTSI for the RZ/G3L SoC.
> The files in this commit have the following meaning:
>   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
>   - r9a08g046l48.dtsi: RZ/G3L R0A08G046L{46,48} SoC specific parts
>
> Added place holders to reuse the code for Renesas SMARC II carrier
> board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G3L SoC
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/clock/r9a08g046-cpg.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "renesas,r9a08g046";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       interrupt-parent = <&gic>;
> +
> +       audio_clk1: audio-clk1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by boards that provide it. */
> +               clock-frequency = <0>;
> +       };
> +
> +       audio_clk2: audio-clk2 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by boards that provide it. */
> +               clock-frequency = <0>;
> +       };
> +
> +       can_clk: can-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by boards that provide it. */
> +               clock-frequency = <0>;
> +       };

These three are unused, so please drop them.

[...]

> +       eth0_txc_tx_clk: eth0-txc-tx-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       eth0_rxc_rx_clk: eth0-rxc-rx-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       eth1_txc_tx_clk: eth1-txc-tx-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       eth1_rxc_rx_clk: eth1-rxc-rx-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };

TBD...

> +
> +       extal_clk: extal-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board. */
> +               clock-frequency = <0>;
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-1.0", "arm,psci-0.2";
> +               method = "smc";
> +       };
> +
> +       soc: soc {

> +               i2c0: i2c@100ae000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;

Please move these two below "reg".

> +                       reg = <0 0x100AE000 0 0x400>;

Please use lower-case hexadecimal.

> +                       /* placeholder */
> +               };

> +               pinctrl: pinctrl@11030000 {
> +                       reg = <0 0x11030000 0 0x10000>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;

/* placeholder */

> +               };
> +
> +               dmac: dma-controller@11820000 {

Unused. Surely you can wire up scif0?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

