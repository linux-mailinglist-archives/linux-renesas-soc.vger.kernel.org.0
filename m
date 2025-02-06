Return-Path: <linux-renesas-soc+bounces-12914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB25A2AA77
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 14:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29DDD1889ACE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 13:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9198E1C6FF5;
	Thu,  6 Feb 2025 13:55:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ADE199B9;
	Thu,  6 Feb 2025 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850128; cv=none; b=aZZlMiZvQsKf1BCLW6dqJna/JfHoGvJWK7Zebi/6C+Ptf5lH/i8WjpAu8PjmcupqJAoWLb0nQ3SqodDZ//r0gY5FeCpvRE8r2aPpS4tuvZ48wPtuEO9LJaWhAzzLb998xnPNJNihzVgcg8OAPEBkAhcw8ez9r/TmsNFU2uD8pvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850128; c=relaxed/simple;
	bh=ZCZr5sozyZgu0CY7jpLwBEURc5rUI6AVwu0Ci2grIBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArZvRJqwjHokGtguxN/Xd9OTuKxAuqpZo23VdhgPcqJAIQNThwJ+QKkU+72WKF7npbaaKznkAnOifApSPju15vJno+tO1PfExXD7KgrePGwpkw1hspq923+sriRc/WNEgGIhdxbwnv1C8c9tTFFCXUnSmWB/QAeDNCxBHDid+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-866f414ccedso549180241.1;
        Thu, 06 Feb 2025 05:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738850125; x=1739454925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udU39gsf+akq6HCw80QzG+NzxjMAWnoUTDvRFN/6jgM=;
        b=qTs5t4VKeq8+4itNQQ7dQ26YCSA0tUWD0N0u4yIXIBTm5UTz/6vffQ7SE4xuCkxNF9
         m91bzePkAUpIchvX5Z0kjbvoe/B7p/ylVr+RV31zvGI7KVOG7KuozYDOjqSEj2qhET1f
         77EWEWirXovC13i4ki1fSivnWYyb7UHtemzbdzdpH91UOu7vNxsfre36Pjju5FSPRcXy
         /Au/A/BpksczByNOCyBP6BnSX+xIjy55hhAd7vBQlgh1btHg0WJ3nrFUPGzI7nRVHSAG
         axkIlUVxO2g8jSJXitSqariBA9LKch49D7Fk13HCo8TkqB2XlqXjS6xAowSYjrJMJUpe
         bAmg==
X-Forwarded-Encrypted: i=1; AJvYcCUZYrBi+DMrjIWbnsBMZTEvgoTSHzj84bvE21HSuwJwgSKg/6KVdj41nxK9l/l4iZdtM5DTc/IwcGMh6L56@vger.kernel.org, AJvYcCVanQ+m6rlfe+0TQ7uDdfJQan2VZxdLu80I38wlPvuEFxBNbYLC3FEvMnoVdguEigGxUOv3fvO6OIA8EKZK1LBMA3c=@vger.kernel.org, AJvYcCWmAmUyWPCqbSfx1n3h7dLo4p+Tmf/GOXfdjtLC00zTqNXWBExXotArv24IJiwJNb7SxLvKPhmglWBgueA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc5MS96HhEZ3FyEdyAUwyyHRcFFzifqxUGx4Oco9FlX0qEFVUN
	W3sz+ZCDYz125KVTBDW+DPtx1gzf5PeZgJ5gwmuzvzwk8F1yJ/f476d8O4Dj
X-Gm-Gg: ASbGncu9K7PhAVDI+FMhoqMzRD6jo95K8RMwvQrfZYiWK6ZUGXTuoCrG6NE/BSePAxk
	u6UO+YhQIAB5WaBhxCgT/12cXCvkVLfg0aM03Mh38mfChNIn9P4Qpoq0yksg68BHVj/XRDqL6c9
	aGwo50MbLMeFoxVO5D3Jr6y5KD3cDa2EY7uySXRm3uAKu/4l48O495B5i06cM833Mx+xYuMd2bC
	jRb+IfgYS0vZDm98b9LdVJIdxk+kaPQwCBWynfC7Yy7As3BYX6L3lZqlwamFvN1n+uSHkLAYTK/
	2cm8NBkMKz1ElbLpDJtPo5clTH79U2AI8E7BhILvlbhl5cKUUgGGa1HFOw==
