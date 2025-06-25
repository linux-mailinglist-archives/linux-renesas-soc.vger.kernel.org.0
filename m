Return-Path: <linux-renesas-soc+bounces-18737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 198AFAE87C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86FD3A6FCF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18C726A1AB;
	Wed, 25 Jun 2025 15:19:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB0A19D071;
	Wed, 25 Jun 2025 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864741; cv=none; b=p11Y7lYCL5w5hdgLoT43xRnCt01e1K6k+UzTeDzeLuPEDWW9hvKkbfJ+3Ccc17a3mED1gOEfos+e3bLCWIKSN7PJsDOHVlVJEafRm19l4ujj/lCxlYXbV4yZzQUvNuCUhldHjhSPA+Q4sawdTGVlg+NXgup4bbfnnrNpjYbzUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864741; c=relaxed/simple;
	bh=lXLEkqm1AZbw1Xkeyz5RDqidMMn5p7Yuuae2E1tcWbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBjkk2E9HIjq3rmSy8F1PBLw9QSROZ01eCTUEjS1JcBtaP63/VfHpJ2XMvpuh4RQRhioBjdny+GRD/pBDLQ4yaK2KqJXovKGOY+fU6a0T5Vmhjo3CdIzLbBkZ8Cwt+id2jghbvH2cT5nr5gI+WPbjGciYQ55KQ7R1cOp7ulg6fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6118c1775dbso2734eaf.1;
        Wed, 25 Jun 2025 08:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864738; x=1751469538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61X6vtBiwIDcFwxAXL+mrWigIfgOJBa9v164n3CvTMU=;
        b=VQ+/WctZES+ws4SDn4yzckyFUTIPe+WUWTvDKED8zlt7/6L5usVRItHLeJdWIwXKZc
         MPMxQHg/ckdLYagYMjh15YMpFQNu4C6qVc/wR65MgutZT7vKAc0fk3zfz7K1h4vloc9r
         MgdnKRvsvfTa/jhSI1nvqZMAaUpB/KZci7+YR98NPnhLoyHRgFJjnif1wJafbSXL6TkF
         uwPQCIBe0Cv/cekyMELKPymERH1KsfVmWyxoxRTylaVb47tH0TScx2fj9Zk2Woe/Pv2F
         rIYSS1X2ro2/hWVZNJqHG1U1x0LnkZ64JlqxVItI9iql8KUREJ4IGXFw53wdSwmkWkh7
         RlxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC6HwMRbfPujTtprw4p8kahOIBH3Iny7kDeRfW/j8wjRWnFT+7yjaK95piPw2cfydY+cyKV9M4zSK/QemcU3eIPOc=@vger.kernel.org, AJvYcCV31aWyi7aEn7wsJ/S5tZInFoL+2APplER5sMdvz9/y7OGrqZ/RelW/ajjWmbrx0qlhtCVrTrte8EGN@vger.kernel.org, AJvYcCWNCuuYAPqZ44KcqXQQyoqWAvinlgJS+E21tDEGszd9cPVZKRIrcR3nIZxHNmIS4D2UqzjviCx0dncISR/V@vger.kernel.org, AJvYcCXII8iThfHOvbkmvbrpaxTDbAxBRnv4l3ducF8xN/qC6oRzEFWTgEPATgMMOc5Oe6hBQ8Z7EcJa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo1EtPR9Susvtsn7FK/aMCjbOMCZJCBNPm5pcp8F5DhZMqoDu0
	mXSI0LKW1W3xJZXNQFcPG0aOrvLlGvb1JbgJTuREqzuJ1dtG8RkYEFUyEUojY5GY
X-Gm-Gg: ASbGncv5g4oLssVcwqUairCRpUxc2ss3YT6CstIXDLvffQumwWV9Na4B1hWinn/mxYe
	ORT6oqOCqUbywGDCO/OwsQL5ySkK8pV/FMKeBILyM+p5UM1H72NzM3iwj9BdlADYh76Mplamiya
	IRvWqf76aZ9S11pCc+S77+v5MEG20YhSFzlQjuR55kQh5iz4t6+F/gRyhXwooeLudms0vReYNS6
	VfwwIgE3RPDC9Ds22b6T1pENxwu40eZhMcHJJ2Ig3kbFNDjN0YhIJmveYLlzyZYYQPTLEqXZTte
	JOqI33S6dyx0lshnhdnZHwlTiwX1LHjRXLBqNjIo3aQZokWpqX8y+e1Oup3a8vRyrEPLHoXtd00
	6Yr5DqIbzH9Vkjq/YTLdaksoE/QiF
