Return-Path: <linux-renesas-soc+bounces-15969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F794A894A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 09:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCEE618892D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 07:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C481B07AE;
	Tue, 15 Apr 2025 07:15:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7986F13E02A;
	Tue, 15 Apr 2025 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701333; cv=none; b=IOtd3AS0ls2KxmwA2PJfpV+Mmc+4IDlrmf1n9hPO9ou1wNRMCrAR0vmvLLs17FPbMw+de79Unw0ihJODXp+EtuTKgjLw2UWKoht8TDlw9muJm8F6rVEiLyTlyHOvVYzyCBjPGV2MbeHqtCK2mdl1XJpveQjzkWWjNpGwsB2opLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701333; c=relaxed/simple;
	bh=9prnVRGxAl7RixDkvPP4gd8pXYvvKeayn1LjBbRHzZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1/bQRJV4ux1VyPEz0Vgn0wGGn2P4gzu14i7Chn9ulR76E4uabKHEMcd7nRShtkkengUTFUkO8Hxofz2GBtymdBHEUGmWW2qkSbjQtMHsPERIj9hXnQuJwxj4bJy0j0uyj7XSYwizI1CGW7GYfb5j7IDaaeykBxKZzl1dB58yRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4c4d8638e17so56640137.1;
        Tue, 15 Apr 2025 00:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701329; x=1745306129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IlcKZDuJKVbcFCZYNnNMTohPyxHUBdujdt06BC99uU=;
        b=mkXr22uo6pv5mDBwhaOnV5kYSaQN8iDX8t5U/inDEqeSq5znGdX2Q91HFB5lnXsMvD
         pjGfBDDgle5DEcGoTt0FZDdNHzVywXhWR9ngHYZXfcNXJqPfOn/OEZmjZnArPd6rfj1X
         d5axqitoINfl3zRlK1xrHV8KsU4ZWClAkynWQaj0wchkxToAz1q0IuG9gzNd83Qc/BsD
         L9brkcu5/V5fL2kwWDgyccQp8ZufkuI3hu6KzE4lfZC0LxTQo28POOdZFKNR28Fnm2kc
         NASNhJmOfUpWrJ+x41D3R1oqw+lf4T5ZFQ3LNVLPxYdWdf62a76INps3C8X/k9KxeLes
         tr0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnJCFIVYroAY9lS3mfDoxpmDTRKkgU/Z9NpAeCfoud4ZlBG6CKmhymZFjxPzilSg9nYCPHo9vPx9h8@vger.kernel.org, AJvYcCX2Y50wtFJitnB+c8foewi6Bpeqduj25ZOHCY1zqvYwu0TKUTE6AX0MRcDnKBFaLYDXYWaLyrF9oW0oikO70Ya0IXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRj/Sfd9yGBFCKRivRFrMnzU+wkqUFE3ld225lZrtFXopv69wa
	dP2eV5YxI0QIK50u2tkGaGmJrsfHAlYKzQEwx11tpoXr0IZ/2yqYbVHo/zuE
X-Gm-Gg: ASbGnctXJHTSCCeXd000M9kyuOJ4Q/BCpESJlFVT+k4+Y8SVPcylDWWPmMhmqpGcqxw
	hI/mjTnUBGjdGXS/B08kZJr/xvsj223XoqXZWejUb9sqXsQl3DH0G0kilEogqJXWYzyF88CXs0k
	J9/GEqmZNPzVdlZABWyB9d85EuNG0WZEOoqvRWMcSy77Q6ibpJ8bkJMe3YE9eTp7tWVQjFwOAze
	lQXfmzjWxyJ3TXIPFMedyDoS4FMZ9cKeoH/am7S0z3J5diUGb+7XRv8KH/kLsMQvuLe5+7r/vHH
	MT6l9Q4p8BuG5G0bTY2Jwb8rVrQbRp+aebd/KDWzfykcNmqAQi34cVjANUALi1S1NoL9tihd7vH
	xK+g=
