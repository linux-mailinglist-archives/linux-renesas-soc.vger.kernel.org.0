Return-Path: <linux-renesas-soc+bounces-23099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CD6BDFCBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 19:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA1C3B62C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D358D33CE81;
	Wed, 15 Oct 2025 17:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax1dUAgF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68233A02C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547705; cv=none; b=j0QM2aFhU6MjiczFld9EYHVnaE4D4ZfLPJl04U6T3w8y+bao+KcbKaZ//mNQ4CM9WV3if2Bi1rQ87iKz4sCWdhkze1CnHu3ZwfGsOX3yTqrUf1RK7CWSNJfJMLcX4T7V0addAULgO+ncKukNnByclLCqo/OeTNjGrhHDzE1IFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547705; c=relaxed/simple;
	bh=wZR6LntXfylrJ2V1qOt0fxUP8eztdGw15uvAPV9vivY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zxw6mtlWZmzNv3DdCUaLZz2QB+3Fgby9pcj+r4SxmpXJ/phaZDUwNZr1ppg5dHWYOdU0qnga1PVbfnlheMy3WsFz6bpmbooiWUWOfnCUWqZIl9Hz+ysAbMoNjaGS2mCmYdlXCWVQ8tEIePYVowI4KMzKZMI0TwedQzySoszEf48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ax1dUAgF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso5662575f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760547702; x=1761152502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaW+UC1rq0W26plsE3XiljyBBYTy7XtdEOWVsRu/CF4=;
        b=ax1dUAgF/U95+L6xAJK5KBZWQK/+0ySfcT2o8X9wXDCjvW7IbS12nuLwyzqL6OdeMy
         9VlFIQ8yirXBY4oMf7rfCM465B5DNd3Wk7SvB4crbpSZS8Ap+rSZSNmFo3yKz5fqrOyI
         D1+VsUDts+DomVczXAEV+yNrvsyoKh9Yd81+5tM3vTNCGiL3Ppdcp/hx7GpmrsqzQZPB
         A2wGQ3eRAUG+Z9oFN6rcVV8s9eGtuRoiDTxoeylzfvvfWi9OetQoskSyAD8s4/0vW3Nn
         dmUjcVqMiBYf3uhdTTXiaFDTRp7bJpAT1SWqGscDG/EUVGwS5fbbfDLnVAUYrfINcLpD
         DceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547702; x=1761152502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaW+UC1rq0W26plsE3XiljyBBYTy7XtdEOWVsRu/CF4=;
        b=s+vpBun1ogmBOdacGOfBd7k9JhfIXq2zYxu0IQ+kExjJvEZKpHlZ72V/a98wxZsDYk
         O2NPa3y0ZyoTPPSzImRsTmm4t3mJv6Huar0fAJq/LcX3GoyEIxWOlvlg3zPRyji8U8Ns
         lWNgtFZCN2NXRIv2TOsfWNpdMJwloQdWZmFhcISq3HmMIaFVxH8ZD3FQAMdQShwupNoQ
         sf/N3plw/OJajutEO7JHZN6F8tv4kB7/DTXFxUy0Ub2fTMvMiroBegj1u6sJbMOJt6Tt
         h/yABl/8MM4UhQzT1bvOv7T20gbDYo59HrytxGXhyhwq8cpg6Rt6shlTnmwSKv5d3H8a
         mBXw==
X-Forwarded-Encrypted: i=1; AJvYcCVtBwebQnlKLl0ICtnwFE5fOCIRuFcdhtdtRW+DODv6gulKF27hEKzy5B732TlEpR1e3ni5ehDQVQcHP6l4H0QhTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9me0b2YGmRI2ihfapRMZ2ynFjQ7fzrqocRgjfr5Tc3DaO/kX
	DPfireDEGThOogfKv+qXY8TFkwqPXGmt23KoqB7AyAnkcYn1QDKyBdxRX7sSVac5/iEXay9yu05
	1aujcRXVaNRLm3V0JZ4S8fvGg9SLAgdw=
X-Gm-Gg: ASbGnculBAlhva7BGfmXpnnEixOzp9CIHOmBaPNZ7Z9AJmP9KZ1mQlzSjP2+iik6K0N
	MRjg8G8Olb/eO9nw0rBR4lIjCU04wwDCJ+6bU8nPMT8HgUTamVIOcOFKb/NDWhzpX1Xao5f75rD
	FkeXRyKvfCjdjXg1R/Dvh+Yg5Zwlfm4Vv9+zbb9YYuOI611nIfPz6ZWt2ywgr7ZSbKMV7jh3CqI
	6FuLmJlYxJfJcRA8+ZESoaPjappMZbKhd/W3jwT9clycs42fNfkSeDde+xj
