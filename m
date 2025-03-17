Return-Path: <linux-renesas-soc+bounces-14457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15602A648CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 11:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21D7C16C28C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 10:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFFD23370A;
	Mon, 17 Mar 2025 10:08:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFA1231CAE;
	Mon, 17 Mar 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206117; cv=none; b=KOykb2Kr9dCU+HefuI9bllXEhO+L8CvTYOLipHHXC/1sUa1+8MjegfHzR7MWyxG/9mC9tkbHpL2F8gDIkBaZp6ch7/FD8E3e8oUmEV1Ew/pyNT7VPsE+Ve46fDibYrfctqi0FDK5n2X0/f+cOYZgvpdcylAygNZh0x8D+b4/QRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206117; c=relaxed/simple;
	bh=LYQnVVghqHNBeBZC9M3qcSQzc999kxd9dUjJydn7Zzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kn7zHJywVDPW8R/n+zcN7GioVgzu22IWME1bMWnlSXJHoCfCsxpDXPF9xvD/52rJ3LrjT5DbGSuCjkQB8f8pwId5bKAQOU+jNxS1Zhoagt00R9ZrsO5oiLdXSjfBvHeW46RT0kSaGgxWkKZFVlNGJicGvYkNCEFf4m4EQ6Q4BJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so1680433e0c.0;
        Mon, 17 Mar 2025 03:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206113; x=1742810913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nV0APjSl3A+QsJgQqRhAxvwjeltjb78Ah9QdJdDOGkI=;
        b=vYIL5iXMs59uI4v1sk9gCg3tRg2VXx1el+RO3A+SauUD/dJMdr+lU268aRGNuXDbQt
         Y8UZk0ONjmCjt/p/ZkKLYIDPI/jB1MHX0ElW5U9lCaslfWZKXki8wWm7sTRWCoCfo5kP
         rhxO/n1/81dL0IATbhrhRyP1vw3BThBPtnKdQFanNKat7pnlDe/aLFQlpJmIxx8WiQf7
         48h7A4d22JVVpVjtEtH2vBdqqRDzkhUnFCoX9sDIpKm/zgap7qDUgCqMzX8QoSMrBM7J
         T1ftPzLWBebUuOv/ELVAjszk3dQDJHxG0w/4ewjQvz+YKuJ77c7wsI9tRzWSGuJCObWZ
         1KqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFOsaGquIdxZTDkwavDFhc9BKuo+ER/u4vL7gczo+I6bTS+feGqhPbbm/54+DbDbxS9/TPOp2otEkl@vger.kernel.org, AJvYcCUv/4p3M7YXNbcP1BE4cbu+9GZ8OhBe7HcZC+u8Q9wd5OeAB9YZBuMxbckZfe8Ot0x3p9LsCU2mdnDeNsSu@vger.kernel.org, AJvYcCXXX9UoDbP7UcBk9lrrtvDPAIYO3bPQ8fzrkxdDVI813yLNuAxhTK7uZ/M82CK+nCbeG0ZBHBtA76yzPFdJGr4qPHg=@vger.kernel.org, AJvYcCXjdMlkm3wBLoItMsPl/w0LNHTJXz+Wg0DXvEaycP1t3zDBnOeSbZ4xhJjFvtZflg4KKUQ/lfy7OKjr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZmE10ODAD9WlyKNyf7jSGy6kKqYUnZgMOlfOKJ4Sb28am+9+
	hctv91VJ/rnFpOXhdRcL8PP6InjLzTNSBEkOCZswH9ArncWL3iM3fM7uf6FT
X-Gm-Gg: ASbGnctlRz4P3J+BgggOQJgxQYL8+XifuK57+dG/+AwH5NbeCDpzlmZl2fRmTFsKjWM
	Z9QTu98hYqq2wD52ODV8HlXkE+aTzD6QiVMr8sNKr+aZKAzjyYTNxtmBdXqqYgcPN0WIUnmAvao
	lC+6Hf/0S/8/CST2WZnV3rv58BVuiu0dGDs2wCnaE8W55CB7U//4q0vEkvZHGJbk6BhLigZH9g5
	zXh4x+qTe3KBS0etDLKc/5DUvoBBZMRp9MqfvqDkXHvl0YymTnE6NH9V2vgpHo2zSvfsBkxHIjN
	ZrVFr1ktLA/RCRZMEAWlMIC8Hrf1XvMKmoMi1FGbGSBnC6MRjliMVpzW427yQa+G4XnaxnBEQM7
	wZvFIo80=
X-Google-Smtp-Source: AGHT+IFN+LqCGUuC3TWRqYuo4aCnCNZO3sAsS8uQsurlmemoSaLoPVKu1He9xV9RB8djRMfvcrG5fA==
X-Received: by 2002:a05:6122:3d13:b0:520:42d3:91c1 with SMTP id 71dfb90a1353d-52449a48ccdmr5687552e0c.10.1742206112800;
        Mon, 17 Mar 2025 03:08:32 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a581473sm1548661e0c.3.2025.03.17.03.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:08:32 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86b68e51af4so1603642241.1;
        Mon, 17 Mar 2025 03:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgCQpKjgdkaV8d1Tl5XwnUwN7p5u979l59bB/HZHDu307NdJGDhA8caLajA79PQiO+U5lx3WQjPEbVEZJ6NVJ/80o=@vger.kernel.org, AJvYcCWSKu3hRUsUi6ygWJEPNjONENakq0aj+P0lnxWNz6g+rylP14J7mEE0dPd+SPUVMeB+oSLYM4HbdpqB7nN4@vger.kernel.org, AJvYcCWT6mVDlOrgURUag2WDpjfrcxeYVFYULTIh3se0sxowgCAvXxM/jFfcZUsW+q8Hq8IkUBMwzS14etvE@vger.kernel.org, AJvYcCX7lGqVcPxfZJ3tXy7S+CtPNE/aKIaGWiMmxv0Fbs35YyqQOMva9C39Fh6u8gNDUbE9qFSA/diE25ad@vger.kernel.org
X-Received: by 2002:a05:6102:3c96:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4c38322a633mr7665016137.22.1742206112108; Mon, 17 Mar 2025
 03:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com> <20250317083213.371614-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250317083213.371614-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 11:08:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4SyviVU0+WhgFD_vCO43BQ31tx8az-JihWDAB9EJS+g@mail.gmail.com>
X-Gm-Features: AQ5f1JpGenG55qVJIf1KTw9AQgufZanrRWkQNAtQMcFuCWyLnmEnMBpT-qpGwzw
Message-ID: <CAMuHMdV4SyviVU0+WhgFD_vCO43BQ31tx8az-JihWDAB9EJS+g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: renesas: Fix description section
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Pavel Machek <pavel@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 17 Mar 2025 at 09:32, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Remove not needed "and" into description section.
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/cip-dev/Z9P%2F51qOlq2B46FK@duo.ucw.cz/
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> @@ -12,7 +12,7 @@ maintainers:
>  description:
>    On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator) handles
>    generation and control of clock signals for the IP modules, generation and
> -  control of resets, and control over booting, low power consumption and power
> +  control of resets, control over booting, low power consumption and power
>    supply domains.
>
>  properties:

I think the original is fine.  When emphasizing the structure:

    The CPG handles:
      A. generation and control of clock signals for the IP modules,
      B. generation and control of resets, and
      C. control over booting, low power consumption and power supply domains.

i.e. the "and" is part of the typical "A, B, and C" construct?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

