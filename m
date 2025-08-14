Return-Path: <linux-renesas-soc+bounces-20526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FEFB26AFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 17:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6D1E1690FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 15:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89C121B9D6;
	Thu, 14 Aug 2025 15:23:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3448F49;
	Thu, 14 Aug 2025 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185020; cv=none; b=jE54aj5N6zQoYNP7PQLYQ4qYusz64Tsal36c5meu5yGP+8Rp7rayJiiKzhBAc65FGrGrvZD5rQqXBsakhdJNUgVFebjbWYHZn2jpJXaOrElLgwtI4ISx7rNRW7VtdmS4RC9osabCBxWv3Ugr2CqwRfa/PgceDascHISmiw7yeDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185020; c=relaxed/simple;
	bh=/yXezW1FG/KZ1KYAeG0hPBHTm1AHW5a3nvMlnzWwcQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYbljHU4G0Hk6Cs2Hr/Hng/G0t7BqZWbV+kQxY14xTWQVUwASQVsfq2J/S2FQmYa89sI8N9PBvdQIoFLD6lLWp4TqT3l5kQRc1nSUz/B0MtnCOgA7srQVoaFND/1w3khbyv3YYqPC+PcM4kmP3fjpzUgWbbMxCt8XMXrGfkgIuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-50f88bd4b96so759719137.1;
        Thu, 14 Aug 2025 08:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755185016; x=1755789816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uksBVcZMFGT5hrIgSm/PLHfK7WggjB7I/fNjjld2HMw=;
        b=MOLbPBxhMdWQSqsYs1jIZ2MgnU3f7VQTML2dyoeQAtPA+DUuFaWiyjCtTTFA870Tw8
         GSNvj+RlwgOZUw63EQS+q0+wR87iGcUgFdSNhNFUEIguHBq/nj3y9EU+FRMyOtdHrqEJ
         IpVP2kNwbGFUwhbt9lXYy0cJbKHsagUKUA9vS+dbUxxhtE3L5PgSXxhUmlZRJ/fzQhG9
         buDfi/KIKV2yrr+/TZDA56PbG3tZCuBUnkpZL0ecPNhmrtFItVZLG7khuK15BttVMNRc
         NdUMG4GW8BI7POYra6boJdFxdbcnQ0Z0VfN9a5ZygjlCCRqft0nOhzGbd3E69LkKFmu6
         w62Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6HjJUl0hO+GaTzzmhsvCp2JPF5co4opqM36JKXxySR/zdgjWxtqmZ0M/D0PdYe5TdXS9dvwhLBx2r5pxWPoW8Xbk=@vger.kernel.org, AJvYcCV+H++Gp4wH46t2cgIqICb3VThvV1DH5uGQ66WA1chC8HJrRTp2JIOIJ6VVGF/5tSl2JoXt/SdYvV1YO7BN@vger.kernel.org, AJvYcCXnp/9R3wo15frjSg1OmAWWk0uMR3IFlObUIYDGuvZ6huJWsvJG13LoWiaIjOmG8epz2amZiWzQVQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUblTl4/Cp6hK+2GzoqtVR+fWoveijKbpA6y/MPHdHn920kxGc
	FifGukBc2tsANYXTzjhdthoDDiH+eBLg14Urf1hVqqKsxqi3R7AvWDfN9vl4ubeg
X-Gm-Gg: ASbGncv1MQ7cRe2ZcfNeNczzFGd0qqCsDkbM9M+9247edatWEHe75PIKAlW+DMVUCE+
	LXJGe4ehzCPAj50FcxzCGWYPdjUb6cXDOKny2tckhizAAkXHCQirqCQNV7QrohaddjMtMnhjvl8
	YXmQ6Fv2ETIhV+U7xtPiZ/Utnor05tRciuQKvJl2O/daawEJKHwrKrGyRwMjEOUUjkuCOIB7JOK
	BcKrMNksjWulrqMK6guq2KKxdVefI+CYXV/8DWBTRFYk1FAQWgCvY3o8WiQfFoc0a1AQtuWEJz9
	L5/FnmOhL341RFqbUjYxoz8fy19lcWehu1DQrvDgjWrJ0mg0QIKxrGMdRMDmEAWg0d+HXxB4+Y+
	LsjWAMKHQUSiBhQbxH5FVqGSaUvWQcTGTJA0+YddkufSZQvokJLsrJr++yF4j
X-Google-Smtp-Source: AGHT+IFGWyS+iCmY7mzjhAsPN+k928BiREDzOXt0k/jAzn7rlqkw3J2jNctBHg4EPqbo7GLSlyZJbA==
X-Received: by 2002:a05:6102:54a6:b0:4df:4a04:8d5e with SMTP id ada2fe7eead31-50fdf8e5078mr1495148137.8.1755185015804;
        Thu, 14 Aug 2025 08:23:35 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-509aee2556asm2155776137.22.2025.08.14.08.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:23:35 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018fcdcd4so533771241.1;
        Thu, 14 Aug 2025 08:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+4J1Zoqd6RH0PYqpCCp7HBFSPQk3Gan1ieOmDzTXkff+UiU8+WE0iXHzS1FGReBYfZUqzVi0JiBo=@vger.kernel.org, AJvYcCVlJnnJ6jzSSWTjkfprtRmngmjSmWGDTnpjZ6Xae6oXWxP2vLCC1Uu142NeU+TryoLOXRiyGHPOxrJFBa7hfPkIwXY=@vger.kernel.org, AJvYcCWbH/swOcCJ0oV8rZgxeQxYK1jAr/BIC5pB52a1PT1lnn8J+Ibyw8vv86Cg6akiugsnX5L9/0MhHka6ZzqF@vger.kernel.org
X-Received: by 2002:a05:6102:6a85:b0:4f3:36bc:554f with SMTP id
 ada2fe7eead31-50fdf2dc666mr1330157137.4.1755185014743; Thu, 14 Aug 2025
 08:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812171720.3245851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812171720.3245851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:23:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFUTpA711xfGOyc7iEMnML1qesYv+ZTP=SEh09yLGXJA@mail.gmail.com>
X-Gm-Features: Ac12FXwusyOrnYu42swR2dZbBbdA963OtASjhChxeNyolXggOV8FBZ1vTVfWLS8
Message-ID: <CAMuHMdUFUTpA711xfGOyc7iEMnML1qesYv+ZTP=SEh09yLGXJA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g077: Add module clocks for SCI1-SCI5
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 12 Aug 2025 at 19:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add asynchronous core clocks and module clocks for SCI channels 1
> through 5 on the RZ/T2H SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> @@ -48,6 +48,11 @@
>  #define DIVCA55S       CONF_PACK(SCKCR2, 12, 1)
>
>  #define DIVSCI0ASYNC   CONF_PACK(SCKCR3, 6, 2)
> +#define DIVSCI1ASYNC   CONF_PACK(SCKCR3, 8, 2)
> +#define DIVSCI2ASYNC   CONF_PACK(SCKCR3, 10, 2)
> +#define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
> +#define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
> +#define DIVSCI5ASYNC   CONF_PACK(SCKCR2, 18, 2)

Please move the last one to the previous block, next to the other
SCKCR2 definitions.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

