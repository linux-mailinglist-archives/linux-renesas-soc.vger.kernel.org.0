Return-Path: <linux-renesas-soc+bounces-11914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F77A03FE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FDCD1888B33
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79B01F12E0;
	Tue,  7 Jan 2025 12:51:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB51F0E5D;
	Tue,  7 Jan 2025 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254294; cv=none; b=UtchtGnYRWVYiEQejbNUOMsxDYATkuyo/pcPoHXRhNnpBng6dfNo0faODEGE3UeRaDoR0x1cy0YkIzSMIsOncJROe+YSK7bdVuxSK3kKgGztxIpwjZ5CTTJTX8pCo3hi49YiJfGfw5wvz1EbrtCjWz5zPy+pi2r6zs1AC9yz0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254294; c=relaxed/simple;
	bh=aAxQc26VYScgTSTS6ZPxIPzYuRXfKl4J4iXCPSV8/Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBcRzkHpzhQtKITNxm7GUPFUmMh9/HicIHYIINn5rtLokP3+Aw1FNFVFXx8wDJvRAi64Gv63TjaoFwqRzcW60UYrWKGgk+GUZdOjQSzrmFKhrGys0DvVHW4w2FSt0LlsBPG6uF53s9vDYKGk3gqtw1nHzmzSWCT+7npT2HbbfJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5189105c5f5so8197522e0c.0;
        Tue, 07 Jan 2025 04:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254290; x=1736859090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1G2eG4S2kes4wp/FTBvZu6SeGQ1OaSLT91UKsnqecQs=;
        b=afpzysIYGseWTFcazeSFVlKAamPwCgR9Px84xlPNfyVgFuWDnIsFR3CrxpUeGhHCch
         XQTr17olVQTIZmqCd2/AjJ7YqQphf43xu2fjQE8Y+lHCuWfdvrHJrPNzabo4U3n1275j
         EBHK5i6Mu6o9vVRXasMKriSWoxIzOWd/jb0i70hixDo54nLVR2mC6iFwmvsREoyCpaj6
         JhEG6BxR7Z7vwPf4gKsWxNdBqunpajWXbo8BnIIDZ7BO3RfDp9/GutN3lpwYsV7bfZJX
         75p7TBw8piRv8LYFmexn45LjL7vZRnBOEo/7JI7SHcljG4w+f1oWTknHPySXRnRBXCHO
         XCvw==
X-Forwarded-Encrypted: i=1; AJvYcCVNUz2T3zHGGT01xlgvXNnR9UlcwQzA2kPwtxPtZmFMZWCJtEoElgCLb7Baj/Ij2rj6hobs+KjmKIDX/op5@vger.kernel.org, AJvYcCWc9KySK6+M/00VnycSsbrELg3Z0QUIb0nhWKvAhDmOAVqAfE8bM2OEZy274y9Q8I9to4kvIZy9qXdP0HW9C5b2GuA=@vger.kernel.org, AJvYcCWvWXeJOTVRltEFj4GLq2bW6OwK3SW+yjFwXsaRxMGB2fXmbppStfU2oSDjdvX7ll8tgaooVyBCMp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjOQ7YKkhm2I3VrfPElxuXKcN1RnJkXM+6RlH7cXZ3JPxhej1m
	lU3XAbY175VwVH70VpDY/Ki8jl2XTEIJA3NnsIfvsp5W0eBQ8GehaN0nZqKP
X-Gm-Gg: ASbGncucZMvD9n3Pco7de8RUA5/NsD3SMSZ+Gbzl3NJ/mMSUcTBH2PMa6v6j8th7BjE
	9ssdk40fb2AieaJjxFp0Y6RKULQkk1FPZmQanNzexrsZIsZ/cJowLOHDjoFnFQRm//bjTgjZFGi
	eZlWc9aWkFsa3/5T54WE1vBX4LhgZz/sPPkQVWNW8AMRQkprJ+8vD0nKbve985A2y1wpaekmYoR
	7p1CFXjBGrdVkQfklh1RwZcbToJlAblFr0FbnEoE2mAzajli+fWYbcSJIAO9nLuuoZ8mxtXTy25
	7SgRMz4ZYuUsRoWdU6Q=
