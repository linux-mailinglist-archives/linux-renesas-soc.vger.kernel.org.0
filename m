Return-Path: <linux-renesas-soc+bounces-20242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B81B20D53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 17:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8834C1887192
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027B12DE715;
	Mon, 11 Aug 2025 15:18:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CF2135AD;
	Mon, 11 Aug 2025 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925485; cv=none; b=TWGABNkIRBy+y3zcIukNaed/Ed+tY+gAW3U0nAqteP3rHb2NESnixJ8bZUivuh31SYvyp00kqtCs9iRqFs2emZkZnI8rV7Z/XaGt3h8aWXPWlOL9G4SsSwQl593LtK4wNdiEFzuUslAuZQPFizpwK95IFwQPR91T0UHFlFDDXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925485; c=relaxed/simple;
	bh=Hbl3FDqH6hGn48dhqV3p7gZfDs6KUR3kV7tPIbZIlFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHvlIQmwO0d6c5yqhL+ngikM9Wbbsy/H6wBe08BBi1nDzPwf7zVlwDACER1/1gqlrzMJ9htQzpGO2RBIjLOd5nzp9xkY7KPoFDDpxhv+HfqJw4uVpZx5vLEJ8eKirw8h8o6PwwXFt3DSqLiR7oA8IpEZdqymjWQZdbdmzSFAhqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5393a970209so2928605e0c.0;
        Mon, 11 Aug 2025 08:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925482; x=1755530282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRERaapospbD2j/AINuPZJ+DOhG36AvV/ZTDomBbWC8=;
        b=ClT5xqgcjWwtJ+GQRsIGFDCnZTM9JOgvkllzjN3Ews4wYzPHj6MBJRjLR4jf/qM2Q8
         8jcC3Tsp/Pigy45UXnmkl4mM4Q78PocueSBgEabkbjNyc9vqPrEtoCcB4xLhNLSmLIEp
         xd186o2OYNd2VxaQydoVQns9wFFK8KWKz5pYGCot8Opd6ttnDtlvc4qX47pRaTQLz8VW
         SBcS8W4PjrebofIDWXhYHKSMYFqOnjtPePOBnxqi5DYCpT9WJAsZDKQu0Ep5R+gW+Ywz
         XM/EKHv+sFtL78M8vW/b7o8/iQt/wO7cmn6O/wIAoeyQ5UYVN8usd1z++p+R6g0FBlx6
         kXNw==
X-Forwarded-Encrypted: i=1; AJvYcCVBmOnRUus/6znxMt6c2XBsmuPMAmHkDG3L9e4foSzIwQIEZqTBhthKFAZKz/KNPPsvsFtK9jkkkNQnNrnfR/mA5/Q=@vger.kernel.org, AJvYcCWWjvsT554UYKAfmdFjTccdtThP8ek4QcYID4JJhT/jcjxt9BCWZly1LGOI+VT1TxnRPShN9m5uZFp/@vger.kernel.org, AJvYcCWf/bjryCniyNbADON6OTaDpJ/gvyJA7Bx/f7tRjDODubEJjzZ2riDMPkTrB7cHH5h+mG6zxiw14Y1bY9Y6@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaSyY3CCaZq+GhoYEM5QVW3wA9/8kwWsITXRkyBEoFKQxYc2Y
	3J7NpMC5hOnyzAnU9yozjMe88ml74YGyQpwINTZ8W4f2/wyhJs0T9iPtM1S+kkKz
X-Gm-Gg: ASbGncvDZORXByzD1ggmovS0bfQ8E+mxJOUyArNWCd5Vj9ue+RohooktMD6rKBflQo0
	d9evp4y77yS1dz6shpp7/JXtDKeNB6y9bnAlG0weyRyxaU3vt0vvLfNkuj/pz3RBksm9lK4sPZo
	sd12gChvyqhBIbUoJTV4e3n1r9h3a5DUn7DDxhu8ygrvik1Fr6O5+qxrtMeQ+0pqS4IFsG11VhP
	IoYLZgkI+BRC9qQmeHaBRiL3McnjRlpWezGhEHF5AQzMjXyTHKXm6ik5u9Eu6Lu1iVNh4I3siRA
	8pAHRs2HN/RnJCpWkc81vz4lz8WgkM1FrtrSb6oIBVNm0bXsgkk3LVE7Li6WhyQwtTFQtLmAOk5
	YxqCT0AWGfZ6I66Xuhkj4IQr1TFe1SZpQIGqqq0dfi/w4RivX+lNM3PYoUGNpoQi5Wxq1k8o=
