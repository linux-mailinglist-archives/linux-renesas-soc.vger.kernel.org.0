Return-Path: <linux-renesas-soc+bounces-16578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0AAAA5D7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 13:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141201753BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 11:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9961F4C96;
	Thu,  1 May 2025 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8gzKHRA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA5D63CB;
	Thu,  1 May 2025 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097382; cv=none; b=WRH1XHlQo4gVnVtbUOw3sdGBD4UV3p+JSx1HEez+M9+h1RpdhgEkbpHBkF0bQn6XiNomneipkjoiM8UGAmPkIvfi+APTuOKH1zOs5IPdxbxCN6mYlH8SV+A95khDcFcuPtD4KS5gvazhrejpetXBXKHbjK+WqmKUK6D2LCBBhl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097382; c=relaxed/simple;
	bh=YP/T0CkwpXUb5RR9D9I+LqSzO3DWW8dnrD0XkmmOOUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7F3vpXWJpd3CPVLZLXC4w2OkdYVGELp5WIu5eYnWfcQgiFOcONB1X/LzTM1KXPptMCYOJebyHFMu/28q0TB+gVbOhNkJ6o+863RfQsYASAR2oqO+sGZRm7MugBjtlbtmiSSYG/mAKUmNV7UoUqYxhf9pNu6X3UcjKdkelV4hys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8gzKHRA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso537493f8f.2;
        Thu, 01 May 2025 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746097379; x=1746702179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP/T0CkwpXUb5RR9D9I+LqSzO3DWW8dnrD0XkmmOOUw=;
        b=X8gzKHRAJCe/UMYR4LpMkZaa3gSTL1ldfRQ9uMIbv4zgKaZ7MhNxtEEhouBuU+rPZX
         Gmhknh4IM5hb6Ki9DPiuZ1100odc8raJq8y8/SzYr2DGgRHTHMuO73+JVaNSuA31g9ak
         DE0yubvmWTPe8pU5n5Lj8i4qIRVYX2MIwMD+acrYV0QqLx6/ahn02SMcQO4SWfsp1vsr
         bPmRdcAlhSryZO0nOJCxMc/EIwxzAxhDbaEgHBOgeGdb3t/L6Yd0iYigMXwsFKdk9H2P
         hgDZfWPjE0Tj8gWIXvA2xYJLqklEP2wmJbYQYi2H5fmNsF53VyReXaf0oQOytp0ERAGs
         b9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746097379; x=1746702179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP/T0CkwpXUb5RR9D9I+LqSzO3DWW8dnrD0XkmmOOUw=;
        b=gjyOXFOQ8PPPkCvuAs6WY6eBkRETjkZ4SrSJ+foUaLt3QwpdWevpx3Wj2RwHTV0IWK
         o8eZFLqvKfd0O1R1PNFCf9ISN/tMJB+pRU6yzx3qXnfiHFT49Eg2CkQ8/p0n9OtBclui
         umKegK2mFSjbnFu4GztfrOImBQtNS5sZyLrkkfi7iNiLMr8r2mvGotDXsIF8ZC+ktxXF
         dHMXt0BHB+u+WrIho1OmquE30Xa903wEs+Nte+rk2DDiR9PIMrGmvdCSv6vTf7is1hXD
         IcwtulVnn+mwRt6qhxGblu3z+TMsM7CcqjRZm7mF9HjH6pkZ40IFr2yFEgE6e+H9na4W
         LSQw==
