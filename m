Return-Path: <linux-renesas-soc+bounces-10748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B520C9DB436
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 09:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 762EF280DB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 08:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBF814EC5B;
	Thu, 28 Nov 2024 08:50:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD9814BF92;
	Thu, 28 Nov 2024 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783812; cv=none; b=QlRU76wwV270D+PC/UGD9jXKwfZyCNl6SK/lOtEq2dMxoqw/usmDOFUkQOTqId2MSC82Y9TzHlKJLxl7uFgl2au5t0QqXSI2oIhAOTpZ5SiN7XHYwaLgyop2HS4EBu1TW7q7P0tg8o86730L6G4fJp39vPE7kJE2zxWvnmkwkTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783812; c=relaxed/simple;
	bh=JVISvdmh8OFLuNyVXWQFLP6jU87WdwArk6CTgskkZME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bv4SyUDRedtUwi0uWYMCf/0Xp/3ZRtYIAxdsH8hyPvf5vt0wf7zCbbECbc3mndN2NLrdIO1pUYEnkKJDyA+0/S5E14SsnoaQjrKvLLpb7mCmxyn68SqKMICoNHmoLdHqilSTM1Nh7TskvXjffzGJxX8ohAcfIAoxtdzJiSE8EoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa5500f7a75so77639666b.0;
        Thu, 28 Nov 2024 00:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783807; x=1733388607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBv6q4uFNmqZlrSJJbBpkAKDp7TQEhvVCutGwJPSYV8=;
        b=MVZt32KZjuDye/DJMZUsrblEqTrRjc8bgjmIWHOosd9dIaTua/WoUO4WDcnPqw+SB6
         zcbfAWwnuBVET/g2gnz62WGh10/f73ucH++UxecLJYe9MeAHNe/RkaJuaNplCqB2HvCe
         n1X6O9JVwj3UOmbNgjrgn866pyQSSqZscPgC4sUsN/QopxTEHQiat1pZXrgZoJhOf7l/
         /RbMh6icIGD+Q3iy62RUCxxpeXkpf7oQXkjKte2DayB5h3RehFyxNRe/SfL7NFZ9LD0T
         v68DwbZmC0t4eCIAymmIEzLkt5xAhd6H6P6m01lspc6Fhzpx01vWhPUeTRubLD75POZ2
         pJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4iG8kkqmKB+GJHfu5TuOHHlLqK2mnFA2DSWHbRDJ/YYBWbMMtiUhYz2/qqJV+NthYoKpm4sWtjKAo@vger.kernel.org, AJvYcCVAKunAA+Vkbhpd85PEPTGhEbYr5hcNBVW0PwF1Ll7tHNBEs5bXtqUUh76jcEdbN9bzOZRL0/hN+wFd5EDn986JBsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdyE2G60a6+HPIxSB/4vWGK5xZknsLfr/6SViuU/RaAYLoFu7/
	nsssYdUhGE8yLE1FF6YTACXQ3qpl4tyrX8G0ab5yvhyPgaMQilp4u3n+lewijHI=
X-Gm-Gg: ASbGncvHGKsvyY+aukFopzXVaFOB63aClvVUftPZVl2nt2fzzmg6QRBmCI8W6sCzWF5
	wXu08Qb8amjfGfA08L31YDHU/TYGXBabS0O6l3+3dfH/w9ekvO0vXLvz4UWF1ZC5AxplnJDQiWZ
	DOCcn/VcQU/w1sjcDYeBKzWBfRrOovQo2+GuZvH4TBKaONcF93AcN/qeutQbovLqf7ly71rloch
	HOKgjukYyZVxplTmvse3OACBkJ2BsYJCm88m5cQAzjNmWwoCUIrpnfJoky0ArHmgF3ldA0AO5SN
	UeT43zq5qzG1
X-Google-Smtp-Source: AGHT+IEYoPtPx2HoZVC9c2TcMqHLTRNfgAlTi31SZsKmeqBFNHuGgQBYJXI05CRHtRDD/ujCBcmM9w==
X-Received: by 2002:a17:907:cc01:b0:a9a:a891:b43e with SMTP id a640c23a62f3a-aa581081adfmr385369666b.50.1732783807221;
        Thu, 28 Nov 2024 00:50:07 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d4101sm42332666b.73.2024.11.28.00.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 00:50:06 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa549d9dffdso70947066b.2;
        Thu, 28 Nov 2024 00:50:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlEblBJeUegiP9lxkFF78v/+JXG58NBpHjrIoB9YHbypbTWkj/+F0wJdsWt182A/+22eDvhXc4VhY3HWz+0cbypx0=@vger.kernel.org, AJvYcCWVr8Fvc+Q/sKlmeL0izvW7K3ucX3cK1TdI4Lk+X9V+WjcU8eMrTXshcFBGljbA6XdLTG7vb83xFE3T@vger.kernel.org
