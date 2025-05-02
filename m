Return-Path: <linux-renesas-soc+bounces-16635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EF5AA7119
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 14:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8354C4350
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8E322D4DB;
	Fri,  2 May 2025 12:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExLdPK6D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBA8246766;
	Fri,  2 May 2025 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187399; cv=none; b=iYGYzfe4IYLAE7IsmVXarHv3zcFcKdkr0uWSouFyocRVAcjZb4/VCcEhtOg+fwyaiAdk35YgxskbzEK6OapRoqAKqDCVASQfvbcUJPx6D2he+0tm9UmVfhXNCsoBbN76BlSeR9EuPIkMZ7KwUonph0y4X+aYEW0oIcBDBRNYaYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187399; c=relaxed/simple;
	bh=GQz2dJpRJ7vUnYei71FgsSOnYW8jKZ+/HVq/FKCwNdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVcTJ1npKpbQ85DRwYYt4YtTN+R5upuIPopX1WRrDE8N2UKetRkqUx95mRDQrRgaOLx7KBiBOovYSgFsxsL5GUzwvfgIgiNkdzeicuJigCOPmoKsHs4raUKKfroNiK6UMRfQoJtHi4pIkWkBI+xE86ts4dNCEVyc76pzEb+j768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExLdPK6D; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso10525405e9.3;
        Fri, 02 May 2025 05:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746187395; x=1746792195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqWxCBeXKwT4Q7O5k/lOSj32VTIJl7EqA4U6Ozcu9Ks=;
        b=ExLdPK6DzVaOtzVjVNFYowO4VOkd/3qmlXPPoCUDMBiKNSSlPoJqnYolJs++d0zjvi
         9UtoEchsI5GaoeTMzNNsv0F3W+kLGuX2iYLUFYMafgEY0PCHmHpwi42PlHtMQqwaAQM8
         rojQwCR8k7p4RkyuiMxdkij5HfS9jBQ/2t98nBfunFflqtzCU78OylDZ4fcBxi/BGj1W
         6skHOZatyIcv/oLVbDzgal1DD/MEHvvkzitQws3WnChWI8qZkD9VeUXs7asDsKwFDKj6
         LztTrNcC/JU1O8v36dg9Zv63Epg5IiphbwLq8bfX0OVzlS4YFPGK5SaRiPjRFm9BA5HB
         p9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187395; x=1746792195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqWxCBeXKwT4Q7O5k/lOSj32VTIJl7EqA4U6Ozcu9Ks=;
        b=QTZvQWtb4N9YGv6I+mfmqdaivA47tDre+ux0Nngj5fbTnms0dx5uqEHa/H8tOJkkNJ
         GaP/3B7vViBDj2n/thoJHYIklZk7V7ePh+LSdtTEIGJ+rIYSIebncWchm5DFB8f4RAcM
         +KBO5onV5kBOWFNC9MVicBDv+gVe56CaP7fbnIn3dR0LlxsY2TVV7WsL24c/CR5FrBZZ
         NW1HC/BLQCNSMl4glpc1iDaa0MKXP5a0LamGEsV4XWXrwtfKlx64bn96e9fzu/Zi+kZR
         gfXIZBzEwsZ0PsLksetcZz/4lcGYqf6W4G6LmuV0qQMXUStddGtGyqYIrXvT0yKbq9A0
         iJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCVqKO+EjH5nCyuJEJt1a36Z+2tFGYsaUleHp4gT4HmIC+RtLVB53zUqfuN9yHBH3LLdmT9lcgSqfBIw1B6JfxPCO18=@vger.kernel.org, AJvYcCXy8fC0L0UVKAOjCj5yGeriW4+2QeLEAcHMSvymebeXOw9ZvlNk1fEcvf3GhDtGjgNnTSV6pCGY9bEH4n4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3f4oT3HgHhwzUvEBdXy+P4YhhgzqycVXITnr8y5yzzJpNzqaS
	/hO3w8mDDdXhIt8nYBrHwUpNPegwSnkouBT3Il3hxP/ieso8jTA+uSo65JO9RvCzqjlPzR85SGp
	LjEwtDdOGvFR9DrBlBdViC7gnZEM=
