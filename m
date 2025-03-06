Return-Path: <linux-renesas-soc+bounces-14071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF7A54B51
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 13:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F6F517238C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 12:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A023201005;
	Thu,  6 Mar 2025 12:58:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91941FF5FF;
	Thu,  6 Mar 2025 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741265898; cv=none; b=XKqT3SwdYSfzUhkWANKbO3bMcz1eeWJD3poVFfXDztENoriueg8ihFUrwHp2kni4OwUkThYTbLTMAnnob9vD2C7Nj89+muYK/T+4cYdZ29UWe9eJTcmDxPVPnyI1uTA6gxllSe5yYoZtk2n88oAx93Gxv1ri12Ij0Sc8v8hquGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741265898; c=relaxed/simple;
	bh=OFPC/mzyz+PA0RKUmyd5MI5x4Sixi7fOuy1co2IZv2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6HHUDWcHZyB95vxCBsoygN1/f8DoEXHDzCfgaJjNHXYY44nlFzeHBBeDieX3GN9K0/W6+OvgYUSzBbBIBW2+Xgow7xzFlx3SSuXjZ/MH/TFngsd/WrQJoUdwJvrOGlGs+hUf1edan3VO2Hvo8VEjaXEhAS1qZpPdi3ZJnKuafQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d30787263so266999241.1;
        Thu, 06 Mar 2025 04:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741265894; x=1741870694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmaYZGKanlTr9BxV5dFqQGNrZsBtXUl277Gn57mLyJs=;
        b=HL2WgUKuMAq/NfaSs87AIe1cA1pnk5VcH7CF56eZFhQxakIXNChZ20wr7hjRfV6qUw
         be54KIA+/8gKItTPUFBHchkTKzNIguybmpicpEjv2/Gl9chcAvKR87KZ1p6UAYbFApfX
         S1BsClc+VZkktsTcA0H9gMXW3+ve14ojt5mhAV2jNyHDBsy8k+C95aSZByPCs1loESzA
         i1FmtXTSZuDCzr4k4U1FUOELMX5OHJFGPNga1KLdlaz82DscLLk7+ZC/19vDbKe6sF2Q
         QvBDCUu/1T+lthEpg3Hjv16ls8bAfT1Qh6yrFAjDGOC7EA2H8N94itxJzq16oHdi8GtB
         gIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGMynhdWn4WgQHrmU5p6NWkNeOHGD9N+jBa/hMjbxBI8yR6HIjD4IVnHhW5swMcDoLkaeLLzdyjqnC@vger.kernel.org, AJvYcCWX1C6/cqiMMi3u0+1GkL1mq1ogQujaO01yIcWvXhMlzRfkC3RuIRBWb9SC7sYUxwHv8QLVeUk/d7WXrmEA4wLIA3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV+Q00Fpg1Jqh5h4NaJ0BFz6TJ4COXWInceccUp5oBvOgNosUf
	1yzdY55nNgsnFdy3jg6tVlF/oJum4kmf0joX3g8od9gUXlRnviCHYeyyerO8
X-Gm-Gg: ASbGncsD2yvPpRR/HytoiTMPQK0q1RYAcZmuK26bWXigjJ6teuCh684pM0ICanEBj0h
	LElnUfdhZSL9H4xdRYylSU41wuXPzSMIsu55jVj8rVeid/ySsm/BH/yUfoq3nQpBf4qgC/kWc+W
	6DnqtQ9WxNvcyr6kIkZWtPFE94AINf7FDWykOs5TAtybJ69RtPLo+hfIoiHtHsMgFNT5afFpbbO
	NRuy+A9g5Zdq2oHO45xfybiZ6Nl/yuIFaMlt5qWllD++d1lDXKIaVJDLxsbd4iQ/g8uWT2CJQnk
	hn5PQcDEj7sjS1X9gmc0TliUzwu5DTPZ8MHUVDFz6ZWAU4WSYug/FyaxbX1chmMjB3HoASfY81p
	Zrh6HvMnjFrI=