X-Google-Smtp-Source: AGHT+IHhzeS9QhMVlC9Da5wv4xW71BdxK6MtLqfXrXQeP4+q51Hrr2d+t0dtfoHh8e12RX0D6LPqLw==
X-Received: by 2002:a05:6808:210a:b0:3f9:2fdc:ee93 with SMTP id 5614622812f47-40b057f4f15mr2980265b6e.30.1750864738067;
        Wed, 25 Jun 2025 08:18:58 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d3af8esm2200265b6e.44.2025.06.25.08.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:18:57 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4080548891fso18744b6e.3;
        Wed, 25 Jun 2025 08:18:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEgOdT1UDFUJKVKepGwxgn4+4jI7sOWV3jgSHL9etfSFuh/4B0tCu9wX5/MMDPzfTLT3RUZ4a8BcRt@vger.kernel.org, AJvYcCVWVtbt4f+VLkJ2ugiyzctOy5Vq4vB/3nuZGH7Iat3nJ+CjnGRHz9v5JZtmhuFKzvR1VEjyV8IJMoY+91RHAhcCBzo=@vger.kernel.org, AJvYcCWA4ZjVA9yhflhr222BgBu3z3GsZPfF3y0uEAgPI4fu7YUzj19ejWzyRZXpK98QJf2fVZ6cDxCy@vger.kernel.org, AJvYcCXVvqU4KZ/Lbn8DGnQ96+IzLNsIvy01ypFqHhUXV1d7fXNzkEqHSEwVn5JHhywuyuvzjYISNlWpaUJHk8Y+@vger.kernel.org
X-Received: by 2002:a05:6808:144b:b0:403:3660:4130 with SMTP id
 5614622812f47-40b057f1341mr2798969b6e.27.1750864737453; Wed, 25 Jun 2025
 08:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-2-john.madieu.xa@bp.renesas.com> <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
 <OSCPR01MB14647EFA0DA38119F00DF1D50FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <CAMuHMdWnz3VUeFaJBEgLc0F_gGkdm679H4YqFFuRAEVFKZd8OA@mail.gmail.com>
 <OSCPR01MB1464715327B4DDE8622B9B510FF7DA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <CA+V-a8sF2wmLEAp7uhxhKaNx_u9xTf9SR_y8rafyvYYaUgxYDw@mail.gmail.com>
In-Reply-To: <CA+V-a8sF2wmLEAp7uhxhKaNx_u9xTf9SR_y8rafyvYYaUgxYDw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jun 2025 17:18:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdhYJ7ZKVa_f15PMBv7t1_xsDUuwR+uv+bOaHMxtr8Lg@mail.gmail.com>
X-Gm-Features: Ac12FXxMuB3uVsmBJbD5APZ-b0irg6FYpOQOBb_DxbMkT4pEas9BrSWPeM1lx3I
Message-ID: <CAMuHMdXdhYJ7ZKVa_f15PMBv7t1_xsDUuwR+uv+bOaHMxtr8Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"robh@kernel.org" <robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"john.madieu@gmail.com" <john.madieu@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ho John,

