Return-Path: <linux-renesas-soc+bounces-883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9CB80C3A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 09:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B52280C82
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 08:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAB91EB46;
	Mon, 11 Dec 2023 08:52:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B713B6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 00:52:53 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5d8ddcc433fso29328957b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 00:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702284772; x=1702889572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wORz4wqcv/FsvKmD/2kxoTZYfp4sz7smsSmNlf/BRM=;
        b=JpQaijb3BxGBnS31Fjt1r0ghsMWIslpJieIk0/6SRoKKAa/kab33unpBEJpqyK9IbA
         +NKsc8DzfMOG1pbONb1ieTAiG4P7ZX6q3dImOV/GoQs39bu+GWk4r9whJ/j3c2lxISCU
         nXbM66wH/nYHmkuEnnYcG9d5hw+pn5DtLTG8yptViE6mEz9d9PuBJC0YTUXbqj2dJqsQ
         AWeC7zzfQtNuTCg2ZZC3x9ung5eA93HN0Mm4danAszPiXz+K53HHcy1D5LzBkTuCfYpJ
         vFNQvwsd5dvTN1G4kUZ9nEcaI6LOHws+z0G+qermjPRpP4sXZIUty2G5WtEq38z/e2vM
         H/sw==
X-Gm-Message-State: AOJu0YzgWmaNHvgtc7N4MY8uptlC52AwWI4KOgNW3BifBFUyStxgtYb7
	aOS63w2jPPLuSvcUfz4TSxuzXJC6tCvthg==
X-Google-Smtp-Source: AGHT+IFkFqLsCmtYFYAvAdt2GJ6ocp6Dfos8nenP6QeSPCK3xWXiGox9/ijv6tVDC6WogYxHkhOb9Q==
X-Received: by 2002:a0d:e607:0:b0:5d7:6161:e263 with SMTP id p7-20020a0de607000000b005d76161e263mr1369930ywe.37.1702284772191;
        Mon, 11 Dec 2023 00:52:52 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id v6-20020a81a546000000b005ca4e49bb54sm2776884ywg.142.2023.12.11.00.52.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:52:50 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso3075254276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 00:52:50 -0800 (PST)
X-Received: by 2002:a25:6805:0:b0:db7:dacf:4d4a with SMTP id
 d5-20020a256805000000b00db7dacf4d4amr1270761ybc.70.1702284769932; Mon, 11 Dec
 2023 00:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-7-biju.das.jz@bp.renesas.com> <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
 <TYCPR01MB112696C301D750A915F2661688681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdXHpE079eLAJjcdsbz6=Y6hux267AhqJow6HESCaf7EXQ@mail.gmail.com>
 <TYCPR01MB112693C2B72B6AA28766FF8EA8688A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdU2pdAYbXdyfpysPR0k7fjh31KrD9Xk05EHWeayzVDz5g@mail.gmail.com> <TYCPR01MB1126926DCFDB193E669C9CF8C868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1126926DCFDB193E669C9CF8C868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Dec 2023 09:52:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUswKrzqgumyoJ3RYWEAUR9WOBzc12dVcCB1s79E-AMRw@mail.gmail.com>
Message-ID: <CAMuHMdUswKrzqgumyoJ3RYWEAUR9WOBzc12dVcCB1s79E-AMRw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defconfig
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Udit Kumar <u-kumar1@ti.com>, Peng Fan <peng.fan@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Dec 11, 2023 at 9:32=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Monday, December 11, 2023 8:20 AM
> > Subject: Re: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defcon=
fig
> >
> > On Sun, Dec 10, 2023 at 10:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renes=
as.com>
> > wrote:
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: Friday, December 1, 2023 3:42 PM
> > > > Subject: Re: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062
> > > > defconfig
> > > >
> > > > On Fri, Dec 1, 2023 at 4:02=E2=80=AFPM Biju Das <biju.das.jz@bp.ren=
esas.com>
> > > > wrote:
> > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Fri, Dec 1,
> > > > > > 2023 at 12:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > wrote:
> > > > > > > Enable the config for the Renesas DA9062 PMIC and RTC, as it
> > > > > > > is populated on RZ/G2UL SMARC EVK.
> > > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > >
> > > > > > Thanks for your patch!
> > > > > >
> > > > > > LGTM, but I would have expected (at least)
> > > > > >
> > > > > >     CONFIG_INPUT_DA9063_ONKEY=3Dm
> > > > > >
> > > > > > too, cfr. my comments on patch 5/6.
> > > > >
> > > > > I have tested this, but I get "da9063-onkey da9062-onkey: error -
> > ENXIO:
> > > > IRQ ONKEY not found"
> > > > > So, I won't be able to test onkey events. So plaaning to disable
> > > > > this
> > > > node.
> > > >
> > > > Indeed, currently drivers/input/misc/da9063_onkey.c requires an
> > > > interrupt to function.  I wonder if it can be made to work using a
> > > > timer and pure polling...
> > >
> > > Yes, that is possible by either adding a debugfs to enable polling fo=
r
> > testing.
> > >
> > > Or
> > >
> > > a device tree property for adding poll delay, so that one can have
> > polling support to test onkey driver.
> >
> > I would go for the latter, cfr. poll-interval in
> > Documentation/devicetree/bindings/input/gpio-keys.yaml.
> >
> > > Basically, on a production system we should avoid polling as it
> > unnecessarily wakeup the system.
> >
> > Wouldn't polling (by Linux) only happen when the system is already awak=
e?
>
> IIUC, That is an overhead. If there is no load, system goes to suspend mo=
de and
> the timer for the polling (SCAN keys) will wakeup the system and same
> process repeats. If we have a PMIC IRQ, this won't happen.

Ah, you mean idle. Yes, that does incur a (small) overhead (I guess
there are other timers running, too).
I don't think any timer runs when the system is suspended.

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