X-Google-Smtp-Source: AGHT+IFlj+IVhzl3HZq8NMJPa0i3x1JGPsbz18uQ7NXy1mgTBE+nr+ycOOGrvC1ShqKHaqbVO5N1/A==
X-Received: by 2002:a05:6122:308b:b0:530:2c65:5bb9 with SMTP id 71dfb90a1353d-53a52ee8667mr5061177e0c.8.1754925482478;
        Mon, 11 Aug 2025 08:18:02 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53adef42d5fsm1215957e0c.0.2025.08.11.08.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 08:18:01 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-88dc40608c1so2962086241.2;
        Mon, 11 Aug 2025 08:18:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV732ze/F0RNuo/lXyVP00Njnz60kaBeVCfOwAazbq2IIHoGvuolVpA8g8e8yJRmweorOX3rDz1outT@vger.kernel.org, AJvYcCW8qTrlFIK4ikeDTRxG98FnxehJp7/iPNeHirRBErWkKx58Mu2Fvgqw6pqtX19z9AxbaLAmFDXIhLJoc7VG@vger.kernel.org, AJvYcCWKLctchTEALjT8Z/VP4Z8pOa8zjxDwIITEl76ZXK6DvfsURH5rxP+957ro5KhP8Z+P45zet8YuNmII4sNpzCTphic=@vger.kernel.org
X-Received: by 2002:a05:6102:c0c:b0:4e9:963f:2d09 with SMTP id
 ada2fe7eead31-50cbd7be826mr117273137.10.1754925481152; Mon, 11 Aug 2025
 08:18:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250808215209.3692744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUWo=hYPWPrweoYn5rFC50aV5EV1xqwFHmLp27GRjEADw@mail.gmail.com> <CA+V-a8vW2-YG8=-u3kUcrou+nPVLn2uhE-W+JOHpu9Cahyw2ZQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vW2-YG8=-u3kUcrou+nPVLn2uhE-W+JOHpu9Cahyw2ZQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 17:17:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXZPhsKSbC1px9c733O-W74EHNOb9+Ag8hgsM2bPg7SQ@mail.gmail.com>
X-Gm-Features: Ac12FXxp-lj0MFbvrPvqguz3Y5JPy4aG-7bqG3-CAFKU8C26rnV-BJ2WrZHG93A
Message-ID: <CAMuHMdVXZPhsKSbC1px9c733O-W74EHNOb9+Ag8hgsM2bPg7SQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and
 RZ/N2H support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 11 Aug 2025 at 17:08, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Aug 11, 2025 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, 8 Aug 2025 at 23:52, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document the USB2 PHY controller for the Renesas RZ/T2H (r9a09g077) a=
nd
> > > RZ/N2H (r9a09g087) SoCs. These SoCs share the same PHY block, which i=
s
> > > similar to the one on RZ/G2L but differs in clocks, resets, and regis=
ter
> > > bits. To account for these differences, a new compatible string
> > > `renesas,usb2-phy-r9a09g077` is introduced.
> > >
> > > The RZ/N2H SoC uses the same PHY as RZ/T2H, so it reuses the RZ/T2H
> > > compatible string as a fallback.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> >
> > > @@ -120,6 +126,17 @@ allOf:
> > >        required:
> > >          - resets
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,usb2-phy-r9a09g077
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          minItems: 2
> > > +        resets: false
> >
> > By the time this hits upstream, you will probably have reset support
> > for RZ/T2H and RZ/N2H, so you just add renesas,usb2-phy-r9a09g077
> > to the conditional section above?
> >
> But the above will still be true as MRCTLA/E/I/M register doesn't have
> any bits to reset USB{PHY} or am I missing something?

You are correct. I overlooked that some modules lack reset bits.

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