X-Google-Smtp-Source: AGHT+IH5q1G3vp7aIr9j+CFjigJLEQjjsDRUdRuc/pR1f5LEo5EYFqYYYI4jZqNguXo6x33gVKJAo9u1xzKoFN4WqTc=
X-Received: by 2002:a05:6000:2389:b0:3fd:eb15:77a with SMTP id
 ffacd0b85a97d-42666ac2da4mr17608172f8f.6.1760547700123; Wed, 15 Oct 2025
 10:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015150026.117587-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251015155622.GE439570@ragnatech.se>
In-Reply-To: <20251015155622.GE439570@ragnatech.se>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 15 Oct 2025 18:01:13 +0100
X-Gm-Features: AS18NWCWlXKzJu_T8GRmOVtHfDBm-KRfIcMNJ-tWiuVV4eOyaIOISimJkQVzUdE
Message-ID: <CA+V-a8vudn0=kSnaAT4qDCcRtVShmS+n2A4GOQH2iogYizUBzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: ravb: Enforce descriptor type ordering to
 prevent early DMA start
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

On Wed, Oct 15, 2025 at 4:56=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hi Prabhakar,
>
> Thanks for your work.
>
> On 2025-10-15 16:00:26 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Ensure TX descriptor type fields are written in a safe order so the DMA
> > engine does not begin processing a chain before all descriptors are
> > fully initialised.
> >
> > For multi-descriptor transmissions the driver writes DT_FEND into the
> > last descriptor and DT_FSTART into the first. The DMA engine starts
> > processing when it sees DT_FSTART. If the compiler or CPU reorders the
> > writes and publishes DT_FSTART before DT_FEND, the DMA can start early
> > and process an incomplete chain, leading to corrupted transmissions or
> > DMA errors.
> >
> > Fix this by writing DT_FEND before the dma_wmb() barrier, executing
> > dma_wmb() immediately before DT_FSTART (or DT_FSINGLE in the single
> > descriptor case), and then adding a wmb() after the type updates to
> > ensure CPU-side ordering before ringing the hardware doorbell.
> >
> > On an RZ/G2L platform running an RT kernel, this reordering hazard was
> > observed as TX stalls and timeouts:
> >
> >   [  372.968431] NETDEV WATCHDOG: end0 (ravb): transmit queue 0 timed o=
ut
> >   [  372.968494] WARNING: CPU: 0 PID: 10 at net/sched/sch_generic.c:467=
 dev_watchdog+0x4a4/0x4ac
> >   [  373.969291] ravb 11c20000.ethernet end0: transmit timed out, statu=
s 00000000, resetting...
> >
> > This change enforces the required ordering and prevents the DMA engine
> > from observing DT_FSTART before the rest of the descriptor chain is
> > valid.
> >
> > Fixes: 2f45d1902acf ("ravb: minimize TX data copying")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> > index a200e205825a..2a995fa9bfff 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -2211,15 +2211,19 @@ static netdev_tx_t ravb_start_xmit(struct sk_bu=
ff *skb, struct net_device *ndev)
> >
> >               skb_tx_timestamp(skb);
> >       }
> > -     /* Descriptor type must be set after all the above writes */
> > -     dma_wmb();
> > +
> > +     /* For multi-descriptors set DT_FEND before calling dma_wmb() */
> >       if (num_tx_desc > 1) {
> >               desc->die_dt =3D DT_FEND;
> >               desc--;
> > -             desc->die_dt =3D DT_FSTART;
> > -     } else {
> > -             desc->die_dt =3D DT_FSINGLE;
> >       }
> > +
> > +     /* Descriptor type must be set after all the above writes */
> > +     dma_wmb();
> > +     desc->die_dt =3D (num_tx_desc > 1) ? DT_FSTART : DT_FSINGLE;
>
> IMHO it's ugly to evaluate num_tx_desc twice. I would rather just open
> code the full steps in each branch of the if above. It would make it
> easier to read and understand.
>
I did this just to avoid compiler optimizations. With the previous
similar code on 5.10 CIP RT it was observed that the compiler
optimized code in such a way that the DT_FSTART was written first
before DT_FEND while the DMA was active because of which we ran into
DMA issues causing QEF errors.

> > +
> > +     /* Ensure data is written to RAM before initiating DMA transfer *=
/
> > +     wmb();
>
> All of this looks a bit odd, why not just do a single dma_wmb() or wmb()
> before ringing the doorbell? Maybe I'm missing something obvious?
>
This wmb() was mainly added to ensure all the descriptor data is in
RAM. The HW manual for RZ/G1/2, R-Car Gen1/2 and RZ/G2L family
mentions that we need to read back the last written descriptor before
triggering the DMA. Please let me know if you think this can be
handled differently.

Cheers,
Prabhakar

> >       ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
> >
> >       priv->cur_tx[q] +=3D num_tx_desc;
> > --
> > 2.43.0
> >
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund

