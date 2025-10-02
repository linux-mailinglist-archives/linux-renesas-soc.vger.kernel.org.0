Return-Path: <linux-renesas-soc+bounces-22581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92452BB3E3B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 016C316A470
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3482F31064E;
	Thu,  2 Oct 2025 12:28:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C6310623
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 12:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759408122; cv=none; b=K9fltiQTxZ7AfyhbFMVf7QxMan2tM4sH9Dqd8is3GycibcBDY8BKmNtfUgwALzhlwslyoSkPV7yjgyTf34tDXX3XTUl3Z4hzYJKz04DSM9MU+Ux7L2JbdPw7qcsBgDSrHRLvCWR7VhyltmE0/NVEn/ABp+S4HutgB0jTJ1VOOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759408122; c=relaxed/simple;
	bh=crq8yfuHaLUS3p5H/zdDJJGaYFs9968BkE02+nGHfFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQg0ZcnpGPK5csMJLWYkx1EG5KyNwliDmTdt1yRu3yUGhjyKuvy8CZN0frtHT6Z89Qyse0d9/5XeIS2qK2WehSpYEIsLOCC/s74gnbvBEGX3pcazdgrSlK2tap/LJduNgXcyVoIYTHJrTH1dQ27+vnpD1D/xO9Jd2XchaepJ2Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b463f986f80so217523666b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759408118; x=1760012918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJO2rpeSfonOqfgPMdFd9YnOjY8waVVypT7pLmPKhlg=;
        b=Wzj3s5ztXpJbeok6jQVRyF+uSTODmf4f9ESAyFsW3aLegPAinNB0P0faNhJ//BvqkR
         j9YZ4aTDX3iobDcPPgfGKqjXY3rxbueEG3LoTUZJj8arMip3oxmqZRyuHE4cbrgl4jpO
         fCw9atx/0k+BkviBPspdSQAW5/AdTpMV8DkTBAJujQZwOgksaXlYNnkgBhG8TsUSIh3s
         ltQh6+koABTSfjzQBb1QF7PugmXuiyR5OStW8AuBW7kwshZRDvcpYk1k2cLy2PltosUE
         vQMDfbROU74USMky4jOTGvF21T+THrpP7EOaUpRcctO8O9OvjWyXQ0IEa4TfuP3udlX/
         bOxA==
X-Forwarded-Encrypted: i=1; AJvYcCU1v263n7Zd1orF3DOf9GVBqcTbMIJU7TnPRVO1Q+edVhFxAcyYy+jYUtJhfuUXxhW7NnAdgOaEUllb/WtPJorDxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLw/LWXQ4MngtvT6hDUSTDpxoTTztWkuG7WFAln2HdO77+pEb
	AtLJZeaKI2X8UsyNEi2RGjloDIJyXf25cncrVVI3Wi+bgRG90mAjq/C4IpWhRIovhtY=
X-Gm-Gg: ASbGncvTuDs1C10lPvuXnGvvMqmltVVy9CIzEy+rWSReWDWH1vVxfHtG0OOIE4YWf1/
	pPtlszdyRlJNdLo9+4WdinqboqDrAtk6lpUILBEMqBWnS12YN8ZDxlrqUX+MXae65k0gEafHDcb
	oBz7omOQfWyavmMP7ztS+V88fmkrb0kOlAJVOsPPEOVfKrwJwARi9R6xgd5cvUIhI48s6tZw85u
	dNR1KOFzLbB3/0stQEXc3OljbsYx6KvIXP7jXb7dNYuCOZmbUzEXK8Cj2PhDjJo+ih2eCtvRT/H
	WQu4SLqxLfBNlUXlFAcHjkUVwXyKrBUZcRdK8dLrrrGs1PwPBpfA8JKY1D+Yh2YuU0kgAg2JTwa
	jnhZ+VrIBulP2M8J5nXdj0ZI+dJXFRoiS/BcSEnQMHlZIYqHu0vEacYseqO+N/5Yc2R52v6MCGx
	R1Bph82SKfFHi0EM4DjZIMNyYrn0A35Q==
