Return-Path: <linux-renesas-soc+bounces-12545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A8AA1D339
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 10:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 488653A29AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 09:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013301FCFF4;
	Mon, 27 Jan 2025 09:20:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31C33C9;
	Mon, 27 Jan 2025 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737969602; cv=none; b=h4yFA79SeUmaqmJoxuxadRFq5HOpps4OrvL6Rh6Cj4zuW2/sGwJ+5if8sV2qSbgQk6yxKqasCnCozpfj06c/r/3AZH7Yy6VBY+xDteLKP5OkFWiwCzZDxs5oMCUVLf2EowszHDYt4DIZOBQOGFxhncqPQRfsBabNT5lS6QBubiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737969602; c=relaxed/simple;
	bh=+1KEvZq6enAKYJ3NEalacX12Dd+eizVDgAhGbI6rEug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHw0GwL3/SVFCXFy0mV1MZGbPOt6Obp07wjDXjHenTzB1UxKGTI4ZgJn0dv5LTGRAULBbQ6OWxHjdTBl3yq73r7WIBAmwb6BLd3QFY9iqb7br/1oJDhKCRH/svjfjify2Y6gT00TJ+nvywGVfkw86P2cVQ1iB6xeRPRtE9N8EMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4aff5b3845eso1521529137.2;
        Mon, 27 Jan 2025 01:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969599; x=1738574399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbVXCluLIwnFXTqVfOED/6rEv6yHuf7dMlmyzgLnx9k=;
        b=c2zKCvLlWfZH+DCpHSfi5TX74Re/dMnLY8KjggxaTTm+FvI83wZ1PZ7Sk3yUqDTP/z
         iNA0XgEALqoKTO2iEDGDC9MqtRXsgPJGYp4zp3cgJQNGG302pqgNT9WZ62cGgnzh8TRb
         l2RRROROVYpP9vLBZQv/c09DwzIFtoM9qbpt03t+B62A/WSTKOWbIQeM9gVfv8qcR9OQ
         Ll7+yGdpOx3vo0HEgeMDV3vuAjZOq15tLNd5Pr0YxLT/J8HWrNztBzP2aqXajygBqOCH
         owwSY78gDbkU6IMMC8QT2N8p2dFeRBDMnjtAEIpCcfOu5X2rArXO30OyiFv7oc9JwwkE
         pLLw==
X-Forwarded-Encrypted: i=1; AJvYcCVKaEA6bKcZlKi9AmopTD5/f/UaVJCrcshftgG4+72uQNYB3GRvT0s+bVAXw9TpKkww8DPI0U8mhi1OHe6J@vger.kernel.org, AJvYcCVeZ0VGSmbUM1iN2B06/I/rdptBjKwjeK3fvZpAZEPSrDNk8rCZEsAyia52w65dlhVidnODy5na20Tvir30@vger.kernel.org, AJvYcCXNJjEliFwqyEd46O9+Jmf72Pq8GHMfU7pLRctl2aRIoMFYPvo2IfgmtEltw++NmnetqvKVaUf28jKa@vger.kernel.org, AJvYcCXYjtwdY1xtwav9wL9o5OXWob0aXMP2XI/aOM1Fd+100ll31xYuDuw/pp9kItnO7O+5oYD/rW1PPXDCXxPFAyIIbqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsED8vYSOPrPb0CzdFcEONOUtFrHoiNq7g0i7ELmjyyJ5VBXy2
	5gySAt0PePD2WwNnfd5MSUIeb29vTDZWan1EEFHu0wk0+Cc9EsKAf5yNCgaA
X-Gm-Gg: ASbGnctZqOUFMz+H4YI8qxpsMfegl9QrocRO09TnYFK9Du89bmo2VLdEU6ZxKZqNJY+
	o8YZEM7ZW83UbQV86Qht7LcbvSNuh4LvgB7xCmZ/CgRpPAW2G+ZtDbw3QsG+JqFj1P38dMC2dF+
	LzpAEOd0+9lLrawl7Sq9r/XVMjQ4gEQ+eIDTqAt6So66RZxQehUl+JLNTLL/N5PpNy2BcC8vpNx
	ikVsIctZMerks/V37OBqTVrlke43PmeFousT/BBFX+L5NLVRYAZbfP/VaqfjsucTdgKDS19bZhx
	2EohpJ6NgbTVT4PdfgjRHBGcgrMwR3GEXsBnAmTA9AP6Q4Oi5YH3hhdKhQ==