X-Received: by 2002:a17:907:2890:b0:a9a:161:8da4 with SMTP id
 a640c23a62f3a-aa58108aa6amr486853366b.55.1732783806305; Thu, 28 Nov 2024
 00:50:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-4-biju.das.jz@bp.renesas.com> <20241125-straw-oozy-f95e18e4704f@spud>
 <TY3PR01MB11346BC7FA5C81C108B4E7A7786282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241127-epidural-violin-651fd0ee2526@spud> <TY3PR01MB11346A0C7A4DAD6A250A6B55386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241127-cargo-impish-9117a49fa425@spud> <TY3PR01MB1134609A5A6381F1F2711794286292@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134609A5A6381F1F2711794286292@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2024 09:49:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVk7xeG-LzpvnyaPp2iP-MB6bp5ce7BZOZv4_4T2nDZrg@mail.gmail.com>
Message-ID: <CAMuHMdVk7xeG-LzpvnyaPp2iP-MB6bp5ce7BZOZv4_4T2nDZrg@mail.gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMARC
 SoM and Carrier-II EVK
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Nov 28, 2024 at 7:52=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Conor Dooley <conor@kernel.org>
> > On Wed, Nov 27, 2024 at 05:18:56PM +0000, Biju Das wrote:
> > > > -----Original Message-----
> > > > From: Conor Dooley <conor@kernel.org>
> > > > Sent: 27 November 2024 16:33
> > > > Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document
> > > > RZ/G3E SMARC SoM and Carrier-II EVK
> > > >
> > > > On Wed, Nov 27, 2024 at 12:34:42PM +0000, Biju Das wrote:
> > > > > Hi Conor Dooley,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Conor Dooley <conor@kernel.org>
> > > > > > Sent: 25 November 2024 18:52
> > > > > > Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document
> > > > > > RZ/G3E SMARC SoM and Carrier-II EVK
> > > > > >
> > > > > > On Fri, Nov 22, 2024 at 12:45:39PM +0000, Biju Das wrote:
> > > > > > > Document the Renesas RZ/G3E SMARC Carrier-II EVK board which
> > > > > > > is based on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC
> > > > > > > Carrier-II EVK consists of an RZ/G3E SoM module and a SMARC C=
arrier-II carrier board.
> > > > > > > The SoM module sits on top of the carrier board.
> > > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/soc/renesas/renesas.yaml |
> > > > > > > 4
> > > > > > > ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git
> > > > > > > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > > > b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > > > index 7cc2bb97db13..1785142fc8da 100644
> > > > > > > ---
> > > > > > > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.y=
a
> > > > > > > +++ ml
> > > > > > > @@ -527,6 +527,10 @@ properties:
> > > > > > >
> > > > > > >        - description: RZ/G3E (R9A09G047)
> > > > > > >          items:
> > > > > > > +          - enum:
> > > > > > > +              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
> > > > > > > +          - enum:
> > > > > > > +              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module
> > > > > > > + (SoM)
> > > > > >
> > > > > > Why are these enums, when you have a single item in each?
> > > > >
> > > > > I just followed the style used in [1]
> > > > >
> > > > > [1]
> > > > > https://elixir.bootlin.com/linux/v6.12.1/source/Documentation/dev=
i
> > > > > cetr
> > > > > ee/bindings/soc/renesas/renesas.yaml#L531
> > > >
> > > > It ain't the same though, since you additionally have the SoM.
> > > >
> > > > > Other than that,
> > > > >
> > > > > In future some vendors can add their RZ/G3E SoM's here
> > > >
> > > > Only makes sense if their SoM is compatible with the smarc2-evk.
> > >
> > > All our SMARC Modules and SMARC Carrier boards are SMARC compliant.
> >
> > All of yours might be, but what you said was "some vendors".
>
> FYI, In the past, we have a requirement to validate smarc-evk before RZ/G=
2L SMARC
> SoM available.
>
> So, we just used a SMARC SoM based on RZ/G2N and tested smarc-evk etherne=
t interface(of course with small hw mods)

Cool!

> > > So, if anyone have a RZ/G3E SMARC SoM, that should work with SMARC2-E=
VK.
> > >
> > > > >
> > > > > They can use Renesas RZ/G3E SMARC module and use their custom car=
rier boards.
> > > >
> > > > But allowing this part does make sense.
> > >
> > > We already have a use case for this example.
> > >
> > > Renesas RZ/G3E SoM can work on both Renesas smarc-evk and smarc2-evk.
> > >
> > > But we only officially support RZ/G3E SoM with SMARC2-EVK as it has m=
ultiple display support.
> > >
> > > So, can I use const for both SoM and Carrier EVK as at the moment
> > > there is only one?
> >
> > That is what I would do.
>
> Geert, Please share your thoughts.

I prefer the enum, as it causes less churn when adding more entries
later.  Cfr. using a comma after the last entry in a C array, so new
entries can be appended later, without touching existing lines.

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

