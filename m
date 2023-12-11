Return-Path: <linux-renesas-soc+bounces-881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8042380C2EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 09:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41532280D86
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 08:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C0420B39;
	Mon, 11 Dec 2023 08:20:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE68E5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 00:20:29 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cfc3a48ab2so34544777b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 00:20:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702282829; x=1702887629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvdLkB0inDlByFLJR/9Lc0lacLkE9ywNJ6L/yH0M0sc=;
        b=L9lko4WsTUm22fei3lbr84dFUeF0nscCU/L0iEekzuEio7klSNPGbgZyBSZmbeBfm/
         r2GdnOtHal/na3sf6b8FhHsABDatbIIrEqO1itG0nBU6OR+vbDTIKAIrlOeoTX+GjwoV
         PSaqhJv9c+xpf4mJiqHBN/gPXYrpKcKBFaY6o2qy2Hsl7m0XEOh88QtlGgIeVSdUG0G1
         eDtK3XMRXtiaz07wjqqVox7FBChXZVwlVDePZNz3RtGDwHKO8N1pPS0UAYY8gzOqIMQi
         WWeFxaQhXjIY9wLgpdCtkzvVrtgVdPYfmp3C6SL432t8sxgQLD2dvnvoIHIXCV0B9+Ft
         gmxg==
X-Gm-Message-State: AOJu0YybsFoTWsWilS7H2FVAY70HXdVAgS00+FGhKmuyj8jqw5mSxAWV
	G6SU6qebKI/LkWQ0qzy/EkcOHNmllrzKEg==
X-Google-Smtp-Source: AGHT+IFvVdIyPq98zFjH5eAEClfhiG4c4YLwYMPx1jp5mhgmkOzqpgUmk1d16vJjS3alXDPdGzaJ2A==
X-Received: by 2002:a0d:dc84:0:b0:5d7:1941:aa2 with SMTP id f126-20020a0ddc84000000b005d719410aa2mr2519197ywe.61.1702282829048;
        Mon, 11 Dec 2023 00:20:29 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id c3-20020a0dc103000000b005a8d713a91esm2847775ywd.15.2023.12.11.00.20.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:20:28 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-db549f869a3so4394707276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 00:20:27 -0800 (PST)
X-Received: by 2002:a5b:f81:0:b0:db5:4ee8:b304 with SMTP id
 q1-20020a5b0f81000000b00db54ee8b304mr2127310ybh.39.1702282827133; Mon, 11 Dec
 2023 00:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-7-biju.das.jz@bp.renesas.com> <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
 <TYCPR01MB112696C301D750A915F2661688681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdXHpE079eLAJjcdsbz6=Y6hux267AhqJow6HESCaf7EXQ@mail.gmail.com> <TYCPR01MB112693C2B72B6AA28766FF8EA8688A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB112693C2B72B6AA28766FF8EA8688A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Dec 2023 09:20:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2pdAYbXdyfpysPR0k7fjh31KrD9Xk05EHWeayzVDz5g@mail.gmail.com>
Message-ID: <CAMuHMdU2pdAYbXdyfpysPR0k7fjh31KrD9Xk05EHWeayzVDz5g@mail.gmail.com>
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

On Sun, Dec 10, 2023 at 10:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Friday, December 1, 2023 3:42 PM
> > Subject: Re: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defcon=
fig
> >
> > On Fri, Dec 1, 2023 at 4:02=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas=
.com>
> > wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Fri, Dec 1, 2023
> > > > at 12:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > Enable the config for the Renesas DA9062 PMIC and RTC, as it is
> > > > > populated on RZ/G2UL SMARC EVK.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > LGTM, but I would have expected (at least)
> > > >
> > > >     CONFIG_INPUT_DA9063_ONKEY=3Dm
> > > >
> > > > too, cfr. my comments on patch 5/6.
> > >
> > > I have tested this, but I get "da9063-onkey da9062-onkey: error -ENXI=
O:
> > IRQ ONKEY not found"
> > > So, I won't be able to test onkey events. So plaaning to disable this
> > node.
> >
> > Indeed, currently drivers/input/misc/da9063_onkey.c requires an interru=
pt
> > to function.  I wonder if it can be made to work using a timer and pure
> > polling...
>
> Yes, that is possible by either adding a debugfs to enable polling for te=
sting.
>
> Or
>
> a device tree property for adding poll delay, so that one can have pollin=
g support to test onkey driver.

I would go for the latter, cfr. poll-interval in
Documentation/devicetree/bindings/input/gpio-keys.yaml.

> Basically, on a production system we should avoid polling as it unnecessa=
rily wakeup the system.

Wouldn't polling (by Linux) only happen when the system is already
awake?  I think the DA9063 itself handles the onkey when the system
is asleep.

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