X-Google-Smtp-Source: AGHT+IFa1otCbCqsomrOK2tKsvTn1N3E9QI2Dt4OzBV4AcXfwlapeAJanEmVzSw1SYBDT5Yyj5v0Rw==
X-Received: by 2002:a05:6102:3bd7:b0:4b2:5d10:29db with SMTP id ada2fe7eead31-4b690bc6357mr26446811137.7.1737969599523;
        Mon, 27 Jan 2025 01:19:59 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b70999c940sm1752976137.28.2025.01.27.01.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 01:19:59 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51878cf85a7so1269786e0c.0;
        Mon, 27 Jan 2025 01:19:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVt0oRvNXKyJCiJCoVVyxOrrCSKWlKi/0ZekNnWqd95dMt+WBUgVOryHiL2rmZtvFO4hRHeN+6oZK90@vger.kernel.org, AJvYcCXA6YOix75t1//j8CBdpL/2uQQkJuth3+Qkh+3sGTzfuXk7VZmy/Y8YMSDAEXIkB1p0V71wce/WkMNkol0NQTHPXZ8=@vger.kernel.org, AJvYcCXOYQMFtuTHzBY3hbUAgFUjKkHFYiXJHpt2fhSsmjljqWT8DR21YZwScQMNuCICbtnEFUPLpcyDtJHlsEgP@vger.kernel.org, AJvYcCXUA9a6CXYrNtXJ7JnjKORRfCKre8kF3b5W/Yb0XOnJBJeo/+EA4hU276uELgMlE4mVnyCUaG/y2y1ehPFC@vger.kernel.org
X-Received: by 2002:a05:6122:2403:b0:516:1582:f72e with SMTP id
 71dfb90a1353d-51d51b782c3mr35111993e0c.2.1737969598541; Mon, 27 Jan 2025
 01:19:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com>
 <20250120130936.1080069-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWYNs2vQTn07Xfx1Misk3Ry5y3PSYPrGbycZdt5LnU_vQ@mail.gmail.com> <c8cbb0ca-f85c-47d7-a581-fbaf2147c807@tuxon.dev>
In-Reply-To: <c8cbb0ca-f85c-47d7-a581-fbaf2147c807@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 10:19:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWs=Q2sZj+P+1a1m-4fb4oizjdO2=u=Oqz162kpbTDtFw@mail.gmail.com>
X-Gm-Features: AWEUYZl1tVTh3m1DhAgi_prr8-_QAQLZJvi2jw67VWaszAJkXZYXSlclFAWDSPs
Message-ID: <CAMuHMdWs=Q2sZj+P+1a1m-4fb4oizjdO2=u=Oqz162kpbTDtFw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] serial: sh-sci: Update the suspend/resume support
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	p.zabel@pengutronix.de, claudiu.beznea.uj@bp.renesas.com, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Mon, 27 Jan 2025 at 09:44, Claudiu Beznea <claudiu.beznea@tuxon.dev> wro=
te:
> On 24.01.2025 12:53, Geert Uytterhoeven wrote:
> > On Mon, Jan 20, 2025 at 2:09=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.d=
ev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The Renesas RZ/G3S supports a power saving mode where power to most of=
 the
> >> SoC components is turned off. When returning from this power saving mo=
de,
> >> SoC components need to be re-configured.
> >>
> >> The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
> >> returning from this power saving mode. The sh-sci code already configu=
res
> >> the SCIF clocks, power domain and registers by calling uart_resume_por=
t()
> >> in sci_resume(). On suspend path the SCIF UART ports are suspended
> >> accordingly (by calling uart_suspend_port() in sci_suspend()). The onl=
y
> >> missing setting is the reset signal. For this assert/de-assert the res=
et
> >> signal on driver suspend/resume.
> >>
> >> In case the no_console_suspend is specified by the user, the registers=
 need
> >> to be saved on suspend path and restore on resume path. To do this the
> >> sci_console_setup() function was added. There is no need to cache/rest=
ore
> >> the status or FIFO registers. Only the control registers. To different=
iate
> >> b/w these, the struct sci_port_params::regs was updated with a new mem=
ber
> >> that specifies if the register needs to be chached on suspend. Only th=
e
> >
> > cached
> >
> >> RZ_SCIFA instances were updated with this new support as the hardware =
for
> >> the rest of variants was missing for testing.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> >> --- a/drivers/tty/serial/sh-sci.c
> >> +++ b/drivers/tty/serial/sh-sci.c
> >> @@ -101,7 +101,7 @@ enum SCI_CLKS {
> >>                 if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
> >>
> >>  struct plat_sci_reg {
> >> -       u8 offset, size;
> >> +       u8 offset, size, suspend_cacheable;
> >
> > This increases the size of sci_port_params[] by 300 bytes.
> > Using bitfields would mitigate that:
> >
> >     struct plat_sci_reg {
> >             u16 offset:8;
> >             u16 size:5;
> >             u16 suspend_cacheable:1;
> >     };
> >
> > (if we ever need more bits, the size member can store an enum value
> >  instead of the actual size (8 or 16 bits) of the register).
> >
> >>  };
>
> OK
>
> >>
> >>  struct sci_port_params {
> >> @@ -134,6 +134,8 @@ struct sci_port {
> >>         struct dma_chan                 *chan_tx;
> >>         struct dma_chan                 *chan_rx;
> >>
> >> +       struct reset_control            *rstc;
> >> +
> >>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
> >>         struct dma_chan                 *chan_tx_saved;
> >>         struct dma_chan                 *chan_rx_saved;
> >> @@ -153,6 +155,7 @@ struct sci_port {
> >>         int                             rx_trigger;
> >>         struct timer_list               rx_fifo_timer;
> >>         int                             rx_fifo_timeout;
> >> +       unsigned int                    console_cached_regs[SCIx_NR_RE=
GS];
> >
> > u16, as all registers are 8 or 16 bit wide.
>
> OK.
>
> >
> > We reserve space for 20 registers, but at most 6 will be used.
> > This has a rather big impact on the size of sci_ports[], as
> > CONFIG_SERIAL_SH_SCI_NR_UARTS defaults to 18.
>
> I agree, but this should keep the suspend/resume code sane in case
> extensions will be added to the code. In general people forget about
> suspend/resume code when extending. Please let me know if you prefer to
> limit it (although, doing like this will complicate the code, I think).
>
> >
> > Also, this space is used/needed only if:
> >   - CONFIG_PM_SLEEP=3Dy,
> >   - CONFIG_SERIAL_CORE_CONSOLE=3Dy (see uart_console()),
> >   - The port is actually used as a console (unfortunately the user
> >     can specify multiple console=3DttySC<N> command line parameters, in
> >     addition to chosen/stdout-path).
>
> Would you prefer to guard the suspend/resume code with these flags?

I was also thinking about console_cached_regs[]. But if you would
protect that by #ifdef, you also have to protect the code that uses it,
meaning less compile coverage.

If you just add a static inline helper function to check for
CONFIG_PM_SLEEP, !console_suspend_enabled, and
uart_console(&sport->port):

    static bool sci_console_keep_alive(struct sci_port *sport)
    {
            return IS_ENABLED(CONFIG_PM_SLEEP) &&
                   !console_suspend_enabled && uart_console(&sport->port);
    }

then most of the code will be validated but optimized away when unused.

> >>         u16                             hscif_tot;
> >>
> >>         bool has_rtscts;
> >> @@ -300,17 +303,17 @@ static const struct sci_port_params sci_port_par=
ams[SCIx_NR_REGTYPES] =3D {
> >>          */
> >>         [SCIx_RZ_SCIFA_REGTYPE] =3D {
> >>                 .regs =3D {
> >> -                       [SCSMR]         =3D { 0x00, 16 },
> >> -                       [SCBRR]         =3D { 0x02,  8 },
> >> -                       [SCSCR]         =3D { 0x04, 16 },
> >> +                       [SCSMR]         =3D { 0x00, 16, 1 },
> >> +                       [SCBRR]         =3D { 0x02,  8, 1 },
> >> +                       [SCSCR]         =3D { 0x04, 16, 1 },
> >>                         [SCxTDR]        =3D { 0x06,  8 },
> >>                         [SCxSR]         =3D { 0x08, 16 },
> >>                         [SCxRDR]        =3D { 0x0A,  8 },
> >> -                       [SCFCR]         =3D { 0x0C, 16 },
> >> +                       [SCFCR]         =3D { 0x0C, 16, 1 },
> >>                         [SCFDR]         =3D { 0x0E, 16 },
> >> -                       [SCSPTR]        =3D { 0x10, 16 },
> >> +                       [SCSPTR]        =3D { 0x10, 16, 1 },
> >>                         [SCLSR]         =3D { 0x12, 16 },
> >> -                       [SEMR]          =3D { 0x14, 8 },
> >> +                       [SEMR]          =3D { 0x14, 8, 1 },
> >
> > Note that the driver always writes zero to SEMR.
>
> In case the IP is used on SoCs with sleep states where the resume is done
> with the help of bootloader, the bootloader code might interact with
> registers that the Linux code writes with zero.
>
> Keeping it for registers where driver writes zero should also help if the
> serial IPs power will be off during suspend, thus registers restored to n=
on
> zero default values (by HW) after resume.

Sure, the driver would have to write zero to the register anyway.

While storing the suspend_cacheable flag wouldn't cost any storage
space anymore using bitfields, I am wondering if it would be worthwhile
to have explicit code to save/restore registers, instead of looping
over all of them and checking the flag. I.e.

    u16 saved_scmsr;
    u16 saved_scscr;
    u8 saved_scbrr;
    ...
    u8 saved_semr;

    /* Save omnipresent registers */
    s->saved_scmsr =3D sci_serial_in(port, SCSMR);
    ...
    /* Save optional registers */
    if (sci_getreg(port, SEMR)->size)
            s->saved_semr =3D sci_serial_in(port, SEMR);

That would make it apply to all SCI variants, not just for SCIFA,
while increasing sci_port by only 10 bytes/port. And 10 bytes/port is
probably not worth to be protected by an #ifdef...

Thoughts?

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