X-Gm-Gg: ASbGncvjNBMVoTU+N+osEPpt3Zbm1QlO77l7YOg/ogN5ClYfl5r8923mSSfYIuZVbMV
	bQIei/uECSp4LPHhi0VZ5hASErc8+KI3A2OgJzYIPsK/7Owzo618rCbPKY2/MoGYTYBrDUaD0cU
	KbS/lpCFATPzoEqUw9kGatXX0=
X-Google-Smtp-Source: AGHT+IGy79Pyn5VrGGeuz9gpceT63f/NXyL0NkGnlV2uPeKHQseweS9ZhF7T2D3keAC6Nf6nm6WHZNQDnIvhGHp7zdA=
X-Received: by 2002:a05:6000:22c5:b0:39c:1f04:a646 with SMTP id
 ffacd0b85a97d-3a099ad6a88mr1746176f8f.13.1746187394679; Fri, 02 May 2025
 05:03:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415085438.83856-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUGK9-gs98e=j87Fm0C518x2JBpSP7d0EYXheN+NGZCDw@mail.gmail.com>
In-Reply-To: <CAMuHMdUGK9-gs98e=j87Fm0C518x2JBpSP7d0EYXheN+NGZCDw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 13:02:48 +0100
X-Gm-Features: ATxdqUHQGBerP5eMr0f-rq3MyD5C7qCmKT-mKusV-wJnDwLU3fBCan1ywh5mOWc
Message-ID: <CA+V-a8tAy-+3u9SR8rg+=sS+Dst+xAyfj9jxvPqj=siifeM7wQ@mail.gmail.com>
Subject: Re: [PATCH v3] soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, May 2, 2025 at 12:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 15 Apr 2025 at 10:54, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add SoC identification for the RZ/V2N SoC using the System Controller
> > (SYS) block.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Hi All,
> > This patch is from series [0]. Since most of the patches have already
> > been queued, I'm sending this one separately.
> >
> > [0] https://lore.kernel.org/all/20250407191628.323613-5-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/
> > Cheers, Prabhakar
> >
> > v2->v3:
> > - Updated dev_info message to include the SoC revision and feature flag=
s.
> > - Dropped `<linux/string.h>` include.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.16...
>
> > --- /dev/null
> > +++ b/drivers/soc/renesas/r9a09g056-sys.c
>
> > +static void rzv2n_sys_print_id(struct device *dev,
> > +                              void __iomem *sysc_base,
> > +                              struct soc_device_attribute *soc_dev_att=
r)
> > +{
> > +       unsigned int part_number;
> > +       u32 prr_val, mode_val;
> > +       u8 feature_flags;
> > +
> > +       prr_val =3D readl(sysc_base + SYS_LSI_PRR);
> > +       mode_val =3D readl(sysc_base + SYS_LSI_MODE);
> > +
> > +       /* Check GPU, ISP and Cryptographic configuration */
> > +       feature_flags =3D !(prr_val & SYS_LSI_PRR_GPU_DIS) ? SYS_RZV2N_=
FEATURE_G31 : 0;
> > +       feature_flags |=3D !(prr_val & SYS_LSI_PRR_ISP_DIS) ? SYS_RZV2N=
_FEATURE_C55 : 0;
> > +       feature_flags |=3D (mode_val & SYS_LSI_MODE_SEC_EN) ? SYS_RZV2N=
_FEATURE_SEC : 0;
> > +
> > +       part_number =3D 41 + feature_flags;
> > +
> > +       dev_info(dev, "Detected Renesas %s %sn%d Rev %s%s%s%s%s\n", soc=
_dev_attr->family,
> > +                soc_dev_attr->soc_id, part_number, soc_dev_attr->revis=
ion, feature_flags ?
> > +                " with" : "", feature_flags & SYS_RZV2N_FEATURE_G31 ? =
" GE3D (Mali-G31)" : "",
> > +                feature_flags & SYS_RZV2N_FEATURE_SEC ? " Cryptographi=
c engine" : "",
> > +                feature_flags & SYS_RZV2N_FEATURE_C55 ? " ISP (Mali-C5=
5)" : "");
>
> ... with the above reflowed to avoid splitting ternary expressions,
> and with part_number expanded to fill the free space.
>
Thank you for taking care of this.

Cheers,
Prabhakar

