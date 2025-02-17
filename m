Return-Path: <linux-renesas-soc+bounces-13216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9931FA38301
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 13:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78CA3188DB35
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389B121ADC3;
	Mon, 17 Feb 2025 12:30:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA6C21ADA4;
	Mon, 17 Feb 2025 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739795406; cv=none; b=AWilwrOSGYj/0aTsko/XrwAVV4hB/N181dv7pRpIn+PmP1UbKjUumzcTjDilQn1b32HKfG7Ua3N8XkFHhdtAlVgVi51O/J69wf+ppEkqMy5VrZuIYC8148xz391Ni7SDcmJTATT+q8bFpt05qmjvZYkTfb52sZNLdtE1GfJ0F10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739795406; c=relaxed/simple;
	bh=J3SFBAZDXUNNlAhhsULZrSD2zJqCg4VZ25hYd8Ta7G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8IAoyuw5wvTkpZgAzAT4PuCiEhU4LoKzFCFXLt8yzOJXp/bJQ0VaOug6/q/xG2qyzhYhDVWAFxW4byC1av9QYEmzNKWPJIkCe2l/qB551FgKoa8eINga4MO5NJKukgC4bOJ3mH3kKbkU3qEbq4BlMe0JLqZzYHH3dyLBhsCDIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb7aecd39fso305505466b.0;
        Mon, 17 Feb 2025 04:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739795402; x=1740400202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1TIWEZalxxCgY45eBOSHh9u1O+DAvz4HdaYIIkamHg=;
        b=jQaylfzax9r15NJ8ROFIxyrT7hoe8CShkT6eh1i2qnMLXe7cM3QHSDHizd0fgqNx5e
         /qrep1w2+xpGBS7fdne2yLb/1I/xjTc6yWRE7U8rRANh2JhgPNka+MxqybBNC9lcGCXw
         OyDhBPulaaie8F4IEG4LGjHcv47Xz1VKEMDWwRUb22BYhsGHS7HRh4EvCw4/DVAa3IHk
         /HZGCH/ixb1D3c1oYY7SBeuFBeRLQmFoLspiAxcxjnDMVIVJyNsbFscweM7H2qRKhlZT
         A7ytx7qSdz63FTQaUFhStjFAEykD4Dcz4ls/1IYb6MhsV1qbWiJC1KLLPvB09c+TfNO9
         QURQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb87Ex/bNZ9DXzLxm5BD4Ryrli2sbe1QI026GcUy3OkzmdmBzXZi7DrcNHKosS6K6uE6jkun3B21FgZRBbXFMvKig=@vger.kernel.org, AJvYcCV2hFe1VU8ZCwC1zasUObtzi5ENIISLkxdXtW0NQDJnk4DVrI1ocRLRj88k+BsoUjjF6Ojkae5oWvMayQLh@vger.kernel.org, AJvYcCWjWYglyfwvVU10+7J67usVux/sIb+iemG7NOJ0NONRap1zHLmpLVYRrhIqyOXG3k1/mkoGDCSVQIavmAuN@vger.kernel.org, AJvYcCXnq0te/RH2kmpCI6T8PK/GFP34JOH98dmKEkqSuGZeICsA1/lRQ6lC1XAnDWQZMoPlfxPpsAXL+LwL@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/FvH8QMSP/pd7PM5M8fhd4cjEHPYnwq3nIHeLbNaooX94bq/
	022nKt6zkWUw4Fs9WV2efIb2zEprPSmRMHlDZZkAsK4rZpsq44IsngrPxWuCIFg=
