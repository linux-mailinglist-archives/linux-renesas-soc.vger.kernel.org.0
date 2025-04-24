Return-Path: <linux-renesas-soc+bounces-16304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF45A9A5C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 10:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968BC17CD7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 08:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2717520A5D8;
	Thu, 24 Apr 2025 08:24:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E60D433B1;
	Thu, 24 Apr 2025 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483087; cv=none; b=nsiSkU5pmYNeomwx5RT1WSuJqMM5pPPNWakmylL4lPA2E6duLUvFoRG3jx2+PbBYazYwwAOfGP9EttEXpl916n3p4kQer0GdOd3NxMgBlWTH2zFioWlWwfSn4tK3MNApctOfKTOuGH1s4YAnArXZl8aVovAk7K6H8ylZ73AD0vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483087; c=relaxed/simple;
	bh=FGlp0gi7Lh2frL5hssZboAJCoHSJSQJT5DYPXkGLO7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+Qt4JSaQqptHp2oy9/+PQgNmh939ab98pkuZQWccy+qpUzTtbw6V6wRQi9Ieo4E69ULtk8nAet93xbdI6++9Jmap7bNsk5mDym9fc4b6bVtbOUZ7LnoSA1no9wRFx2keukvlyFguPgZHqB0GOuEG1M0MELABPTivdU/xJaMv0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso330439241.2;
        Thu, 24 Apr 2025 01:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483081; x=1746087881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/HIGD5CEBqAUzJn6SybcBiQ48Vv8hvyMcmx+mxfZnQ=;
        b=ZysoJr/bkv7B/nRm+xmEmIAmdRL779VXMFjWCg12o3rgCxWhaJHoTj4iJ9VZ1Ym53X
         19C5QdGNCrtjd3cIbdYY0VV2S8QSN5Tx1NFAlnHeR51MDxOv6pCHa5a/dbBo4JQPoYec
         +8oJVpug5xk62+e5peTJC2og6h8JcssFTFR9Ba5VXMmQO4u5oLegCQIbDGnPPiINlKTe
         jFR9gGAQp5zUPVvX7XyVAaHPAiLV6Wxif5HAy/biTwmW90hckZTZT8Ew7u/+eyDIR2Qj
         SXJBIcUj43bgFcl97dNLf4MDyE6aWZuoxBvy6fKb2LeuxHHne9IlmRGX3sblGeu6sYBF
         +AMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuagJ8uBI2pcxpRhOM2ja5QfjokfS7em7eYIIC4+vs2KdD1IHJssSGzzgEx7ZUadDG62yij55rohs=@vger.kernel.org, AJvYcCXJ71e8FMjOCxOmcT+kNu0X/Zt9uEPBc0BA8hXZB+hj0ldKNVoAW7wfm8C/f9Sed2+Ivts99SgsE248uoqO@vger.kernel.org, AJvYcCXgxv66vCOIocUdglkT6MqFS/3GyqwcYFD29w0Yy1mR1P2HtMw40/j63FbLxASx5xEhFeCkvKuDrx2HDS4Xn5CoxRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUtU8dxPDHpTxIQWhhzIbOZRVH80uXZigKZN8sGGja2iSLBaSu
	dt7buAhc+Iftkt12dCRnSFjQJxhXRJbQtdGWvQYMCYY3anYEUfU21Qp8/TUA
X-Gm-Gg: ASbGncseCxZFa0Wm+j7OplCOJgnr9K56cfXgbhmSO9vOpdpee3Chyj0jKT0/D+IqSgD
	sSg5NCBNd/Y4ZOohjdAaX3IntWLDICzwpy99N9LG9r8m445CZx9waszybK5nVn8gkzfGxfnw1Ui
	iEzTkBCLT6NSmp20Mk2O8Cko5aaYXXXWM7IvWwpA3AZv+XI0os1JqkQlX+6hAEr1UD0pjjxySfx
	xQ2o3NWrPcg8UTnbASUTU45ytt0Y5vzVI312IKbD93BTruL0gDGwPA7Mk8NODVnDmpzpvYO6oBG
	sEAqU6QfJmwn8s7sT+cqx4FM652/FNLvrzVxdsBDFGI4JMJcadi/xUk+Ou4crPKS5qWY96+An3m
	9piA=
