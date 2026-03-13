Return-Path: <linux-renesas-soc+bounces-29353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEmGIlMXtGlkgwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:55:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C628451C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07DF730E07FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA65315D28;
	Fri, 13 Mar 2026 13:42:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6C331F991
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409319; cv=none; b=DQ7E5rgr40AO85Q5BuE2v1algZvdC4fDUJVnqSoVQfQOE7Aa/OfEdqjfQV729qj0Wra+VDGV7lyQs2ym6cCXe5YSUZXPf8stP4rz108NcJ8KIZoqZLftORoPOofZ54Orfrs/7swTfwWwxSeIX9bPW5n9fvQx4GU/smF32pkNDdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409319; c=relaxed/simple;
	bh=OGNsVHE+rPU9IIEJf0KsqvOCe9Unep2HqD7hopOQMw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDkxbGxyq2hEQX+uo0B6gT3LEIB6xsggmEGJ0FySaXI1Zwu5ms/Wr2aV3pKftGOHURyTQJwv4TaIdQSxMNwCtOrUN1i+www8/FZomIKm4bt3KKIopy40kWX0sgwVrGpMFxAatQC+ueMy+esPQI9CJAIkZHO8JI7SCV2s9rcRbzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94de4f5531eso572917241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 06:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409317; x=1774014117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Zh9SwmJLErLffqJi20ruMX+mG5Ur8/4eLKTNuwkM4k=;
        b=DnmxNOlg5uLtxCD0sWsfv/cxh66ujz0ddycbPE+lepYZvmjfiPcZ+9+BE4zZM20WUd
         6E4ixtKL854kW4S1kp/ln5bik+lnTT0Zy+bDgGSggvNYdWyznfp8vfzW+jXPUd5BEHwN
         LhWnUOnL8NEkfg2CE1f+E6Dogg4yfA0rlGSYYFHxNVoWXVFVF3XR2bMybgb2r+BfPW7J
         XTH68uGMn+KOx24Ff6WyYjc3A5XLTRtWlfIGk3ArWb1DkV1FGpid3p8/Ip4MP1eiAmTY
         zybYZCKB1gW9ZaUZN4PS2p/58DKzSLBQNSlOlZG01XbVVGG1E2tKAGrUcw58gnwEkqDQ
         VsmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmT82oH7CFSM/zZlNuabI3y0FTRmjUC5OVCgM55NKLGz6sdre1/eaieVUfGIu8QsZsBdMNxJUXAk8lMA1O3vKplw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5S+Mw6zOYrNAyuzHzmrrhKyjCgPLOxiQ8j1d7i66FmHnahnU
	jIHZmeQQRzuOvavICtafoC6n0K/CzfycNaAPHeedEDsWm2Vg0DHnaeNvIx9Hd0C6
X-Gm-Gg: ATEYQzyFJMNNiv752pdDhy/xCns7m4bzTLvf6XvDyX6DJfCfb58DC7xOiH9jcJtNVJn
	4tPWUlt0RTl/1D5Hm6xo6x7PMER+/imdgFUVRdQzrQr0PrygxFQ/LFPyPfPHx41wJB4KVBXXx+m
	+zfnOfh0gsk9n97lMDm0h6agDCfH6cS9KdLrc1CT0DNiqKnIKkQBo/MOG69Yvc4xV4C3F5DZGrb
	T4hLF5wjN4Ad9G4rl1JwJ5iwabbI4DwW5IWhuuZR36LGlDm2n5WDenc+wDvkWdYoxg3wtS+sn06
	Fx0ukvCyfa9r24RRlfMZsphxv6ovEC8REHzKRcytcj1JJWnfpGQYiSxBRJLXPh/KnnYoNgY9WjG
	ax+ibcy38fmD1ZNA9KBz8C5FfMRH8TtLPtyYkyV6t5H5l0pvgisarofDjF7uB+J9fktW8hFEgXp
	eTtFpA8Omtwrs+wCM0NZ0nUaRHtFq9qaj+7YUMn3VKrQMXHJB4/htCfPuygeSRr4KE
