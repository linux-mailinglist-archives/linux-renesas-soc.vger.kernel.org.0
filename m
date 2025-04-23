Return-Path: <linux-renesas-soc+bounces-16241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B634A9842B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 10:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 722EA7AC8F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 08:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C8F19FA93;
	Wed, 23 Apr 2025 08:52:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9362701B3;
	Wed, 23 Apr 2025 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398343; cv=none; b=fJVE0oG9HfO4wEEj/7U9RImIIGqyXH58s6fLKXXfnZ0pLO622NgZvJBRPlJtvju6RTpURQZ8wWJxVcvqPNpl/zTHwzjw1hLX3mRow+iPru8klGgshqFd3/rk8Z7SgMFrtJt7+e7SQsI8fLUiNTrv4EBPXprw9bnYLslzTbo30p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398343; c=relaxed/simple;
	bh=ZT+aTcDj6n7xgMSrVmH50CHyTSXx7NxekjQJ77DmiUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1TQnXIQAvFSSlbnR5VJ6J4HPQqCZiz+ep4D3P0f+ImFFZVbfa4+B70004bVD68A+jU+/oEnDREhr+qAOr558LjoONlnRnhAliI0pHNLz4ryu4R02UlwtxDyuiQM6OmFi8W1HixbDbQgM6RhbzBbZdXDg58tgwiKK84b3CIw2u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so2205242e0c.0;
        Wed, 23 Apr 2025 01:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398340; x=1746003140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNzLMhAwEW1BPiNK9bNE9/7Jt7OBYMaBTaiFgrT60mM=;
        b=QfzgZeFLqfpVRsAoj2mctYF9vI3QJOUA3ew5pEA5WCgezM71prXuBKiEDJ6a2zNCf9
         +wFDMD1ZMFaBghL1ilULmCmAnV/RUvpZtForMA7UCRcN8fYGqFDDVDthroD1VBjJQe9p
         DNZBxpMqnr12Dp9jzBoS9wUXnGl5aahGP2pJ9RTGc27zwOr4MYXEdnRSeg0miAt59SvN
         Bfoj8nXPF7K5quiWK9jwvdQseG8XDEdHQBRSR5wUOwTyF8nSqkk3yT/ZWG929e27S+0F
         SoTQP/p5DHAl3fadFF3+q0Z7GLUJ62CGdt25ptLmwmN0FjwFpQ8JAVFm9QRSeurWklm0
         pdJA==
X-Forwarded-Encrypted: i=1; AJvYcCUaApltNSXHi+2gSERVjbzKS8pFc0Rh/RTQ/7EzWMW/NBtxpxl5rJ54wseU8t7uggRTGSp1GKO0aEMsyxu4rKvo1QA=@vger.kernel.org, AJvYcCW83BD3YJHIf52odiu7XSj+OGFcMHXSmmzuc+ApPWGigbIRWwQB5dbnuHBhhYvS6IJ0kWR6ZRFn0wKF0Nn7@vger.kernel.org, AJvYcCWZTJ/XBkvFWznufKD/wmjQF9eWNtH8gUf0lPQqGB8th4SHN6skwpQm8TuUYE30xGhL/scJ+4m1vdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjii8uCY9ds/9aAJ5el6jIXTM7aFgmoMSsnn2Fmh3wGW5bLTsl
	2m6ilphADJaBUYS6cnk+2LpKhGrk8KUqj/Ft2o8UhXwtoW6fMJ1rxm82RsjIv/M=
X-Gm-Gg: ASbGncuF/KoQp3GzltVymTrkd8CtVQMJEKzGNAXbOYykaJx1G7R//4KKIZu2Ki5IYZW
	Ct5hhvbPHktjdC6nHwWIE2KS9BUy6QMOOrvrhRjyFskp47pxxX8M5iBXNq0ATw/hdUu6M/+Moeb
	PdwCUkc0rO2rhDrI3s5EEDokxIsQjFj5YSr3gCgVRwP9AhLmyHgcibvK5o3xxxQrVDHgoQWnwmb
	go6gPdPJQ5w6j5UF7YbZipb9M0cRDFLL9Bh+v68swzu0XyCa57z6XGoRJwDHq3Y+k0J0AZqCDol
	/AUT6uaQlhz4z3KMj4P0AxDzbVdYTskDrb0WIgKsGOYtOflb4g00HCI0SQGbti4L8nP+T5vS8A8
	QgHU=
