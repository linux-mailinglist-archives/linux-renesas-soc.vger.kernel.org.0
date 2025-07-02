Return-Path: <linux-renesas-soc+bounces-19042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0FAF611E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 20:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35C31C40DFA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 18:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45162E49A3;
	Wed,  2 Jul 2025 18:23:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE62E4993;
	Wed,  2 Jul 2025 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480618; cv=none; b=FvaWYaH7o2TkVv9RcaEq6tHjt+XE5ixUYCf3qkJJ0lPErm/Como3M8ahxNXC6Fnkxj8nBjRF7FWZEhLrsgWODbAXTibC5RagKXHT7zmZfQ4iWkmIoynfk5wD4MHd4/+FfHJfCkL/0UMwY0ZgB4fW+Rh+rOT3rowBmG5DAQgnhK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480618; c=relaxed/simple;
	bh=3lV19QM6EHNa7B/8xG5FF9Kq6Yb2/cvg45CtinwXUkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntAfrmM6eZK9fzmPdrWz1v7WwdLLPa4CDlnH22pyyengaZSBsss0zWzr3jjoKwZMTuKjxqy+Q2fgJi1lseefW+8n5iqvjgPJ0gMbhXZlgFy27nTpA/43+KOWO95hCM/uFG6fnONCMnmwm6wxTBqVFRNkHEf0bRqFnA8HNRBuR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e9c689d538so1194777137.0;
        Wed, 02 Jul 2025 11:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480615; x=1752085415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAXOJIQnkDn1DxS/zo7Sy1BwwDpVI6t8KYkWgveCytQ=;
        b=vHk20WpAFNYNn9uiunhPF0ajutqtY93xEFtxGtURgMm29gaJDmF9mbhbcgQV0lOiXD
         jVYUNsqZuYYQhsuAZ0CcEEXuvZVbKORddo2cRbuJrW828gtP7ExojqULxjn874ahaU9s
         8wiBJTdSbYaB3rCq23dX8b7TiaxBQ/nZpyAbZwhC2RS7VTErdEm1T81WHkAtTgzVMKNQ
         6es5vXSjVnIN5Tpm/ehyU/AdiVrXmEv5MkoKJWXlWKCLSmaCqayaODsqHogtJHXjoaBu
         Y19Lc2U4nCWlu/gc4Nsf5ZD8zXEcjA2Vhjq8NSwuXHc8quudNy4B8cuScgZfOlQ4GVAf
         w01w==
X-Forwarded-Encrypted: i=1; AJvYcCVxYR//8MCN1rkXAjcwhY0NQDIGj6kZk1/3xlZnzKDQ6WwYOZz3UEz3+yYDnFqBtL3IDbJM2euu5aoK+opq@vger.kernel.org, AJvYcCW2Ep503IsBIz2HD9jpkOp0RdxWn42k+v7EUMZ4GQ4BKpduccpQfVP6mVpgIK2Dc95ZweQ/YNc/DU69ZBDKgwwsHWc=@vger.kernel.org, AJvYcCX6e7J3r4MfZoSW1tUavyqKYoSYJxq/vsVZACgXQdctTr7cCizVpmCPYHKQtmi7YzXHNFaGc1W9d+b4@vger.kernel.org, AJvYcCXH5DI32vavA0WeK3tAHa6KscqRqEAY3Vr4J9QHhQnjaJSqR0VkmJf8sM35V4/ZtPmuSOS0wcUkN8KZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6btnJqrMmRTQ0q85eytGqmT5uEKD+QHMKtZJgqgGdRjd18zE
	Hfn6Qy4FRweEOTiUMiSlT3EcX38vorN+76yYqVhvdwWST0RuqRxPOcQJcQi1Xo5L
