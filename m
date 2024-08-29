Return-Path: <linux-renesas-soc+bounces-8479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B590963F94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 11:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF3141C2113B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 09:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4144F18C92E;
	Thu, 29 Aug 2024 09:10:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4FA4A00;
	Thu, 29 Aug 2024 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922659; cv=none; b=UZjuskX8zUiVAmu/odZBprIFXbFzwmekiuczBtt0d9rrdWHzIRmMXGtEJCCphubcuNo05W/YM9dH1UOqEM/lf6LO6A4eUmzQXk71IbBxWecPpI89ftRFsEBCeGKI/b+ZRLL5SK6CPNQroDXYKZsFYK4+Z0Dg588nhFXYvFZqFys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922659; c=relaxed/simple;
	bh=SgfU44U9EdjpfFiGRWuufcYOuNf5t2tOIqBYzAFwekc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EG9xpxz2bZ0G3C1bextROAgjX808G22Rl9kEZMBdhERswYYuGMooncoFlXb1pryuUDMrGQrdQyiZOr6pN92AEeyK+dexWSUMgcBGziOD0VaqNM7OTWjwMEI/+FUBX/9YLjWg8AFQ7NnDuG3glMfQ7vsY8t8VS+g9wjH+W+/ICqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1659e9a982so447680276.1;
        Thu, 29 Aug 2024 02:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922655; x=1725527455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qX5auZ4K4swlInFd6gZiiYpgikH1E+d2tNb0upH7gvY=;
        b=jAcBoWcX0lHnf79ZVIfyZq1X1blui8cqplOfU+ORGqcRX3X5hJwk472fEq7M/DkpYJ
         ZyJVXZHdk5w1a8Y2E778galv2d06RVLXqqdzkPsNAKjGcrfkathW1OfD9vqPNOuJCAgR
         VvFd/EPCUCMo99OGBksJnpNmtvbOkz4p5v9rQ330MN7j3xD9iM1RKNcEnXRiqSe3EDwp
         NjvqYPjG/TdBNIXe5U+4nqgvMEFZ5A7+LymwgsHHfpmPPEoFQCbVSto3ajqZW7YbgkXZ
         PzjCDOaytwLg4qL7Fo+26zYZ87lVSb3wyc859G14u7PWlYukJJtE9UphXJTJw8slCyFf
         YLaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX04QiE9ACslIrlZx7YNV7jYOkjz2sFHvfjH83Xm2R9TMNsj3cvktRDRLSKM5amkERTPZzI+2S22rub@vger.kernel.org, AJvYcCX9UG9Ok3OLl45b6aCjjd31z8hngaoHmDoL/dxyzdMecqO2TBBD/QI+KEWSCqpN0RKXOVSBtpo/unCwDyGP8eXsyuI=@vger.kernel.org, AJvYcCXnIYwT6hQs9ZuJEJ3mx/qn5I5yxCJqM4u5PG4JTF+Ea5HXN/AazJvvrUfyKW5QCiPTYyOVkOEYeqehFCuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxD1GIeRlCFDsknKpA2gFpDPbWwSfnDeGDHNk8IRjnv6zpDjiLS
	gOtggmruVJTSjebrrSgHpfjRDYO/857AadYo+sz36sWLqLkZ7n0KJSSCXzex
X-Google-Smtp-Source: AGHT+IG5jdBbjCl24JGIsYxkzKW/wakMFL/2GxRz8Oq7dylml4vCsYNu/rQwyt0e71hZnK7ip2ckwA==
X-Received: by 2002:a05:690c:3187:b0:6b1:2825:a3e2 with SMTP id 00721157ae682-6d27813ffc7mr18188627b3.44.1724922655025;
        Thu, 29 Aug 2024 02:10:55 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d57de66dsm1597877b3.101.2024.08.29.02.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 02:10:54 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b4432b541aso4473367b3.1;
        Thu, 29 Aug 2024 02:10:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPllKMss5eeHcpdX4LVOtLd94HG//LhHIeFmQAuD/+OnLbUohaIOEFSgRhPcqsu4KTlM5agGOYFEW/VD0C@vger.kernel.org, AJvYcCXTZk/RhJPXJyTxWQjgdM+YZI/mR+TdcMRWsKdez1KCbDLq5KpZCscl09ldRl/BVrC26rN8kc6Vwn2A@vger.kernel.org, AJvYcCXbhT80iWiONF2v5Fuyl226uWJM3u8LoEaePHc4hLukX69fst7ZWsBo6obt/bTHFxLCyIvsrONnk824pOCqtxICUdQ=@vger.kernel.org