X-Google-Smtp-Source: AGHT+IHZrFCA/RqsRFDOhWaEqQLAbfWXi2jesv4HS7p+A8Max+urozTf7xeCHSx5A6z+gmLMLXeExQ==
X-Received: by 2002:a05:6102:c06:b0:4bb:b809:36c6 with SMTP id ada2fe7eead31-4d38dc19ccemr1399255137.11.1745483080841;
        Thu, 24 Apr 2025 01:24:40 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4d3d4e9c417sm159583137.9.2025.04.24.01.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 01:24:40 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso331702241.1;
        Thu, 24 Apr 2025 01:24:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqs+knq8vnREjXRsEUtdemeiiQ2bk6DQrYN/lI7p37zt1Jrwf9aJ9fiV1iOYYVKS2KNO9WfgL8iaU=@vger.kernel.org, AJvYcCXHuyls24IARSAt9MMfQT80/a3Wd1nRRUfsenhj/qaJugCXypfeWwkcnppTOfwBcPeBhbziTcgyLlUWiI3l6X30W6k=@vger.kernel.org, AJvYcCXZqiUm9LOPDaKT32+t/WGNw7s9QX2EjQfuFur3/FEpmFlHEB9C0BGjQCYTIEYZyj3voIOhDv8N3OMcONet@vger.kernel.org
X-Received: by 2002:a05:6102:508c:b0:4c4:fdb9:2ea with SMTP id
 ada2fe7eead31-4d38d524305mr1285747137.7.1745483080095; Thu, 24 Apr 2025
 01:24:40 -0700 (PDT)
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
 <CAMuHMdVQPbP0Fi5SDN8uOJ23S=_8pqHRVR2QFS8vHNfohzae2g@mail.gmail.com>
 <TYCPR01MB11492F29C81C6A33A9ED90F888ABA2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <CAMuHMdUV-kHD7BZ7zU71f8GD4sKqSnSTfoDhTU+s8wyVfXgq=A@mail.gmail.com> <TYCPR01MB114927B2ECBF040D48CB460CE8A852@TYCPR01MB11492.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB114927B2ECBF040D48CB460CE8A852@TYCPR01MB11492.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Apr 2025 10:24:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWPzbN7C05H5v-pjaohJJ1uprmPmWjcY61hsVk=_35Ow@mail.gmail.com>
X-Gm-Features: ATxdqUGt-mj0oN1VU3WvXubGWzX6m6hwzDgb5qAY0Ye5AFSVfDRqlBgLe6vYLyA
Message-ID: <CAMuHMdVWPzbN7C05H5v-pjaohJJ1uprmPmWjcY61hsVk=_35Ow@mail.gmail.com>
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

