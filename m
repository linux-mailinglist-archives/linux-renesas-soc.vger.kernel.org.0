Return-Path: <linux-renesas-soc+bounces-12601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832FA1DAC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 17:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42D7B1889542
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 16:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E54F175D4F;
	Mon, 27 Jan 2025 16:45:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE371662EF;
	Mon, 27 Jan 2025 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737996304; cv=none; b=Ol1GfEtErC2IRawIRwIKkEEhMdnJ9p3okMYYq9JvnM7glJlLvAb2s79pzuvt4CSh+ps/YMsMbvnj+IgY3TMgZU0BOs/DFf8eS67U5Jr297/1ShaUW1gyahcriJNMRq6ofDqjao2cT+A1EK3r7Yo/skZX6q9cZlG544CSLCQF4Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737996304; c=relaxed/simple;
	bh=xT8jgs3XxgF6Kwj3K/AFuNv1qnw3sqdQpdUa0VQmBE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5U61nEavtCvVZsrwxoMu2n9uWWCuoZoOrCjoVa/j7jVbYr9oo5k2HugXbqMLPaLS7E8i0vDLSdSVphrMHJQXWg880yI8avO/JwPaHQUsXfQ+jJdMQAybysTrFyFTj6LjXLemQCbFpQlnpNn5sObQJzdbc/ur6kf2N7cSFg+TIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afe7429d37so1181444137.2;
        Mon, 27 Jan 2025 08:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737996301; x=1738601101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/L/oLqfgKXgEIy2iOSOinRjrktgwWC6e04LbtOQjJs=;
        b=BdJoNf2Z2gqFHet5dlwe6p6at+dmkva6LTXcjCFIhABbDMmvIitIS7dZlfy7d6FN/7
         N2NmTKTLHUyu4bUSfzR9lJgGDoGNPrHuobsuuoQ9p1oy0ynKrmxxpOQ4R5sCESW6L7Bt
         zEPlHZY8LukmEMUam86Wyu8Iv6RfZSCXxOtrceTkc00br5Z/ky9Y7UY8k4rAvDgA8c3T
         hA5gQ+rt9GsKygAOcpkw6wlDKFeisMa1FZ2uz/vMEU8hHmJZW3FSEjCsRlsdh9QrtcPy
         +OttyYKXa6NSPMT3OXKYloJaiafHoE9vsAyks5z1sx4pHoimQkgE6ePREPfisS+hNaZb
         LDOg==
X-Forwarded-Encrypted: i=1; AJvYcCV79R/DfohVtQHYx3fj90BRBMMQS1xY/NRnPlt4lI73h6xzLoRRpAyrdpGKtH2wOXt50rpWmOP6sdiNSFomfQgb7zo=@vger.kernel.org, AJvYcCV7p2VtERvc+np2DQsQyRewQzBjbVaALbudvo8rb93XZyC1MHO4Md3MzCsitD17tA2mlV7iSvNO5tg1@vger.kernel.org, AJvYcCVG71cXNnPDx8+bzbZAOcb4QuFusIw3CSVVyszQ/FaKZ49vqzO89VewBZBYr1zF3QaW3xHErexBXFBWS78W@vger.kernel.org, AJvYcCVX+4MZdWWHpBdMJXpIBGscto/yLl25i3hnTvlf7C2N2FUShjAmj9HNfilS3qgIwliHHEGC90/Ini57Olhg@vger.kernel.org
X-Gm-Message-State: AOJu0YzsEz91fnTMjD9q6jgRLp12IaSOWonZ9ZpDjHV32rgMkuJGvqAm
	NHnedATbeBf7j25f4Xo3BeFTYtKVXbh8s1XZ1PRNtzl6LtPDLG1ywKNeMlruFnk=
X-Gm-Gg: ASbGncsaoIX1BEbJdQNeMXQ+rlHicgmbVNFNtw+Q7q3SZRxNzTTOvwZERLdRZe8CwF6
	uRE3qx/Mc7L+4QgOPsjq+g8tO3Vnmr4a/DF3u9rEcboCdeKKiL61Hi53x9juaJr8ImjPGG9HCUE
	yIAAmylBQgOAGAV6B5rd4w3CjoagWVUTe2GhMSYPPV0vLmzJoA7NQXEHgvyXGmD0eMThkesQKyS
	EwmqaTd53R5pVnCBB2IrRuw3X1bAl4jxgnxBcij/M/7cLzXferUxlSnx+6/lKKxF4aS5IDorGnB
	Jufn0EK63mG0Zm/54IIsfkYlNNGzngNCw3aQ+Bg6XnzgGCU=
X-Google-Smtp-Source: AGHT+IHhfnqC3Gbsb8+8mVMHgMdrycP2Le4XdyjD2YuDCWlmYbErAK8S3bDRbV80ShrERZOQnLmKsw==
X-Received: by 2002:a05:6102:162c:b0:4b2:5d10:58f1 with SMTP id ada2fe7eead31-4b690be8604mr37038079137.11.1737996300714;
        Mon, 27 Jan 2025 08:45:00 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9b1b694sm1924237241.17.2025.01.27.08.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 08:45:00 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51c7b5f3b8bso1489657e0c.2;
        Mon, 27 Jan 2025 08:45:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1KMEZj+KCCtZpwoKA+F1gbBmquvmDFquGWe48xQ+I8JF0lgCiDSeqBfBrdO4cCKkuv4Lx4RxBIhdQ392t@vger.kernel.org, AJvYcCWhjCgy8B00Okm1b2MYkemAfM2/CSrM1Ng0emqQlJ+7uJNI7f4EbLLDn+VcfFg9B6Pm4BAgyR68qE5AF6Dw@vger.kernel.org, AJvYcCXAxNxRxGhDwSo27V/+Y1i7Wi1q6GgTb7j8ONdwlgKPgLvbkN3DThe9VpujiDznuB0Djbn0jVdDCA/9@vger.kernel.org, AJvYcCXoN700l949W49fYo/PJ42lObOPhO4bePJU51GLAwmyyCbmVP0BAo+0ZrIyFB9u2QOXbm5gGkdWsN2qXhSPMI05uNQ=@vger.kernel.org
