Return-Path: <linux-renesas-soc+bounces-8475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2E1963D26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 09:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE9F01C211CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 07:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71BB184549;
	Thu, 29 Aug 2024 07:35:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483271547E3;
	Thu, 29 Aug 2024 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916950; cv=none; b=GSJn6NcVOmIU8QTzz8hdSbMirTAS7ohBTBOfmAR4AANttf5OACpDOVGgOGf1YruzUFHQh8LtKZgalGZjIP4qPDARQlf+cYceDTk9jYFc2liiqEv/G7EuX/yfZ6EXjl5Moy/i07yymGtEbLlr1fBJzLNBeyN8LukcAAygOPILH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916950; c=relaxed/simple;
	bh=p1Vkr19hJTLTUTOcWLPszfgqyG1Shl0iGFNL6olCzvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL0ZxWJbrbqxGlKlQovw0v8awrQvDMFpQ3ovISxLPsi7TedEcA2aIPWvDO7tBAP0SNONbPOBpNT/Tf3Q3km71eCKpxptwlERSoqOHx2KH0wMZTKQg9iPeeLlg00VTPJUA9OWOOM8A+d7Qbj0asjbZEaGH9ffFExc/bIVDuaGjh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-68d30057ae9so3644187b3.1;
        Thu, 29 Aug 2024 00:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724916946; x=1725521746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x83lbO5k5wF7aHs57NGdCI/bHwczCBu9jTua8FtGuno=;
        b=SYYMrR0L5gp6HhsXz/2h/Q4vgsw/9uGlfPuNNj2RncfOzywTu3ub9JOQug4+D12VKD
         RAluPU4IVnQGbgidj71ebkyLAm5qrH/VFxDx4z+OI3HJL2n9TVJxCFX4UAM6CijSexLt
         FzMJaBaJQCoH/vVX/cRy8DzDEK8rFASUKNUZwrtrnLEhl6cAGt9Pt1BPkrs749n9I6j9
         63B8bxr+KjynoTdG5d98rNlCF2jB0pLhFveRXIN0sowt0SILpix90gv174D5ID4EGVAt
         7agMxnzww1y3UMGGx15P1JR6la3bdllJhc7frDLHl/ZHGRw7LmaB5W5cIe3WOWrHhd61
         i/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVaawwnwVW0vVy1HSvoYzAlib005sJGzgDhtYfTnNmENGrm9Ry0LMyxkD+RXeNsmzTC/6lKmBvwVFKI@vger.kernel.org, AJvYcCW8ZsXWJ57Z9QMl24RnZPvhbn0YmQS8pEgXdkj97+Y+qD17yC/n6pceo/lCwYTGJMMJbHeUJvTGxAdO38uOD6U2/e8=@vger.kernel.org, AJvYcCXz7XKUF1KWyt7BEgNkHtg8JBjqy1bjAxNIwCfgT6+c3S+dXr0o3b+p9IgwogOaE+MnjYwG/R40KyW3UPMO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb7wXXBcLRys11NHW2TvjxDGkXxW3SI0KLFeI59ml277I/d7JC
	IP3QReM1VataC6lYHc85+R4HZLBNnP6bHOeEH46rmDOiPs/ttwEtA5AKv4xf
X-Google-Smtp-Source: AGHT+IH51bdYEaF5ndhYSc6OscP4HZXA92NHn6kzW6asWqH8eXYS8Xe4udQGsUM8sl7bi87ouFS4pA==
X-Received: by 2002:a05:690c:8:b0:664:a85d:47c6 with SMTP id 00721157ae682-6d277879970mr22345207b3.33.1724916946494;
        Thu, 29 Aug 2024 00:35:46 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d4485725sm1399267b3.74.2024.08.29.00.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 00:35:46 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-690aabe2600so3178647b3.0;
        Thu, 29 Aug 2024 00:35:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk3LOurcilPtvNoLkESfMH8zHGtMEvntjqshKk9V3KBlxXN0Nefkf512J82R7mQJWvkNOHPmoU0AI5GmQv@vger.kernel.org, AJvYcCV3cNblrInOCXn/A5a8vSU/KrASOJUc6FZxenKaK+Fzk+7imkBxe7r5BxJ0qO457WJf/L+regyx7K/v@vger.kernel.org, AJvYcCVw0S9nmwxYlceAKdmecqip2nisEXXiZrmDFVsrZ7AiAZ16lvCTWll4HUJKywWktjrXeWRwy0xEJNVaHtaQcv/aeP8=@vger.kernel.org
