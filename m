Return-Path: <linux-renesas-soc+bounces-4866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 372308B05E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 11:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69B241C20CBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 09:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60042158D74;
	Wed, 24 Apr 2024 09:19:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C373158A2E;
	Wed, 24 Apr 2024 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950382; cv=none; b=bwfCwql7NCl8Xqw1t7v2KJ93KlzELyPTzmtirkkwQgJ4PH/slJMV0Eb44bBVaLEe0elmvEreAwAJMiWVxlNLtjy/SfBY7bzY66UuKoOy/d8Wdm4/sbeaeBA7AsMq4Jo7SlE+XRW/m/saM28e5mKb9CDi8QH1fJn8RmO8E6wMwXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950382; c=relaxed/simple;
	bh=kUBGr2oZnttCKHSXi/dD01ijzXWYABFTnLyHEqELfk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfrB5hFadTA6HMpTplbqSA9lZgr/jFWXGw/mR8ApBKDawLRRHedH0OKOT1bKMp/bbiM8D2CLLCveiviC3VqcxXNg5Z2kK25gWgLJXp6QxRsvhOcXpL1VrWdh4+63JYLkUiwQNSV3GhAiLiwwgCMoUeQXiE4+j+5zJK6p/fuWs4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de467733156so6544824276.0;
        Wed, 24 Apr 2024 02:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950379; x=1714555179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuWaWADwUCEoNFz1ONzkpQVTHPc+M5KP2oYlXsQw2+Y=;
        b=ciqrQApF4g6G5LH4rcsW3hT1qRAIScm1dtshxM/R+Vc8NKmoSeMae6VBRi+USZq7CI
         dK/0d8i++1PiCWurx4OnBtpyf9GusQXX0VNvkW8EAyO/q/UEOkdDR6cmTHDIGdAuJxxt
         i8U4ZKW50gSrZ31rrnr+wu/6SBiDuhvqBxBOZLEzwRbpXXzWqGysvB1sTVC+Ze4M0vym
         TsKaXr++ABCc3wIOF2d3V5810PK3WeHotpwWu/qXmYkC6KJ3bYgdSkikI0hlyxIewQX9
         re6/UXw1KgmE+CCnKnISGTBr876JRNUWfJkxyybN8FUhcIJ3kOBoKs9fVepiGjXY8uRw
         9PCw==
X-Forwarded-Encrypted: i=1; AJvYcCVpw7WWyAN7TTxEjFLxDHYdrIZHoE4ajK0/uIj/CTWOkiynH0Bbn4dcAXz+Q6D1wMCXLOYgkGHvMCgmYKJ4edk/LhObwFzm2Js/cW8Dy9/xCjluc+C4yH4RkV6le/AbtZxPu85uNF/CZZU=
X-Gm-Message-State: AOJu0YyhZL4v6NtOI7WvtOYyw91TZEc3b/6zNR3fk6ytTiq+Tj6kVFdn
	U63XFtwduFGVNIrJoaJFItm2UTVjJZ+/HHyFMSupKA/NTc9PI/iGy+MwEVQF
X-Google-Smtp-Source: AGHT+IHZsDy7LGdDgkvEgYYPHJxtyhdjMiM/gDcjvPiwL7OBKT8Lei5vFcR0Z4xH+397aKxeJ2aEJw==
X-Received: by 2002:a05:6902:2604:b0:dc6:d87c:fc73 with SMTP id dw4-20020a056902260400b00dc6d87cfc73mr2617886ybb.35.1713950379194;
        Wed, 24 Apr 2024 02:19:39 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id o3-20020a056902110300b00de50124defcsm1977074ybu.39.2024.04.24.02.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 02:19:39 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de467733156so6544815276.0;
        Wed, 24 Apr 2024 02:19:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBWXr69/gzEtTA4ejMEBpiybiDU1hPgwNhjr/aPc3g1gJTZ+NAQex0/8m5gNH7BtbbFFID2Wz33eC98jq+s7MU2+RZ4g4lppdlLr1fgLynS7kevIMh2/W4/80xN90qHo3RfPX9ePqzwu4=
X-Received: by 2002:a25:9f03:0:b0:de5:6a2f:45d3 with SMTP id
 n3-20020a259f03000000b00de56a2f45d3mr2438915ybq.36.1713950378785; Wed, 24 Apr
 2024 02:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
 <81d556da-8aa4-cf92-d8a6-5d8b147ab9a2@omp.ru>
In-Reply-To: <81d556da-8aa4-cf92-d8a6-5d8b147ab9a2@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Apr 2024 11:19:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxi2QJ2nz8JBrm0bFLRwkwdtgoBMX8N3wtzdLDvCw6gA@mail.gmail.com>
Message-ID: <CAMuHMdVxi2QJ2nz8JBrm0bFLRwkwdtgoBMX8N3wtzdLDvCw6gA@mail.gmail.com>
Subject: Re: [PATCH] net: ravb: Fix registered interrupt names
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Wed, Apr 24, 2024 at 11:10=E2=80=AFAM Sergey Shtylyov <s.shtylyov@omp.ru=
> wrote:
> On 4/24/24 10:45 AM, Geert Uytterhoeven wrote:
> > As interrupts are now requested from ravb_probe(), before calling
> > register_netdev(), ndev->name still contains the template "eth%d",
> > leading to funny names in /proc/interrupts.  E.g. on R-Car E3:
> >
> >       89:  0      0  GICv2  93 Level  eth%d:ch22:multi
> >       90:  0      3  GICv2  95 Level  eth%d:ch24:emac
> >       91:  0  23484  GICv2  71 Level  eth%d:ch0:rx_be
> >       92:  0      0  GICv2  72 Level  eth%d:ch1:rx_nc
> >       93:  0  13735  GICv2  89 Level  eth%d:ch18:tx_be
> >       94:  0      0  GICv2  90 Level  eth%d:ch19:tx_nc
> >
> > Worse, on platforms with multiple RAVB instances (e.g. R-Car V4H), all
> > interrupts have similar names.
> >
> > Fix this by using the device name instead, like is done in several othe=
r
> > drivers:
> >
> >       89:  0      0  GICv2  93 Level  e6800000.ethernet:ch22:multi
> >       90:  0      1  GICv2  95 Level  e6800000.ethernet:ch24:emac
> >       91:  0  28578  GICv2  71 Level  e6800000.ethernet:ch0:rx_be
> >       92:  0      0  GICv2  72 Level  e6800000.ethernet:ch1:rx_nc
> >       93:  0  14044  GICv2  89 Level  e6800000.ethernet:ch18:tx_be
> >       94:  0      0  GICv2  90 Level  e6800000.ethernet:ch19:tx_nc
>
>    Ugh! Sorry about missing this one...
>
> > Rename the local variable dev_name, as it shadows the dev_name()
> > function, and pre-initialize it, to simplify the code.
>
>    Why not call it just name instead?

Because the function has a parameter named "irq_name".
"devname" also matches the corresponding parameter of
devm_request_irq().

>
> > Fixes: 32f012b8c01ca9fd ("net: ravb: Move getting/requesting IRQs in th=
e probe() method")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Thanks!

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

