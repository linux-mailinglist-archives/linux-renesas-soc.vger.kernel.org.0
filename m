Return-Path: <linux-renesas-soc+bounces-16032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D6DA8A7D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 21:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A4317E9DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 19:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B226241CA9;
	Tue, 15 Apr 2025 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM3YdYGu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8AC215F49;
	Tue, 15 Apr 2025 19:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744745118; cv=none; b=pKFwXL5Q2OEg8lCX/meW132LuPyeZK1A9UBDMFoIJRJL4mJZn2z8PszRO4sHl9wNbROFH1ReSSgrSECtuzjAR4HPowEH0pz78cYbdDEoWZTkZKX3btHzyTiz5FQcgF+KFqAavJfZdwGGgbm1hCr6e3ABU+yXWSDhPhGKRhqq3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744745118; c=relaxed/simple;
	bh=usCFcWw17l/ARIJ0oB3UQXOQvkPGjuleha4VpwTy/dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Htl+tgfVoDwC+yXwefa+xp891EcA4R+SdBFTCnv1RG6srjfU2ZA5eXVNb6BxW56jxMK7lSNhWAYY6hAqP0yQoPxvS/jkl/IWWRP5NSpoKqWiV4LEYfy287rOK7hOiPBb5XthnNUW2ZFmouHjck80JCxfJGupMlZ2hyI/DYJ8tqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM3YdYGu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfba946so4403266f8f.3;
        Tue, 15 Apr 2025 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744745114; x=1745349914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRZqXv/H0O2qzhzH2urF9jU+w0RY0V9ZOA9hcqXs3Xw=;
        b=gM3YdYGuy/npS3Yzd9ovg2HQAcskfjCsLQfzg2Bq4K5mWLtZbjyET63XcJJjKcgGOv
         cf0ceHkJVSQp4XFUxCLNZwU56X9lSqhNrVIpLBpodKRBWkhVTQiotmZFzYpKwgWF478f
         yrlu7yL9QV1vPi2PFWZXe5a/CWTv7Y9CGtT9zBwhGAvmOmsEDvbpnPmE1ybP9E0Y9Dwg
         0FB6Z9ugC8ghe86Wfdss0MkSpz4/4FduBG1+6k3/zcF57ixNrH9bQE3eT7cFsFGLr+pQ
         PQEyETlQI7WUQK7hrurmsW/owND+VX5Yq+skRW9IML8QXuRL1Iu7YGMt/QWsVZwzeUe9
         jcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744745114; x=1745349914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRZqXv/H0O2qzhzH2urF9jU+w0RY0V9ZOA9hcqXs3Xw=;
        b=SKIBbIJlMVd1k24BAtn59qZ0JlNogMohDSPD6g2aNAW8ic23KDmOfFHa7r+tuN1xbY
         Id23UJHMkhkz3A6dqWDyZNLbh0aBnTintJk0L0mDCvuarDdzgbq+v/hwje8Rf/uoS+PB
         J7hv1KWG8ZLCs6HOERSLQpLMRz/i0XP+NLM4YYzlzoLsYNgkNnnH/Z5LDZr6HJsBISET
         +f0MgdsxZtNE2BZ9E+HH0e9APGhe9I1RSCPGTYcVJo6boYRK2z4FRPc61/1Rxc5hoFH4
         KmV4oh7HmqUj+Us5luWaxts141aB/debydFj8Gke0ZvpazfediPXB9XoChz1BZ+PuU+7
         4ZOw==
X-Forwarded-Encrypted: i=1; AJvYcCU5k/jFFq9J66pRZm/OOJ0dNK25/9m/aKyr33p9h+405CeFRoHP4/8+E/7p2ZJSjqP5NeRAkMZ6T27EEo2WGsNCppo=@vger.kernel.org, AJvYcCWr3R/ijDUE6Q9coWKzdhvkbQI/A2fOTURCgwb/reou6JKZNGo4ob8Lcpt+LD9I4GjrO95zySUZOQx/@vger.kernel.org, AJvYcCXBDQdYDlm/6zRTgOoyplRd7S2RFQthM/Y3MPy7h0HA/cyWvo1tlNKPJ3NQdsHxKE3RFv9uS1D9JTCKiUB3@vger.kernel.org, AJvYcCXGg7d5L0xaCPOLgf21QAc0i8JeI+8cfajP0lCEio9UDwViRn311g9cprHRyZjekV63DywKfyCsfq3q@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7q9/owc6z5sjfZINY5rW02nvkQI/b6CNB77oirfOCADC59Ph
	nquiD6mfRgGCHvOhCv5UtGO/PiPUZxc0JKf6PeJ6UeRs7LKvVedu0Bal0dfGLhs/Rh8ItHNCwUp
	zfk26xegwoOyXct78rVJseJKFJXk=