X-Received: by 2002:a05:690c:fd6:b0:65f:a0e5:8324 with SMTP id
 00721157ae682-6d27595e993mr25362827b3.4.1724916945699; Thu, 29 Aug 2024
 00:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240828124134.188864-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <28106585-59d1-42c4-af56-89820b15bdfb@kernel.org> <CA+V-a8tGBQTNLEBBKTi0Gy47CsdFpQKQkwP02omSWTt8DveqGA@mail.gmail.com>
 <606dc93b-9433-46bf-8c38-1d07b3677abb@kernel.org>
In-Reply-To: <606dc93b-9433-46bf-8c38-1d07b3677abb@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 09:35:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGZKCQ7FKsN7mR6ER7sc=P8qv=+eukFyHZt1VGYN7-GA@mail.gmail.com>
Message-ID: <CAMuHMdVGZKCQ7FKsN7mR6ER7sc=P8qv=+eukFyHZt1VGYN7-GA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: renesas: Document RZ/V2H EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good mornin' Krzysztof,

On Thu, Aug 29, 2024 at 8:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 28/08/2024 22:09, Lad, Prabhakar wrote:
> > On Wed, Aug 28, 2024 at 3:34=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >> On 28/08/2024 14:41, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> Add "renesas,rzv2h-evk" which targets the Renesas RZ/V2H ("R9A09G057"=
)
> >>> EVK board.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >>> ---
> >>> Hi Rob, I have restored your Ack with the below change, I hope that's=
 OK.
> >>>
> >>> Cheers, Prabhakar
> >>>
> >>> v1->v4
> >>> - Updated 'renesas,gp-evk # GP-EVK' -> 'renesas,rzv2h-evk # RZ/V2H EV=
K'
> >>> - Updated commit message
> >>>
> >>> v1: https://patchwork.kernel.org/project/linux-renesas-soc/patch/2024=
0724094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >>> ---
> >>>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.ya=
ml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >>> index d582992aaf0e..b7acb65bdecd 100644
> >>> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >>> @@ -527,6 +527,8 @@ properties:
> >>>
> >>>        - description: RZ/V2H(P) (R9A09G057)
> >>>          items:
> >>> +          - enum:
> >>> +              - renesas,rzv2h-evk # RZ/V2H EVK
> >>>            - enum:
> >>
> >> This is unusual pattern for me, but maybe I miss here something. Commi=
t
> >> message does not explain why EXISTING boards needs to be changed. What
> >> does it mean "rzv2h-evk targets evk board"? How does this work?
> >>
> > This commit is not changing the existing boards. The entries below the
> > addition are the RZ/V2H(P) SoC variants. Here we are just adding the
> > board entry which is based on RZ/V2H SoC [0].
>
> Then it is even more surprising to see there entries which were not
> boards. What's in this file in such case?

Before this patch, the entry that is being modified just contained
SoC variants and a fallback SoC type.
This patch documents the compatible value for the first board based
on an SoC of this type.

> Which DTS file it matches?

The one that is introduced in patch 3/9  in this series.

> > In the board DTS file it will be used as "compatible =3D
> > "renesas,rzv2h-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";",
> > see [1].
> >
> >                ^^                              ^^
> >                  ^^
> >
> >               Board variant             SoC  variant
> >     Generic RZ/V2H SoC
> >
> >> You have EVK board and now it is not valid anymore?
> >>
> > No this is not the case.

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

