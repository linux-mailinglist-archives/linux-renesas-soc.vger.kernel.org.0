Return-Path: <linux-renesas-soc+bounces-19007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C84AF0C20
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 09:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBD5B1C01E63
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 07:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD41190072;
	Wed,  2 Jul 2025 07:00:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D72C13AA53;
	Wed,  2 Jul 2025 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751439658; cv=none; b=JKTgkImt+tXKnxtT/2EY1VHDrthK2ISr6/2sAQdm2I50dIbFqU+I2sRJ5TEyVJjFPSky5vady9NcLXPRu4jrGucZDxRfK9pOL5/svphEFWLBl11Orwjr+ihjAguKGiWAA9ktmNnPJEX7CvUiiJL44FqiJcp3Jw0MQnYOpPeraOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751439658; c=relaxed/simple;
	bh=ZAohozwgXhCfaTkIAbLY5WIlPGLIi2JDtWLffVfkn1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RckgZdHnpQvOlTFC9mULAvOpKcjaKE1Rnsso6hiX8MBuzaisKf26IrexuBGtH0x9X/a74koI9kz190HuvJz03OeXL/wPcLIGgLNsyWUc5KvTykFXd+fKOsMDWSabYfXEokkaPIYuaoZqXVhJoOmc0BpqD4M8Omf5Ihn1pcK3R1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5313ea766d8so2124718e0c.0;
        Wed, 02 Jul 2025 00:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751439654; x=1752044454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kzqFhDecSsPBGIKLh7TFgcJDtqSJLtrHW0rK4QgStU=;
        b=ETKSgDDxLFC09rvuNch1BZTGNx6gJeFs5ZO546QCL3u/CftXNkkxXdikY7yn4VthUz
         gdT2O5WRw+cBq/jnkUT9qW+qqii3BGqSlltajCwJB8TbTEOKXsNUtdOSTLEbN4cyNbUW
         pa2GRlTKRqsq1hJuDQ3cthlNIbyTsuGcmQeoaE+Xh6eYuDfWQk599gbyNp8DBIuCPndV
         BTT3O1R4TIgLNQ2v7q2nsCrYqz4+0roK4fheynAqkAnamR3Z7bWU8J+YHyMry+GJdYIo
         JY51dmS3ueEMgdvkiCGrWF/I39GD8EMaYeMrthK7H0X/zJLAyFtpwgFIMJAOHS19NWhy
         HzyA==
X-Forwarded-Encrypted: i=1; AJvYcCUDwg7jdMwEYPBZl/Nujb+pnY+LWpUhF70kThn6L5ua5mZVxeqpdqrZgDwcSWfCZxLxL9QiTxZn0MlqpKD8HVQyur0=@vger.kernel.org, AJvYcCXadQe49sNIyrx+LSaoRU0F4wPGz7lc99we0tiij4nQYzdVCJBgC25fvJbw3zL6zJMWibnHRRpyd9+1@vger.kernel.org
X-Gm-Message-State: AOJu0YxkqAhrY3gKpnNcfrzHAtDQHqBJiRD0ykIwZu7FDMlu1Te5pXyI
	Jmzn5mSOXCSJRVYOd2q+Pbwk9Gz4OaUxP6/erFhGZnUzCOzKPlceORzXxtch68kK
X-Gm-Gg: ASbGncsTYF4BVMK4l4p1/8k3paCKIG7l+L97ebDK9HnlNAupKTvaYZNPbVXCGpSud3f
	tMZzyHxy5iY/MpMNn9WJs1Xfjaho1P+2kwi/a/e5nEf7B+sm+Bqa271K04FSiJkukUKcFucJ1oo
	8lb7EiN4eQTvAh165oTEpfCq3hCI2CRS83mSfdagAjCInz9DNW04zH1pRAKhQtj0c42um3ZvB/E
	RXCF1BP0HlA27a7tIA3+h5wWyHcgVI2CpWaL9bLtG+a8YAI/ix5VD8TJQR4a7TGXeDxotaLQREK
	EAnreA6i+SzNxsghEybkX6+HSmXdjCjDxhArUenMwu169Psfm8Jlg6fUAyHzXZ0WI8PqGd/riVn
	IdW0wFxUPR8xhdmLm2VggsSGY
