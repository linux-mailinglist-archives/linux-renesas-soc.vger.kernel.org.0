Return-Path: <linux-renesas-soc+bounces-13215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC46A382F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 13:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC5201896C66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3774721A455;
	Mon, 17 Feb 2025 12:25:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72255218842;
	Mon, 17 Feb 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739795126; cv=none; b=VSnl/PNqFAlkVKRMhQGGoJUsSGjJg+FEKCQz0j9dxkPkYHepJ0Rwb+n+mt6XfWnhzwzbprtNKSi7e/hRhlHJOr7aHT+WQq3A/4GAdUSDTLt5Iw8uoeKX1hR2b2i0z807bMnqoFk3rbs9CErkvASe5S09F5kmrA11iBZ7NsphIEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739795126; c=relaxed/simple;
	bh=8EsnnAExLIbmkwz6a9yiUKwK1x2zuwj8e5URNlsIZ30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pR6hgqZYquXlC56jyhKK0ko5Qjy/x8zJ+tkkDV5yM36j6FM7gb11BBV+nR5QuiLUq2JV4D5a3dCM01aiPXQQntX6CzNXb/cgBnbAveHDNW2/mKJCHlJX/dGsf63L41vNvF0QiM6o2I1+9z5h4do4IPvgjUViJUa0VxdOobTDK+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4be707fffbcso15975137.0;
        Mon, 17 Feb 2025 04:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739795122; x=1740399922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEdtyBK7UfY7e+VMYAhKXbR5/lho4BcZPMg1z6On5mg=;
        b=Ht9bObPxfDi3UhB6XqxB4uDk3z1F5CB/cdMnsKyyTBE/bzDHoZLyoUMTN9pEeqRoua
         Butmrg5XBoPkNoLPPEjFkprOUlg5fSK7sDD0qH7CTjpffFMH8k6/lTgN6yb0tmkPCMrV
         Oi4QS13LWBXlYtWvO2Z7hf9lhfTBr14usIEYIYG3WSLO4xaZNEIM/s3PU6qPU0vF1kZi
         VAgy3au5IwYAQ7q3XB0ze/6GL7kijFo8j+HR2zKdHUl/ZvzymaTfkRE/yIDJsTaoakzt
         1QAUg3UJvyyDi5fumeQnZcZyJDdqYyaB2ZIeeCuW+9MFf7AjvgHNdm1z5bpeBv4Xh3eG
         nSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV0MKexn1x+hQRwtXpi3gGclLXbub38PMssLZQXshE+oNUGVU/nY/a4OmHLJgCLbLBDq8FXLUoAwzFD677@vger.kernel.org, AJvYcCVXyAZEUZPb0kd5287Fsu3buvOFHIOlOUQf+txewUCWFXlmxUKzE69zXXFNd8OaoOe/FV6uPN787axf@vger.kernel.org, AJvYcCWZGkGLQT+cYCZSSN3uCyT80LH66r5SiUS8/eHb7jZt/Mufh98vlOfVRRKmY7E4iUGY6Uj6l4ujjAPKTPgzbdBxLlg=@vger.kernel.org, AJvYcCXdUFpM1z3Z8fJmwvdutzHCtqMLX3xM8YaAOhovUTX7sAcizT/dvmKqgpGnZZVpkXY6n8YnbnDBIcsR@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOfhMWOwkIewF8t2uRr+0qS7gJedB5LiJbFaAd0zeVR3X+2tZ
	uI4ElmOpiw6Oix3Zei4hAiG4SuQeUKo33GoV2Ssi7oZQwoOmeaAGlrIiwCQs
X-Gm-Gg: ASbGnctyudZ89pHL+Ki1KBCQLm7kJyY0Z/9oVMmHQ2SHVKJ4BXed0APMvR1X8KtR8NK
	gl4b+PCmFGEMvYfg3pqE705zEi111Awbv3tJ37yLyN9D/0PFZv9mV42w1R1j+rUoBAbF6sO5Fwn
	SEDbqqQvbM9iVhTAHzWiOdC3DYlWS7bNlCiBKrLQl4Vboz9xK3rgletEfEb/k45A2wlhHg2M/tf
	mgkjTwv0W9MOmYoruD96ELaf7B8E74busaHrK7sG9N1EFMh7J+daeA0yPPqnbiQRpr+tZmIGdQI
	8OdSIRuNhC7czJiXkC95ivKjwPL6P0JOqgCHm5tj1oNUD1zJzJJX3Q==
X-Google-Smtp-Source: AGHT+IE6V22RxoJTvqpVsArlX0GgX8+ONmFxYb0F9J3/nu4Ea0Xp5vfgpnXvNR+k6XkkwK0c5MwY1w==
X-Received: by 2002:a05:6102:419e:b0:4bb:bf49:9088 with SMTP id ada2fe7eead31-4bd3fe85bacmr4042638137.16.1739795122664;
        Mon, 17 Feb 2025 04:25:22 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520be32e8c0sm356107e0c.38.2025.02.17.04.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 04:25:22 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4be5033a2cbso625964137.1;
        Mon, 17 Feb 2025 04:25:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNndBZlTn3FXDbV645BlM+s49cRRrBaPPdYSDgZT81HmMzB0a4Qw6bIVe8lVF3zV6PH/9zH9g3PK66@vger.kernel.org, AJvYcCVdyR6tOyRYMHsZ83WjH1hcoyLMpMP+tT+EjeCqNUmepzoRxkBPizzNMhND3KOnvwYjPhIusigjosJrkF7a@vger.kernel.org, AJvYcCVmWS5xJUUAnwid9NfU+bi5uWb4d009I7D0dpgycwr/a5E+mHxzdOOkB+/PD35luNJH/sNA63lgWpuu@vger.kernel.org, AJvYcCXMgoDdtVyGwu+De2MrXRbtBwAmHKCbfc34cLmv+2+enuC3PLuYvGFim8hDmCySbNfeZeuXEqsKj4JScmUNzA5Z7Qo=@vger.kernel.org
X-Received: by 2002:a05:6102:3748:b0:4ba:9abf:800f with SMTP id
 ada2fe7eead31-4bd3fd491f7mr3336947137.6.1739795122029; Mon, 17 Feb 2025
 04:25:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-3-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-3-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 13:25:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_rw30Qnqzxb4cmEsPs4FBXzqG7+BQtztx3=XMMnE6wg@mail.gmail.com>
X-Gm-Features: AWEUYZnGIe1bslYNmy-rEq37IhcV1Co9ygTyuYFINdfTDxCoBelELzNKvBlVgCM
Message-ID: <CAMuHMdU_rw30Qnqzxb4cmEsPs4FBXzqG7+BQtztx3=XMMnE6wg@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 11:54, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -52,6 +52,7 @@ properties:
>        - renesas,r8a779f0-cpg-mssr # R-Car S4-8
>        - renesas,r8a779g0-cpg-mssr # R-Car V4H
>        - renesas,r8a779h0-cpg-mssr # R-Car V4M
> +      - renesas,r9a09g077-cpg-mssr # RZ/T2H
>
>    reg:
>      maxItems: 1
> diff --git a/include/dt-bindings/clock/r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/r9a09g077-cpg-mssr.h
> new file mode 100644
> index 000000000000..27c9cdcdf7c8
> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a09g077-cpg-mssr.h

Please include a "renesas,"-prefix in new binding definition headers.

> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
> +#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__

Ah, here you do have the prefix; good!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