X-Received: by 2002:a05:6102:2914:b0:5db:f031:84ce with SMTP id ada2fe7eead31-6020e545dd6mr1250286137.29.1773409317370;
        Fri, 13 Mar 2026 06:41:57 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601deb3e0absm3153158137.13.2026.03.13.06.41.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 06:41:56 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso903415e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 06:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3VL1dR33yAMBzT7CY5mlgMB8Sgl0S5tZOkGtvQNbuqoJN2RLYDEjP/VxWO2ejhhGSEv8Qn5+k7x8nSwkbr/e1vg==@vger.kernel.org
X-Received: by 2002:a05:6122:4d83:b0:559:7294:da85 with SMTP id
 71dfb90a1353d-56b6291a626mr1203002e0c.12.1773409316609; Fri, 13 Mar 2026
 06:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124163611.3279104-1-onlywig@gmail.com>
In-Reply-To: <20260124163611.3279104-1-onlywig@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 14:41:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsJ7NW18XcT2TQfSZx4HUUzaBUm2N=BhCoD6k0QTeqzw@mail.gmail.com>
X-Gm-Features: AaiRm51nMJlxLSRZWLZq4dQPaTyi4ba_gzu-eXdF9xFF9cEF32Y6CVSfd-O4ZFA
Message-ID: <CAMuHMdWsJ7NW18XcT2TQfSZx4HUUzaBUm2N=BhCoD6k0QTeqzw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add pixpaper display overlay for
 RZ/V2H Kakip board
To: Wig Cheng <onlywig@gmail.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-29353-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 3D9C628451C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wig,

On Sat, 24 Jan 2026 at 17:36, Wig Cheng <onlywig@gmail.com> wrote:
> Add device tree overlay to support the MayQueen PixPaper e-paper display
> on the Renesas RZ/V2H EVK (KAKIP board). The display is connected via
> SPI0 interface and uses GPIO pins for reset, busy, and DC control.
>
> The overlay configures:
>     - RSPI0 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
>     - PixPaper display device with proper GPIO assignments
>     - SPI frequency set to 1MHz for stable operation
>
> This enables support for the Open-EP Community pixpaper-213-c module on
> the RZ/V2H platform.
>
> Signed-off-by: Wig Cheng <onlywig@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip-pixpaper.dtso
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
> + * support on Renesas RZ/V2H platform (KAKIP board).
> + *
> + * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>

This include is not needed, so I will drop it while applying.

> +
> +&pinctrl {
> +       rspi0_pins: rspi0 {
> +               pinmux = <RZV2H_PORT_PINMUX(9, 0, 1)>, /* SPI0 MOSI */
> +                        <RZV2H_PORT_PINMUX(9, 1, 1)>, /* SPI0 MISO */
> +                        <RZV2H_PORT_PINMUX(9, 2, 1)>, /* SPI0 CLK */
> +                        <RZV2H_PORT_PINMUX(9, 3, 1)>; /* SPI0 CE0 */
> +       };
> +};
> +
> +&rspi0 {
> +       pinctrl-0 = <&rspi0_pins>;
> +       pinctrl-names = "default";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       display0: display@0 {

The label is not needed, so I will drop it while applying.

> +               compatible = "mayqueen,pixpaper";
> +               reg = <0>;
> +               spi-max-frequency = <1000000>;
> +               reset-gpios = <&pinctrl RZV2H_GPIO(A, 7) GPIO_ACTIVE_HIGH>;
> +               busy-gpios = <&pinctrl RZV2H_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
> +               dc-gpios = <&pinctrl RZV2H_GPIO(7, 4) GPIO_ACTIVE_HIGH>;
> +       };
> +};

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1 with the above fixed.
No need to resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