X-Gm-Gg: ASbGnctvH37YlLS2sQpnrzMMdzcGyYWn6wkiy3Oe0FSdZfTeVIbKpOKSPGHr8ZTtjLF
	Adoik9X5IEBeOu3lhSQDM23nO5/kg+KXVoXmQ9pvoA25JUVYNjnNLuQqtlFKlt+7W7e6Pr5WTC5
	EYMXPfsT6/HHQNK5cL/TOHq8/p7Pp9KlLIdiqnCgARc8AR9Nvivnbcmw==
X-Google-Smtp-Source: AGHT+IFpnd4Ze3yETlkOqiRU0HGeHriLjAMwYzN3R4ACRtC+FSJ0oAt+zFWD/AWJd/k7NEB9IEm1ZsnSBIuVPV9BJds=
X-Received: by 2002:a05:6000:381:b0:39e:cbe3:638e with SMTP id
 ffacd0b85a97d-39ee272a23dmr575516f8f.3.1744745114006; Tue, 15 Apr 2025
 12:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXDDBS1POX3AmvTLWBbYcpXjnZm6sNqRpKfghF4uPGsUA@mail.gmail.com>
In-Reply-To: <CAMuHMdXDDBS1POX3AmvTLWBbYcpXjnZm6sNqRpKfghF4uPGsUA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 20:24:47 +0100
X-Gm-Features: ATxdqUEHWCw97EAWwzVu2LDq3jcV1JQO_QUs6YLMAS1BzcGvPcuDoSMn-xB3J_Q
Message-ID: <CA+V-a8uSB62TSxgcGTaWbfkPsNOmxZmO31jH3TREE6g2HHtcXA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Apr 15, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for GBETH instances. Include core clocks fo=
r
> > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> > used as clock sources for the GBETH IP.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] =3D =
{
> >         {0, 0},
> >  };
> >
> > +static const struct clk_div_table dtable_2_100[] =3D {
> > +       {0, 2},
> > +       {1, 10},
> > +       {2, 100},
> > +       {0, 0},
> > +};
> > +
> > +/* Mux clock tables */
> > +static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0", "et=
0-rxc-rxclk" };
> > +static const char * const smux2_gbe0_txclk[] =3D { ".plleth_gbe0", "et=
0-txc-txclk" };
> > +static const char * const smux2_gbe1_rxclk[] =3D { ".plleth_gbe1", "et=
1-rxc-rxclk" };
> > +static const char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1", "et=
1-txc-txclk" };
>
> The "et[01]-[rt]xc-[rt]xclk" clocks are not created by this driver.
> IIUIC, they are actually Ethernet PHY signals.
> How is this supposed to work?
>
My intention was to add support for PHY drivers to provide the clocks
and hook them up accordingly. Currently, for the RX clocks, we get a
rate of 0 since they are external.

# cat /sys/kernel/debug/clk/clk_summary | grep eth_0
                gbeth_0_clk_tx_180_i     1   1   0   125000000   0   0
  50000   Y   15c30000.ethernet   tx-180
                gbeth_0_clk_tx_i         1   1   0   125000000   0   0
  50000   Y   15c30000.ethernet   tx
                gbeth_0_clk_ptp_ref_i    1   1   0   125000000   0   0
  50000   Y   15c30000.ethernet   ptp_ref
                gbeth_0_aclk_i           1   1   0   200000000   0   0
  50000   Y   15c30000.ethernet   stmmaceth
                gbeth_0_aclk_csr_i       1   1   0   200000000   0   0
  50000   Y   15c30000.ethernet   pclk
                gbeth_0_clk_rx_180_i     1   1   0   0           0   0
  50000   Y   15c30000.ethernet   rx-180
                gbeth_0_clk_rx_i         1   1   0   0           0   0
  50000   Y   15c30000.ethernet   rx

I haven=E2=80=99t written a prototype yet for the PHY driver to provide the
clocks, but the plan is to get the initial pieces in place and then
extend support for that.

Is my understanding correct that the PHY should provide the clocks? Or
would you suggest a different approach?

Cheers,
Prabhakar

