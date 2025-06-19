Return-Path: <linux-renesas-soc+bounces-18520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA8ADFFAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 10:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A3C27AE4F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 08:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F582494FF;
	Thu, 19 Jun 2025 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leG8PQM8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FE83085D7;
	Thu, 19 Jun 2025 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321346; cv=none; b=k7SJoSc2h/6p++zC6xsJKs6FwPKdMnLCjfPIa1CJbiRZ+gbLcxknpPKZYRv/mTbPW4I7fFzxZ7zCOEBJAwGDt3dob0YrTGoH3fOfJiKBmUYtwGRKpiUuxAadMbnZbWXoACZpZ3WA79Uwj0jkyUGy/QYn40wsKS96o1kZoTYmVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321346; c=relaxed/simple;
	bh=/qs36Hq9qLfFVsLKCB4V6x7SFDwQu3Wl3SfA2xa0Xs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWUJMonPaFoqUYpVobS4rSrsDznaTAxMBO5Y82vgcgUiZwJi9hi+WAhJYlqgxvSapYDvDu2nhufxJ8a/0zEcDx4ckIAzJ3XVwsmlI3ij2kV1aeHRE/aLjF0Xfj7Ds4MrstR3R0OUU3INBH1B8GWRPs+qLBcSbdWiPMcuwJxECa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leG8PQM8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so304252f8f.0;
        Thu, 19 Jun 2025 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750321342; x=1750926142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBFfdLKqVRiGfA9A94avgM1blBNQaiZ2fRuQS5o4xWc=;
        b=leG8PQM8yGP9AJrk4qD9Mf6GToK/zTeIJCQ28BZuR6Kn9/UVAS0N4B2AiITf9aDHLF
         uvhLPG9pe/wqK+K/zP6iD2q+XFwnWMlDTlUPAe5FKtbrkgE854mmJ60c+kM8myANoSid
         MOQJVkeTaXy9HglxX+reagZLL39ty/VCGeIN84nnqMpcgmAJnQWKoDsxscJuakEMefPm
         hIwWFwkTPVU9SRrU1WTjiRrCvs+goNl8qV2ybqvBC9cEtBI0d/w8DI+ermwW04xXJ76X
         5/YL9Vo9zhtVEvgiueVA+wqwG+RdELnsyLp5yc0SaFd70G6MRxt/LPNVbVP0YTkB6pq6
         eppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321342; x=1750926142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBFfdLKqVRiGfA9A94avgM1blBNQaiZ2fRuQS5o4xWc=;
        b=Sm0CvF5dmx6jvqUSKTy3bMV2BtxGjBXVYNo04Bxy33zpOBJhOH4GAWgrD6eF7I4Fdn
         NmrlOKxS5WC+GLj8BR8QR76j/TKTvxoU+yPousdeEXxU0jVN9xX6C18P/8JJacQUW/w3
         37rJCYxEGaynyFbdPJGYd2X9rK2Tq4qmzlNyiOTq+6cdA6a6G29ng3sF2ckl5+XyhIPj
         MjSfv7zqyNZX8PAyQOjLAh1xx1HVn5Yp5Jyux/aMI7TchglpeMEcJ2N9TH2HoAIlWTI5
         bXPQtodI1yE5kJWSVBAvI1kR4sRLR6UmBVkRVAMB0K+lb8jO6xZo1Enw06/akS3RlGJd
         rVPw==
