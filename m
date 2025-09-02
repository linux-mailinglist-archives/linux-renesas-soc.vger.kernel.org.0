Return-Path: <linux-renesas-soc+bounces-21201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D0B40673
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 16:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 090DD1882ECC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4B42FFDF8;
	Tue,  2 Sep 2025 14:16:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851D2F5319;
	Tue,  2 Sep 2025 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822588; cv=none; b=ZCbAFl7h7TeFDZaNE/4iFXS+fyAgDC38cnRQiITBMQ840vD7obVNvomhql0E25yR3MgZFEtGv1JEiur4rfAZ5H1cMKZ7vWU3nd2KIu9W8SBNsqN6kkOdTVvIfzzCZ3voEj/TcWPX7PPTo8p33OTkSmqLs7Xrs0m8yMZcz8ZF4TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822588; c=relaxed/simple;
	bh=aLYrm488cnjvOdQN668BCxj/bZGtyadmcl2EeBCMeI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shWJyYlVbCvPz7ENIf5Ptsju8hnDgU0efEoOg0xezpQ3JS4I19G2Gg9Z1P6koK//WH/ldmGsZgzW7/WEPyYBxiit8aKqwhKJFNBNP6NtxckeD5CGjg1l/s2TkyJLkwmLetHDeZAek7sELKuSlNZDsOeHJ+npXYJxsdK1oj8gxIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-51d14932f27so2055697137.2;
        Tue, 02 Sep 2025 07:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822586; x=1757427386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfSSUfoJsOrjvJVwoZq1zlYEdtTdA2IpfCtnao4jICE=;
        b=csFrTwmHPiO/ew+IbTEysiOcRf2PUlc30xt2HzNZCbFEFXfyDbfjTSA5XCgKVgrOIw
         hR0rwOEJipNd10ly235z2MS4Mjdu3y0xwR6ZKxjk+KvR0eH6W53XryL+kjl6VGvqIBuw
         9nTfVQGysBsPtjqI2FWNbCEjraIY0lTD8xI++yuIoVYOUBzD1szFFUXd6AfeT1/1Dq9C
         yNii1oyn9ZewlGLjDdaBAin9qHSCWOYkyWo+GuoCEStDzgXnq0WChgSgp1Fpg61FF49+
         8RevdOJq30CSixLG7Npx01npuqMy2w3ejVC/sUsSQ4haB0jc0o/KqqhAosN/SeSAORdo
         +buQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0jaT3B6nY36kJ9WhouhOw1J2esHtcBqg4kY0MpycomqlVvbDb3z4CvP9ZNa/Y8+mhBRyK92HfmdO4gz+z@vger.kernel.org, AJvYcCV/1xebIRScbqzV6bYpZy9S4lMlXJWK3b11trO4cjaRfRJsJgyd8rKxY2DO4MyNnLG6BGCCLZ0m25w=@vger.kernel.org, AJvYcCXiAznlgEMtd8CLua+2UiqbfkWICOA0OQCbwS8ILxFcCQjdRBLGxvvQjcZC38XDna1Ra8gbGslAyXM5asAwODPa7wI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/p1biaI4baqmfoUdn2SkBL3QvwVnzrAC7cfrlJCPa9mfbByjL
	RoXjeiYDTRQ6keMdeMmtb0xbrKBX4d4xCLGmazy8mA/HRhLfoLnPkarE0wZ2jR6p
X-Gm-Gg: ASbGncsprm9LvSzAV1TfZk05brBRV/iT0Hqv5QvPVzSOq18/d8L60BZP8R+03Wy/M9h
	ufQyB9IWzUWfDlTW4BTsN9lHjEfsGamOGbVABGBZpdmCCbmS0AFZRYCGkHY6lBh2znuFBqScSV3
	TKeFWvZpPIRb11VN/ACzg6fc0MPSmVGxaEOP32kYRtffz8bQd6bTAIDpqjQltNr6kCsrN7+rc8/
	2aZvr9HpbAa7R1pLIQXvlR9U3HAWE1GVJn6JAg2qTADZUgNY0qZifjPENiJ72UEuYyLbLhZ/D+M
	omYoqpgo2sm0lFfS5yjqtb3JW69vAdS3KyfFs4M6Ji5DRdQo18FEp0hBbspyAeRXhD7I1pyhTSw
	5D7fmHLTjpi65TzetgXp0onS3A4PSKN2EWk2PgIdd5xb6wUYey5bynQhwpsUPNgNE
