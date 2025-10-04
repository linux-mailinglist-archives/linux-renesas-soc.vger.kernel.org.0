Return-Path: <linux-renesas-soc+bounces-22641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1066BB8EE6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Oct 2025 16:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 671E13C7ABD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Oct 2025 14:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A7E1F91E3;
	Sat,  4 Oct 2025 14:33:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF94201004
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Oct 2025 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759588401; cv=none; b=cJ5iFD9sz60a0Nko8DjHQkXFpbi9E23OM1m80AOSWP2Wf7xk/X+2j71O6I0EVCFWTGJi5K9OoYWLuQ9NbeJGZ8I1s5gqGWqXQZeXxjKResYHUMot4OdUXjyUST5pOvr8L3V6HdHtVFPc9Js0P51g1Ri5ulaCVK83puiewSDyfC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759588401; c=relaxed/simple;
	bh=0J55Y2HmqgcnbS+RXB3tiJFIIySx+Rr5EZpIa0gAB24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMu72EDVuGoTFUUc8fyUHCoOv9ftiJK+3A5PGj4gHbl3LsWAJ3xy4EnU36Bh1pq0/UUnRVi3gXHvt0i3HljDyHLzUXp6ubO74YzEeryJOM9LWzfCNscFgkpUTqdK9lBRtc8RmKknBWs74JE42wrle5AcS0RWXjorb6ZFG0HQgxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8e936be1359so2083341241.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Oct 2025 07:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759588398; x=1760193198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xthzmHjkhKJUrri8Wf1E3AifPP/ZxbkaJDpboT1dzM4=;
        b=SUjpiNcPve3kPVQCnlT0pv2M4sHxXuwgfHk+9e3pAg6EVu32yda5ioGvxjCcThkQ+R
         DMmyH8gbFPsOLEUgVFb9KbS9TaMcHepmpRSMF4jZv9whFYKHMXTRjLPuhsSfyES9YlmD
         UWyfE5LCr+fsgXmleb1W71VezGDW2YYbaruOkmoe+DXx67PTBog34ZRRaHGqwVeVjZzV
         1w1gX2UhptIZsLrP3ZdLEs7+0X+W9s84AQjmIckPkuqOLOsohWHeCU7YkofPt5Up3NUH
         4I1C/+N4SCpq9YweJpGHF7Itj2NGTZx8p96gtlZ84WnhjyfZDT0NgjeZBVnq1Ou6O7uo
         anGw==
X-Forwarded-Encrypted: i=1; AJvYcCWdrXhpmW+1lYtV3ad/L/bo8RCvOnlyZMfWb2+P67V0iv3XZsWxHwLYlWZrkNs49QMy3CeSgORue87v5CBKUsJHmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjgoNz2z5/EhSBYNeKSmmzSWqRj2vw1hfPc70VCnHRoE/NHhF/
	m89LmLbXyOKwKRoR/lAITc9mVagBeVL6rn64Vb57D4RY17nIIAtUvNYsaiELL/zI
X-Gm-Gg: ASbGncuzA5jPIJbUPXVXvXTZgF43ZHerNfi1FOjG5BNHwXCEQw/uVNKQD3IkQfmJiu/
	1aAKKxb7H5EDRIdPa4eI78SxdpU7xkNQzXJTtS7Oyjp7IppQRmxS8EJsAZA/bfWYuJ5upn8DY0x
	3VWbEiS7tfLNAO8WE3aDNZn9Q/IBXMaydNSQxrr1PNa1eZW8FWfbVEvwFOcw+P7QWA1nuXfXhhZ
	iUH09CINEPaJ7bj0uTVhOIIXtbRhVssVjy5a4xcwvEbwgzZptufyrdlv4iMKWrKSA3xp0C6rFgh
	L8T+txDbJlqtXwKJJ5kuBeyoM16DXpzSXHHInWew4MvCG4Rzrishyx22SxPYizy1WW8AxetHuHe
	ORuRVPppADH93J5F52BR/X65pdPuL4zjO6dbezMw70m6WKzWKS7dT3lu3Sr2VRGz9X5CAl2xe/H
	B8eFdr8LR1
X-Google-Smtp-Source: AGHT+IFqQRoGVgKGSYM63UguWrvs4/F/n/Gd48S2uDzE70MkGSrtVLV6W17+Cu8GaL0tacLhPbTmmQ==
X-Received: by 2002:a05:6122:882:b0:54b:c080:a55e with SMTP id 71dfb90a1353d-5524e420feamr2511115e0c.0.1759588398484;
        Sat, 04 Oct 2025 07:33:18 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf96587sm1863134e0c.25.2025.10.04.07.33.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 07:33:17 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8e8163d94bbso2399304241.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Oct 2025 07:33:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmfQXGSP0AXAzVAllrPOEb2cjtWszdNtPCGc6XCIfzZ1v2vMkX7HgYmqfmiuTRxmJRxsSRKBvQUDjHnVHJFMFW8w==@vger.kernel.org
X-Received: by 2002:a05:6102:291f:b0:5a2:668d:f20b with SMTP id
 ada2fe7eead31-5d41d0dd17bmr3054407137.16.1759588396956; Sat, 04 Oct 2025
 07:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001122326.4024391-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251001122326.4024391-4-cosmin-gabriel.tanislav.xa@renesas.com> <20251004143901.505ec386@jic23-huawei>
In-Reply-To: <20251004143901.505ec386@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 4 Oct 2025 16:33:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+V60pZSRmu6SjeBNyi_0+Un5pXjWDLDDBt6UbYfTmeQ@mail.gmail.com>
X-Gm-Features: AS18NWBkap4dmgI1LydXdtTPg0XGaFgAjq5oqq5cMsJWqAup1M73smsgPeqmT7I
Message-ID: <CAMuHMdV+V60pZSRmu6SjeBNyi_0+Un5pXjWDLDDBt6UbYfTmeQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] iio: adc: add RZ/T2H / RZ/N2H ADC driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Oct 2025 at 15:39, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Wed,  1 Oct 2025 15:23:10 +0300
> Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
>
> > Add support for the A/D 12-Bit successive approximation converters foun=
d
> > in the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> >
> > RZ/T2H has two ADCs with 4 channels and one with 6.
> > RZ/N2H has two ADCs with 4 channels and one with 15.
> >
> > Conversions can be performed in single or continuous mode. Result of th=
e
> > conversion is stored in a 16-bit data register corresponding to each
> > channel.
> >
> > The conversions can be started by a software trigger, a synchronous
> > trigger (from MTU or from ELC) or an asynchronous external trigger (fro=
m
> > ADTRGn# pin).
> >
> > Only single mode with software trigger is supported for now.
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> Hi Cosmin
>
> A few really minor comments.
>
> I might have ignored these or tweaked whilst applying but looks
> like you'll probably be doing a v4 anyway so I thought I'd mention them.
>
> Thanks,
>
> Jonathan
>
>
> > diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> > new file mode 100644
> > index 000000000000..51d1852d814d
> > --- /dev/null
> > +++ b/drivers/iio/adc/rzt2h_adc.c
> > @@ -0,0 +1,309 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/completion.h>
> > +#include <linux/delay.h>
> > +#include <linux/iio/adc-helpers.h>
> > +#include <linux/iio/iio.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/property.h>
> > +
> > +#define RZT2H_NAME                   "rzt2h-adc"
>
> I'm not a huge fan of defines like this as there is no inherent reason th=
e two
> places it is used should take the same value. If you feel it's really jus=
tified
> then I don't mind too much though.

I am not a fan either, as using a define in the initialization of
platform_driver.driver.name means I have to do another grep to
find the actual name.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

