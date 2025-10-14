Return-Path: <linux-renesas-soc+bounces-22991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBFEBD7E52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 09:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD65C4EC5DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 07:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2919130E823;
	Tue, 14 Oct 2025 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e50EonGE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059D30E0E0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760427022; cv=none; b=iyzuAKFNyA+bpCeBh+3jMFT6E8zf33JMFsDMKSZm8jujGGgvuvRiX0G+I1lYtEFknPm1kl2KfQSP4HMM2eTwLmPcDNkNy3az2vlmnhJTDH9EtAOTxxuUQ8wzR+qcjEelZ0nh2J8NSvmGSIN8zBUOZia9mF01J63UmnWzWIFGMMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760427022; c=relaxed/simple;
	bh=81NIS2/I72XFASdail0a4m5/ef/jzz2CXXhiC8R4kbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEimjUvxetJeyDzyIxAoyJqEZQifFR4FlGz3/e+uFP1A67DCTuLZ7odXjhZ0jq8u8sy+FU7Tof6tJGLIVDbW4b6FipNJixa4yKWHpulTI5w0wU/tvdUxVT6f4/N4ra0srz19BHcrLRvGpOxllcTThPzxV9RLyxLJb3i/2nwWeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e50EonGE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso4168793f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 00:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760427016; x=1761031816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjsmQsAWKR+AO8bY1bzFnlPN5sRWXcF5EVgjOHKuI0M=;
        b=e50EonGEjNkh0UPEI0QCgtwaqZVjMhrZZUPlBTn3sionV+1bpFkhzsOhxQz6FHEQzB
         4s0JsV6ZLO1+MPAbTHQoNETQRja0JCp2rDFvOkSZOsUo6c7aSeIyeH6bs6aW1iWzUkiG
         unTypavVglBMmX0Yslyc8FbFUsk5fXl4DulWG3gK9sKL4GaKU6SwsOntx3Ozb1tF4Dzo
         0Jsou2OI0utnnVSBxSXnO5kCBqCq6gu5aCXwm+dfjT6V42a4rEZ64cFDlO/cxCR06kAv
         BW9xzHiSLc1+HwdTDVTVy/6Y/CMCkwPE3ZQ1+CmwNUytRFxPxmDCy/lJYDlhOcPCnI/s
         jN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760427016; x=1761031816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjsmQsAWKR+AO8bY1bzFnlPN5sRWXcF5EVgjOHKuI0M=;
        b=q0TJK7TY/sjCpxM5u3D3hfAfLF1o3nqCPlGtDxzoQaeq6q5sf0ZjeNP2S/opvwDBfH
         MPuVuS/buY+2PZHHLe37pEDM74L01Ggnxztw+SeOF0rsOQp0C9CPGriv3BMOYDVaHCQ0
         gcqxUVk0T3yup++sIET7fUtSz7Vq+P96xQXEgFEKqSnK/xaKU0ofekplEdvcuHN6yru8
         WC0WG1cyX+awMmZXF951wCbREHGUh9wjlamYe3P2FlQoXHCP8XkaAz282jaygD8euBRO
         i29dTsbk3YQWRFwi0vL7gk7N0SBxf/eUtSJhHzE/z4L7zo9UApqm+5MSypNEETBb3VGq
         LNZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6TxWIdV7digEOD3r/J10pM7y8xhV2craOmrdJ9Kkng6YuWIUULEteJ+pbfViZm97s/6gijaCiXt1fEu6Jx3aOFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycswcDKgS1oqGm4kItJRNaZdVGMmbvct6u1Z20AU3l9f0N7nDf
	6zsNfQ9s24EA/pxeBMVmTI2NyubDVHx3j+E2PII6hCFGG9+cZjx0vbfi3jGxh81GrCJDBK3s8oZ
	2kxsDtxWtnQhZKtABdJuy/dziBslWga4=
X-Gm-Gg: ASbGnctsXawgGVwEWKk9lgb4WYz+rjg9UaveV1CKhvH+A4B4hKF7tZZd4//ET+9Cir2
	qXAbLFtZGzUyeSbamyUwatuHVAksUCsQ7MftgV+DDK8hPv8+Hq9C+leaNTFzzfExPiwcjW22Ngk
	EI8XyWo0QeBZsvOjtNVceZgQZUUE7yUgIiDKYVyEKNol6C1EmPsJJEcQQj+3v+SMj+qeWtL46q1
	ubWMEnbsw/u/ZjIw2HxaSUp/oS3X4H7IS5cIiexKxysF44FMce2Z7a7/nAsBBVF5CRb+EY=
