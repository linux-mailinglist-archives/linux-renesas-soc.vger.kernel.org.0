Return-Path: <linux-renesas-soc+bounces-6822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A3D91A07C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 09:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F071C20F6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 07:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C163EA76;
	Thu, 27 Jun 2024 07:35:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3D04EB3F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719473756; cv=none; b=P1V7Cs1UsRQNIRMHVsdP2na2CCKgJR3TECvC5qJskLG3Vv/K+6uvY4RRLgT5g4XssV5uegLigy2BJThO0bW5lq67lYSFdI5ZGz/ZNHMzzx4i/tF6n72lH1PttjpkasqON095VJ6FKmVdZs90KOHA3Iv+EZIaVc/8QUBi+BliYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719473756; c=relaxed/simple;
	bh=7i11nKUotuT85MWIY0jYxd+swCO1AjOMbQnk0/tAnl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zgvfjl7zW5c/HMUpre89NzktJyXhvPagvMlxHv77agowTQY2Uk1mvzJXxNN2fMDC/5vHuJPPdDoKJFXHMW/PuaLpFIWoHJiINNnpKq6Gp5jHBSXG+qcuj/CRN8HNQtnSBQvJfIuS7Y53luuJv0nBNO3XolAILHyoz0ybsYBEamo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6499aa90f0fso1936757b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 00:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719473752; x=1720078552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuIgPGOoauwns+ufxEHYbE7gfGhBVUyGk/eZY67E4g0=;
        b=ZF4/E6YqlKcM6TFC2dbq3id9bKD9MXdD+eW1ZwOk4GC2m9FueDBfeAGDrkMYmrN4aA
         qjNWDDPWVt0SiK6IDr/gkYKqSklPxPQP3xDZhbPvzLfnUyOT8sGKDearPnrdec91BmIJ
         j9+fRqL/wn+/otENLcujXLkFLMG7/CoBXm/BR0O4VAnIkXyyJWA3S7gRKZAlm5Su3/3C
         v1qxGQv9qNZGj+oVODgSdQtSkneLb6yZCHDExT9//1al0cuXgydy2DLCiz92wQiCajvY
         RO5ipiXyCz19zIKlqlWFupCy3xct+qNZ9meVx6JkhjM6AsKcqsccrShmAHvMRW1Tpq0x
         jcGg==
X-Gm-Message-State: AOJu0Yx+rvRcVPjVJdxs3pBi4HSEYp2utVDrPquwtmUZW0fnEIRXQmTX
	NNNf6TY1ofVLfis44IM8ZdKhave9yMB0o8aCBPJvj5COybZa8q3OnIj9szP1
X-Google-Smtp-Source: AGHT+IHt/RcKmB0NzXwyNpe78P98r8jWWNalRktC0jvO5xp2QJP1VOnOgJy/w6xukvZdHdX0hESYpw==
X-Received: by 2002:a05:690c:7108:b0:615:2fa1:c55d with SMTP id 00721157ae682-649a1e286e0mr4554827b3.19.1719473752399;
        Thu, 27 Jun 2024 00:35:52 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64978f3fc4esm1592587b3.30.2024.06.27.00.35.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 00:35:51 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6499aa90f0fso1936647b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 00:35:51 -0700 (PDT)
X-Received: by 2002:a81:6007:0:b0:61e:eec:ec5d with SMTP id
 00721157ae682-6462df2b6eemr54220287b3.5.1719473751335; Thu, 27 Jun 2024
 00:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
 <87cyo7kxek.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVuXreoDxQHT9Yf88fhrCTnOwRJjWNVRoue=8DsbO0=4A@mail.gmail.com>
 <8734ozqm7q.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8734ozqm7q.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jun 2024 09:35:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4BpeoLeENaV8yK1G_MYmgHYx=tHoKeoYBAqL7FD+Kyg@mail.gmail.com>
Message-ID: <CAMuHMdU4BpeoLeENaV8yK1G_MYmgHYx=tHoKeoYBAqL7FD+Kyg@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: gray-hawk-single: Add Sound support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Thu, Jun 27, 2024 at 2:11=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > The use of "Input 1" and "Input 2" sounds a bit strange to me.
> > Looking at sound/soc/codecs/simple-mux.c, these are dictated by the
> > MUX driver.
> (snip)
> > Adding support to simple-audio-mux to override the default "Input 1"
> > and "Input 2" names, using e.g.
> >
> >     state-names =3D "Playback", "Record";
> >
> > would make this more user-friendly.
>
> I have tried to re-use existing driver without fixes.
> but yes, using own naming is better idea.
> I will try to update it, and re-post this patch again.

OK

> > Still, I wonder if there are any side-effects of (ab)using
> > simple-audio-mux for your use case. This MUX driver is really meant
> > to pick one of two sources to connect to a single sink, as described
> > by the topology in simple_mux_dapm_routes[] in the driver.  Perhaps
> > there exists software which interpretes these routes, and offers the
> > user a graphical description of the topology, which would be wrong?
>
> If you are talking about detail of direction (IN/OUT vs Playback/Capture)=
,
> indeed it might be a little bit mismatch. But, Playback node and Capture
> node are not shared in general. R-Car Gen4 Sound concept itself is very
> special. So I it not cinderella fit driver but enough driver for this
> purpose. I think there is no *bad* side-effects.

Yes, I mean the assignment of sources and sinks in:

    struct snd_soc_dapm_route {
            const char *sink;
            const char *control;
            const char *source;
            ...
    };

    static const struct snd_soc_dapm_route simple_mux_dapm_routes[] =3D {
            { "OUT", NULL, "MUX" },
            { "MUX", "Input 1", "IN1" },
            { "MUX", "Input 2", "IN2" },
    };

It looks like snd_soc_dapm_route does not support a node that can
change roles between sink and source.

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