X-Forwarded-Encrypted: i=1; AJvYcCUK5ZEGvVL2Z1z2DGVsFTehG46caJ1qcX1Gx7Jps64vkkmtVFeuKd1tP3/0Z4IQ5ZDg50FLBcFQwvY8@vger.kernel.org, AJvYcCUc2G9aSML6Tdu5GRmH5Jw7okTekIt3+pg8k9eCeyF36dhaKQaoKmRigUsKLBMh5eKwS9KLfFdYOBUx9ypuFGPkAFM=@vger.kernel.org, AJvYcCVvimmI8gWOqQdFHBo49iPodT3TlrHyz+XEMjmbejh+OAl3khW+fHZDcjT0yfidkHGZqztUjJFG@vger.kernel.org, AJvYcCVwx4hRvoReJfRFaHPyHFtGbJ4TAg8SXt5ISsV8f0TyPZUDgC5bGdpp+1GHRIoElO1tQk2CEgngUvbmxR8q@vger.kernel.org
X-Gm-Message-State: AOJu0YxpHWvVobifmNnQZWPjIOpePXVh/wzL8pAgNkdD6gRwSl3pmcJT
	mhDbD8DoQ66rjLH1DGZ8jKxECnW8k/LVWBqx3jn+QfqzweTnzv+p2yJpdO3ib3dxjySaURifZ9q
	B0OAAP6NU7KUt+4Exgh3KYPSyXSUcv/Y=
X-Gm-Gg: ASbGncv0fkH2HEB2MhDi6WJajnPHLjKDatUOMMzGyTl7CF2/CyUoZhVQYNk7rP0dK4m
	Xl70g4EITYWz8/2lHawSprcfawQHrDNlRpqzQ9+ypi5ABFYA35ImHh8EVSGwY/yQj60e+8pw+9I
	U6mqH9dfm0mzyDziiuAI8+/IZ5XISlWalhU8fQ88w6AB/uoA==
X-Google-Smtp-Source: AGHT+IFHVWo80PukRMotk+hrUJ+fxBcd9GLLavTH3Khe1xVyoxXVOyjwj6wdQSK1QmAD+VJ4LdjpZStVOLfsP5UN3AE=
X-Received: by 2002:a05:6000:400c:b0:3a4:d6aa:1277 with SMTP id
 ffacd0b85a97d-3a572e79d82mr16013900f8f.37.1750321341731; Thu, 19 Jun 2025
 01:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-2-john.madieu.xa@bp.renesas.com> <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
 <OSCPR01MB14647EFA0DA38119F00DF1D50FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <CAMuHMdWnz3VUeFaJBEgLc0F_gGkdm679H4YqFFuRAEVFKZd8OA@mail.gmail.com> <OSCPR01MB1464715327B4DDE8622B9B510FF7DA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