X-Google-Smtp-Source: AGHT+IH6PPSFCelTrABPZ42fVLMnN2h+MLsrcczEgUEY+njHcY0u0A97j62o3tScqdAtCRcxDLgXkQ==
X-Received: by 2002:a05:6122:d8d:b0:526:42c2:8453 with SMTP id 71dfb90a1353d-5292547e851mr14802070e0c.7.1745398339858;
        Wed, 23 Apr 2025 01:52:19 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52922c10c1bsm2264081e0c.12.2025.04.23.01.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 01:52:19 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso2278496241.3;
        Wed, 23 Apr 2025 01:52:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAEdzfE5SpKLo2zkyTIE64xvGtGCpIF2aZC/qF9TGonOf7LtLL8913AasGFKhjuEqpgwBThs9kwg4048t6w6OB8b4=@vger.kernel.org, AJvYcCUduIrfmFflL5NpEicLWoxhS+5LvZ9ab8UnMUSKZBL4Xgo8J1LSmEDYTWQ2zvKrAt5UHzxjGDz77oO0ZI/K@vger.kernel.org, AJvYcCX2th1CJWm1XrxpgVNGUucpgqRW15W+9wPdtcu14IUxedRFwFW6xWxARu7z0pr5sBkJ4nPlZqoXkbM=@vger.kernel.org
X-Received: by 2002:a05:6102:311a:b0:4c4:e42c:38ba with SMTP id
 ada2fe7eead31-4cb80145a4bmr9745862137.13.1745398339507; Wed, 23 Apr 2025
 01:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-7-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVpiZ+F0TMbLm000M_Scwozj2-SHPrUwTHqFKckVcmufQ@mail.gmail.com>
 <TYCPR01MB11492BCF416760E978541AFE18ABF2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <CAMuHMdVQPbP0Fi5SDN8uOJ23S=_8pqHRVR2QFS8vHNfohzae2g@mail.gmail.com> <TYCPR01MB11492F29C81C6A33A9ED90F888ABA2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11492F29C81C6A33A9ED90F888ABA2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 10:52:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUV-kHD7BZ7zU71f8GD4sKqSnSTfoDhTU+s8wyVfXgq=A@mail.gmail.com>
X-Gm-Features: ATxdqUG3FZzI8HCkNGm5T6G_ujgFMbIetZczmb5fQaQtW6-2uSwvcnMI6dgpIjs
Message-ID: <CAMuHMdUV-kHD7BZ7zU71f8GD4sKqSnSTfoDhTU+s8wyVfXgq=A@mail.gmail.com>
Subject: Re: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Wed, 23 Apr 2025 at 09:36, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, 18 Apr 2025 at 23:22, Thierry Bultel
> > <thierry.bultel.yh@bp.renesas.com> wrote:
> >  > +};
> > > > > +
> > > > > +static const struct mssr_mod_clk r9a09g077_mod_clks[] __initcons=
t =3D
> > {
> > > > > +       DEF_MOD("sci0", 108, R9A09G077_PCLKM),
> > > >
> > > > Shouldn't that be 8 instead of 108?
> > > > Using R9A09G077_PCLKM as the parent is a temporary simplification,
> > right?
> > >
> > > I am probably missing something, isn=E2=80=99t PCKML actually the par=
ent clock ?
> >
> > According to Figure 7.1 ("Block diagram of clock generation circuit"), =
it
> > is PCLKSCI0, which can be switched to PCLKM.  I guess that is the defau=
lt,
> > hence my "temporary simplification" question.
> >
> > As the actual switching is controlled through the SCI's CCR3 register, =
the
> > SCI block should have two clock inputs in DT (PCLKM and PCLKSCIn), and
> > thus the DT bindings should be amended.  See also Figure 33.1 ("SCI blo=
ck
> > diagram").
> >
>
> Thanks for clarifying.
> Indeed, this is the default setting (and the one we have at this stage).
> I think that support for PCLKSCIn can be added at the time we support
> baudrate setting.

I am not sure we can do that in a clean backwards-compatible way.
Currently the DT bindings describe a single clock:

  clock-names:
    const: fck # UART functional clock

The documentation calls the two clocks:
  - Bus clock (PCLKM),
  - Operation clock (PCLKSCIn).

Which one is the functional clock? I'd say the latter...
Currently, DT says:

        clocks =3D <&cpg CPG_MOD 8>;
        clock-names =3D "fck";

and the clock driver uses PCLKM as the module's parent clock,
I think you will have a very hard time to synchronize all of the clock
driver, sci driver, and DTS when transitioning to something like:

        clocks =3D <&cpg CPG_MOD 8>, <&cpgR9A09G077_PCLKM>;
        clock-names =3D "fck", "bus";

where the modulo clock has to become PCLKSCIn (actually SCInASYNC,
as seen from the CPG).

Does that make sense, or am I missing something?

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