X-Received: by 2002:a05:690c:6d93:b0:65f:dfd9:b672 with SMTP id
 00721157ae682-6d27640496dmr22475847b3.11.1724922654357; Thu, 29 Aug 2024
 02:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1721999833.git.geert+renesas@glider.be> <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
 <20240730162435.GA1480758-robh@kernel.org> <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
 <67hcoj3haiptjh4f7qvaz4xwcdamr3x33xxrxusuwq2t3veiln@z2ggc7razty4>
 <CAMuHMdXSxMzzM6WgwObbymdWHcqUU2r6BOyS7ZzqSBx_gsWftw@mail.gmail.com> <c91167d8-df24-4a3c-bb92-811bd1543be3@kernel.org>
In-Reply-To: <c91167d8-df24-4a3c-bb92-811bd1543be3@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 11:10:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOi-jNLdfnG1iWORa8=EnZjM+DpREsWPyc9RMQwW80SA@mail.gmail.com>
Message-ID: <CAMuHMdUOi-jNLdfnG1iWORa8=EnZjM+DpREsWPyc9RMQwW80SA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp}
 to nvmem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Aug 29, 2024 at 10:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 28/08/2024 22:10, Geert Uytterhoeven wrote:
> > On Mon, Aug 19, 2024 at 1:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >> On Wed, Jul 31, 2024 at 09:37:36AM +0200, Geert Uytterhoeven wrote:
> >>> On Tue, Jul 30, 2024 at 6:24=E2=80=AFPM Rob Herring <robh@kernel.org>=
 wrote:
> >>>> On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wrote:
> >>>>> The R-Car E-FUSE blocks can be modelled better using the nvmem
> >>>>> framework.
> >>>>>
> >>>>> Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to sh=
ow
> >>>>> the definition of nvmem cells.  While at it, drop unneeded labels f=
rom
> >>>>> the examples, and fix indentation.
> >>>>>
> >>>>> Add an entry to the MAINTAINERS file.
> >>>>>
> >>>>> Reported-by: Arnd Bergmann <arnd@arndb.de>
> >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>> ---
> >>>>> v3:
> >>>>>   - New.
> >>>>>
> >>>>> I would expect that the calib@144 node needs:
> >>>>>
> >>>>>     #nvmem-cell-cells =3D <0>;
>
> So this is for mac-base...

No, mac-base is not involved.

> >>>>> but after adding that, "make dt_binding_check" starts complaining:

[...]

> >> And if you test your schema or DTS with all nvmem (so also layouts)
> >> schemas?
> >>
> >> Apparently fixed-layout schema was not applied.
> >
> > With today's dt-schema:

[...]

> > Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
> > nvmem-layout: calib@144: Unevaluated properties are not allowed
> > ('#nvmem-cell-cells' was unexpected)
> >         from schema $id:
> > http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
> >
> > According to the last line, fixed-layout.yaml is applied.
> > Am I missing something?
>
> I cannot reproduce it. Neither on 2024.6.dev5+g0e44e14b7eb4 nor on
> todays 2024.6.dev16+gc51125d571ca (which is actually from 15th of Aug).
>
> But maybe we talk about modified patch, but then which exactly?

Yes, you have to add "#nvmem-cell-cells =3D <0>;" to the calib@144 node
after applying my series (or at least the bindings patch).

I can reproduce it on Linux v6.11-rc5 and dt-schema
v2024.05-16-gc51125d571cac959 by modifying the fixed-layout example:

--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
@@ -58,5 +58,6 @@ examples:

         calibration@4000 {
             reg =3D <0x4000 0x100>;
+            #nvmem-cell-cells =3D <0>;
         };
     };

Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.example.dtb:
nvmem-layout: calibration@4000: Unevaluated properties are not allowed
('#nvmem-cell-cells' was unexpected)
        from schema $id:
http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#

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

