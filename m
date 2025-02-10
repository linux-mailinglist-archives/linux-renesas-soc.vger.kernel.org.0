Return-Path: <linux-renesas-soc+bounces-12997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837AA2EF06
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0A316493D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6D423099D;
	Mon, 10 Feb 2025 13:56:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0922E406
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195813; cv=none; b=On8QuewId4ZqEbOTzHP4DpVKomf/yUt6RaYej2NuFCCt24gPK9Iei3CniBRPtH9on/Nn3UjDevcwlekuC14SoaJyHpuGdCho0+w03k2Wsid+5C80A1HKqzuttIWoNRcvVeocWyHancPfBmDhP7DysSDWGtab7INP3kQ4FsizokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195813; c=relaxed/simple;
	bh=VzswW+cwRX3zmxMChoq8wK1XM6YIlsxrkHhD2fwAXbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6+kxYWofyen86nt6hmsxGcRwpEQf+QD1WmrC4+7pbK/OgppR1bOh3jhPwnvYZvlnLF5+vjyExgUSw8KELBExsGNBwKJ7dTyItUWYjdRFFSlkNYSvLcNMuLd4/6LnGP+jthFQQ5RRZ6am+Q0VPCXn3Q/TfpaqryPXQ23R2JiBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4bbd703245aso145156137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 05:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195810; x=1739800610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNLuO1TDfq3/iWNukv6zai8iT8BgsnhD7jdohthV3uk=;
        b=MyTQdwcnfFczpqr8ZLX7tyzdOUDn3hsnfmpP3DNUTeIoe6+h1TxCWD9jyDWI7MiRq6
         L99yDnVYNsm73bdEFx0KDjpWFUgafli8kOSYxmS2Au1KfYm5HmvpM/Lqz+xExrpQ78xB
         2pT8oFiOubgDQ2qX7jP2ocu01ykolUUWnhFafO2q8aof007sJ9GxD4EwakGikMTa8e6B
         Cc0SGFQs7dJPG2uVQiaiXb4jG1fWbMhlb+B2mN9AFTryiwYwbJcl+CbornDpZhOw+9xz
         9aw4yAQuMJZzTGQ1KKmgvtNbtDkWQ5jh99NXhsnEapYa90peVu7tG494Y26rmmEAEJwx
         aXRw==
X-Gm-Message-State: AOJu0Yzj4j1L0GT/8BhWmucQSmirE31PkXBUAfbXR4xObXAz38M2V+w6
	PM2+tdpyPU6ZtBO+Uv0YcLj5hTcnD8b+1LSNl0kTGc6gp1GDugxJuRdPQ4Xn
X-Gm-Gg: ASbGnctNrp4YdU9zoYkhfNWbAwYTIxvm+cghaP25hm40fQHH3v9dj5ELYXqRIcu0Jj2
	s0EgnzKXnVw6jzJMzuAzcWJIqdvhOfdyVlFrMj8HD29tn05Vd8ITPP8AqCfocoBDnHuI6awyph4
	adsrhs/SnYmOnRHKRtxbK3ZnevF19SX2LZtCPPbwm1bWSaZS4R/WHEmBOK4q/uJLaSHdeTcL5lg
	twjY8czqx5lAj7jSKgahAVto3eVpgswhWmp/cIEtYAp5qdDj9/P8n08Fus+PTP4uo46kS7rWN7g
	Z2jwCWXaTHodLIJmpLX1Vqpddl6S2kSGbfJlxb4P1yrTSiZU2YUXhA==
X-Google-Smtp-Source: AGHT+IErPtm2ekhme7cia4lUVrpBXRriXN2mE7F+t094N9XC1scDW7nnd6jy+8dV7l8ssqIiFwNhJQ==
X-Received: by 2002:a05:6102:a54:b0:4bb:d394:46cd with SMTP id ada2fe7eead31-4bbd39458f1mr965222137.18.1739195810505;
        Mon, 10 Feb 2025 05:56:50 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba772d7239sm1674267137.19.2025.02.10.05.56.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 05:56:50 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4bbbaef28a5so421116137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 05:56:50 -0800 (PST)
X-Received: by 2002:a05:6102:304b:b0:4bb:db41:3b6c with SMTP id
 ada2fe7eead31-4bbdb4141e8mr612697137.12.1739195810068; Mon, 10 Feb 2025
 05:56:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-2-thierry.bultel.yh@bp.renesas.com> <CAMuHMdU2jbSmLGORg_j8TK8Q0s3O=2fFR0KhUhucNcrw9z7U-g@mail.gmail.com>
 <Z6n_4g1EtMAm0jaS@superbuilder>
In-Reply-To: <Z6n_4g1EtMAm0jaS@superbuilder>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 14:56:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBZV4utc4agFrX3xnTjBq-hmiToAOgBGzFExzd0OjT-g@mail.gmail.com>
X-Gm-Features: AWEUYZmKpkn1sFXKJGbohfvbAfKy3ZfZgQxd_xiJB7c5VsHa7Zf6O0NdDzUYxEs
Message-ID: <CAMuHMdXBZV4utc4agFrX3xnTjBq-hmiToAOgBGzFExzd0OjT-g@mail.gmail.com>
Subject: Re: [PATCH 01/14] dt-bindings: soc: Document Renesas RZ/T2H
 (R9A09G077) SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thiery,

On Mon, 10 Feb 2025 at 14:32, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> On Mon, Feb 10, 2025 at 01:52:44PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 29 Jan 2025 at 17:51, Thierry Bultel
> > <thierry.bultel.yh@bp.renesas.com> wrote:
> > > Add RZ/T2H (R9A09G077) and variants in documentation.
> > >
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > @@ -535,6 +535,14 @@ properties:
> > >                - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
> > >            - const: renesas,r9a09g057
> > >
> > > +      - description: RZ/T2H (R9A09G077)
> > > +        items:
> > > +          - enum:
> > > +            - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52
> > > +            - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
> > > +            - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
> > > +            - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
> >
> > While the part numbers match, the grouping (variant-specific + fallback).
> > do not.
>
> Do you mean that this would be better ?
>
>           - enum:
>               - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
>               - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
>               - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
>           - const: renesas,r9a09g077

Exactly!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

