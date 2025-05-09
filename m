Return-Path: <linux-renesas-soc+bounces-16853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A631DAB130C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC803AEFE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D167728FFE3;
	Fri,  9 May 2025 12:12:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B05B22D9ED;
	Fri,  9 May 2025 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792775; cv=none; b=BTycYaWJIlEUsbsoojYNcV+Byx2PUwOBGuyWR66v22UO1cyyQITuALJwk2zOvkh3KtnhbxfaXo4X3ENLhv3IYErJqcgt/jC3Hg8uegHLtJXFXASi08s5HnQv5QSdtWLWUZik8oMU96YBdj3tdMKHH5m/Hd2Vivi4ij9ZU0AtYGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792775; c=relaxed/simple;
	bh=e9uGctgyGje+9ab4oVRHbX5YpVrprf8/+tUzJvWbA+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zgl4jYZbWAgVyenmx1bKoOdVOE/KupN6FmDHo6dUgtW1Qdntlisi1R+bLwLIaO0wD4gEyPdD7yuzarAIDu/HE3G3uZLSQXOHBXKBthi6YeBunPvloRUPWzR4v7B+Td2RlTN1fWSn4GmakkJ83k3Xoh+uACp/UQILZ1YYEOcuxF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4c32d6ddd50so710092137.0;
        Fri, 09 May 2025 05:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746792770; x=1747397570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjyxLwVk3cM57BeUSe1116GyUpWvRecglMRaKmGPDvk=;
        b=ibSiQ64RaIvkSfw3BgROx//eXw65L66J8E+OHGmOTpSKSkpk6gAC62i0A5MxOFQ33Q
         YGwHQ8D8yz3a/z12pxacrjwO0/q1jgk7i1XaiVMEwE2pUWL461ghwTU0iCxfllimXAIh
         6COuh18Vt6TJ6Ywc4HTgFzv4kyVOmYGkTjm9KOQMILQ77GNec0pC68SIN1VCOpyOFvW6
         Mgqrv6aaYzROPzkvaiRXco3krChIZv1yv2TPVB9XN9PEoNnn61uOFxGWZa3u9XYSjPK4
         leIm64m7ht/FN2qJh+c5srfbAo6+pfpqCo8DahLNJ/MThk3puqYYJSo8FXn9C6egXadG
         ZEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS0ml5ks8GHYbTN0LyNF+0JOB2QkmBv3mlGUbsS//pDoepQF4jAz23UTNmZtmjU5Es2U4P8DGaLAZV@vger.kernel.org, AJvYcCVYToCHjZZzTNy0kp2aC2FS/rdTWPauHFoZ45gL7cpZzcPIo4VFgUWutK5L5cc+xEY7C8riY/8hkSgpCV2j@vger.kernel.org, AJvYcCXWwQ2M8TbREW9VcSR1exhhQUGgI2+ihgjHXVsTjLgwbyVMeUyU1Mf/gTbUHw57cTZJrY3dOEEOl7Fd/CVr1jFjQBg=@vger.kernel.org, AJvYcCXavM5I7Ws3ttKxoyzTfnPzA7LJ2pQM/+D3d62epCBCAYDGiM6qClLrLQC6zNrnZdTBZihVGvOdeS8e@vger.kernel.org
X-Gm-Message-State: AOJu0YxhJS41DVwBYOe70Hl/hNlVcuIxWbdsP6A/9T0CuEJGJ13dBCAz
	8fAEA/DtMp8CRd/ICf9sIYAQbssXzc1fTpd3INGiQCEgWpgg7p8QNKcgw/Ao
X-Gm-Gg: ASbGncvN1768eZ6bBlVZ1JiUQgysdAc9KyABWmqx8ypwnukA/KRC8h+LcnlpSL3rly6
	647w7W6wSEG1tUAyTuEW9uE/ywX0tlRM3cYTDH5PrSoj4toCQNVXaVhhLpPT+wLGh/0Xl06iQbE
	lXMAAI8bmMz+oHL4ToTtxHCHq6m7urt1lYDK5WDLtSeqbKV9Q1/cjMFvs9gyKocO8jQ2aBX6fSo
	UdKXf+LxKI+XReA97ud6TF7jxTLITl3DW1DSbBjivqGm4SSLnkrNV2UhpqR/792g2E/YpbT9GGS
	SOqfOVT/+eYQBJYeoOSDfr3oziNzsClyVrgeKoBVPipNFuD20VFTO3ixmaFFkrToWaQzYO1wNyQ
	GRGI=