On Thu, 19 Jun 2025 at 10:22, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Thu, Jun 19, 2025 at 5:34=E2=80=AFAM John Madieu
> <john.madieu.xa@bp.renesas.com> wrote:
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Wed, 18 Jun 2025 at 12:04, John Madieu <john.madieu.xa@bp.renesas.=
com>
> > > wrote:
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 11 Jun 20=
25
> > > > > at 11:02, John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > wrote:
> > > > > > Add clock and reset entries for the Gigabit Ethernet Interfaces
> > > > > > (GBETH
> > > > > > 0-1) IPs found on the RZ/G3E SoC. This includes various PLLs,
> > > > > > dividers, and mux clocks needed by these two GBETH IPs.
> > > > > >
> > > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > > > > > +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> > >
> > > > > > @@ -214,6 +252,30 @@ static const struct rzv2h_mod_clk
> > > > > r9a09g047_mod_clks[] __initconst =3D {
> > > > > >                                                 BUS_MSTOP(8,
> > > BIT(4))),
> > > > > >         DEF_MOD("sdhi_2_aclk",
> > > CLK_PLLDTY_ACPU_DIV4,
> > > > > 10, 14, 5, 14,
> > > > > >                                                 BUS_MSTOP(8,
> > > > > > BIT(4))),
> > > > > > +       DEF_MOD("gbeth_0_clk_tx_i",
> > > CLK_SMUX2_GBE0_TXCLK,
> > > > > 11, 8, 5, 24,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(5))),
> > > > > > +       DEF_MOD("gbeth_0_clk_rx_i",
> > > CLK_SMUX2_GBE0_RXCLK,
> > > > > 11, 9, 5, 25,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(5))),
> > > > > > +       DEF_MOD("gbeth_0_clk_tx_180_i",
> > > CLK_SMUX2_GBE0_TXCLK,
> > > > > 11, 10, 5, 26,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(5))),
> > > > > > +       DEF_MOD("gbeth_0_clk_rx_180_i",
> > > CLK_SMUX2_GBE0_RXCLK,
> > > > > 11, 11, 5, 27,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(5))),
> > > > > > +       DEF_MOD("gbeth_0_aclk_csr_i",           CLK_PLLDTY_DIV8=
, 11,
> > > 12,
> > > > > 5, 28,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(5))),
> > > > > > +       DEF_MOD("gbeth_0_aclk_i",               CLK_PLLDTY_DIV8=
, 11,
> > > 13,
> > > > > 5, 29,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(5))),
> > > > > > +       DEF_MOD("gbeth_1_clk_tx_i",
> > > CLK_SMUX2_GBE1_TXCLK,
> > > > > 11, 14, 5, 30,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(6))),
> > > > > > +       DEF_MOD("gbeth_1_clk_rx_i",
> > > CLK_SMUX2_GBE1_RXCLK,
> > > > > 11, 15, 5, 31,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(6))),
> > > > > > +       DEF_MOD("gbeth_1_clk_tx_180_i",
> > > CLK_SMUX2_GBE1_TXCLK,
> > > > > 12, 0, 6, 0,
> > > > >
> > > > > scripts/checkpatch.pl says:
> > > > >
> > > > >     WARNING: please, no space before tabs
> > > > >
> > > >
> > > > Noted.
> > > >
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(6))),
> > > > > > +       DEF_MOD("gbeth_1_clk_rx_180_i",
> > > CLK_SMUX2_GBE1_RXCLK,
> > > > > 12, 1, 6, 1,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(6))),
> > > > > > +       DEF_MOD("gbeth_1_aclk_csr_i",           CLK_PLLDTY_DIV8=
, 12,
> > > 2,
> > > > > 6, 2,
> > > > > > +                                               BUS_MSTOP(8,
> > > BIT(6))),
> > > > > > +       DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8=
, 12,
> > > 3,
> > > > > 6, 3,
> > > > > > +                                               BUS_MSTOP(8,
> > > > > > + BIT(6))),
> > > > >
> > > > > Shouldn't all of these use DEF_MOD_MUX_EXTERNAL() instead of
> > > > > DEF_MOD(), like on RZ/V2H and RZ/V2N?
> > > > >
> > > >
> > > > Do we really need to use DEF_MOD_MUX_EXTERNAL? Unlike for the RZ/V2=
H,
> > > > On G3E, unbind/bind works with DEF_MOD. I can however switch to
> > > > DEF_MOD_MUX_EXTERNAL for consistency if required.
> > > >
> > > > Please let me know.
> > >
> > > Does that mean the monitor bits on RZ/G3E do reflect the correct stat=
e of
> > > external clocks? If yes, then DEF_MOD() is fine.
> >
> > Checked DEF_MOD() and had expected result. I'll then it and send v3.
> >
> Can you please share the devmem logs for external clocks please. I ask
> because the HW team mentioned the below information will be added in
> the RZ/V2H(P) HW manual. We need to check if below is not needed on
> RZ/G3E.
>
> "The clock gating cells require source clocks to operate correctly. If
> the source clocks are stopped, these registers cannot be used."

Has this been sorted out yet? I see no change or mention of it in v3.

Thanks!

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