X-Google-Smtp-Source: AGHT+IFzS+TNS0GYdBWWIjNWsqcgQ7MPxpy3p39SytTDE5Piuna3TU5yITVjtBcKz3PibS4y4b0Dig==
X-Received: by 2002:a05:6102:4b85:b0:4c1:749b:2c27 with SMTP id ada2fe7eead31-4c9e4f1a07amr10211089137.14.1744701329299;
        Tue, 15 Apr 2025 00:15:29 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c975e7b1sm2521692137.8.2025.04.15.00.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 00:15:28 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86b9d1f729eso2305959241.3;
        Tue, 15 Apr 2025 00:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwq0K2JYVW+saLE57lmGfJqKmbeuRqHE5pWmZoavxFqddk9/ojdQKIToNfHXi5NAJHeo76zVlpCs+K@vger.kernel.org, AJvYcCWnyJSnTmyMTxvi6fbN1KAstakJ3PYzwMP1tPPr1IDZ+agODRSAyGSGJjwNv1CAN4GxEvVn279cbLSrNB/N8GHo/vg=@vger.kernel.org
X-Received: by 2002:a05:6102:334a:b0:4bb:d394:46cd with SMTP id
 ada2fe7eead31-4c9e4fff079mr9517256137.18.1744701328203; Tue, 15 Apr 2025
 00:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
 <20250320164121.193857-4-biju.das.jz@bp.renesas.com> <CAMuHMdWSTbVwOzTtTV8DRayvgor52=KwErzhOv2iPJkMy4BXbQ@mail.gmail.com>
 <TY3PR01MB113460657E91226377615A51C86B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460657E91226377615A51C86B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 09:15:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUStvHU5+fPcM1DYPrCUS+_u8nXyDHsjpjQaeBkx-KNiA@mail.gmail.com>
X-Gm-Features: ATxdqUEpBpYcJ0pO7FETQUgXasGUUc-25pN-RPvmUaoIisYhhzYMuom1Gsmop2A
Message-ID: <CAMuHMdUStvHU5+fPcM1DYPrCUS+_u8nXyDHsjpjQaeBkx-KNiA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CAN Transceiver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 14 Apr 2025 at 18:04, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 20 Mar 2025 at 17:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Enable TCAN1046V-Q1 CAN Transceiver populated on RZ/G3E SMARC EVK by
> > > modelling it as two instances of tcan1042.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v1->v2:
> > >  * Replaced GPIO hog with CAN Transceiver.
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > > @@ -8,6 +8,8 @@
> > >  /dts-v1/;
> > >
> > >  /* Switch selection settings */
> > > +#define SW_GPIO8_CAN0_STB      0
> > > +#define SW_GPIO9_CAN1_STB      0
> > >  #define SW_LCD_EN              0
> > >  #define SW_PDM_EN              0
> > >  #define SW_SD0_DEV_SEL         0
> > > @@ -42,16 +44,36 @@ &canfd {
> > >  #if (!SW_PDM_EN)
> > >         channel1 {
> > >                 status = "okay";
> > > +#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> > > +               phys = <&can_transceiver1>; #endif
> > >         };
> > >  #endif
> >
> > Do you need these two levels of #ifdefs?  If CAN-FD doesn't work without the transceivers, wouldn't
> > you just need a single #ifdef with the logical AND of all conditions above around the channel1
> > subnode?
>
> By default, the switch is set to GPIO8_PMOD, so, CAN_STB pulled low and the transceiver driver
> is not used.
>
> If any system(for eg: low power design) want to make use of STB, then change the SW
> and macro and then make use of transceiver driver.

[...]

> > Related, doesn't this need !SW_PDM_EN, too?
>
> SW_PDM_EN is only used for MUX between CAN1 Rx/Tx and PDM. It is not related
> to CAN0 Rx/Tx.

Thanks,
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

