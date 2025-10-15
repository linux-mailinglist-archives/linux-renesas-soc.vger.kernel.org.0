Return-Path: <linux-renesas-soc+bounces-23100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1030BDFCF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 19:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 791683B7D5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F3F33CE93;
	Wed, 15 Oct 2025 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA9u4T8A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCB732E75F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547965; cv=none; b=pgPrM/EzkZtjjk4eiiJ5RWr+Q2bgTcIkvOwc2jYcnWKdN4mHtnvyb5B7DPJZGTbwxtcX7AwJV/LC+JhLwDV6Mu/j5L0aprLXM8XDTk+n6YKoilr/geHx8FpwTsP1+WGsXPPh7UDC2yFK/eQ++P5WR9yTx7BwKZk1MXDOWznB8M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547965; c=relaxed/simple;
	bh=ZRj4yj/dKCCw4SWLghqAcuiSwYLPhJ4yuDL64uAxDnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0l3fx7oLnX+rBSTAHrg7cr8enryQYW624kowb8Q2sa015aQYXyUiceJb8GLTzunBK3XlUEEErquCcW1P+fFbIc8tG0C4AT+dG0A/3wUJU/R7pxRDMgw07Xl0Ydj1fRyHtvcIWJiR823xxgmUKJ13bQa7kfW33KROUVu6crUDZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA9u4T8A; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46b303f7469so47514545e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 10:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760547961; x=1761152761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAkTMQSX/DJUiILggSnm+16NO/7qs2Cgt/X+vx3kuHk=;
        b=MA9u4T8ALuAdvYyQht5t0Onkqed/vNRwbUida/LZuV0X6ZKq10kKkA+qw4kCOpHJTB
         CQx3OZJwYkmmOQ9fbfPwuaa6WrLyusvCKrR4GFUVguaLGLMTX3EtvtAoqiwyVuCpPcv8
         HNRgoLxdO7bTylTis/KTTtH1ojqCylndEXCoDQlpnuzhhdOm/iZtpAVZzp9xYNByNAE1
         2WYHeknJSNkbijMxNOvSTw6cB0o6mbh9p7LwHguMGrrxeWkZ+kevkZgfssd4vrAfeQ7+
         2aRyekDSXSjIxAlaIKdkrZTbY+NqbMJzdWrjYWOeFVKnAKzfFpT3MhrRDtpwNjzPFaH+
         jBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547961; x=1761152761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAkTMQSX/DJUiILggSnm+16NO/7qs2Cgt/X+vx3kuHk=;
        b=gnP2X/aXxUjamORqI7V3KBYZU+spj1wfNu9j48Vv+2DZJhgYbLSRgcqmnLBKCaeXjK
         6YVNb6p3dPmooyQsQ3RoJbp2r3y5RL0jMkt4kteyd2z2+YXesI7qNyJ6JvxOVHJHTbD6
         UT4JCf5rDiCvg88MS3mL/fJBtMPwq45Oj+VHH2QjJPKfvrbnOpju9MUgdYCrI8YL2AMW
         RjoBP8GV/7jIx+5GCAC1csSz/YIU3W2bJNeQ1OpubWRl/CV9tLKixPQ4fvOYc1wy3/cm
         s8orZQlFJnIr/LW8j7J9AEy0OMmqhEdz4SGFnXo2xZba6Vu2DyYWx9dDdP5/7gxfk+Ot
         e2hg==
X-Forwarded-Encrypted: i=1; AJvYcCXEjdOJfpclivKHFVrImdRwdBaWSGALAGhBuYtDq2al05kU5LNev4mTYRtz2uOzGPY5s3chyFWD8bRQLp9ePbFIMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtuPmDuOdMolcCh0aFWyJFtSBYah6IKy0EdxyClF7/TxNpETO1
	S+0HFITaourxQIz2+s3sBFBO0Lxr5aLwnx/wkjtwqEdbV37pMUUP4uBnFun+DLju/nT1McUIVv+
	qi2PRSWWjAW6thmvSdVWD3IVtGgK1txY=
