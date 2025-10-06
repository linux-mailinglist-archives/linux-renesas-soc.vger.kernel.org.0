Return-Path: <linux-renesas-soc+bounces-22693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5793BBD6EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 11:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B6E63A4B7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 09:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2329260590;
	Mon,  6 Oct 2025 09:25:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F977262FE9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759742726; cv=none; b=Tg3JMMrfKNNRMrTviJeN0q1k2EZLOmb10CXfZE5dQROcKCKwRErZcqeTaFC5Js029vvI3a4gGTqzlmJGfjHs37xSeaKANyYN6asbsQ2cxyOeKGHihur0AQTAnlvHNMWH5a95De0uuurjlWfSECzcohRL9MRWtgD3SLB2oIDAp8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759742726; c=relaxed/simple;
	bh=sZDSusUePS7KTbHF94xK8rV0QQmbxPNR2RLFiaVDrNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyswNgr299boJNSQWQNpU371UGlgi4zqAk0BhpmTgIwkeXRQPSauGgVU85Rc8uzQP2lSxZjAxFtOfbk5RMgqygDuMUfiHrnYPpt8iHmH3c/IN0ATnPtNyAkpVlwIR51uSSsZXbmiuOhcv70CR1a+Gpoi4dgYbAH4NT1+SN0vZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-905b08b09f5so1455718241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 02:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759742724; x=1760347524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1f5H254g1HK7lVacJLaFY9n0QZTczpZzL+ddUhW6f4=;
        b=wnK+ETACLzPQf+XGTVzu/NAcWCCknGmvUceNzNrsTWtIBi6DxPlOzISMVDTSp5GVZi
         oOmPcJaTrUvjDg2rx97f3kIhBdcvKwARlWKuG+x7XnCzDfIRd+DnBsUtEtikz1kN5h6D
         Ao8Zi3oAV9qIbz4WqvhcR523kGk/WqieVbX1pEcHHSabfpURUbsj4klCgwXeZHD2xAoH
         B2eEs+7DXp9ZqNsE0mkaP0z6vHJIkmVUr1dd/x/IA8imVCzM51PCWpdbNKI2uR3UYWqk
         CgN6kc+fivIBZtkkW1/mh0hC1q0PeiOIkqZyKT/3py/tVouQWCbvPpfLCkYH2IFLT4Un
         enyA==
X-Forwarded-Encrypted: i=1; AJvYcCVa/C/LVwRPx5FAdjVfoofGHBH/7F0I3WNXvCgxYMMpVGtf1NfbubBqLSl10RLaCq1jrpGRw/6dCB9BvtkCCYMS7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykk8cSDJXpOPVoDN8JlnF8vsJRyfV0kiBPKDhr7FO/Afw4Ysnu
	O9Dxx5Xn9grf0o3iGfjJz+G5Gowz3uQLkudBvNAvlfdk7VAMG4JRUYa+Ch5pw5Xe
X-Gm-Gg: ASbGncuHMzUn95AikmjfFDcsuog/SbiTfqKvoye/mIpLjWklICXd+nZZLffFPlD3i96
	/wS0+L4qi0u53r5uqJ3h88sACz40N6IpAt/0G20cnsevvmEzLDxoMTQP8PwfhNHPk0APxmRbU6I
	zYC6XUqMcuv3VUJxTKcbA5oOFvsEZ3DK0g8xRKcVaSNvRn2mbddNL04FMv57JL1EBLshbxrkwRu
	7SbT2vvG7FO7AFfmsMa1JOmp3MTfUdxxqW/wMBbRxMnzSfQPIjHQv4901rd/MsyAkuYWk2pLs6f
	9uA7b1m/IVMkovknewUy9ygmMo7hABk1mUu/7Vidh2y2lTD5sxgo1hZEnyQfWjYNRkguBYOjWWM
	/tcEiq2LHLxjA9D87lO+o5856pW2UELUD91Ewces1q/GaKQNbhCdKhEsfoBLoJ9bmqlcrNeF6A8
	E7zu48rAj8DOggwCWthPU=
X-Google-Smtp-Source: AGHT+IF31XvmuO0KMWxV1oPWCsHR1Wb127jeFxtsDcYFlpP0nwq1SmvKj+uIp+6doTa1hHu5ZBKCdg==
X-Received: by 2002:a05:6102:32c2:b0:5a3:acb7:55c5 with SMTP id ada2fe7eead31-5d41d10c1fdmr4051433137.26.1759742723516;
        Mon, 06 Oct 2025 02:25:23 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4f08a7fsm2892699241.17.2025.10.06.02.25.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:25:23 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5997f407c85so1705492137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 02:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/k3xo0MwWM7k2Yhs6we+Ms3AaqJuNbOEXxkkiNySmIZ+mYCaQCa3h1eyWzfKY4iqPJlr5KE3WI43jLH2RG90Ujg==@vger.kernel.org
X-Received: by 2002:a67:e7ca:0:b0:4e5:980a:d164 with SMTP id
 ada2fe7eead31-5d41cdf4a3bmr3915460137.0.1759742722677; Mon, 06 Oct 2025
 02:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com> <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aOKajKzRlrQD7plt@shikoro> <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aONh89-5-llFZWue@shikoro>
In-Reply-To: <aONh89-5-llFZWue@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>
X-Gm-Features: AS18NWDrTsDaUWwW6vNGYUXbBb2hzV0fRFzAQBAzuQ6sMouqWvDz9ki7n_BBmQw
Message-ID: <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: "wsa+renesas" <wsa+renesas@sang-engineering.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 6 Oct 2025 at 08:30, wsa+renesas
<wsa+renesas@sang-engineering.com> wrote:
> > > > > +      - enum:
> > > > > +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > > > > +          - renesas,r9a09g077-wdt    # RZ/T2H
> > > > > +
> > > > > +      - items:
> > > > > +          - const: renesas,r9a09g087-wdt # RZ/N2H
> > > > > +          - const: renesas,r9a09g077-wdt # RZ/T2H
> >
> > I guess a comment like # fallback RZ/T2H here will avoid confusion.
>
> Hmmm, if we add such a comment for every fallback, this will be quite
> some churn, I would think. My favourite solution would be to swap the
> 'items' entry with the 'enum'. So, everything with a fallback comes
> first, and the 'plain' entries last. But what do others think?

We do have "fallback" comments in other places, and I think they do
help in understanding compatible naming schemes.

Would it be possible to handle this in dt-schema?
Currently we have to write:

      - const: vendor,soc1-ip

      - items:
          - enum:
              - vendor,soc2-ip
              - vendor,soc3-ip
          - const: vendor,soc1-ip       # fallback

If dt-schema would automatically drop duplicates of the fallback,
we could just write:

      - items:
          - enum:
              - vendor,soc1-ip
              - vendor,soc2-ip
              - vendor,soc3-ip
          - const: vendor,soc1-ip       # fallback

What do you think?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

