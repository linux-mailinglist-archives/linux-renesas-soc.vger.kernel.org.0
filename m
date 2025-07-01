Return-Path: <linux-renesas-soc+bounces-18966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D797AEF774
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDD091C03351
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4C7275850;
	Tue,  1 Jul 2025 11:50:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7F275847;
	Tue,  1 Jul 2025 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370609; cv=none; b=sCQh9bkt9LFZ/mZnU5K4NccRVzOwLsZ+Vo0g+jIqSdKxHgCoCByukWlYNSxdO2XwFLGmdFxSuvypZG9zAooX350heYwqlnRTk+dV15dZxNZxX+8KzMJ09nTALHRaAOy4i2eyBcuegHj87GqQmRVueiuisq26CUrY7u9QT0Z+wo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370609; c=relaxed/simple;
	bh=oQaSfjn16gkpmyiOHuJHxs/od2PeJENkOL44tWybTSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLgZXz7Vo1RBb/GkKYlfo0sEsUJq7A1MaNS+C5i90Qtscsac7tpcxWEit100G6BPiBtNOBHXZertXVPvUVg2aLe6P5FwN9Iqii0GHNMGSRADIjXqddtuNE4QjAhodYh9uQFndSo0IDkM+vNu0cxHPq3YlE5HA1+LaWbEDhEGsdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-532d498eb95so1039858e0c.1;
        Tue, 01 Jul 2025 04:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370606; x=1751975406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNcAgqNSg4xL8jPZ4ZsDnoQkMlpOI3kIKIEOSXamPXA=;
        b=Df+J7Ko5cZbxck3Y/AeiiouZbVfUabI6XvazapIULiyTOlKhtMHUAS+oZQCGgReeib
         YAlNkE78lYJ+ItapcLOeV8HZb1qItIirRIVOjSYAhgjX1ZXD3WJ9PbPUTSorwRWYSxYJ
         r3xG18a+xqlTR4X+VTp2NUwrQR9Hk0LQIDN+lHPr5rkkTotKj0ziYgQcKQomm5yP1bpr
         NaQpNkiJ4Mf9VgniUZ7RMRuxuSPPBJbFpvfUMXaDx9gnvuvyn+puSKcetKITwEEmwntI
         yfcA/K3gdtDuJKLBj6jN7jeDFxbuERLbPvGXU3OoCVMW4B8aYEcZjuBjVw0ijqLirKDa
         xbHA==
X-Forwarded-Encrypted: i=1; AJvYcCUvG8GMXhDdhQzbBQinIpASXQgnF0xaK6c7qXIQRO9qAfs1LjS2VzZ36hdYuZZINlqPwRS7ydFG9dWz@vger.kernel.org, AJvYcCWJoNLE8jgthtBBluLSvADcEjUVs3AX3Holn5DZ7f47TZluRg3SPmlCJmQJsz0UqX7cWMEu14USBjJf1uWVW3JrQsU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnzo6PmO2Z6JnS+T06shPPxMfLYqvxloesDe/QQRY6CujyJANw
	DagAx/lOeU57Z5bpelIbHJ299boQj7dsIH+91+6sT0ZFEd9oFfK+zLltJfCCbV5N
X-Gm-Gg: ASbGncuau4t10aDSz52gmGVfUGiF5q2kPrAVbm+0vTcpW7NKXdd3MDIB39ksn9lyLuF
	WGeuBeeLFV9zrVhV+kmWOJCvKo60iHnJBaMrW9bNNsMb37tuPkKqtgzpkJEgYD9Gg1K80H5mp48
	hvNbeNUPviWps3WC4lRKyTIY+yJWPJiMWdQQmTzOuHMrLP18mQ8rXIBpAl2eUwDJfq5lKJ5OlmM
	UWccPZDNpdfaVVntKHwtsgSjrhaLZDko/6zvo7HUeoJ87ZofY/XXcV4J91pUhS5KsnZWD4IM8Lq
	USwHtGAu27pwHXJjvXKEDEJcYqUB3bCZZ+/oFAdz33ggnCtN5bz0FoM0QoWbKBhWATWHzGBzK64
	3b5Ozgs9ThRS43Gos0Cmp1EVS
X-Google-Smtp-Source: AGHT+IFd1BS47FCf4HvrIBoeWTZ8l915KmZ7mCErDSAjS0lWFeCUxw7Az/xIPEv9Y/6HnIaQQmIcaA==
X-Received: by 2002:a05:6122:168a:b0:526:19e6:fa34 with SMTP id 71dfb90a1353d-5330be06b4cmr9426733e0c.1.1751370605436;
        Tue, 01 Jul 2025 04:50:05 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1c3781esm2015978241.10.2025.07.01.04.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:50:05 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87ed3b792a2so601161241.3;
        Tue, 01 Jul 2025 04:50:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9jcO7gaAd4DVmlBQza9FXyQRh034U3sRJGEgxGOfeWI6kTCyfBejQ9Ax3N7Lf+63Sl1SM0v7Eqqpe03t2U5a3WbE=@vger.kernel.org, AJvYcCW+Mi3iQfeeqofPBC0VmWcFtBWL3zwi81aHVRZ10rJaSGA8nCatAKwAT88xUhc0GEpiCwX2o8etX+6W@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:4e5:a394:16cb with SMTP id
 ada2fe7eead31-4ee4f579878mr10321161137.7.1751370604674; Tue, 01 Jul 2025
 04:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com> <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 13:49:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
X-Gm-Features: Ac12FXzVaMxYpR0NooRU2Rl0a4IA6capgW65lhENwGvxKsSwezd-mA-KIH1omJg
Message-ID: <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 1 Jul 2025 at 13:40, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 14 Apr 2025 at 17:38, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > RZ/G3E SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
> > > USER_SW3. Add a DT node in device tree to instantiate the gpio-keys
> > > driver for these buttons.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > @@ -12,8 +12,13 @@
> > >   * SW_SDIO_M2E:
> > >   *     0 - SMARC SDIO signal is connected to uSD1
> > >   *     1 - SMARC SDIO signal is connected to M.2 Key E connector
> > > + *
> > > + * GPIO keys are enabled by default. Use PMOD_GPIO macros to disable
> > > + them
> > > + * if needed.
> > >   */
> > >
> > > +#include <dt-bindings/input/input.h>
> > > +
> > >  / {
> > >         model = "Renesas RZ SMARC Carrier-II Board";
> > >         compatible = "renesas,smarc2-evk"; @@ -27,6 +32,31 @@ aliases
> > > {
> > >                 serial3 = &scif0;
> > >                 mmc1 = &sdhi1;
> > >         };
> > > +
> > > +       keys: keys {
> > > +               compatible = "gpio-keys";
> > > +
> > > +               key-1 {
> > > +                       interrupts-extended = <&pinctrl KEY_1_GPIO
> > > + IRQ_TYPE_EDGE_FALLING>;
> >
> > So you are using them as interrupts. Don't you need to configure pin control for that (function 15 =
> > IRQ14)?
>
> The same pin can be configured as TINT or IRQ15, currently it is configured as TINT IRQ.
> Is it ok?

OK.

> > Alternatively, can't you use them as gpios with interrupt facilities?
>
> interrupts-extended = <&pinctrl KEY_1_GPIO IRQ_TYPE_EDGE_FALLING>;
>
> The TINT IRQ will provide the same right? Am I missing anything here?

When you use interrupts directly, the system will detect only key presses,
and fake (timer-based) key releases.
When you use GPIOs with interrupt-capability, the system can detect both
key presses and releases.

See also commit cab3511ea7a0b1fc ("ARM: dts: marzen: Add slide switches").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