X-Google-Smtp-Source: AGHT+IFxvb51dlFv8wOWArWiobszwjYTEusV2NvJo2voUswPvDpUyjuVzD4nyIBnwXnAS0labrVyUg==
X-Received: by 2002:a05:6102:fa8:b0:4dd:b95c:a43b with SMTP id ada2fe7eead31-4deed3d47f4mr2246403137.18.1746792770140;
        Fri, 09 May 2025 05:12:50 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb203c26bsm959576137.27.2025.05.09.05.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:12:49 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4c9cea30173so739027137.3;
        Fri, 09 May 2025 05:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9nNDQgnv+8dR+0J/DsuGGQodSo8zGrAxjmoVvvlhPEUinM/Cr0owNayi6yRzquomsVCKybahRiG3D@vger.kernel.org, AJvYcCUfWC/9DHx1jIoI9X/LunK8EfNJjyMhPc56sFBeEE3Sxc2/cXXTG3GlEn/+cJ1/ui1q1zdi/898CQAAcdW9ICjSfBA=@vger.kernel.org, AJvYcCXUKtI8Q/ekOcElxLnKLEaZMdn+ucM4pMcMEARC1qKntguZM5g1xxpRm0ghBszgyPALrFG2PfczHGWL+l85@vger.kernel.org, AJvYcCXjDkXb8ADJcughEbpIeLu0lBe6Tzbd3JAPYleXrgeeyRT3QlejX7p64IXDzfbKSY0QAfKnAjKRVYR5@vger.kernel.org
X-Received: by 2002:a05:6102:3e04:b0:4b6:d108:cac1 with SMTP id
 ada2fe7eead31-4deed338f13mr2697599137.9.1746792768489; Fri, 09 May 2025
 05:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdU00apiWYCPiwqGr66Ucg9KgWMhhm8FW_KBoeN2ceos+w@mail.gmail.com> <8a14cf38-9a7b-462b-80d1-ec5026b5a565@tuxon.dev>
In-Reply-To: <8a14cf38-9a7b-462b-80d1-ec5026b5a565@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 14:12:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOihhQtpi+J9t-4bApEHx+f6_q7NtdEiLVi63krZnK=w@mail.gmail.com>
X-Gm-Features: AX0GCFuMEPN26ASMgvw_arsNY2nl7S1yq6Skm-p6Er9eIIofHnH_CGJa3k1lcRQ
Message-ID: <CAMuHMdWOihhQtpi+J9t-4bApEHx+f6_q7NtdEiLVi63krZnK=w@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 9 May 2025 at 12:58, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 07.05.2025 18:47, Geert Uytterhoeven wrote:
> > On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
> >> module has one or more MSTOP bits associated with it, and these bits need
> >> to be configured along with the module clocks. Setting the MSTOP bits
> >> switches the module between normal and standby states.
> >>
> >> Previously, MSTOP support was abstracted through power domains
> >> (struct generic_pm_domain::{power_on, power_off} APIs). With this
> >> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
> >>
> >> Previous Order:
> >> A/ Switching to Normal State (e.g., during probe):
> >> 1/ Clear module MSTOP bits
> >> 2/ Set module CLKON bits
> >>
> >> B/ Switching to Standby State (e.g., during remove):
> >> 1/ Clear CLKON bits
> >> 2/ Set MSTOP bits
> >>
> >> However, in some cases (when the clock is disabled through devres), the
> >> order may have been (due to the issue described in link section):
> >>
> >> 1/ Set MSTOP bits
> >> 2/ Clear CLKON bits
> >>
> >> Recently, the hardware team has suggested that the correct order to set
> >> the MSTOP and CLKON bits is:
> >>
> >> Updated Order:
> >> A/ Switching to Normal State (e.g., during probe):
> >> 1/ Set CLKON bits
                  ^^^^
                  plural

> >> 2/ Clear MSTOP bits
                    ^^^^
                    plural

> > What is the recommended order in case multiple clocks map to
> > the same module? Clear the MSTOP bit(s) after enabling the first clock,
> > or clear the MSTOP bit(s) after enabling all clocks?
>
> I can't find anything about this in the HW manual.
>
> > I believe the code implements the former?
>
> The proposed implementation clears the MSTOP after enabling the first clock
> taking into account that there might be cases where 2 clocks sharing the
> same MSTOP may not be both enabled for a particular functionality.

I am wondering if all clocks must be enabled before clearing MSTOP,
as the recommendation from the hardware team uses the plural bits.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