X-Google-Smtp-Source: AGHT+IEAEyQmzP2Q43dtJNgqpf0wHp0DcWiYcixydM4HgyBJUYFnxGLcJMSJBmvoKQJYUVCSaBZnWA==
X-Received: by 2002:a17:907:3d92:b0:b46:6718:3f37 with SMTP id a640c23a62f3a-b46e30e8f68mr869478966b.16.1759408118160;
        Thu, 02 Oct 2025 05:28:38 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4e5d8sm192207066b.82.2025.10.02.05.28.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:28:33 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so2111503a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:28:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjXHtwkm5KDKitnYM9UuYeFnhY9FIZjjTaH68Wy3V2e+5qa+ePKgODRHVse5PITF2MfnLg2scyT7kDXWSB+4kstQ==@vger.kernel.org
X-Received: by 2002:a05:6402:1d53:b0:634:b5b5:9fb5 with SMTP id
 4fb4d7f45d1cf-63678bb704emr8111645a12.10.1759408113266; Thu, 02 Oct 2025
 05:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001122326.4024391-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251001122326.4024391-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251001122326.4024391-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:28:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPEZJ11sfLDk=O1oZq_OKz22G9wz3Sw5acMr1QVYG_Qg@mail.gmail.com>
X-Gm-Features: AS18NWC-_9Ox7ciqPoYRQmMsFw1knBxTffAhjo8400Hfa4uqpwmBsatJ-il-O0c
Message-ID: <CAMuHMdXPEZJ11sfLDk=O1oZq_OKz22G9wz3Sw5acMr1QVYG_Qg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] iio: adc: add RZ/T2H / RZ/N2H ADC driver
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cosmin,

On Wed, 1 Oct 2025 at 14:24, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Add support for the A/D 12-Bit successive approximation converters found
> in the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> RZ/T2H has two ADCs with 4 channels and one with 6.
> RZ/N2H has two ADCs with 4 channels and one with 15.
>
> Conversions can be performed in single or continuous mode. Result of the
> conversion is stored in a 16-bit data register corresponding to each
> channel.
>
> The conversions can be started by a software trigger, a synchronous
> trigger (from MTU or from ELC) or an asynchronous external trigger (from
> ADTRGn# pin).
>
> Only single mode with software trigger is supported for now.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Thanks for your patch!

> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1403,6 +1403,16 @@ config RZG2L_ADC
>           To compile this driver as a module, choose M here: the
>           module will be called rzg2l_adc.
>
> +config RZT2H_ADC
> +       tristate "Renesas RZ/T2H / RZ/N2H ADC driver"

depends on ARCH_RENESAS || COMPILE_TEST

> +       select IIO_ADC_HELPER
> +       help
> +         Say yes here to build support for the ADC found in Renesas
> +         RZ/T2H / RZ/N2H SoCs.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called rzt2h_adc.
> +
>  config SC27XX_ADC
>         tristate "Spreadtrum SC27xx series PMICs ADC"
>         depends on MFD_SC27XX_PMIC || COMPILE_TEST

> --- /dev/null
> +++ b/drivers/iio/adc/rzt2h_adc.c
> @@ -0,0 +1,309 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/iio/adc-helpers.h>
> +#include <linux/iio/iio.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +
> +#define RZT2H_NAME                     "rzt2h-adc"
> +
> +#define RZT2H_ADCSR_REG                        0x00

I would drop the "_REG"-suffix from register definitions...

> +#define RZT2H_ADCSR_ADIE_MASK          BIT(12)

... and the "_MASK"-suffix from single-bit definitions.  But this is
my personal preference/taste.  Perhaps IIO uses a different convention?

> +#define RZT2H_ADCSR_ADCS_MASK          GENMASK(14, 13)
> +#define RZT2H_ADCSR_ADCS_SINGLE                0b00
> +#define RZT2H_ADCSR_ADST_MASK          BIT(15)

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