X-Google-Smtp-Source: AGHT+IFELOyrMJzqmh8+z/WPRRlEssMUhPkccMXAnvKn0xcP8VaubdRrRCIn+hL/3/DOXawdGK4Jhg==
X-Received: by 2002:a05:6102:5a8c:b0:524:c7ab:6bef with SMTP id ada2fe7eead31-52b1b809c7fmr2944043137.22.1756822585310;
        Tue, 02 Sep 2025 07:16:25 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af214e18csm4115515137.15.2025.09.02.07.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 07:16:25 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54487445158so1455201e0c.3;
        Tue, 02 Sep 2025 07:16:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIYCKgJ4r/SYEsXnvanIWnvGQKBIC6+OYRty10TGU1Yq4tYEn4h8DwH9HWgHpUQDXLfjg6QYzFHEFHJxmTQ85WPhk=@vger.kernel.org, AJvYcCWmq31uuk+gC6qPZdszPYqHI5xR1/kwmtp4rpfN/owsHoPPhZ0PEk7jpzNyAZW9/YLF5rnmpENr7v6icjWx@vger.kernel.org, AJvYcCWp7R++vbT9mWLbgw5Ojn0DsHheLp7o7blMXYUutPY+53Xivrrjz2GGRDeHbMPuAvAbHTOsbErnQW8=@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:523:146a:f2b with SMTP id
 ada2fe7eead31-52b1c7726ddmr2935240137.33.1756822583673; Tue, 02 Sep 2025
 07:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
 <20250820100428.233913-3-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdU_grYXJF_L77-6np9iiVGvo52Z7TXN=ft97BuPX2BGxQ@mail.gmail.com> <aLb2Zh3ENS6B_ik4@tom-desktop>
In-Reply-To: <aLb2Zh3ENS6B_ik4@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 16:16:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUm4c0RSQ=pOz9dC7cuHA2STJaQ_d4ded9-rw3orcyGA@mail.gmail.com>
X-Gm-Features: Ac12FXxyyfCVXb3F2ZqmKrkuDDUj-8VXPn1prUKjBOQts4mSy_Ebt4zRvv6nxs0
Message-ID: <CAMuHMdXUm4c0RSQ=pOz9dC7cuHA2STJaQ_d4ded9-rw3orcyGA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rzg2l: Re-assert reset on deassert timeout
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

On Tue, 2 Sept 2025 at 15:51, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Sep 02, 2025 at 02:18:17PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Prevent issues during reset deassertion by re-asserting the reset if =
a
> > > timeout occurs when trying to deassert. This ensures the reset line i=
s in a
> > > known state and improves reliability for hardware that may not immedi=
ately
> > > clear the reset monitor bit.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > @@ -1667,9 +1667,16 @@ static int __rzg2l_cpg_assert(struct reset_con=
troller_dev *rcdev,
> > >                 return 0;
> > >         }
> > >
> > > -       return readl_poll_timeout_atomic(priv->base + reg, value,
> > > -                                        assert ? (value & mask) : !(=
value & mask),
> > > -                                        10, 200);
> > > +       ret =3D readl_poll_timeout_atomic(priv->base + reg, value,
> > > +                                       assert ? (value & mask) : !(v=
alue & mask),
> > > +                                       10, 200);
> > > +       if (ret && !assert) {
> > > +               dev_warn(rcdev->dev, "deassert timeout, re-asserting =
reset id %ld\n", id);
> > > +               value =3D mask << 16;
> > > +               writel(value, priv->base + CLK_RST_R(info->resets[id]=
.off));
> > > +       }
> >
> > Is this an issue you've seen during actual use?
> > Would it make sense to print warnings on assertion timeouts, too?
>
> I haven=E2=80=99t observed any assertion timeout issues during actual use=
,
> so maybe printing warnings on assertion may not be necessary.
> What do you think?

Have you seen deassertion timeouts?
I would rather not print a warning.  The error code would be propagated
up anyway.

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