X-Received: by 2002:a05:6122:6610:b0:51c:aa1a:2b5b with SMTP id
 71dfb90a1353d-51d5b2641e4mr38109370e0c.4.1737996300109; Mon, 27 Jan 2025
 08:45:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com>
 <20250120130936.1080069-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWYNs2vQTn07Xfx1Misk3Ry5y3PSYPrGbycZdt5LnU_vQ@mail.gmail.com>
 <c8cbb0ca-f85c-47d7-a581-fbaf2147c807@tuxon.dev> <CAMuHMdWs=Q2sZj+P+1a1m-4fb4oizjdO2=u=Oqz162kpbTDtFw@mail.gmail.com>
 <b409fd8d-4c5e-4f1d-94fa-b37ab25095c9@tuxon.dev>
In-Reply-To: <b409fd8d-4c5e-4f1d-94fa-b37ab25095c9@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 17:44:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTpffbK8Nv_b45o=b76ageQtfH693CW=ob4hF28NBsBw@mail.gmail.com>
X-Gm-Features: AWEUYZmZEr5KFcPLbLwC_2NR6Ke3dFxN2fu-jTcuk49ndz0_IeJiwkObetKJKeQ
Message-ID: <CAMuHMdVTpffbK8Nv_b45o=b76ageQtfH693CW=ob4hF28NBsBw@mail.gmail.com>
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

On Mon, 27 Jan 2025 at 13:23, Claudiu Beznea <claudiu.beznea@tuxon.dev> wro=
te:
> On 27.01.2025 11:19, Geert Uytterhoeven wrote:
> > On Mon, 27 Jan 2025 at 09:44, Claudiu Beznea <claudiu.beznea@tuxon.dev>=
 wrote:
> >> On 24.01.2025 12:53, Geert Uytterhoeven wrote:
> >>> On Mon, Jan 20, 2025 at 2:09=E2=80=AFPM Claudiu <claudiu.beznea@tuxon=
.dev> wrote:
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> The Renesas RZ/G3S supports a power saving mode where power to most =
of the
> >>>> SoC components is turned off. When returning from this power saving =
mode,
> >>>> SoC components need to be re-configured.
> >>>>
> >>>> The SCIFs on the Renesas RZ/G3S need to be re-configured as well whe=
n
> >>>> returning from this power saving mode. The sh-sci code already confi=
gures
> >>>> the SCIF clocks, power domain and registers by calling uart_resume_p=
ort()
> >>>> in sci_resume(). On suspend path the SCIF UART ports are suspended
> >>>> accordingly (by calling uart_suspend_port() in sci_suspend()). The o=
nly
> >>>> missing setting is the reset signal. For this assert/de-assert the r=
eset
> >>>> signal on driver suspend/resume.
> >>>>
> >>>> In case the no_console_suspend is specified by the user, the registe=
rs need
> >>>> to be saved on suspend path and restore on resume path. To do this t=
he
> >>>> sci_console_setup() function was added. There is no need to cache/re=
store
> >>>> the status or FIFO registers. Only the control registers. To differe=
ntiate
> >>>> b/w these, the struct sci_port_params::regs was updated with a new m=
ember
> >>>> that specifies if the register needs to be chached on suspend. Only =
the
> >>>
> >>> cached
> >>>
> >>>> RZ_SCIFA instances were updated with this new support as the hardwar=
e for
> >>>> the rest of variants was missing for testing.
> >>>>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> > While storing the suspend_cacheable flag wouldn't cost any storage
> > space anymore using bitfields, I am wondering if it would be worthwhile
> > to have explicit code to save/restore registers, instead of looping
> > over all of them and checking the flag. I.e.
> >
> >     u16 saved_scmsr;
> >     u16 saved_scscr;
> >     u8 saved_scbrr;
> >     ...
> >     u8 saved_semr;
> >
> >     /* Save omnipresent registers */
> >     s->saved_scmsr =3D sci_serial_in(port, SCSMR);
> >     ...
> >     /* Save optional registers */
> >     if (sci_getreg(port, SEMR)->size)
> >             s->saved_semr =3D sci_serial_in(port, SEMR);
> >
> > That would make it apply to all SCI variants, not just for SCIFA,
> > while increasing sci_port by only 10 bytes/port. And 10 bytes/port is
> > probably not worth to be protected by an #ifdef...
>
> That was the other approach I thought about when working on this patch. I
> chose the one proposed in this patch as it looked to me simpler to extend
> to other registers, if needed (just enable proper flag in
> sci_port_params[]). And needed less changes for the code saving/restoring
> the registers.
>
> If you prefer your version let me know and I'll switch to it.

As this driver is also used on smaller systems (e.g. SH), I'd go for
the solution that leads to the smallest increase of code size and
memory consumption.

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