X-Google-Smtp-Source: AGHT+IH7ZEHHwCf9begaCd67Hp1n6vylp5+ftHGNm9gO7vqVDNLEdzCNDR+70FAkJPGM8JCE0LGx5Q==
X-Received: by 2002:a67:e718:0:b0:4c1:b3a5:9f4 with SMTP id ada2fe7eead31-4c2e276e300mr5060193137.10.1741265894587;
        Thu, 06 Mar 2025 04:58:14 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d33ccb936sm208252241.31.2025.03.06.04.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 04:58:14 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523dd512bb8so119166e0c.0;
        Thu, 06 Mar 2025 04:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBx5Mjw6jOwCYF9sv/KNovAnGDNGEvtf/pE3KpzFiJXx1he9JZjGXtX7lrcGSIV+811y4Xoofz9Yts@vger.kernel.org, AJvYcCXBrCndVUtgVSmPLWfiaRfv74U5LHxfoTZoSUQrdKB8HuPiVgFrotfEXwCt1i3VKjUmMXJnY9P1Ak3CrxTeOipZmeU=@vger.kernel.org
X-Received: by 2002:a05:6102:604d:b0:4c3:52f:175c with SMTP id
 ada2fe7eead31-4c3052f188amr198850137.0.1741265894180; Thu, 06 Mar 2025
 04:58:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
 <20250228160810.171413-2-biju.das.jz@bp.renesas.com> <CAMuHMdXOd0QgnWiptLJ2u8MwgYqw3=UufozdB2Lubt0yGc2BXg@mail.gmail.com>
 <TY3PR01MB11346736FD737998ADB7378E286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUMuCCe-tpkkrPS10o7+kNUUYZ1n89_LLVkJVF5pka3EQ@mail.gmail.com> <TY3PR01MB113462D3DF3056B740D45DAF186CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113462D3DF3056B740D45DAF186CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 13:58:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsbUGgz1-g4NgdZADQZC2f=5sc54u9XKZ3Dz-fpiNJEw@mail.gmail.com>
X-Gm-Features: AQ5f1Jo7RBVKbNvpzaYH_aAuHkO85PuF58HFKswZ7UV5eq-imeQUDJYPLeMdoQk
Message-ID: <CAMuHMdVsbUGgz1-g4NgdZADQZC2f=5sc54u9XKZ3Dz-fpiNJEw@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 6 Mar 2025 at 12:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 6 Mar 2025 at 11:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: 06 March 2025 10:44
> > > > Subject: Re: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E
> > > > support
> > > >
> > > > On Fri, 28 Feb 2025 at 17:08, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > Document support for the Expanded Serial Peripheral Interface
> > > > > (xSPI) Controller in the Renesas RZ/G3E (R9A09G047) SoC.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas
> > > > > +++ ,rz-
> > > > > +++ xspi.yaml
> > > >
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - const: renesas,r9a09g047-xspi  # RZ/G3E
> > > > > +      - const: renesas,rz-xspi         # a generic RZ xSPI device
> > > >
> > > > Is this the same variant of RPC-IF as used on older "RZ" SoCs like
> > > > RZ/A1 and RZ/A2?
> > > > If the answer is yes, then I do not object against introducing rz-xspi.
> > >
> > > No, by looking at the registers,
> > > I think one on RZ/A1 and RZ/A2 is same as RZ/G2L. So
> > > renesas,rzg2l-rpc-if will fit there.
> >
> > In that case I think "renesas,rz-xspi" is a too generic name.
>
> if rz-xspi is too generic, what about using rzg3e-xspi?
>
> Note:
> RZ/G3S and RZ/V2H have similar IP's

Just drop the generic fallback?
RZ/G3S and RZ/V2H can use "renesas,r9a09g047-xspi" as a fallback.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