X-Google-Smtp-Source: AGHT+IHBWCYdz5rJNUVu0DmK1geA7yusnZYrpuSUVIOVPDB/BLhdN1R8AoVFPsPDYn+DF53mts5Q1Q==
X-Received: by 2002:a05:6122:1992:b0:516:1ab2:9955 with SMTP id 71dfb90a1353d-51b75c57a9bmr45572348e0c.6.1736254289909;
        Tue, 07 Jan 2025 04:51:29 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68d082e3sm4773223e0c.43.2025.01.07.04.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:51:29 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so8738991137.2;
        Tue, 07 Jan 2025 04:51:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6KmCIeIVUGcLxlMJ0TQL3UWRdxnwGppPesYT1RwW1nZGb19xfRBrdUocrcVvhkkc6WJlrWt8OtD8=@vger.kernel.org, AJvYcCWlJL81hQyfjjDOrjAkSUPtZoDasQmmnqGBcT9x60aMsoKipT3uC2TNfK8UEbKbBbYg8OaXzhlpGIyboOit@vger.kernel.org, AJvYcCXwD1c0+cyW3kInHxLIIg3ZWq5DQslr792ooX0PwmOgyD569tmzgQ1am+oDqAqzOL5ft3rvEUonF3e523saWJy6ZkY=@vger.kernel.org
X-Received: by 2002:a05:6102:26cd:b0:4b2:cbe4:565e with SMTP id
 ada2fe7eead31-4b2cc44827emr48473020137.22.1736254289467; Tue, 07 Jan 2025
 04:51:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
 <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v3wdwEk9zu26MeQVmOnWKm=RdHJzdH6tLKrvRLeoQ2DA@mail.gmail.com>
 <TY3PR01MB11346E9B6CD4CDB6EF93B99C986112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8uekQ=_KyTnm4vOg+DVXfXm5q9BrEb4Ms1k+je7a9aiDw@mail.gmail.com>
In-Reply-To: <CA+V-a8uekQ=_KyTnm4vOg+DVXfXm5q9BrEb4Ms1k+je7a9aiDw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jan 2025 13:51:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTAipDd1rkRdrDAJdtFQ59E2M_WP+31OfVYJk-eZFsSA@mail.gmail.com>
X-Gm-Features: AbW1kvZvVjhwaBVLEWECo5a-XfMo9MWW_yzm7CYRdB65JVzj_PFXSFOdF9fynPg
Message-ID: <CAMuHMdWTAipDd1rkRdrDAJdtFQ59E2M_WP+31OfVYJk-eZFsSA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Jan 7, 2025 at 1:44=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Jan 7, 2025 at 12:38=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > > On Tue, Jan 7, 2025 at 12:25=E2=80=AFPM Biju Das <biju.das.jz@bp.rene=
sas.com> wrote:
> > > > > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > > > > On Tue, Jan 7, 2025 at 11:24=E2=80=AFAM Biju Das <biju.das.jz@bp.=
renesas.com> wrote:
> > > > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > > > Switch MSTOP handling from group-based to per-bit configurati=
on
> > > > > > > to address issues with shared dependencies between module
> > > > > > > clocks. In the current group-based configuration, multiple
> > > > > > > module clocks may rely on a single MSTOP bit. When both clock=
s
> > > > > > > are turned ON and one is subsequently turned OFF, the shared
> > > > > > > MSTOP bit will still be set, which is incorrect since the
> > > > > other dependent module clock remains ON.
> > > > > >
> > > > > > I guess this statement is incorrect. Still in group-based, msto=
p
> > > > > > bit is controlled by usage
> > > > > count(ref_cnt).
> > > > > >
> > > > > It is valid, consider an example say IP-A reuiqres MSTOP bits 8 |=
 9
> > > > > |
> > > > > 10 and consider IP-B requires MSTOP bits 10 | 11 | 12 (of the sam=
e
> > > > > MSTOP register say MSTOP1). Now this will be seperate groups havi=
ng
> > > > > separate count(ref_cnt). Say you turn ON IP-A module clock and
> > > > > correspondingly clear the MSTOP bits and similarly now lets turn =
ON
> > > > > module clocks for IP-B and clear the MSTOP bits. Now let's say yo=
u
> > > > > want to turn OFF IP-A so you turn OFF module clock and set the MS=
TOP bits 8 | 9 | 10. In this case
> > > you will now see issues with IP-B as MSTOP BIT(10) has been set when =
we turned OFF IP-A block.  This
> > > case is handled by switching refcount on per mstop bit by this patch.
> > > >
> > > > Consider another use case, index 0, bit 8| index 0, bit9| index0, b=
it10 and index 0, bit8 | index1,
> > > bit 0 | index1 10 is addressed in current patch series?
> > > >
> > > Can you please elaborate, the above isn't clear to me.
> >
> > I just provide a random example for a future IP, where
> >
> > IP_A requires mstop1 {8,9,10}
> > And
> > IP_B requires mstop1 {8} and mstop2 {9, 10}
> >
> No, this case is not handled by the patch series.
>
> > Note: I haven't seen this scenario in hardware manual.
> >
> Yes, neither do I. For this case we will have to re-work the
> BUS_MSTOP() macro. Let me know if we want this case to be handled.
> I'll create a new patch on top of this series.

-EPROBE_DEFER. I.e. fix it when the need arises (if ever)...

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

