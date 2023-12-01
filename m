Return-Path: <linux-renesas-soc+bounces-531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7F2800EBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 16:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDBAFB20DC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 15:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E4B48791;
	Fri,  1 Dec 2023 15:42:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B931711
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Dec 2023 07:42:11 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5cd81e76164so25309627b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Dec 2023 07:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701445331; x=1702050131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQ+O4CQ0n2oqpnBSefwfIMYpBfOlyVy24WjacruURbE=;
        b=rf3hnfBmmb7zc7LXzRN5TOli41UZsgNJKBX8SXFPBE6un1Vk2YrcqJz8CnYRhreEO2
         BqqI3iFNR+wjfhwLFl2jrI45+WB/0p7lbMZgCURcKvzd40nxdctY4AvYy69ArrwQN14D
         vcbhzERasJvPDAThkaXSbZovombtCwJUo2kpCFfpdRxyxTcKK/XN813xOLJZ3H2d2ffx
         qvLkyyZsfLTP9PKFbZeixSYeOIi9sZGnx6zIERokb8xFExN8YDEktD4TWpSktiTcQrpi
         dJu8JR0NHNxBDt/LQUnGlKcTZU6ZIYbegiG5PIGExvHhvGtgp2CLqSJyPJQlshes+viW
         GACg==
X-Gm-Message-State: AOJu0Yz9qzkpl7E9J9fKjojf6mPB8GiQ+W3ezJ4RM0TvptbUQPMBEaIP
	RnvrBcsWzsA4kH53AfdJRMPOgAnWNpZlEQ==
X-Google-Smtp-Source: AGHT+IF2ipBRkoy7p4GBVJkjkiIxWc4UQYEaB3IvBTDR5/6YpK9G79DtYfwNT5X2okvp+WcvzTNnLg==
X-Received: by 2002:a05:690c:d8f:b0:5ce:aad2:3d6a with SMTP id da15-20020a05690c0d8f00b005ceaad23d6amr29272090ywb.14.1701445330751;
        Fri, 01 Dec 2023 07:42:10 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id m7-20020a817107000000b0059af121d0b8sm1161269ywc.52.2023.12.01.07.42.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 07:42:09 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cd81e76164so25309077b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Dec 2023 07:42:09 -0800 (PST)
X-Received: by 2002:a81:ae05:0:b0:5d4:1fe1:312d with SMTP id
 m5-20020a81ae05000000b005d41fe1312dmr2067102ywh.17.1701445329259; Fri, 01 Dec
 2023 07:42:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-7-biju.das.jz@bp.renesas.com> <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
 <TYCPR01MB112696C301D750A915F2661688681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB112696C301D750A915F2661688681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 16:41:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHpE079eLAJjcdsbz6=Y6hux267AhqJow6HESCaf7EXQ@mail.gmail.com>
Message-ID: <CAMuHMdXHpE079eLAJjcdsbz6=Y6hux267AhqJow6HESCaf7EXQ@mail.gmail.com>
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

On Fri, Dec 1, 2023 at 4:02=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, Dec 1, 2023 at 12:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote:
> > > Enable the config for the Renesas DA9062 PMIC and RTC, as it is
> > > populated on RZ/G2UL SMARC EVK.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > LGTM, but I would have expected (at least)
> >
> >     CONFIG_INPUT_DA9063_ONKEY=3Dm
> >
> > too, cfr. my comments on patch 5/6.
>
> I have tested this, but I get "da9063-onkey da9062-onkey: error -ENXIO: I=
RQ ONKEY not found"
> So, I won't be able to test onkey events. So plaaning to disable this nod=
e.

Indeed, currently drivers/input/misc/da9063_onkey.c requires an
interrupt to function.  I wonder if it can be made to work using a
timer and pure polling...

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