On Thu, 24 Apr 2025 at 09:53, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 23 Apr 2025 at 09:36, Thierry Bultel
> > <thierry.bultel.yh@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Fri, 18 Apr 2025
> > > > at 23:22, Thierry Bultel <thierry.bultel.yh@bp.renesas.com> wrote:
> > > >  > +};
> > > > > > > +
> > > > > > > +static const struct mssr_mod_clk r9a09g077_mod_clks[]
> > > > > > > +__initconst =3D
> > > > {
> > > > > > > +       DEF_MOD("sci0", 108, R9A09G077_PCLKM),
> > > > > >
> > > > > > Shouldn't that be 8 instead of 108?
> > > > > > Using R9A09G077_PCLKM as the parent is a temporary
> > > > > > simplification,
> > > > right?
> > > > >
> > > > > I am probably missing something, isn=E2=80=99t PCKML actually the=
 parent
> > clock ?
> > > >
> > > > According to Figure 7.1 ("Block diagram of clock generation
> > > > circuit"), it is PCLKSCI0, which can be switched to PCLKM.  I guess
> > > > that is the default, hence my "temporary simplification" question.
> > > >
> > > > As the actual switching is controlled through the SCI's CCR3
> > > > register, the SCI block should have two clock inputs in DT (PCLKM
> > > > and PCLKSCIn), and thus the DT bindings should be amended.  See als=
o
> > > > Figure 33.1 ("SCI block diagram").
> > > >
> > >
> > > Thanks for clarifying.
> > > Indeed, this is the default setting (and the one we have at this stag=
e).
> > > I think that support for PCLKSCIn can be added at the time we support
> > > baudrate setting.
> >
> > I am not sure we can do that in a clean backwards-compatible way.
> > Currently the DT bindings describe a single clock:
> >
> >   clock-names:
> >     const: fck # UART functional clock
> >
> > The documentation calls the two clocks:
> >   - Bus clock (PCLKM),
> >   - Operation clock (PCLKSCIn).
> >
> > Which one is the functional clock? I'd say the latter...
> > Currently, DT says:
> >
> >         clocks =3D <&cpg CPG_MOD 8>;
> >         clock-names =3D "fck";
> >
> > and the clock driver uses PCLKM as the module's parent clock, I think y=
ou
> > will have a very hard time to synchronize all of the clock driver, sci
> > driver, and DTS when transitioning to something like:
> >
> >         clocks =3D <&cpg CPG_MOD 8>, <&cpgR9A09G077_PCLKM>;
> >         clock-names =3D "fck", "bus";
> >
> > where the modulo clock has to become PCLKSCIn (actually SCInASYNC, as s=
een
> > from the CPG).
> >
> > Does that make sense, or am I missing something?
>
> You are right, I completely understand how hard it would be to have backw=
ard compatibility.
> However, doing so:
>
>                 clocks =3D <&cpg CPG_MOD R9A09G077_PCLK_SCI0>, <&cpg CPG_=
CORE R9A09G077_CLK_PCLKM>;
>                 clock-names =3D "fck", "bus";
>
> without modifying the sh-sci driver (yet) would lead to this bogus clk_su=
mmary:
>
>   clock                          count    count    count        rate   ac=
curacy phase  cycle    enable   consumer                         id
> -------------------------------------------------------------------------=
--------------------------------------------------------------------
>  loco                                0       0        0        1000000   =
  0          0     50000      Y   deviceless                      no_connec=
tion_id
>  extal                               1       1        0        25000000  =
  0          0     50000      Y   clock-controller@80280000       extal
>                                                                          =
                                  deviceless                      no_connec=
tion_id
>     .pll4                            1       1        0        2400000000=
  0          0     50000      Y      deviceless                      no_con=
nection_id
>        .sel_pll4                     1       1        0        2400000000=
  0          0     50000      Y         deviceless                      no_=
connection_id
>           .sel_clk_pll4              1       1        0        2400000000=
  0          0     50000      Y            deviceless                      =
no_connection_id
>              .pll4d1                 1       1        0        2400000000=
  0          0     50000      Y               deviceless                   =
   no_connection_id
>                 .sci0async           1       1        0        100000000 =
  0          0     50000      Y                  deviceless                =
      no_connection_id
>                    sci0              2       2        0        100000000 =
  0          0     50000      Y                     80005000.serial        =
         fck
>                                                                          =
                                                    deviceless             =
         of_clk_get_from_provider
>                                                                          =
                                                    deviceless             =
         no_connection_id
>
> it is wrong because the actual default state is that PCKLM is used, not s=
ci0async.
> Having PCKML consumed by sci0 is an obvious fix in sci_init_clocks, but i=
t won't show up that only one clock is used at a time.

So your rsci patch should modify the sh-sci driver to handle this correctly=
...

> Couldn't it be better be solved by introducing an extra mux clock ? (the =
one controlled by BPEN) ?

I don't think that will simplify anything:  as the BPEN bit is located
inside the RSCI register space, that mux clock must be handled by the
sh-sci/rsci driver itself, so you cannot just refer to it in the clocks
property in DT.
In theory, several other control bits (e.g. BGDM (Baud Rate Generator
Double-Speed Mode Select), ABCS (Asynchronous Mode Base Clock Select),
and ABCSE (Asynchronous Mode Extended Base Clock Select) in CCR2)
could also be modelled using the common clock framework, but that
wouldn't simplify the serial driver...

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

