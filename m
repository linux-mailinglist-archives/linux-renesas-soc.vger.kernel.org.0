Return-Path: <linux-renesas-soc+bounces-28919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK93CymeqmlLUgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 10:28:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9411B21DE6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 10:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A7DA30143C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 09:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C65933DEE5;
	Fri,  6 Mar 2026 09:25:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3F30F92D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789137; cv=none; b=KRGH/F44llqsesxA59Xjj2uc4DoxI0g0iFmb/Hp8VCc5/xpMyxPg/my/PyT63EjdDcqv1steRNC3RkN7El/t6BQ7duc5YcQzDUhS28E4VOoViPGcn4tB5RdXYo4+GMcen3GxcTqOeCmyxpOvvGmWFjTDMXskSD020Cwtno9JFh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789137; c=relaxed/simple;
	bh=3aeQnuXG/sbuzwZcoW1JWlfdUspZWU84VTzWsTMiRHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccTpDzW+xM3wlTgx4Ugoy1nuZADDebTvb+5Mygv1K5oCWH/ZucNr6KAPQ4f0s+TcOW5NYNbTPdfNGcweRHOV0SNZa1VTBh1E+FMHZCV+ezHhOKRo7Hkyn7mQSj/ZUQD4+a2E77IqkepzPQbSTRNEKu6oHKmavLsUMo5bYw6PRgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffc1e25d6cso617472137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 01:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772789135; x=1773393935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4h9uJarZ4BuNnQJ353k8JX9BgnLvdKA/TpTU+cJowg=;
        b=HCtVv8sqbPM/jW6rO51/WEVyU3T2bI2nmXLJ4ZhRvcijm5TLkD7qTVqaHqJi/DwFOE
         A2Rrk/i7OLox8fYzl3vn9b8N0nMj5PtlZWTgVswwEfDJx0OLJHn2GXAr1jVWGzwoWQ7K
         p5KiEG9WN8TvbcltKtiA9rSAQgki+RvTW9yViMQmjbDAq9xthtiZRrFw7wO0x91KFAfP
         kcVEtWfT0ndd8IOM6dZ6HwIoUuQM6JetFj/BET7lqulinnDQaS0t+Msei85XSATIQrMW
         p8woAXs+zxp30UOjwcBxUut/0QJm0eMwENXaXYiSIZ0am9ZwNkoPHro+L2oS6MGhGwh5
         bRag==
X-Forwarded-Encrypted: i=1; AJvYcCUB0BCtSy1L7FgaaKxcf85MdbfR+RU7Ui0hPVSP6pJxYXDoJzl+IsJTBu1WEuw4Z85ulvpfc/shjdeMSf06g5fnFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytwGs7zz8QiGalGM7g/5ZPeBWE7R71a5WN2zbXspmbyWXzy+UA
	wHRa1Y5OCG9zvAcj7csPySjKQUBrGMkWnRLS2lGoyOoeQdLPV7BXVjEQRLDSGtHdMFY=
X-Gm-Gg: ATEYQzyi3b37spUBotmAsOdh/zJLq3F3toN3qIPUtJECzkmHxlxl51nGfPW7ZdZD41V
	A4r4gK7cbiPIa9A/QMy3JW/W82LJr2eOqSUZxumA9gR1/2jnj7bURqIXXiR546QsbQkcEMpBcPi
	PyDsrVLCk3eIcCcUixClIeQUkZWUKokd3R6VJxpGJ2nLgrrz9WiSPHsUJb9kCx2tj9mSt5/BfPQ
	LwALWn/XXKSOHQ4RPjpzeUn1tykcs2OpMo1BmP04Lev/N3sfcFv+Q4OanqpCHjJWKJHTIRumN4Z
	8zrebJRI/4wPswsjmTTaQYFQ80eN6M0faqe0ZLQxnttqhsn70H7OhGTs48gm3hBJ93bTDDVZlkY
	9qQQUQZrSI1YtrPt+DKx17spNhZvqOf1YGlSmwOCTLgrp8MB09f6XuiQ3THFXbc/2dTbDe1qAyc
	Jxotn6QnWTa79skSbZXGtPPqp5ab3eW0dekUXFHtzGWmRXVYEDIvcXS4QOd3su
X-Received: by 2002:a05:6102:292a:b0:5ff:d9e2:3f88 with SMTP id ada2fe7eead31-5ffe633ce41mr422516137.35.1772789134873;
        Fri, 06 Mar 2026 01:25:34 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b35f67bsm841983241.5.2026.03.06.01.25.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:25:34 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffd57b6fc6so331965137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 01:25:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXS17mDe3SN266b2ofzDjs0+PVyPL60A0Np+bwcbXqZ49UrmgnBtbZy7MqoecENDHk0pQgEuREhtZ+ZYNXzvQKDRw==@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:5fe:c506:c83 with SMTP id
 ada2fe7eead31-5ffe6387f72mr386564137.39.1772789134182; Fri, 06 Mar 2026
 01:25:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-8-biju.das.jz@bp.renesas.com> <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
 <TY3PR01MB11346EEC0D9D7391EEE7ED27C867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdV_WiB8graMNeJRVbNZczDetd+fA_4yxt5MV-h7Htzoeg@mail.gmail.com> <TY3PR01MB113468A1F5D5BA474644D2BFF867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113468A1F5D5BA474644D2BFF867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 10:25:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXr=8Y2cnyL-oOsCmzeNCqCYHm8dyDXWkhOd8qsshiOtA@mail.gmail.com>
X-Gm-Features: AaiRm516n5Ur_fK59xt1pmIs2-EkFLrEscM3rsR-L6wvu240WGY9jgsjVADKaNY
Message-ID: <CAMuHMdXr=8Y2cnyL-oOsCmzeNCqCYHm8dyDXWkhOd8qsshiOtA@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9411B21DE6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-28919-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi Biju,

On Fri, 6 Mar 2026 at 10:10, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 5 Mar 2026 at 17:58, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Tue, 3 Feb 2026
> > > > at 11:30, Biju <biju.das.au@gmail.com> wrote:
> > > > > Add the initial DTSI for the RZ/G3L SoC.
> > > > > The files in this commit have the following meaning:
> > > > >   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
> > > > >   - r9a08g046l48.dtsi: RZ/G3L R0A08G046L{46,48} SoC specific parts
> > > > >
> > > > > Added place holders to reuse the code for Renesas SMARC II carrier
> > > > > board.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > =
> > > > > +               dmac: dma-controller@11820000 {
> > > >
> > > > Unused. Surely you can wire up scif0?
> > >
> > > Yes, but I don't get login prompt, as SCIF0 interrupts have dependency
> > > on DMA reset/clocks to route the interrupts to CPU.
> >
> > Aha ;-)
> >
> > So you need to enable the DMA clock and deassert the DMA reset in the clock/reset driver, and mark
> > them critical.
>
> For CLK, already framework is providing critical clock support, which turns on the clk at the start.
> But for reset there is no support for critical reset in the reset framework.
>
> you mean handle this in SoC specific driver for DMA deassert like[1]
> DEF_RST_INIT_DEASSERTED during boot??
>
> Or
>
> Create a critical reset table in the SoC specific driver like clk
> and explicitly deassert the resets in CPG core driver during probe??

The latter sounds simpler to me...

You also have to avoid the DMAC is reset is ever being asserted again.

> Note:
> For Suspend to RAM, marking critical clock/critical reset won't solve the issue
> as we need to explicitly turn on DMA CLK/dessert reset for routing SCIF0 irq to CPU.

So you need to add suspendresume support to the clock driver,
to enable the clock and deassert the reset during resume?

> [1]
> https://lore.kernel.org/linux-renesas-soc/20260210113041.138430-4-john.madieu.xa@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