X-Gm-Gg: ASbGnct5qat9p2xedn6xZmU1nIu+78nfsf+by1bEwLJfm9hdfk5POk897PQmxGrzEGA
	Z7PFCxLFRLZzl14+qL3AqJ0eKkQvOIJHklfgxqFNJh5yP4a/sQDx2CocII6K35zdRhxzX229LdV
	+nBBOnCfVmBTP3iUyt9teBdArD4zZgWydi1NDHXaA8dubEC65bYra+MSoGAp8W3fuNwSAEA7s85
	l5bnvU85jSPoUpAeE2jzWbQtjIGaiVLJqzWeaVEs0Gnj+dfGUpirnKFA/Vyh7qzz0VOt0R2Xt7m
	EFS5ERLZJuvKptIe+6Wpuc6WzvlHAacH2vgHIaZCXC2muz/Zjh8kYQ==
X-Google-Smtp-Source: AGHT+IFyU5wJtXXUs4IqnPMunIdCvLam5pfngNR55xHL/oCfHQ5msYgeLsv1nO/TBmFAHxED+IvCzg==
X-Received: by 2002:a17:907:7706:b0:ab7:b9b5:6104 with SMTP id a640c23a62f3a-abb706ffef2mr756802466b.5.1739795401768;
        Mon, 17 Feb 2025 04:30:01 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53398364sm876166466b.128.2025.02.17.04.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 04:30:01 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab771575040so1048512166b.1;
        Mon, 17 Feb 2025 04:30:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1fxaxIpxea+rNPLIr8I9nkxEiMMJZ6Zv/fGwvrPzSmGJdmwhuhWG1+6zRntBKCgeSDgvahYW06fVvMrCt@vger.kernel.org, AJvYcCUGMFVr8EHfljmLPz+1ILvPR5ku+SMJCYTBUpF76eo27L6lI4PrdFqAIuSrv1/bMCcaug0ubJoskeyVmrAq@vger.kernel.org, AJvYcCUL3wdtm/QS3gsOnootuDb1uTIEstChA7gvU73fIOwobcTO/B4rBVxXVEUpiyDgMmj7Ybp+pgWXpjXr@vger.kernel.org, AJvYcCVwDBOZHPDj816E0Cmp4QFcoo2L3maJ0qL5fZnv2VQ0p0Ax7J30IVKyVlsFKIRbQ7lWh5Byc7LV6V835I5PoidMViE=@vger.kernel.org
X-Received: by 2002:a17:907:3d9e:b0:abb:5b02:9e7 with SMTP id
 a640c23a62f3a-abb708f2d26mr963945066b.12.1739795401012; Mon, 17 Feb 2025
 04:30:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
 <20250217105354.551788-4-thierry.bultel.yh@bp.renesas.com> <CAMuHMdWfTsocOwuqDQZOBN7-wGMrrSc=cfJau+U1tx3Pwe+VHA@mail.gmail.com>
In-Reply-To: <CAMuHMdWfTsocOwuqDQZOBN7-wGMrrSc=cfJau+U1tx3Pwe+VHA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 13:29:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUs3uv-yhJxVTot7t3BjXcMDm=sWu-MTRv=-D5PrqX_zg@mail.gmail.com>
X-Gm-Features: AWEUYZk8HXdwA6QdcVV6UVVVAVy0o-P-gKkZGawCKYB8YbY4M9JB3uv5mL3juaM
Message-ID: <CAMuHMdUs3uv-yhJxVTot7t3BjXcMDm=sWu-MTRv=-D5PrqX_zg@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 13:20, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 17 Feb 2025 at 11:54, Thierry Bultel
> <thierry.bultel.yh@bp.renesas.com> wrote:
> > Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > @@ -20,6 +20,7 @@ properties:
> >                - renesas,r9a07g043-sci     # RZ/G2UL and RZ/Five
> >                - renesas,r9a07g044-sci     # RZ/G2{L,LC}
> >                - renesas,r9a07g054-sci     # RZ/V2L
> > +              - renesas,r9a09g077-sci     # RZ/T2H
>
> As the RZ/T2H SCI does not work with a generic SCI driver, it cannot
> use renesas,sci as a fallback, but needs its own section.
>
> >            - const: renesas,sci            # generic SCI compatible UART

As the RZ/T2H SCI does support RTS/CTS, the line

  uart-has-rtscts: false

needs to become conditional.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

