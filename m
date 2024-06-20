Return-Path: <linux-renesas-soc+bounces-6524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B573C90FF01
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 10:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4112D1F26097
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 08:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC763CF65;
	Thu, 20 Jun 2024 08:37:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1176D54720
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718872628; cv=none; b=TudjeeGMNoShHJf7leQYq8iyGPCsNcjSUoEUBhpDXg7SrYUwIVE7IBvZZnjmmg+xTzIrKJzAcVU/Cp4cNLgOrqHJnaKQFsyOvApJHM/agnqecDANYYZR3i+bamFMZMuzIzjO3Ta64tYss3QnEbJaq4YTk9Z+7YnTImA5Q5+cJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718872628; c=relaxed/simple;
	bh=WpU6MR8HUlrZjx1A5zd9M4agh9yZX9KrP1cPaYNpW+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hhuqyz2MBAVU41LaF0VCHDkAAh9y/bpHYI0Bbai6Jq00RqewS8EwIVWdbcBmn+xuZf8G/iCodS5xZ7Rwbofyau9tGp/MGu1KywotBNxoby+fKWRJmrcawjozjoggo/4+LR8x2vbxQ1SM+ACrm2nLmv4QXrrY+6io7u9RdNqGrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e02bda4aba3so628669276.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 01:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718872624; x=1719477424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCl+YUVKslfLT0hk0NaDyWu3rTuDPls8CkOUTvZ5oy0=;
        b=DKxb4079sMmhttgAa//WIii50sf3aA4OovkEMaeCYTpmL8LvYyLF0cQXmZrJUMNdgJ
         A2rR+9hnL9f0S9T+iWiiKmtxlcjlMvwWY84Ei26MnRii0dgji05mtG2BV3t1vF1q4ch4
         b8ywjY2dpdKp5DQmnFdxY6SQF3XsBuespoLNcrVTk//yHWqWs3M66xIUQ7R/+BH0YSgJ
         v9Nuy6c+/LQvdlrdogm63g/3OCZbIzsYvBt6oiwwNKxRVAVxcumrTJIucO9EYBq0nmId
         CDlRSO5K8ZOMMNs8KubIl6wBma2xB/ruUPLKs9oMKfFHq7ydLEvGipdA+QL4YyvrMfhG
         F1iA==
X-Forwarded-Encrypted: i=1; AJvYcCV/o1hRgDwrf9I9ADRrO9EIPVXI9R8IWg2HUVA/d3TRLOrptShMxdMgk0VyKnEQ3czrRHQMu4/HKSq1wOq9RebFhR8EXkRBGQ3qFzSEl6X+WRY=
X-Gm-Message-State: AOJu0YwPGl0FrZ4s9rO4063cqEYsFvUTzwSiSl0sN0iivMCIQihY42Zt
	Df06/0qOPWYe4eXBKkBc8QHJTd8V9cXVveM+/OJLw49gNp3C6xo2qJMW7+da
X-Google-Smtp-Source: AGHT+IHSFBPyuaL49xyieNRtIaXqDDzI+zVKiCQuZ6zldVGHzshd7XHUnpKSRDsf3bfVMTIBGdFyWw==
X-Received: by 2002:a25:d6d8:0:b0:dff:2e24:9e8e with SMTP id 3f1490d57ef6-e02be10b97bmr4589920276.11.1718872623710;
        Thu, 20 Jun 2024 01:37:03 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff0466880bsm3382802276.9.2024.06.20.01.37.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 01:37:03 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfdff9771f8so545690276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 01:37:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6zDPXOonRVUemRqlAp4TgKCVRzrvqeBaGZrWEurUapWXTXyI+RjPmOT2SNLXrrzd9oEurZKG/W4wHP13RyCjejYITvA99i6PMEY0DyEQwmbQ=
X-Received: by 2002:a25:5f0f:0:b0:e02:b793:8ad1 with SMTP id
 3f1490d57ef6-e02be22eefbmr4913668276.58.1718872622937; Thu, 20 Jun 2024
 01:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f0ef3e00aec461beb33869ab69ccb44a23d78f51.1718378166.git.geert+renesas@glider.be>
 <f757f4a2-2ac5-3005-93e2-aaaab6e95e30@omp.ru>
In-Reply-To: <f757f4a2-2ac5-3005-93e2-aaaab6e95e30@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 10:36:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiWSy0_ToE50Q8Tq23xyOxWnG-eQtyn0B=x44ca6rkoQ@mail.gmail.com>
Message-ID: <CAMuHMdWiWSy0_ToE50Q8Tq23xyOxWnG-eQtyn0B=x44ca6rkoQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] net: ravb: Add MII support for R-Car V4M
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Wed, Jun 19, 2024 at 9:01=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru>=
 wrote:
> On 6/14/24 6:25 PM, Geert Uytterhoeven wrote:
> > All EtherAVB instances on R-Car Gen3/Gen4 SoCs support the RGMII
> > interface.  In addition, the first two EtherAVB instances on R-Car V4M
> > also support the MII interface, but this is not yet supported by the
> > driver.
> >
> > Add support for MII to the R-Car Gen3/Gen4-specific EMAC initialization
> > function, by selecting the MII clock instead of the RGMII clock when th=
e
>
>    But why are you adding such code to the ge3 function? According to the=
 gen3
> manual I have, gen3 SoCs don't have MII support...

I wanted to limit the number of changes, and avoid the need to add
an additional ravb_hw_info structure.  The bit is documented to be
zero on R-Car Gen3 (but writing one to it seems to stick on some of
the later Gen3 variants, so perhaps these do support MII?).

> > PHY interface is MII.  Note that all implementations of EtherAVB on
> > R-Car Gen3/Gen4 SoCs have the APSR register, but only MII-capable
> > instances are documented to have the MIISELECT bit, which has a
> > documented value of zero when reserved.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> [...]
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> > index c1546b916e4ef581..cbe2709e0ace871f 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -579,6 +579,16 @@ static void ravb_emac_init_rcar(struct net_device =
*ndev)
> >       ravb_write(ndev, ECSIPR_ICDIP | ECSIPR_MPDIP | ECSIPR_LCHNGIP, EC=
SIPR);
> >  }
> >
> > +static void ravb_emac_init_rcar_apsr(struct net_device *ndev)
>
>    No, this name doesn't match the currently used naming scheme (which
> has the SoC type as a last word... I'm suggesting something like ravb_ema=
c_init_rcar_gen4() instead.
>
> [...]
> > @@ -2657,7 +2667,7 @@ static const struct ravb_hw_info ravb_gen3_hw_inf=
o =3D {
> >       .set_rate =3D ravb_set_rate_rcar,
> >       .set_feature =3D ravb_set_features_rcar,
> >       .dmac_init =3D ravb_dmac_init_rcar,
> > -     .emac_init =3D ravb_emac_init_rcar,
> > +     .emac_init =3D ravb_emac_init_rcar_apsr,
>
>    I'm afraid we'll have to add the new ravb_gen4_hw_info variable. We al=
ready
> have the gen4-specific compatible in ravb_match_table[]...

If you insist, I will make a v2 doing so...

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