In-Reply-To: <OSCPR01MB1464715327B4DDE8622B9B510FF7DA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Jun 2025 09:21:54 +0100
X-Gm-Features: Ac12FXx6S7P0_zC19GoS7qaz5ecUd-8wy2yc7PZEpXtAmpsUFeCiZF4dWzyxAwU
Message-ID: <CA+V-a8sF2wmLEAp7uhxhKaNx_u9xTf9SR_y8rafyvYYaUgxYDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"robh@kernel.org" <robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"john.madieu@gmail.com" <john.madieu@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Thu, Jun 19, 2025 at 5:34=E2=80=AFAM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
> Hi Geert,
>
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Wednesday, June 18, 2025 1:02 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and rese=
t
> > signals for the GBETH IPs
> >
> > Hi John,
> >
> > On Wed, 18 Jun 2025 at 12:04, John Madieu <john.madieu.xa@bp.renesas.co=
m>
> > wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 11 Jun 2025
> > > > at 11:02, John Madieu <john.madieu.xa@bp.renesas.com>
> > > > wrote:
> > > > > Add clock and reset entries for the Gigabit Ethernet Interfaces
> > > > > (GBETH
> > > > > 0-1) IPs found on the RZ/G3E SoC. This includes various PLLs,
> > > > > dividers, and mux clocks needed by these two GBETH IPs.
> > > > >
> > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > > > > +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> >
> > > > > @@ -214,6 +252,30 @@ static const struct rzv2h_mod_clk
> > > > r9a09g047_mod_clks[] __initconst =3D {
> > > > >                                                 BUS_MSTOP(8,
> > BIT(4))),
> > > > >         DEF_MOD("sdhi_2_aclk",
> > CLK_PLLDTY_ACPU_DIV4,
> > > > 10, 14, 5, 14,
> > > > >                                                 BUS_MSTOP(8,
> > > > > BIT(4))),
> > > > > +       DEF_MOD("gbeth_0_clk_tx_i",
> > CLK_SMUX2_GBE0_TXCLK,
> > > > 11, 8, 5, 24,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(5))),
> > > > > +       DEF_MOD("gbeth_0_clk_rx_i",
> > CLK_SMUX2_GBE0_RXCLK,
> > > > 11, 9, 5, 25,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(5))),
> > > > > +       DEF_MOD("gbeth_0_clk_tx_180_i",
> > CLK_SMUX2_GBE0_TXCLK,
> > > > 11, 10, 5, 26,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(5))),
> > > > > +       DEF_MOD("gbeth_0_clk_rx_180_i",
> > CLK_SMUX2_GBE0_RXCLK,
> > > > 11, 11, 5, 27,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(5))),
> > > > > +       DEF_MOD("gbeth_0_aclk_csr_i",           CLK_PLLDTY_DIV8, =
11,
> > 12,
> > > > 5, 28,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(5))),
> > > > > +       DEF_MOD("gbeth_0_aclk_i",               CLK_PLLDTY_DIV8, =
11,
> > 13,
> > > > 5, 29,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(5))),
> > > > > +       DEF_MOD("gbeth_1_clk_tx_i",
> > CLK_SMUX2_GBE1_TXCLK,
> > > > 11, 14, 5, 30,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(6))),
> > > > > +       DEF_MOD("gbeth_1_clk_rx_i",
> > CLK_SMUX2_GBE1_RXCLK,
> > > > 11, 15, 5, 31,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(6))),
> > > > > +       DEF_MOD("gbeth_1_clk_tx_180_i",
> > CLK_SMUX2_GBE1_TXCLK,
> > > > 12, 0, 6, 0,
> > > >
> > > > scripts/checkpatch.pl says:
> > > >
> > > >     WARNING: please, no space before tabs
> > > >
> > >
> > > Noted.
> > >
> > > > > +                                               BUS_MSTOP(8,
> > BIT(6))),
> > > > > +       DEF_MOD("gbeth_1_clk_rx_180_i",
> > CLK_SMUX2_GBE1_RXCLK,
> > > > 12, 1, 6, 1,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(6))),
> > > > > +       DEF_MOD("gbeth_1_aclk_csr_i",           CLK_PLLDTY_DIV8, =
12,
> > 2,
> > > > 6, 2,
> > > > > +                                               BUS_MSTOP(8,
> > BIT(6))),
> > > > > +       DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8, =
12,
> > 3,
> > > > 6, 3,
> > > > > +                                               BUS_MSTOP(8,
> > > > > + BIT(6))),
> > > >
> > > > Shouldn't all of these use DEF_MOD_MUX_EXTERNAL() instead of
> > > > DEF_MOD(), like on RZ/V2H and RZ/V2N?
> > > >
> > >
> > > Do we really need to use DEF_MOD_MUX_EXTERNAL? Unlike for the RZ/V2H,
> > > On G3E, unbind/bind works with DEF_MOD. I can however switch to
> > > DEF_MOD_MUX_EXTERNAL for consistency if required.
> > >
> > > Please let me know.
> >
> > Does that mean the monitor bits on RZ/G3E do reflect the correct state =
of
> > external clocks? If yes, then DEF_MOD() is fine.
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
>
> Checked DEF_MOD() and had expected result. I'll then it and send v3.
>
Can you please share the devmem logs for external clocks please. I ask
because the HW team mentioned the below information will be added in
the RZ/V2H(P) HW manual. We need to check if below is not needed on
RZ/G3E.

"The clock gating cells require source clocks to operate correctly. If
the source clocks are stopped, these registers cannot be used."

Cheers,
Prabhakar

