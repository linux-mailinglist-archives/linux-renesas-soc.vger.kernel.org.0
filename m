Return-Path: <linux-renesas-soc+bounces-7701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97996945A8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 11:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52D3728668D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 09:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B741D4160;
	Fri,  2 Aug 2024 09:11:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FE61D4156;
	Fri,  2 Aug 2024 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722589865; cv=none; b=Q4KjVJyGFrjn9hds6fWN5cBtUVsTiijNyUSXLluhjWkCMDOL/U45QoWBjsOhWXdVu+4JMt6a02amPJTk/ASCzrkJG/qNC2VZ7YxzZBHYanzCz1QquPSvH0Qz/dhZzQ06D0OD/dSeqXipu5n9O4cARLjBm1SuuMdFcpXbO0R67cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722589865; c=relaxed/simple;
	bh=4CGaNMTRt4NwQND77k8RZeAMxyBS+bSmInjCgFBfYsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+Fb/ulCW850eQsVpyQkNNPy70KR0T0iDVvelNsPHONxQcBIAK1MH3RcDrGdXef4sNEd484HZgLaZ8k4iN+Gm7fzWWG65PhsfAJX19K6iYedUpyBNnQQh7UtiG5fSQ8teaiCXGYGPhiIlEJjOeSfRuYkkTLD5tCjDWpXcQnwMmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66acac24443so69508037b3.1;
        Fri, 02 Aug 2024 02:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722589860; x=1723194660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8OmAKkFaePtglSs/84dWGxGSqBVry9Z57ZPXW2jrk8=;
        b=wkYI3zMkLW+hJ/hx/ubkU/JroVCCunRKCmJx+K2w77LzvNMILYWHLN77llTu3OhUH2
         Sm3cjJXN2moxGMZ/RhZhEtu9sxiPhAYkfbk0md36h/P2NcZNpdoRl5esrCApYum0zlUn
         QhwWtfPLTem/WQq7G6e9IXHTphDnDtkYsIXfBMLaObO+wxSn1tNy61Q90NE5KwAOI4kV
         ryPG1moW43UUUZabqB/zy/AcDKM2dmYvFpCWA0+X+M1nRxx4qQAAyWa7qZXpeED+BhMV
         CRoyvA7MLhlh4H8x3QbXEHDO+rQulmqu8I9y5d1SQOujystOvrnjsaHFpjWqFaYTykqw
         nYJA==
X-Forwarded-Encrypted: i=1; AJvYcCXx79pjESCj4GjTNJFmkfwcbb/LfDiPhMPJlL3nbsxo6WbRnP7rLY9VizSdcnCb/fBjRkT+m9xluxzqe9g4kHFDtgA6ohQkpp0ir5rjjWzSqzyO2UjA+RJYdL0ev1VG8n3ySjgaxWItG4jfHaFeW1alcHqVhkB1iCW3wd3/2vZ5CC/dMmGwSXkAjChuR/WqCPaZ7EqX9/NOia9bRG8OG/3ivjUKOIBa
X-Gm-Message-State: AOJu0Yz/GPEP1YtkpNzwl3LuivIFtKXQBVSkkcyGXMGA59US9+jrDURF
	OVz2/Ioy4ciRYLHnv9Mgn10Q+Zh0ipYl2Qs7vyaWY231syxUlZSSc9fvOCMV
X-Google-Smtp-Source: AGHT+IHBXQKwPMfVNGxyHEa19e7aiuQjxjwVqb9B/XDbaDzUdQul1Jr3wCKmUZ7JUrLlepcpCCcN3w==
X-Received: by 2002:a81:a504:0:b0:64a:7040:2d8a with SMTP id 00721157ae682-6896150ff7amr28754337b3.23.1722589860437;
        Fri, 02 Aug 2024 02:11:00 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-68a135c9dbcsm1816447b3.107.2024.08.02.02.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 02:10:59 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-651da7c1531so65889477b3.0;
        Fri, 02 Aug 2024 02:10:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+Jy9aXPZyZxo1aU//3N5EhkTHWd+CyWbamrDa8zJNIim9tcffMiHWfs98cjJ67wtUrptZM0QvtFUnt2FVEHAXYEK8AhobZKrWWsg3j/GP5sDqeSjIzkqOol4lRFhAAQLiujsqLo6BLYDfjzeR1h1hFwFtnB7+BW1Jr5e09lRpJ7N6T+q4qaFCOidAgANkkLQw40jwIPwK+N+B3cwhLwKxIb5Zbqnq
X-Received: by 2002:a0d:fc86:0:b0:64a:5f5a:b38c with SMTP id
 00721157ae682-68961bd493fmr34018207b3.26.1722589859602; Fri, 02 Aug 2024
 02:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240724182119.652080-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240724182119.652080-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Aug 2024 11:10:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkPwfVT-iJp70pEi5ubpc5YBKt=a2C5NmL_tjbocXKRQ@mail.gmail.com>
Message-ID: <CAMuHMdXkPwfVT-iJp70pEi5ubpc5YBKt=a2C5NmL_tjbocXKRQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Jul 24, 2024 at 8:22=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> of the R-Car Gen3, but it has some differences:
> - HS400 is not supported.
> - It has additional SD_STATUS register to control voltage,
>   power enable and reset.
> - It supports fixed address mode.
>
> To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
> compatible string is added.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5
> - Dropped regulator node.

Thanks for your patch, which is now commit 32842af74abc8ff9
("dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support") in
mmc/next.

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -18,6 +18,7 @@ properties:
>            - renesas,sdhi-r7s9210 # SH-Mobile AG5
>            - renesas,sdhi-r8a73a4 # R-Mobile APE6
>            - renesas,sdhi-r8a7740 # R-Mobile A1
> +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
>            - renesas,sdhi-sh73a0  # R-Mobile APE6
>        - items:
>            - enum:
> @@ -66,6 +67,7 @@ properties:
>                - renesas,sdhi-r9a07g054 # RZ/V2L
>                - renesas,sdhi-r9a08g045 # RZ/G3S
>                - renesas,sdhi-r9a09g011 # RZ/V2M
> +              - renesas,sdhi-r9a09g057 # RZ/V2H(P)

This looks wrong to me.
Did you want to add it to the clocks constraint, like the third hunk
in v4[1], and was it mangled in a rebase?

>            - const: renesas,rzg2l-sdhi
>
>    reg:

[1] https://lore.kernel.org/all/20240626132341.342963-2-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

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

