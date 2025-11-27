Return-Path: <linux-renesas-soc+bounces-25295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F95C8F894
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA5EB3A1765
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9B22D7DC6;
	Thu, 27 Nov 2025 16:39:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0CF221FB4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261591; cv=none; b=RBzESZ3iKqepTXSayCgnJdGgLLdR8G+I43bTNl+d2SjZL9g6Cuj3aFN2qwMIUTg00+9lHrtFZumYnUxjTnUa4/69h8i8t4na5X4ekibEVE0Je75rg43Ui9V1nWXnAYveqFMo/rkZUQqN1YEXEEeMBc+b2L5cl7mjEYCxGWX5Yu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261591; c=relaxed/simple;
	bh=NZFXpM+aSU1uQSEcm9y1PlL2odIqQQKz9Q67og3Qay4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lx1SQYbRRe4mRDAEgb2jfMpbmjnICwZWXmhOlqqThNT3AfaY+tW9Uhc04lWbfdtRtG+03EMnDR+P9bAspRUwIYiDK1S3nuzmgvwYWY82FJmAArcYswrcniZIVunSL+dwmeeqwXilNDH6TE4MtkW0OAwvz9gG0Sy1lwKaF7DyfCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9352980a4f2so275653241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764261589; x=1764866389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCTgATthkKjninUj683rTd4syC+gjm2ZPB4/RFx6n54=;
        b=sX+Okqkh/WDWh43IzjUX4KI/JaeR3lplYSksebL0OZC+OvpQCxIGHIa9XjLVrT9/Nv
         Qay7LgUJgwhzUWkn+maAeVxC5LuDLqsN0ABJbfFULUIneuOn2Zv+KTvI1RoCaCbxkily
         IjTyfx1W5n/Et//AMEmAlaRMqxv6hvMlI+AgM/8TYbQsX8C/+MaTPojvRH9cdZNxxIpw
         fDoghP0Je89jTGlwcfzm0QxfwKMS/42M6RsRThQ2/MsKiU1+UCxDNO3Oftmvci0B0nRB
         ccGyvKf8bH01UlOnJAMJLiFXE34nJ1shXkFxlYzDAgCiiwB3TyUTUtgBEMWVXyOw956X
         eWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe3ERjTaxR1Nq4rxHXGFGsADqm4maOTadv952CPt8udinFuLkgwPFILxs1rMe8C7AABr4vUeyDwoCXbNFyg3G0jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf0lDxSx+i+FGQssfwpEjOtHztlz5BW01dqDz7mYtGY2+VqcD9
	lCKfaNYkT5hBqLCHwxLwjWmVU4K4+c7kg1sjZ7kr/S/F9jeIRK2znJCQzhumOvZu
X-Gm-Gg: ASbGncspaYS5jtB83CH2Cg8pJtMwdFXBqVWg6lMegwXqzhoCt4TVu57mP8CwwCD8a/V
	CNSaI9s4wXJL2Ci2JZX3N/z17x5Fgu7QagECUaWM2pYFTbF+MxmJx8utvG+fjIRXKx+SpsbEZkC
	8ybwKqlOW2zMwLFizgKifxoFZ2QJMu3bej5Wy3Y8r9S9Rl24OHPVuXRHEoYCq2y/wdylAHR+eD5
	G3IqqLZ9cuTu+S+nJT9csKHSMguwwCFWRSq0oQHcdQq9C90WTt7rG6KytNPSxjVHlebn3NtZCQr
	hlg2/Ena3VG8r+6CGUMc63rCBomn0vYlU95NwGAA5vnCxeNzBoYNrbZnV/WvCb/OaYCPxsVsthL
	yBgmOu5prgzrYoE2cnp00zf6Wl+mKSZugmy34u/bwhlAdSlgolrmsbZ/zaKFGVA9ot8aofh4viz
	v8YCwzq96HnQOxXQIvDeTFnlsbfykVjLNAmI+l8MMh1FTyeG6u
X-Google-Smtp-Source: AGHT+IHpur6ZykwRUEMD3LsnMVVQ8+B4bM7jNCDls0FoAw9ovuNd1GU+1qMjeGxv1f1pgSHp/Oc2fg==
X-Received: by 2002:a05:6102:441b:b0:5dd:84f1:b51a with SMTP id ada2fe7eead31-5e1de4ba7e9mr7380230137.43.1764261589029;
        Thu, 27 Nov 2025 08:39:49 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24dce47ebsm647934137.11.2025.11.27.08.39.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:39:48 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dd88eef2f3so304339137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:39:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvmbC+3bUYtAILVawhSAcue/8unvwT5+b9/bUDprkNztajtskW1HPBKLmc9CbHwa/EMKbCWjGAA5MTF9nOCUT8Fg==@vger.kernel.org
X-Received: by 2002:a05:6102:a47:b0:5de:6dc:22be with SMTP id
 ada2fe7eead31-5e1de43795fmr7900879137.36.1764261587515; Thu, 27 Nov 2025
 08:39:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:39:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-WihXVPtTQsw9+AfF=kXR7u=-Dd_j_zS+WwPprww7xg@mail.gmail.com>
X-Gm-Features: AWmQ_bnzyV4oo_LYUmYWO7ZPNRLsleLForWIcVAp5Mgza40F_Xz3vf5fBtqEtZw
Message-ID: <CAMuHMdU-WihXVPtTQsw9+AfF=kXR7u=-Dd_j_zS+WwPprww7xg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Nov 2025 at 17:24, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the Interrupt Control Unit (ICU) used on the Renesas RZ/V2N SoC.
> Although the ICU closely matches the design found on the RZ/V2H(P) family,
> it differs in its register layout, particularly in the reduced set of
> ECCRAM related registers. These variations require a distinct compatible
> string so that software can correctly match and handle the RZ/V2N
> implementation.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped using RZ/V2H compatible as a fallback.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