X-Gm-Gg: ASbGncu4meOHIccRc7cHhXSY5XP5MJEhy4ev5jMgfTvw5tWfYo9r/AnoFZdJ5nhlw0l
	JilCkgxxnYTlIiAHE0GzJD/wn9JD9t627ZomV2jQUjPgkTBON7WPeSUY34zXV9Oct/a0pgf1OGo
	1vGJiovvE9VLue6rg4pSiEn5ihk+yA+uPmdf6MId+HlNW7K1iUadpQK2mMiExM46pu/osWnVARd
	HFOH1DkilzARzkzj447XYJNZa93964I4DYT9M9/gLz+SCFpgAIxsJGWRIucswQI6i+fL/I=
X-Google-Smtp-Source: AGHT+IHI7wNHnTiwaqUhiPR8CydFMYL65NRKSxFd39pyvhc1Mu/mg/YS2k0xCuKgzJyECEHhLkPG2NPYmawpE45EPMs=
X-Received: by 2002:a05:600c:529a:b0:46e:3e25:1626 with SMTP id
 5b1f17b1804b1-46fa9aefe15mr218668285e9.19.1760547960573; Wed, 15 Oct 2025
 10:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015150026.117587-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251015153556.GC439570@ragnatech.se>
In-Reply-To: <20251015153556.GC439570@ragnatech.se>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 15 Oct 2025 18:05:34 +0100
X-Gm-Features: AS18NWCeZXObMFBnMoScyXIU84ZFuSWIQLCEr-5cctebOmvYCISJdgFwzckySGU
Message-ID: <CA+V-a8vRXN+2CDQu=FkN_teTDLywzGPn_=8obvKC+3tmwYo4hA@mail.gmail.com>
Subject: Re: [PATCH 1/3] net: ravb: Make DBAT entry count configurable per-SoC
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thank you for the review.

