Return-Path: <linux-renesas-soc+bounces-11909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39010A03F31
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E4327A37EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654A51F03F5;
	Tue,  7 Jan 2025 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGNDnj/Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40111E1041;
	Tue,  7 Jan 2025 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736253120; cv=none; b=YLhMOG8NmbdlvT7kc/Dap4GOP50k17VTnsARV7J0aUBMxFU1h7OokBn2A6YyRWxooe8wJILBmqF+coFv+80O0g6BW/Cm36H87/XaP1PBrTENJ9xGccsyUPhZ2qm3fa/mFOFNfxEfmmqNK8C+ptalEoMpxkQzLD3cJ9ghfKNTYXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736253120; c=relaxed/simple;
	bh=GDzTPxoZA8uIyJHGrviksn6tNCxxFk71uS0D7l3E0m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=no2/RmZyhXhQFHa7O4BzjCwYmC4rFyFaZtYRc5vgJpqEweES0P0p3X3e+bUGcuc4Ks2EqzW8Bnuj6YxTs8GYVxSb5lYo9quyx5Q5h8hjfrPQHqQvdvvIbN7lduEeggdBjhrzU0IfC2zjOqVzzC3G12/dr1DPvccgTC2eK8dvgJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGNDnj/Q; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51bc2363fd7so3492345e0c.2;
        Tue, 07 Jan 2025 04:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736253114; x=1736857914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaWTf3we5KXhqQvUI/p8YDd5q/G3+LDixqBeeDCTQXs=;
        b=WGNDnj/QZ8FkDZkSCj5oZ1/lFRp/gblqGsKsi49xM0rPUmVQXcDJJ3rmlewa52xqIJ
         fD1EBqvhXGV0xsRtyHgT3PfePh0FoBb4X0fVYeq07ZzBlVXMxgp/vrjTCVVmND1qf2O8
         OPOV5NMO9W9AJ6gayRg3vBScFGvRxLpLZYZLREeNFZtvahcIHrgAVuOmJqJCfx0kFtDR
         R2HcLv3yhffISKOxs/nyr2vXJM8wol0mKzO5F5l7dzo6iymT9tDPPtXtvX88mep33rF8
         FmmHH2WpCgZKEkruBbXPhe8NGoIFSGg/V/OhE4/xBtJBLLm8ezIlEQcIBvhEO+8TjfAk
         wmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253114; x=1736857914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaWTf3we5KXhqQvUI/p8YDd5q/G3+LDixqBeeDCTQXs=;
        b=tW5C0umsuabPl0MDYKMSQ79wFz0afBLH+qktUXAV0pO7IIUbeE8jWmh7LT//61efO2
         EJ6jR9X1Zx1YzMu2qUHPZ1iwQhicRwnF2vBlMaqf5nrqNtI9jPOX2AQ05TeedhVKZDij
         cOUAwbboUdnidHMq3EmedceiasdrvCj4VyyiiQDNRpGDXqkKx5F4MPMt2+d/t08LZZtG
         gwvwPWqx15GFwVxWf8TiH1qcZ2bpx87xlax9/pf0CVT7mHXqubqilzDaCI38uWIS9BC+
         0ugKbVaKuMSbOlU5gTbu4Q+YdkK/DyafjdT2c0debQltToNSDIY8cSqFz7PfGTGtefVN
         mXeg==
X-Forwarded-Encrypted: i=1; AJvYcCUMoanql3bSeleBjpM4Tlqrw3Kuq4FOTvB4qiZ/Orf7loeS+S/QHW3W/Hw179luBqWOsfkY/7Uogt61IiCv@vger.kernel.org, AJvYcCUvKbeU62X1drdHJ/cISRrZIUh2RMEpYwNQOhhpHzHXaQDcJOz3bF0dCvMxdxzSjRLzLftCTgiOvWxQgxe+Kmyj0/c=@vger.kernel.org, AJvYcCWx7K3e/ySCoZoElNRcSsnrP8rTVUx4fQqZ/QMpBlu0t3w9H5ljOkfNvTB9V/P6cPrT/gnjs0OwSTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnRJDvaVc6dHuf7QPhrFQJmwxm3vw3gkXNYqoqYPSPGph0CLE3
	NtxIldaW3ejyEt3zeqYMXGP0mXto7Q2DHhxF8isWFGhbjW80RoYyRfJoxEM2T8clYMI4zcYSBF8
	WNAeMzwuiPVlW+GDyTWe6IQqp/8UU093jAH/Xzg==
X-Gm-Gg: ASbGncsV+JaNtc3RCoQsWEkNltq9AT48qlQWgT3H4ewdoyjp5YeoNSlwpYPT4Djo6Vs
	uXMMyyyhwa4IvPFAedKImBf40uXdtxS7Yf2SVYLA=
X-Google-Smtp-Source: AGHT+IHzHWMWlrN/SgCkockB9AswQ8nP80IT+eL4v5gJcdN/yWOk8vQN4C7OanhnANkP9vlcnVmg4kwiaQu5kBkEktw=
X-Received: by 2002:a05:6122:2398:b0:518:778b:70a1 with SMTP id
 71dfb90a1353d-51b75d58cd3mr38947045e0c.7.1736253114356; Tue, 07 Jan 2025
 04:31:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com> <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 7 Jan 2025 12:31:28 +0000
X-Gm-Features: AbW1kvaUbv_orfJZ1GqWH3hq3UBs6GGLonSZznFjzDsyze4UL4Wzsz5hI1qiOIY
Message-ID: <CA+V-a8v3wdwEk9zu26MeQVmOnWKm=RdHJzdH6tLKrvRLeoQ2DA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Jan 7, 2025 at 12:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 07 January 2025 11:46
> > Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configura=
tion to per-bit basis
> >
> > Hi Biju,
> >
> > On Tue, Jan 7, 2025 at 11:24=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 02 January 2025 18:19
> > > > Subject: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP
> > > > configuration to per-bit basis
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Switch MSTOP handling from group-based to per-bit configuration to
> > > > address issues with shared dependencies between module clocks. In
> > > > the current group-based configuration, multiple module clocks may
> > > > rely on a single MSTOP bit. When both clocks are turned ON and one
> > > > is subsequently turned OFF, the shared MSTOP bit will still be set,=
 which is incorrect since the
> > other dependent module clock remains ON.
> > >
> > > I guess this statement is incorrect. Still in group-based, mstop bit =
is controlled by usage
> > count(ref_cnt).
> > >
> > It is valid, consider an example say IP-A reuiqres MSTOP bits 8 | 9 |
> > 10 and consider IP-B requires MSTOP bits 10 | 11 | 12 (of the same MSTO=
P register say MSTOP1). Now
> > this will be seperate groups having separate count(ref_cnt). Say you tu=
rn ON IP-A module clock and
> > correspondingly clear the MSTOP bits and similarly now lets turn ON mod=
ule clocks for IP-B and clear
> > the MSTOP bits. Now let's say you want to turn OFF IP-A so you turn OFF=
 module clock and set the MSTOP
> > bits 8 | 9 | 10. In this case you will now see issues with IP-B as MSTO=
P BIT(10) has been set when we
> > turned OFF IP-A block.  This case is handled by switching refcount on p=
er mstop bit by this patch.
>
> I agree, Do we have such use case?
>
Yes, for USB2.0 on RZ/V2H.

> Consider another use case, index 0, bit 8| index 0, bit9| index0, bit10 a=
nd index 0, bit8 | index1, bit 0 | index1 10 is addressed in current patch =
series?
>
Can you please elaborate, the above isn't clear to me.

Cheers,
Prabhakar

