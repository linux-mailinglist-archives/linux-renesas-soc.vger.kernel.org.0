Return-Path: <linux-renesas-soc+bounces-18198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAD5AD7469
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7653AAC61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6761A00FA;
	Thu, 12 Jun 2025 14:47:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6B15278E;
	Thu, 12 Jun 2025 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739622; cv=none; b=I2IHj35xwNHgDIX5D0+tmrHU3DPj35JPEVIRDATKR3RZ5yD8bBoU/7hO3K2Z961tiph2FlY9poOjXhh5e71Y/JhwFJeHejGIf2c437QAYL4UX7LWx/XaPc08HjeJ5WhAynp9qeSnBtekSn5z613gQFWe2TjbEV5T27gZMg48MV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739622; c=relaxed/simple;
	bh=xhXwFA7K7QsidFRQdSd5RJx+u46l2K56qIqvNBBPDcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLhaqm6YWn0oOhXr0A9fbyhAcy6zAI2tV3EywbNLPxbQo8zbrbxDT8MCk6npOqGUq3IhMfORXfMjVqDJFsx8/y7mSA5bmAhAef0a5YYqp8kgEapPqCgkbBuRHrKJ5oMZrTL97xDZd3JRBVgsPRCFGjLroMa841sMLfJG7CLTRwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6face367320so11386666d6.3;
        Thu, 12 Jun 2025 07:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739619; x=1750344419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPQnvstfYcB3i++rnfd+IeGow4JWie1AdJXj2QA9U+4=;
        b=hSqUHOdmABEYJoI56th7rwl1g01CfPcA/OpIBJQBX+r/RZkU0RVU6VO6Jz0e3Ru+dV
         7KNIj/BzADmWZoY9Pc8s0zKMDzG36DSVv+va7h91g5sib1NEeNm2fhc6D6mPwqWVhCXq
         IUTK3H1zfJDhf7QV2qtPCmb+DQ9/1EOjC66vWi4ZsMpO9rQy+9bqrNn5eR7miq2hYRtT
         +gGGUfmOKcGEem57ob2rhYko/f8av4NvyAudjRJyUK3Cl/HrA0X1IWOmoJMgbkeN8psH
         5XZ1n9pMsIbQIJ6gi1zVhw4/VtwkaYAX/+QB1ZgUOy99kmKen6BuDRQaKC1wNPMnyWi6
         yX0A==
X-Forwarded-Encrypted: i=1; AJvYcCU6i+4FjNendq/wJm52iq3REIESNcYTY2mD12nJ2ibnosi7cf5x732+Zwwf7l6K1n4p5gi1wzV5Ai2D@vger.kernel.org, AJvYcCUChrzmslB1l+sWUmaRlAnt3j6COgJoJNgumbvkK1YRkxu9TD2khZchGiBXOOD+WZ3+Z0q9O3MZF8iRYdk4XJP8IKg=@vger.kernel.org, AJvYcCVURsytOFVoBuwX1e3pm69LwJu4pfEYrD2AMYAAyHfpJH/k8yjUGxor6xEggKDxf5Xs08haK0h22shV+mzh@vger.kernel.org, AJvYcCXRRvqDBnZqcvdr91ltCLu+5nCYcfouAh+jewRw2x4zci9iNgl477DjgDhiLy0pbLi5sdnaOHAtR7jX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2+xJLQRyBT5XgdNk8jQMqWk5JM88yR3+dHkxFQjTAisA3SbP
	1Mr0IKVQyE6r+AgYuE2bgQs1+ZIsr8WC0lrPODDXwDE1t7+vJTgEtWs6Ih6x7x2S
X-Gm-Gg: ASbGnctuUyjShSnQVaBRS2uhJjbcRz1RUPPO604FU81fnTUoqPcdG5LlNLS2dzowl3p
	6wkPyklswUHJmhlwEr11YPPKBySreeF4eZeehjdc70gf4DoUD/FIe6hNdY7HI/ACynCWirBO0b0
	bEP7EC5rotcRfp8aTxzsDPLPcyah44xo+vfDBan4vV1g3BbW5aHWAb9K9fy2ClaNyraiwbRimct
	Fbi7l+Ky2HBWrUEQAKlcLSNDTZBTsDyut2bfT0TqQ3t5x12HInWnX+88zOzklZZF8QEAyWq4B+c
	iS7Nckgu/SuMh7BGM1L7CT0WfazoWLTupOrEAqicorAV+2OjV/Uzp9G4aLnu/iRZvAci85gVgsO
	M8UPU9YQjLnrWzDuK8i1mZO2QHJIULuXQjss=
X-Google-Smtp-Source: AGHT+IErRealAoCpHb/7jEpFhckJz2xIjcmQKnwfC1zBB+0M6IP6x4bif67eEIBDFLcdGAozbmQPhg==
X-Received: by 2002:a05:6214:2024:b0:6fa:ba15:e8d with SMTP id 6a1803df08f44-6fb345635ebmr63130996d6.0.1749739618785;
        Thu, 12 Jun 2025 07:46:58 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c92758sm10716286d6.125.2025.06.12.07.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:46:58 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so11022666d6.1;
        Thu, 12 Jun 2025 07:46:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgYaYy1Ce72/AVcxpMEKa9+gX1XfPyo6ta8maLWk9XpdkuyiDMZ7gkhI4z6TmuOtIaaJpXAk9pXDSu@vger.kernel.org, AJvYcCX7UM1l1jFeWR72PMhAeVDP0ak+MxthTmYXDXn8N4rail8uWolfG/hPtGHcSrTDyLvwIq2ErSzcVS8HqnJD@vger.kernel.org, AJvYcCX8JUxuxB60k8v0bCOU+oulY+snjt90W/PSV4OfWZPnXeig3dXpMwc4MKy/qddtRzitxIaKKs+sEzjIGtELRtuHVrY=@vger.kernel.org, AJvYcCXgMsKzB/mw2SmgWkDhe6n2uK9NclKkoOBSvjVvdPhth1dgKu0fp81XO8+diLkqOgXuXMYGtF12p/b0@vger.kernel.org
X-Received: by 2002:a0c:e011:0:b0:6fa:d976:197e with SMTP id
 6a1803df08f44-6fb34658e3fmr47352656d6.33.1749739617825; Thu, 12 Jun 2025
 07:46:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609203656.333138-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609203656.333138-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:46:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWd3atW6H=ewNcHDOkC7aEzXGi1mU0YtiEiBPgB6uT3bw@mail.gmail.com>
X-Gm-Features: AX0GCFtJ9Ws27KN77fsFTiSkeS0Q_R8dIDJua9nkeCHXUCdoAws2T0wHrEKm3js
Message-ID: <CAMuHMdWd3atW6H=ewNcHDOkC7aEzXGi1mU0YtiEiBPgB6uT3bw@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: Refactor RZ/T2H EVK device tree
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>
> The RZ/T2H EVK and RZ/N2H EVK are very similar boards. As there is so
> much overlap between these parts, common device tree entries are moved
> to the new file rzt2h-evk-common.dtsi.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

>  .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 17 +------------

Definitely a good idea! Note that r9a09g077m44-rzt2h-evk.dts does not
exist yet in my tree...

>  .../boot/dts/renesas/rzt2h-evk-common.dtsi    | 24 +++++++++++++++++++
>  2 files changed, 25 insertions(+), 16 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-evk-common.dtsi

Perhaps call it rzt2h-n2h-evk-common.dtsi, to match the filename
of the documentation?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

