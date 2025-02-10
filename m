Return-Path: <linux-renesas-soc+bounces-13000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13577A2EF62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10C8018877C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB76D23314D;
	Mon, 10 Feb 2025 14:10:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA34235BFE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196652; cv=none; b=oN2KFWi7M3MSQjnOZ2qAEMoR2cyP73mRRV+La/dD/6oZTgGQg3bK5q321Yq5vfwg2h9UNMLjT6LVH219ZRu9Ek6oZ3S7FveJ8d/S0Wks8qjr/FIpqFN40iehFnYtWgjNzDrZ+iX5MEAR49T0tUUhsExd7EVnevYTbAKEqGzRdjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196652; c=relaxed/simple;
	bh=SpN8r/moajXKSiV0CoNePFuKEVtlnh0Hduab4Er07Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6C9rhugCmRrXignCCtdirt3qv3brK/yOi+GE4vx4E7ld1+YTdr3NPcBxeFcfQ7h25IyclNRDaQYR4yEnWT0exW04vVik7tAzkcIvb6YDlkXiWKY1xnraVa1QBYFer70jwwijMhtPB2VHc1T/N1Ob+uyBOoX13zfCcdo58/m5vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4bbc047a3c3so880041137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 06:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196649; x=1739801449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0xb5gYqtaa2MGHbtx12QQaIuGbQ4G+OU6FdByrhluw=;
        b=g+EgQTPihCEoRf3wwOLtuc9fNiW7/90O5EPfljW0pSMuf2BFV6+IChI/UjfKM4z89x
         fdYTN02rK3iufmPkg7NaCjwWo4WiGi2HcyI/OjfMyADr2OdwuHrE4DFiVoFHydfXqmGS
         8yvc51k1+diqkWSmAR86hVvhRCr43WctmmCnMBdfJNb10pIWF3BFjxRCeRLIKYdoJscU
         mxVjMi9DM6lc9DGY8kkqkvMaMAzi5zPwLxJGht7l6jINhxq4r7mujwueneDWjAmuRwC3
         7jMoagkXhAsYJP1ud5wjs6HITZUc/w4e0dXT0HVTXeInnoVA+Ea4m/JCFckDBVV40C+M
         HP7w==
X-Gm-Message-State: AOJu0YwYoCZjTAhYqNqSTDoSKfN85p0Hj1SSwL/iXZW57MN25mGk89vB
	qFoGn151OfxLsSUn6zJOEvioVs3GKSgx4aa+NnDseuUaavfZ2NTrhaXYyC5V
X-Gm-Gg: ASbGnctQ4Rj+oNTe1zXXxq0TzC+2TRIkxFyYgWcPC1fdeXUemTNrZvOiEBp7ZbXjL8T
	x0nnEZP5fuau7UFqr5QfKFKSMjxCa9wX/jPg8Z5zLCZFyKhHSI9WjaLAz60fUM29kAwcMgtHpeX
	agDDT9DuPk2jp6jY1Zq4WFmk3AVLg118nNhENv+gG6K072LCPDiJHLju8j8O3M40gBw572Qp036
	oAxQKNXzPNJQse7S9WB+Xnfrk6EswuvC6uuws/FKNASOLaA63r6Q2iLPpm/ir6f/dCJJKp8DAom
	agihLCl5X6fhCrAJ3/1jvr7dO2zAFn2T+nyBlI7W/Yo9Y+WMIJmnOg==
X-Google-Smtp-Source: AGHT+IF5KDebyY1+bRgA6lx5i4gjUWh0iwSJoErCt2r66oxuM6TQRPvLDBnDqtzTWH2uKm7+EAO1kA==
X-Received: by 2002:a05:6102:32ce:b0:4bb:d062:452 with SMTP id ada2fe7eead31-4bbd0621467mr1570792137.3.1739196649558;
        Mon, 10 Feb 2025 06:10:49 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76ebcf54sm1747710137.11.2025.02.10.06.10.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:10:49 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso3345463137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 06:10:48 -0800 (PST)
X-Received: by 2002:a05:6102:3c88:b0:4bb:de88:d027 with SMTP id
 ada2fe7eead31-4bbde88d206mr434470137.7.1739196648659; Mon, 10 Feb 2025
 06:10:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-4-thierry.bultel.yh@bp.renesas.com> <CAMuHMdWLdLiyQUuO-Xox5zQ9waTqWYk474yYL4qqfyfkvxFs6Q@mail.gmail.com>
 <Z6oG2vPy0miE2GZw@superbuilder>
In-Reply-To: <Z6oG2vPy0miE2GZw@superbuilder>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 15:10:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwuM+D_AgqMU4KhPSmHKCreYhq5fLjhX1pn0bv2pV01Q@mail.gmail.com>
X-Gm-Features: AWEUYZkyUfPFKGZXcwHIs9tM4wKzcXHqLNq-QNylSbwu5KTV4fsxptJp78xzDeQ
Message-ID: <CAMuHMdXwuM+D_AgqMU4KhPSmHKCreYhq5fLjhX1pn0bv2pV01Q@mail.gmail.com>
Subject: Re: [PATCH 03/14] dt-bindings: soc: Document the Renesas RZ/T2H
 Evaluation board for the R9A09G077 SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 10 Feb 2025 at 15:03, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> On Mon, Feb 10, 2025 at 02:21:05PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
> > <thierry.bultel.yh@bp.renesas.com> wrote:
> > > Add the RZ/T2H Evaluation board (r9a9g077m44-dev) in documentation.
> >
> > This is the Evaluation Board Kit for RZ/T2H, "RZ/T2H-EVKIT" aka "rzt2hevb"?
>
> Yes. AFAIK there is no other one as of today.
>
> > > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > @@ -537,6 +537,8 @@ properties:
> > >
> > >        - description: RZ/T2H (R9A09G077)
> > >          items:
> > > +          - enum:
> > > +            - renesas,r9a9g077m44-dev # RZ/T2H Evaluation Board
> >
> > Perhaps "renesas,rzt2hevb" or "renesas,rzt2h-evb"?
>
> We would lose the 'm44' variant information by doing so,
> is that acceptable ?
> But anyway this should rather match the dts file name
> that comes in a later patch (named: r9a09g077m44-rzt2h-evk.dts)
>
> So what about 'r9a09g077m44-rzt2h-evk' here instead ?

You would still have the "m44" info in the fallback compatible value:

    compatible = "renesas,rzt2h-evb", "renesas,r9a9g077m44", "renesas,r9a9g077";

A variant with the single-core variant would have:

    compatible = "renesas,rzt2h-evb", "renesas,r9a9g077m04", "renesas,r9a9g077";

Cfr. e.g. the Salvator-X(S) development boards, which are available
with different processor options (R-Car H3/M3-W/M3-N + "Gen3e" variants).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