X-Google-Smtp-Source: AGHT+IHMzTpAr4ur5sVChtFu3Z8mUiP7yBFa/KRaAaQfjRgTABHAWsoFJ8VVwTT2TrUoDEAIV1JOXg==
X-Received: by 2002:a05:6102:b10:b0:4b1:1b67:6a5c with SMTP id ada2fe7eead31-4ba47abab86mr4592666137.18.1738850124694;
        Thu, 06 Feb 2025 05:55:24 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76ebe373sm229823137.12.2025.02.06.05.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 05:55:24 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5189105c5f5so542473e0c.0;
        Thu, 06 Feb 2025 05:55:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1+8jDYJeX4eQNBkQOCk0qIIa4wJxHYwTgPv2dgmzumYfjEYq3DDD7IBn9kWYK2siarIqKwh70QKlt0hEqKZ/IIJM=@vger.kernel.org, AJvYcCU9SISi/48XYi8VUfC/oS+d1r8qI7dMGAuyCYyN4rxnk+ckwJwVL3xc7sqyguwogxHQIDqYuqr+qk7nJfNu@vger.kernel.org, AJvYcCWocFMMkyJw2PXkQL0yXFuJekSGmidgSztC2f08SPCgc7xLeCDJ1SLDHpaRPpp2SeaTs5oxXn1kJx7P5eY=@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:4b2:4877:2de4 with SMTP id
 ada2fe7eead31-4ba479df281mr4184465137.15.1738850124232; Thu, 06 Feb 2025
 05:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205093108.2027894-1-claudiu.beznea.uj@bp.renesas.com> <CAMuHMdVD-=n5LdRk42SicdH6MoffTfNGtAz_1AMQ1c7Mui7dFg@mail.gmail.com>
In-Reply-To: <CAMuHMdVD-=n5LdRk42SicdH6MoffTfNGtAz_1AMQ1c7Mui7dFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 14:55:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTifmJ82geKC5Ta2yM-uH6dFZab1_Tc_vTDWzZ3o4D1w@mail.gmail.com>
X-Gm-Features: AWEUYZmaPrRwoy5Whha0O4pj7at87u5ymYx_wgG0HEUA78KoZ0A4m-0briIbJFU
Message-ID: <CAMuHMdVTifmJ82geKC5Ta2yM-uH6dFZab1_Tc_vTDWzZ3o4D1w@mail.gmail.com>
Subject: Re: [PATCH v5] serial: sh-sci: Update the suspend/resume support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 6 Feb 2025 at 13:47, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 5 Feb 2025 at 10:31, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > @@ -3546,13 +3559,41 @@ static int sci_probe(struct platform_device *dev)
> >         return 0;
> >  }
> >
> > +static void sci_console_save_restore(struct sci_port *s, bool save)
> > +{
> > +       struct sci_suspend_regs *regs = &s->suspend_regs;
> > +       struct uart_port *port = &s->port;
> > +
> > +       if (save) {
> > +               regs->scsmr = sci_serial_in(port, SCSMR);
> > +               regs->scscr = sci_serial_in(port, SCSCR);
> > +               regs->scfcr = sci_serial_in(port, SCFCR);
> > +               regs->scsptr = sci_serial_in(port, SCSPTR);
> > +               regs->scbrr = sci_serial_in(port, SCBRR);
> > +               regs->semr = sci_serial_in(port, SEMR);
>
> The SCFCR, SCSPTR, and SEMR registers do not exist on all
> variants.  Hence you should call sci_getreg() and check if
> plat_sci_reg.size is non-zero first, else you will trigger the WARN()
> in sci_serial_in().

As expected, the WARN() is triggered on any R-Car platform during
system suspend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