X-Forwarded-Encrypted: i=1; AJvYcCUhOyUNvKg9ELutkqSVabpvW1sY3VQww2dfvxeMgqTKNPQkBYTYJcLO/JouJ8QiMcTtjrdmDyRNKdR9eOkk@vger.kernel.org, AJvYcCVmllkoMPDeZg1VN9GeT9OhzIIfwbtuSCj26pVEG2JWijXJrrf6HZOkwKBJKkbMx/8cdv6+LTzMRChL45+pp7ZKcpQ=@vger.kernel.org, AJvYcCW5kuaecD+7kp+u7p8amPW/rZ23yB28L+/zk47SUeGJglNnGS2MjzYk1XQ9JjYyYWwxcIPGHtNlJSfr@vger.kernel.org, AJvYcCXPR0N4Xn/OCku3nUgST5kb77eJPWAC0NQX7YBTE1Exupxb++1yoZAp/looAAm+i5DSKbw1t7iHwyK6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/hzsMoEO4VwYYmecqmeONz1kiojqCFlVWYX53AjE0DO5TdP9
	Ol3eO+XDHHi8wHxJ0j4sk0ixogNzYKB619LYQlZaQtvZ7XOo0Njw2V8Ix4YGL58VGeuoIodMlsy
	IF4YWuxsrARYJCU/BocmtJiMCGOE=
X-Gm-Gg: ASbGncuztTst4qXSKkTKwdRzvqPZtmP7aJi02JkOHxH8a9ka+CuVXDc5vGvUuzB98L3
	LwfJkmdbZffMGu47CCrChXDX+2ROlMTMJavAg3yL6UI9wW8O1sPnTMe/L+tCXgmcbJRl5dtvKDt
	smILUr2VE/Ft4NXOfIuT0pleA=
X-Google-Smtp-Source: AGHT+IHnsasC5a6owegYHHHKpqCakBnDLStztj0M0y2Ms6YAEP6lxMvKXVUQRyad58NLJTnwpxgsVeGJi0Dx1JRW5Hc=
X-Received: by 2002:a05:6000:1aca:b0:391:40bd:6222 with SMTP id
 ffacd0b85a97d-3a08ff38a6amr4797433f8f.22.1746097379004; Thu, 01 May 2025
 04:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <f9a7c9fd-bd49-4cf0-9a86-a8e65b4fb6a5@oracle.com> <TYCPR01MB1209317F533E528616A4C2492C2822@TYCPR01MB12093.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1209317F533E528616A4C2492C2822@TYCPR01MB12093.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 May 2025 12:02:33 +0100
X-Gm-Features: ATxdqUFLehOqNU3alydkWylhiFwZjkdBEHDlkzJ7NpWrnUfS-t8P_W39zRE4coM
Message-ID: <CA+V-a8vsKhi8Z7zi749CErCF4cR6s4r0WcUumwFY1ZPg3uAO4g@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabrizio,

On Thu, May 1, 2025 at 11:38=E2=80=AFAM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> Hi Alok,
>
> Thanks for your email.
>
> > From: ALOK TIWARI <alok.a.tiwari@oracle.com>
> > Sent: 01 May 2025 10:51
> > Subject: Re: [PATCH v4 01/15] clk: renesas: rzv2h-cpg: Add support for =
DSI clocks
> >
> >
> > On 01-05-2025 02:10, Prabhakar wrote:
> > > From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add support for PLLDSI and PLLDSI divider clocks.
> > >
> > > Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> > > PLLDSI-related data structures, limits, and algorithms between the RZ=
/V2H
> > > CPG and DSI drivers.
> > >
> > > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slig=
htly
> > > different parameter limits and omits the programmable divider present=
 in
> > > CPG. To ensure precise frequency calculations-especially for milliHz-=
level
> > > accuracy needed by the DSI driver-the shared algorithm allows both dr=
ivers
> > > to compute PLL parameters consistently using the same logic and input
> > > clock.
> > >
> > > Co-developed-by: Fabrizio Castro<fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Fabrizio Castro<fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> >
> > Acked-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>
> I am not sure it makes sense for you to Ack this patch?
> Please have a look at the process here:
> https://www.kernel.org/doc/Documentation/process/submitting-patches.rst
>
> Perhaps you meant to add your Reviewed-by tag instead?
>
I'm not sure a Reviewed-by tag would be appropriate either, as it
implies the reviewer has performed a thorough technical review of the
patch.

Cheers,
Prabhakar