X-Google-Smtp-Source: AGHT+IGo7dR5zdkJW3D/xH2KEeFf0lt7zeOM+boGa6AgEN+BBljNynuJv9D8o0+h3AZSmE1WSPqAQ/2P1ihf02bfAdk=
X-Received: by 2002:a05:6000:2504:b0:3ee:11d1:2a1e with SMTP id
 ffacd0b85a97d-425829b0d45mr20308975f8f.10.1760427016268; Tue, 14 Oct 2025
 00:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com>
 <CA+V-a8urG_e4yZXg9VH-cOPeK62qPGR1L2Zbbc3O97WB22hcRw@mail.gmail.com> <CAMuHMdWNnmmXPxPiuO4r66Mc78gPQ7ticuKt3y5pJ_DqRu_aLQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWNnmmXPxPiuO4r66Mc78gPQ7ticuKt3y5pJ_DqRu_aLQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Oct 2025 08:29:50 +0100
X-Gm-Features: AS18NWCxsWOjy_XXbh2jQTyRM-GYEcEmaxy6wnT40dQ2eoo0RQ-PYJ_CEFPFTxU
Message-ID: <CA+V-a8tvd1uWNWqLSt4TQ-rD4Odfy0SiFX-4tWA2wsqae1wTeA@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
To: Geert Uytterhoeven <geert@linux-m68k.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Oct 14, 2025 at 7:46=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 13 Oct 2025 at 18:45, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Oct 13, 2025 at 4:46=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 29 Sept 2025 at 13:23, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add support for module reset handling on the RZ/T2H SoC. Unlike ear=
lier
> > > > CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Contro=
l
> > > > Registers (MRCR) where both reset and deassert actions are done via
> > > > read-modify-write (RMW) to the same register.
> > > >
> > > > Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and a=
ssign
> > > > it to reset_regs. For this SoC, the number of resets is based on th=
e
> > > > number of MRCR registers rather than the number of module clocks. A=
lso
> > > > add cpg_mrcr_reset_ops to implement reset, assert, and deassert usi=
ng RMW
> > > > while holding the spinlock. This follows the RZ/T2H requirements, w=
here
> > > > processing after releasing a module reset must be secured by perfor=
ming
> > > > seven dummy reads of the same register, and where a module that is =
reset
> > > > and released again must ensure the target bit in the Module Reset C=
ontrol
> > > > Register is set to 1.
> > > >
> > > > Update the reset controller registration to select cpg_mrcr_reset_o=
ps for
> > > > RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other SoC=
s.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v3->v4:
> > > > - Renamed cpg_mrcr_set_bit() to cpg_mrcr_set_reset_state() for clar=
ity.
> > > > - Updated the parameters in cpg_mrcr_set_reset_state().
> > >
> > > Thanks for the update!
> > >
> > > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > @@ -736,6 +754,72 @@ static int cpg_mssr_status(struct reset_contro=
ller_dev *rcdev,
> > > >         return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & =
bitmask);
> > > >  }
> > > >
> > > > +static int cpg_mrcr_set_reset_state(struct reset_controller_dev *r=
cdev,
> > > > +                                   unsigned long id, bool set)
> > > > +{
> > > > +       struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> > > > +       unsigned int reg =3D id / 32;
> > > > +       unsigned int bit =3D id % 32;
> > > > +       u32 bitmask =3D BIT(bit);
> > > > +       void __iomem *reg_addr;
> > > > +       unsigned long flags;
> > > > +       unsigned int i;
> > > > +       u32 val;
> > > > +
> > > > +       dev_dbg(priv->dev, "%s %u%02u\n", set ? "assert" : "deasser=
t", reg, bit);
> > > > +
> > > > +       spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> > > > +
> > > > +       reg_addr =3D priv->pub.base0 + priv->reset_regs[reg];
> > > > +       /* Read current value and modify */
> > > > +       val =3D readl(reg_addr);
> > > > +       if (set)
> > > > +               val |=3D bitmask;
> > > > +       else
> > > > +               val &=3D ~bitmask;
> > > > +       writel(val, reg_addr);
> > > > +
> > > > +       /*
> > > > +        * For secure processing after release from a module reset,=
 dummy read
> > > > +        * the same register at least seven times.
> > >
> > > This comment is waiting to become out-of-sync with the actual value..=
.
> > >
> > For the reset operation no, for this I would like to keep this as is.
> > But for the MSTP registers I will be adding a delay. Or did I
> > misunderstand something?
>
> How to make sure both "#define RZT2H_RESET_REG_READ_COUNT 7" and
> "seven" are updated together?
>
>     /*
>      * For secure processing after release from a module reset, one must
>      * perform multiple dummy reads of the same register.
>      */
>
Ahh got you now, thanks for the clarification.

> >
> > > > +        */
> > > > +       for (i =3D 0; !set && i < RZT2H_RESET_REG_READ_COUNT; i++)
> > > > +               readl(reg_addr);
> > > > +
> > > > +       /* Verify the operation */
> > > > +       val =3D readl(reg_addr);
> > > > +       if ((set && !(bitmask & val)) || (!set && (bitmask & val)))=
 {
> > >
> > > Perhaps just "set =3D=3D !(bitmask & val)"? Or is that too obscure?
> > >
> > Ok, I will update it to the above in v5.
>
> No need to resend yet, I could make these changes while applying
> (when Philipp is happy).
>
Ok, thank you.


Cheers,
Prabhakar

