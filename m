Return-Path: <linux-renesas-soc+bounces-18549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F747AE0A22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 17:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 026387B0A3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA19230BF6;
	Thu, 19 Jun 2025 15:18:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E8D221270;
	Thu, 19 Jun 2025 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346284; cv=none; b=nUEVCmXFsi3slhzqVy05g/QiWCdf2k/Nv78SEqdFKXzByEX3leUFm23tCsa/Ye9h5qDFP2rHuB23aTju+54wefflA2WppUCx8ZECEv9hVNLA9B0CPz3lpSblgP04AT5M6fAYXR58Ks5NztX/ZZwY7VatsgvEQ6U+dCOrlsvXb+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346284; c=relaxed/simple;
	bh=qAmKIMry2tJjYOV/mRm6EhXtZ3wqm8lfOnhBtky/cus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIc3rYOOJwmdeuhirfrTUwoFjbBx8FC6rRPypVQ23UD9M4C+qmFd18CHao3DNj7MwCtX13n6qBVaUIY/JYCwnAw6ZxkhS+9ap0ITmyy9oFjby1eB3aVSo+ue9JH+l4ggUw+FNtA10cHTXMvN3D1Xa0J3/pzyldpro0C3MDs27Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e9a284c225so273325137.2;
        Thu, 19 Jun 2025 08:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346281; x=1750951081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ntk+so1xA40iJ1eMvOf2PChc0jZI6RSYBcRU/+9kzH0=;
        b=rMomg7rUHqajlfw/wPzqy8/BjXhIfMnVOiuW9oM1JIV90vY+O/eehpwWbTHKEvTSof
         q1iv1ctMYELn+XwLoq7Ocykl1YCNQ8zS/f9QgpW76vO7yAn2x1r/huSugsubVXGrZFdx
         G+BqqJe0SOK8MYAMGkiBDb5afDMAXAHgHWRmOm5Mjx2pKWsJqpVvyIKl+v0EAHCtGC22
         hNqSzrGPVcWHbCYP8bjhP5j7mdqTctMyiJX8MaU9rthwQz8y9KPyq5clfvZeKwF0ohDg
         nMrdHmZ2uN7n3CVpsOzD/wCWYpsDqmF9JMKY/7WAOVFPqw3H6/POhQukHqtpI57jyobm
         P+lw==
X-Forwarded-Encrypted: i=1; AJvYcCU+x5F3Z4GTo0bE4RBhUZR5LR5zzcXCSoVYn7H4c123CbKsT5RxwXeTZbNmqe4DUVIdgcWoDaPCRUlS@vger.kernel.org, AJvYcCU85Xk+6z+NklAmPQsLnSsAWR1KgpPlf4J/U7zQn5c8Qv1Bl+Li20/xdHrS9E0baUH1tzowBZiJblmekM1t@vger.kernel.org, AJvYcCW1ROHspX+oHLRDdSqEAb22if+A2f2+fLPnJE1yZIjnTKOS5wbiQXKR6LxKRqRXVQqqoniAnmI4gBem@vger.kernel.org, AJvYcCXR0nx660DsCuiub3UIFx8aAYZHknD58Iu03FN7BAoZGoPVIsgLycvJDSkVdZnRV7podZgY79ZN+N3hJKRlAFQxxA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7K7CfkzTIAjmKhOLBfx3HcUgZOBPhhzqVuxEfjA+4vU2/51At
	5JvXa7B9Yn6So+v+XuXAoqtTqGA5IQ++OGqPpEs352I2rCq3IkPiJQWqgLWbHivX
X-Gm-Gg: ASbGnctOX9TR/IpjVWEfWhYhpPh8gNo7VgeqdkKXFl0PHZBcUT6GP75Y7nIAam3T1nM
	Gt7cuB9LPUcQ/E+8AQoI3uvieM4xC0uIbskkUMCF9HREZi9+/NLB65qSgcF8UYz1TTf+YlkzFPM
	4x3qOm4DgDB4H4NGz7OMZYSE0NkGmkRg58A0iBHHVst7vT6TetqgzHnT4Ib/6aLiElheF/3wRba
	mFnrrajZyeQDoqybQsAG5WrpCw9wfXDQeQYb2PPV3eU/b+jW0EoilEd6grj1aa9MU3VFQaFD3+o
	tLZGY8fxhjbS3v1Glajbnb0X/xIpiFtTM77Y81D3NXUPyL9hAJEy3ug8bV1bRyLgq8nilOApb9h
	/3fbeuchXIhFG0pBQRxkXxvzv
X-Google-Smtp-Source: AGHT+IGp+rIiFVTF0qFZtbXCpbPWn8i+wOZiAFu1907kUjqNkTIVcYFBH2366sAa2GdOb3V761kF+w==
X-Received: by 2002:a05:6102:3e07:b0:4e2:bacd:9f02 with SMTP id ada2fe7eead31-4e7f62126d6mr15054576137.16.1750346280738;
        Thu, 19 Jun 2025 08:18:00 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f389dd153sm1199677241.22.2025.06.19.08.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:18:00 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e9a284c225so273312137.2;
        Thu, 19 Jun 2025 08:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsUSgA6NhlCA9ZFkJsu0SpxVqPpfgQsUbCsdtSyqT2xBcyXoNveshlaicdf/wmWGaevsXiXReoK5t/eERylzrDets=@vger.kernel.org, AJvYcCVab2GRJCYUEtnVQbP7Rgqy51UvtciUgcFTdXdHJQ95PUrNa/U/rOZRWdgvpXBdOYQ192m5sdIpg23y@vger.kernel.org, AJvYcCXSjrYXpfDwdJARENkoICF5K5Dh6HronP3rawwUQPeD5CbInQkjIMXH0/HRrZuTtxtMd2sicAKPJJ35mR27@vger.kernel.org, AJvYcCXgP+0mhzs2f5St3pMkaIX2aUTDlVGP3G30qr8EMYUZEMnIG+j6EGnB0MnZU7G/VZ9POthdYV4MCstv@vger.kernel.org
X-Received: by 2002:a05:6102:6a8c:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-4e7f61646ecmr18359222137.9.1750346279912; Thu, 19 Jun 2025
 08:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617155757.149597-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617155757.149597-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:17:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVW8oPiqUqFt573-Db3963Yawm6+sT8DAHTq-64Naegog@mail.gmail.com>
X-Gm-Features: Ac12FXzvo_4PUAY2MpopAYSr5MVWx-2BQeRauunUyjVmJtVyUj79Za_ayKIMT50
Message-ID: <CAMuHMdVW8oPiqUqFt573-Db3963Yawm6+sT8DAHTq-64Naegog@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: renesas: r9a09g077-cpg: Add PCLKL core clock
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the Peripheral Module Clock L (PCLKL) for the RZ/T2H (R9A09G077) SoC.
> PCLKL is sourced from PLL1 and runs at 62.5MHz. It is used by various
> low-speed peripherals such as IIC and WDT.
>
> Also update LAST_DT_CORE_CLK to reflect the addition of PCLKL, ensuring
> correct enumeration of core clocks exposed to the DT.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - New patch to add PCLKL core clock.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