On Wed, Oct 15, 2025 at 4:36=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hi Prabhakar,
>
> Thanks for your work.
>
> On 2025-10-15 16:00:24 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The number of CDARq (Current Descriptor Address Register) registers is =
not
> > fixed to 22 across all SoC variants. For example, the GBETH implementat=
ion
> > uses only two entries. Hardcoding the value leads to incorrect resource
> > allocation on such platforms.
> >
> > Pass the DBAT entry count through the per-SoC hardware info struct and =
use
> > it during probe instead of relying on a fixed constant. This ensures
> > correct descriptor table sizing and initialization across different SoC=
s.
> >
> > Fixes: feab85c7ccea ("ravb: Add support for RZ/G2L SoC")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I have not verified with documentation the setting of 2 for
> gbeth_hw_info. But the change itself is good.
>
> > ---
> >  drivers/net/ethernet/renesas/ravb.h      | 2 +-
> >  drivers/net/ethernet/renesas/ravb_main.c | 9 +++++++--
> >  2 files changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet=
/renesas/ravb.h
> > index 7b48060c250b..d65cd83ddd16 100644
> > --- a/drivers/net/ethernet/renesas/ravb.h
> > +++ b/drivers/net/ethernet/renesas/ravb.h
> > @@ -1017,7 +1017,6 @@ enum CSR2_BIT {
> >  #define CSR2_CSUM_ENABLE (CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4 | \
> >                         CSR2_RTCP6 | CSR2_RUDP6 | CSR2_RICMP6)
> >
> > -#define DBAT_ENTRY_NUM       22
> >  #define RX_QUEUE_OFFSET      4
> >  #define NUM_RX_QUEUE 2
> >  #define NUM_TX_QUEUE 2
> > @@ -1062,6 +1061,7 @@ struct ravb_hw_info {
> >       u32 rx_max_frame_size;
> >       u32 rx_buffer_size;
> >       u32 rx_desc_size;
> > +     u32 dbat_entry_num;
>
> I have been wondering for some time if we shall not start to document
> these fields as they always take so much time to get back to what each
> of them represent. How do you feel about starting a header?
>
> /**
>  * dbat_entry_num: Describe me here.
>  */
>
I agree, let's take this separately into a different patch as it will
make things easier to backport. What do you think?

Cheers,
Prabhakar

> Without, but preferably with, this added.
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
>
> >       unsigned aligned_tx: 1;
> >       unsigned coalesce_irqs:1;       /* Needs software IRQ coalescing =
*/
> >
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> > index 9d3bd65b85ff..69d382e8757d 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -2694,6 +2694,7 @@ static const struct ravb_hw_info ravb_gen2_hw_inf=
o =3D {
> >       .rx_buffer_size =3D SZ_2K +
> >                         SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> >       .rx_desc_size =3D sizeof(struct ravb_ex_rx_desc),
> > +     .dbat_entry_num =3D 22,
> >       .aligned_tx =3D 1,
> >       .gptp =3D 1,
> >       .nc_queues =3D 1,
> > @@ -2717,6 +2718,7 @@ static const struct ravb_hw_info ravb_gen3_hw_inf=
o =3D {
> >       .rx_buffer_size =3D SZ_2K +
> >                         SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> >       .rx_desc_size =3D sizeof(struct ravb_ex_rx_desc),
> > +     .dbat_entry_num =3D 22,
> >       .internal_delay =3D 1,
> >       .tx_counters =3D 1,
> >       .multi_irqs =3D 1,
> > @@ -2743,6 +2745,7 @@ static const struct ravb_hw_info ravb_gen4_hw_inf=
o =3D {
> >       .rx_buffer_size =3D SZ_2K +
> >                         SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> >       .rx_desc_size =3D sizeof(struct ravb_ex_rx_desc),
> > +     .dbat_entry_num =3D 22,
> >       .internal_delay =3D 1,
> >       .tx_counters =3D 1,
> >       .multi_irqs =3D 1,
> > @@ -2769,6 +2772,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_in=
fo =3D {
> >       .rx_buffer_size =3D SZ_2K +
> >                         SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> >       .rx_desc_size =3D sizeof(struct ravb_ex_rx_desc),
> > +     .dbat_entry_num =3D 22,
> >       .multi_irqs =3D 1,
> >       .err_mgmt_irqs =3D 1,
> >       .gptp =3D 1,
> > @@ -2794,6 +2798,7 @@ static const struct ravb_hw_info gbeth_hw_info =
=3D {
> >       .rx_max_frame_size =3D SZ_8K,
> >       .rx_buffer_size =3D SZ_2K,
> >       .rx_desc_size =3D sizeof(struct ravb_rx_desc),
> > +     .dbat_entry_num =3D 2,
> >       .aligned_tx =3D 1,
> >       .coalesce_irqs =3D 1,
> >       .tx_counters =3D 1,
> > @@ -3025,7 +3030,7 @@ static int ravb_probe(struct platform_device *pde=
v)
> >       ravb_parse_delay_mode(np, ndev);
> >
> >       /* Allocate descriptor base address table */
> > -     priv->desc_bat_size =3D sizeof(struct ravb_desc) * DBAT_ENTRY_NUM=
;
> > +     priv->desc_bat_size =3D sizeof(struct ravb_desc) * info->dbat_ent=
ry_num;
> >       priv->desc_bat =3D dma_alloc_coherent(ndev->dev.parent, priv->des=
c_bat_size,
> >                                           &priv->desc_bat_dma, GFP_KERN=
EL);
> >       if (!priv->desc_bat) {
> > @@ -3035,7 +3040,7 @@ static int ravb_probe(struct platform_device *pde=
v)
> >               error =3D -ENOMEM;
> >               goto out_rpm_put;
> >       }
> > -     for (q =3D RAVB_BE; q < DBAT_ENTRY_NUM; q++)
> > +     for (q =3D RAVB_BE; q < info->dbat_entry_num; q++)
> >               priv->desc_bat[q].die_dt =3D DT_EOS;
> >
> >       /* Initialise HW timestamp list */
> > --
> > 2.43.0
> >
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund

