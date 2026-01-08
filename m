Return-Path: <linux-renesas-soc+bounces-26419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0665BD02EA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 980303190600
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591B437F8B7;
	Thu,  8 Jan 2026 12:48:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0192F4A14
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876493; cv=none; b=iEt/Iud+c3JOi5uUwJlPL02QwDWge5pbY0ixHnUZ8Jst2vB1DkPfpwpiga7+oxsrx2c5bnWsNkNqFA8zhdz5YamX1Ofd71UK9XfgUXfjnlBU8bC0WnTXvh8qbnE+R/HVhS3UEsENsDIYv4E+UUKEsJwpt/xChEko0JfWZE66Bak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876493; c=relaxed/simple;
	bh=gYLqcuQR8Q+WXhLk5WsSY60ZFCxF9gWLSAXbl+g0qyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5NCSnKnG1gA4mBog+tkk+97lHJE152neXtSLlTxU1e/CGFzlI7AS9psXkNFODe+pO0S8r/mUNPxiydsfoTE4ZqT+xbx0w8W1ZraanyBAIWaDKpJmr5JCrHcgcVWm3pUZhF1BJki8Fap5XNKlC8iUg7qkeDQmsfBRrSL2QywFIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f67.google.com with SMTP id ada2fe7eead31-5dfc6be7df3so1152315137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876490; x=1768481290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B4tidj+iK0D3xATA4P9Q9+i8tTKE7sCV5IU5EjdDtk=;
        b=KH9Mx6mozQ0hHT0fBjn+FQBnJDW/DcuwRj3gQWgrhA4IKnZtMKraknGLJy27HygZCz
         kknViwq5lKjJoOWOlpxn+X2jvUEUvrV36vbfT7MLgqm4CUTxRyE90Qx8HvLYoigFr/f5
         LIAGI3CuKNzSYq6eZFd1H6OpISEq4ikaAkALeQbsz3m9UZ7UGoWce+vzGbxVJJnDloLP
         aDAoNf0aB/PxAZo+6OqcgHLlui1ibDgYVJLEB94YyYbO6mrnsNXQQWViM2+zPyoxzm8Y
         YnU28xaXhjI4dxUN8LO+Rt6luI8M2+g2ZMWMxWQPjZ0e/xfH3HCfbISRukrk7klHaw5p
         MGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyC//AzZrztSpaUH+JQB/5NrtNRReEEfmFsnvJpvich+qCX9tMw5/pTz3AMZ93umrDqGiZfC2AcxuULBDw1zIK8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3ajA9v3EOGSaVHb6yAOtxZc3lxE3pz4UhBKHs7zfl/G9LwP+
	C+qBe4XuFaPB9cvoeEhVTqvD5TpAJd1YKyTqArkLidZ3yi/FNc9N2WvEYlA+qg7frRM=
X-Gm-Gg: AY/fxX6qV4x1D83MUSrMFrbxsYE2oQo01UcUfqiMnRqCSO0aE4VghRp7QyDfr65pijK
	9/NjBzRbAlefwkFSfvPeUwrUmoBQGGIvqsGyLZLwADKm8PbhEt9oqccJYwTZH0RLlVet13MdVxH
	liPPdC7SutHBgMsMK1QDs+kxPZTiiDt8tIeV7vX4UV2RzNOFgyBjyqSs5RN9uKlqjr3WcZXVaND
	P0l4Ain1OOlV3XAKf766pvZSh0Ae81nvJfaspKYatD7xKV1pcIbPIlMFOrLXrVUGeS01J/owv5H
	JnKWLHLUJRlU3oLEx3n6O4fqvHftYUPIslgBn4MtBuTQSCjLBMi4lo48qMDNDtQu39STh1No/su
	3KpS691U/YgDYKgphdL1F58fA809YsH4ZRjB6dFa6tJzCVGzKuFCfxjyZjUXmyMdam6fOKewC/f
	gEkasy79fLDmmZ5KVZWpQ7qVaweP5434ZzndcIFB9PZDbfyan2
X-Google-Smtp-Source: AGHT+IGcDDyOBaIdXh/5XEdrwvNyfIImgd192OnijrrvqxxKECNHkRSNvnk8bnAUzy8b4BoM2AWGhg==
X-Received: by 2002:a05:6102:dc6:b0:5de:31b1:2011 with SMTP id ada2fe7eead31-5ecb513dca5mr2062959137.17.1767876490424;
        Thu, 08 Jan 2026 04:48:10 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ee9d013b3csm1499921137.5.2026.01.08.04.48.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:48:09 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f63d46f34so924519241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:48:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmtKv0C7X45UZAzBi48MJiMLhqlKHheajgxDqma8RsTOIyyFbl9zOt+i/o/JVBL0tq/hcHnQ5tcXTZ/LN+1t/zIg==@vger.kernel.org
X-Received: by 2002:a05:6102:508c:b0:5db:cc25:dd7e with SMTP id
 ada2fe7eead31-5ecb69083d6mr2121654137.34.1767876488653; Thu, 08 Jan 2026
 04:48:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222162909.155279-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251222162909.155279-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 13:47:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJe68Vz1nk_30KT54t040mYv6MBD=Kttruw4nfz1qLWw@mail.gmail.com>
X-Gm-Features: AQt7F2qW201xE1CipQTEgelw42wE49kIh7jGt0uhdogu1_rDaCTLbGtcolX4WD4
Message-ID: <CAMuHMdVJe68Vz1nk_30KT54t040mYv6MBD=Kttruw4nfz1qLWw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: renesas,rsci: Document RZ/V2H(P) and
 RZ/V2N SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Dec 2025 at 17:29, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the serial communication interface (RSCI) used on the Renesas
> RZ/V2H(P) (R9A09G057) and RZ/V2N (R9A09G056) SoCs. These SoCs integrate
> the same RSCI IP block as the RZ/G3E (R9A09G047), so the RZ/G3E
> compatible is used as a fallback for both.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

