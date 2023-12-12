Return-Path: <linux-renesas-soc+bounces-936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1F80EA5E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 12:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41FE41C2086F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 11:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12BF5D483;
	Tue, 12 Dec 2023 11:28:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AAED5;
	Tue, 12 Dec 2023 03:28:05 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e19bfb258cso11246447b3.3;
        Tue, 12 Dec 2023 03:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702380484; x=1702985284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dBqkhGNCaNrIeJofjxToRgBDnB1BjUt2Wc8SAYBh/U=;
        b=OXP0LkwoVcQ1xuCB+l80jIdUZY52VQNKmZjDy3YJuHh2rarVdbLnrqHVNItFtT4Syp
         8QSRyPFymg/avr2Dz+9p3Ut9JN+WR7Not8SxxmHhvbusY+2cw5fGn6UC7J+LN53iEW0I
         e52mVFGPbjg1MbnY4fCrdhjBcdBh5ruOetBsjzgFiBeSuoxJuDveBzEVQgNPoc/FoWbD
         ejn33Y1ig+LW3ZB5noe7Dw1Rn5/6BWK8vmHztNMEi9sj639IFgTUI/q4fZRxOoF7vo8H
         evPour4HO1kmR35w2MP2/GQutjGI6bQ/D5+XwCXcJjy88XCLmqP8vLILLqTxbzEHyWk2
         Ta1Q==
X-Gm-Message-State: AOJu0YypEl0fanl9K4fRZRYDYhZIHOvLJLYCvWuUd/pyI0L7al8r8Dg4
	Nc8+K+UXMKlsvDq8gnoweNiPOWxOXprcLA==
X-Google-Smtp-Source: AGHT+IGQIl2x2gU/UCg/qi2Nmd5zHDHBC+GRHU8eOI8QNJoWzlmZDfJABG427Lu02D89Zh6uBF15fw==
X-Received: by 2002:a81:7183:0:b0:5d7:31ca:c631 with SMTP id m125-20020a817183000000b005d731cac631mr5287973ywc.59.1702380484141;
        Tue, 12 Dec 2023 03:28:04 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id h198-20020a816ccf000000b005e1ac5d8035sm619221ywc.110.2023.12.12.03.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 03:28:02 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db54611b920so5071426276.3;
        Tue, 12 Dec 2023 03:28:02 -0800 (PST)
X-Received: by 2002:a25:2581:0:b0:dbc:b2db:d6e7 with SMTP id
 l123-20020a252581000000b00dbcb2dbd6e7mr1371483ybl.39.1702380482366; Tue, 12
 Dec 2023 03:28:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208113218.3001940-6-ardb@google.com> <20231208113218.3001940-7-ardb@google.com>
In-Reply-To: <20231208113218.3001940-7-ardb@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2023 12:27:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWewWJ1msJTcPNcbAf296gt+Kait3ECXjsJrSN+uerWyA@mail.gmail.com>
Message-ID: <CAMuHMdWewWJ1msJTcPNcbAf296gt+Kait3ECXjsJrSN+uerWyA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: fpsimd: Drop unneeded 'busy' flag
To: Ard Biesheuvel <ardb@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@google.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

On Fri, Dec 8, 2023 at 12:34=E2=80=AFPM Ard Biesheuvel <ardb@google.com> wr=
ote:
> From: Ard Biesheuvel <ardb@kernel.org>
> Kernel mode NEON will preserve the user mode FPSIMD state by saving it
> into the task struct before clobbering the registers. In order to avoid
> the need for preserving kernel mode state too, we disallow nested use of
> kernel mode NEON, i..e, use in softirq context while the interrupted
> task context was using kernel mode NEON too.
>
> Originally, this policy was implemented using a per-CPU flag which was
> exposed via may_use_simd(), requiring the users of the kernel mode NEON
> to deal with the possibility that it might return false, and having NEON
> and non-NEON code paths. This policy was changed by commit
> 13150149aa6ded1 ("arm64: fpsimd: run kernel mode NEON with softirqs
> disabled"), and now, softirq processing is disabled entirely instead,
> and so may_use_simd() can never fail when called from task or softirq
> context.
>
> This means we can drop the fpsimd_context_busy flag entirely, and
> instead, ensure that we disable softirq processing in places where we
> formerly relied on the flag for preventing races in the FPSIMD preserve
> routines.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks for your patch, which is now commit e109130b0e5ec3fd
("arm64: fpsimd: Drop unneeded 'busy' flag") in arm64/for-next/core
and next-20231212.

I have bisected the following warning during boot (on Salvator-XS with
R-Car H3 ES2.0 and on White-Hawk with R-Car V4H) followed by a lock-up
(on Salvator-XS) to this commit:

Reverting commits 035262623959cbe1 ("arm64: fpsimd: Implement lazy
restore for kernel mode FPSIMD"), 1e3a3de1ff6ca6b1 ("arm64: fpsimd:
Preserve/restore kernel mode NEON at context switch"), and this commit
fixes the issue.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