X-Gm-Gg: ASbGncu63rjGsVO7IQbSZL0+Y+P2Ofh7luNxNktcR8eb87SgJGvvVRFPXHrPZk6vviY
	xiLbzz80+B6hvwos2rDxtxvnD6QQlyYh7GVXWtXuyz04id9gH1Zbkl3lNbaHqQYxfqSKo5rXZ+R
	odKNvcdAmCvEY/Bgrjq7ct9TOdOK+1yItEnrcVMImu8dH4nule3dWrd09Jnbn23tV6PDvcj9hvz
	vou5CnqS9Vy/nUDPTjFIrZScwV7GGNTB48GV88H6RHhJS5BelmqcfbL89+mBoO12lpw6VxmfWVf
	R7F5XDXZEj3rtE5vycqmPJKkt+avdJTymuVBnJ7c0U6E0VLJIx7DQs4OW3kk1juAhxoSnGnrpcX
	qhKqX02YeveBI+wPEdO8e86aY
X-Google-Smtp-Source: AGHT+IE+GUQplyEF11LWIwRxh+f0YOm/73WUJ15DAP1QJ0kUPKytuBEKEtOETco8CPezM3I8g92hCA==
X-Received: by 2002:a05:6102:5e8b:b0:4bc:82f:b4e0 with SMTP id ada2fe7eead31-4f1612992e2mr2885554137.22.1751480613792;
        Wed, 02 Jul 2025 11:23:33 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4c7e774csm1963957137.8.2025.07.02.11.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 11:23:33 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e7f4adaedaso1304367137.3;
        Wed, 02 Jul 2025 11:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOP0H8c94kRO5zBgaRJBtuB6PezoLGQGm79RKQ2CTVTcZeKC7xf56ppZwIC3rC/EP1nj4bNatWd1m+Z2S8rpfqw9Y=@vger.kernel.org, AJvYcCXabTBwWVKz9TFtLPNcf+Yha5J2W9Q0oZIIWOz945bK2beRns4JI6eiv/fBD7wjT26U5VLRkMpWAjcT@vger.kernel.org, AJvYcCXivNuVstECy2nGCoccGfqA7VhIVNpYGdwE5pl2WmfIsjsaH0L7ox2uiYLGMDkoNtD/1Sb+DXRnmT6PJNUz@vger.kernel.org, AJvYcCXwW+jKzq82zu9IKPC5Sv4D7sfgQKGePJ0iSCjAARUvT+rBJEdPebHQDuan7JKAIqJSMe/NyvhaoNsB@vger.kernel.org
X-Received: by 2002:a05:6102:8017:b0:4e5:ae05:fff9 with SMTP id
 ada2fe7eead31-4f161055764mr2580625137.8.1751480612895; Wed, 02 Jul 2025
 11:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625141705.151383-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXbr5Rb7SNzYTQz+rBNuRrLCC4mf+XauTFA8FArFZzfNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXbr5Rb7SNzYTQz+rBNuRrLCC4mf+XauTFA8FArFZzfNQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 20:23:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3H0OqabLneTXeuhN5zUFx2-tq9OZjLbhR3OgLJ22Cdw@mail.gmail.com>
X-Gm-Features: Ac12FXxaGVaatnm---TqkHJJZtbKjSqzEKuKgGIudRuS-IKJfMIFZdR6GUTmBJI
Message-ID: <CAMuHMdU3H0OqabLneTXeuhN5zUFx2-tq9OZjLbhR3OgLJ22Cdw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: renesas,r9a09g077/87: Add
 SDHI_CLKHS clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 15:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 25 Jun 2025 at 16:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the SDHI high-speed clock (SDHI_CLKHS) definition for the Renesas
> > RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. SDHI_CLKHS is used as
> > a core clock for the SDHI IP and operates at 800MHz.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> >  include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
> >  include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will split, and queue in renesas-r9a09g077-dt-binding-defs resp.
> renesas-r9a09g087-dt-binding-defs, to be shared by renesas-clk and
> renesas-devel.

Looks like I can do without the split, as renesas-r9a09g087-dt-binding-defs
is based on renesas-r9a09g077-dt-binding-defs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