X-Google-Smtp-Source: AGHT+IGuxX11nmreO79ONBz8vPOYrACNCi4gx8mpSnScKUz+jlFmr9hPn3TS9hQOQPrKU+HbjT2ekg==
X-Received: by 2002:a05:6122:2228:b0:530:65f0:7fc4 with SMTP id 71dfb90a1353d-53457fea6b9mr1088008e0c.1.1751439653750;
        Wed, 02 Jul 2025 00:00:53 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091ec4absm2037318e0c.32.2025.07.02.00.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 00:00:53 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e770bb7b45so1840779137.0;
        Wed, 02 Jul 2025 00:00:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXZ+A9DuDsilLBrRPRHk3TCwejOnc6TOIDfrJZ2dTEYAVjOleHV9XNntWAjtDtYxJlw8NVGaW+J1lB@vger.kernel.org, AJvYcCXuWaa7G97cLhTWuBoqxP4ldg6emNHGhvlHt1V9InzY54ls0F4hKqjS37WMp4NSUV7sUokDZIph6MKI8gxHPiBUymo=@vger.kernel.org
X-Received: by 2002:a05:6102:8097:b0:4eb:2eac:aaa0 with SMTP id
 ada2fe7eead31-4f160fe0f0emr744940137.19.1751439653138; Wed, 02 Jul 2025
 00:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
 <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
 <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346C70FFD599B85A790B8278641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C70FFD599B85A790B8278641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 09:00:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCq7eQ0Fpq6oMFP-n_yZZV8TB2WXV3SgjhW3Wne77CxA@mail.gmail.com>
X-Gm-Features: Ac12FXy9O598tRbSQe8MBdJ5lZ_Fke2AVhDAe-4HDC1E5uhnN0XHJiv2bfXyjOE
Message-ID: <CAMuHMdWCq7eQ0Fpq6oMFP-n_yZZV8TB2WXV3SgjhW3Wne77CxA@mail.gmail.com>
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

On Tue, 1 Jul 2025 at 16:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Tue, 1 Jul 2025 at 13:40, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 14 Apr
> > > > > 2025 at 17:38, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > RZ/G3E SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2
> > > > > > and USER_SW3. Add a DT node in device tree to instantiate the
> > > > > > gpio-keys driver for these buttons.
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > > > > --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > > > > @@ -12,8 +12,13 @@
> > > > > >   * SW_SDIO_M2E:
> > > > > >   *     0 - SMARC SDIO signal is connected to uSD1
> > > > > >   *     1 - SMARC SDIO signal is connected to M.2 Key E connector
> > > > > > + *
> > > > > > + * GPIO keys are enabled by default. Use PMOD_GPIO macros to
> > > > > > + disable them
> > > > > > + * if needed.
> > > > > >   */
> > > > > >
> > > > > > +#include <dt-bindings/input/input.h>
> > > > > > +
> > > > > >  / {
> > > > > >         model = "Renesas RZ SMARC Carrier-II Board";
> > > > > >         compatible = "renesas,smarc2-evk"; @@ -27,6 +32,31 @@
> > > > > > aliases {
> > > > > >                 serial3 = &scif0;
> > > > > >                 mmc1 = &sdhi1;
> > > > > >         };
> > > > > > +
> > > > > > +       keys: keys {
> > > > > > +               compatible = "gpio-keys";
> > > > > > +
> > > > > > +               key-1 {
> > > > > > +                       interrupts-extended = <&pinctrl
> > > > > > + KEY_1_GPIO IRQ_TYPE_EDGE_FALLING>;
> > > > >
> > > > > So you are using them as interrupts. Don't you need to configure
> > > > > pin control for that (function 15 = IRQ14)?
> > > >
> > > > The same pin can be configured as TINT or IRQ15, currently it is configured as TINT IRQ.
> > > > Is it ok?
> > >
> > > OK.
> > >
> > > > > Alternatively, can't you use them as gpios with interrupt facilities?
> > > >
> > > > interrupts-extended = <&pinctrl KEY_1_GPIO IRQ_TYPE_EDGE_FALLING>;
> > > >
> > > > The TINT IRQ will provide the same right? Am I missing anything here?
> > >
> > > When you use interrupts directly, the system will detect only key
> > > presses, and fake (timer-based) key releases.
> > > When you use GPIOs with interrupt-capability, the system can detect both key presses and releases.
> > >
> > > See also commit cab3511ea7a0b1fc ("ARM: dts: marzen: Add slide switches").
> >
> > As per [1], for GPIOs with interrupt-capability, IRQ controller needs to support both edges.
> > But TINT supports Rising or Falling edge, but not both. So, we cannot use this.
> >
> > That is the reason using interrupt directly.
> >
> > [1]
> > https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/input/keyboard/gpio_keys.c#L980
>
> This is the error message I get if set gpio with irq capability
>
> [    2.191819] genirq: Setting trigger mode 3 for irq 51 failed (rzg2l_gpio_irq_set_type+0x0/0x14)
> [    2.204168] gpio-keys keys: Unable to claim irq 51; error -22
> [    2.210018] gpio-keys keys: probe with driver gpio-keys failed with error -22

So interrupts = <...> it shall be...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

