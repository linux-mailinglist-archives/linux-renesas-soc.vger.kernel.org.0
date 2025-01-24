Return-Path: <linux-renesas-soc+bounces-12478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D10A1B7D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2350D3AE639
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE36E12BF02;
	Fri, 24 Jan 2025 14:25:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE486335;
	Fri, 24 Jan 2025 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728721; cv=none; b=sB2hi2WCs5V0rNgldW1KNhz0sWl3wn+2EpwvkGpo8G4FczgcZAh6bIcsht8cDeLWwFSYi0yxrbwpDTdQS9ptw7T4R8wqRGRUHn7mVxfdL6Q8oyaPX+BzI1GlrM77nNF4dbAfS6CUsY+QPFy8L8BUEckMSwpbrQu+CljIL5hG+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728721; c=relaxed/simple;
	bh=aYtIZT2sRAgkYxafk+eex+FgQUM5iP4gssKX0ICr+dY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1GcN0AumiwqpvAUYrLcozuh4JHy2STLCYXpViPldr2MicEn+wqTHLbZLJHJsPfjLmfPDt/l7eTi7eV6Siosx2vexEGuom7UHfbOQZgoLj8mRW0kDHqEwEGkXGLiQhQy+qXXgr5EouxoAu9hUpoI4u0GyAM/tY0r8LmgUy2C+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85c662ebbc3so467282241.0;
        Fri, 24 Jan 2025 06:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728718; x=1738333518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md+1aqV+QGlUxxCD4j1Hp9Qs22FpdvTtchT31fc12kk=;
        b=G7kvPoBnIhzE54HL+jqc3okV0C8tSM1aSdidWCV2bGb45LZ8UHLpbuzS3ifDF3n5eK
         GIL7rH76yDyvob5Z7pZTfLrnJFwDWoXd846xiYLhZapu50ghfvNVTgnkLIaOjyfejkMH
         BqZK7bRYTKnUbDZGh8o919I/lBOSmBL9liyhzBQK/TdiJ/z1g7kYXHGkDaESACtVkXEl
         G7K10buVRibG18mri2DulqrUPsrqd6+g6rI0Ca6VSAsAZQxMBzotk1Rpul97JXXFpu4I
         05rHvVRMqXAvBiNmhzj7sv2zaWb3W77eQKa0H1zNwoBeLMU1N6qbJ6LmW68pTul0Aran
         jeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHM0QcErw57glsCQ1mx9CyyMKwANZFDmHsWDy/Uor59QO1LbeHvI24m4egznDaEZNkaT5fmIL0DgFG5IDi@vger.kernel.org, AJvYcCUOhLOPQHHo2FeWMeSiF9zCccAs2eQydm/V6bzHI3ELmTm+rTsdySr5Ds6yLG1CH0lDgxIMZ1DyZndj0y9ojTGirrs=@vger.kernel.org, AJvYcCXUA702OBPqiFpGy5xtkBuXbKwdl1LU2hYLC4E5BymVelJWgM45WCg+FzS4XL8GWTuz+7SbHK2h2sWk@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqWTVJJCawg9YjA9FIKfwEubtF1drm5W3J8qg1EVWZR03qbdJ
	b/w49YRiIflomzeCNoqL/L5v2Nht27dL8gE2lJ2X4385XvhrbP0HsM5GBCK4
X-Gm-Gg: ASbGncu/A/3WcOsHuhbGy77tP5ckWukujyKLgCMJWz6+yCiRJNB7x3tqwN6dkP2SYvH
	1w7bJRD2FYo9u4oT/9hKn7US5oTGAdz7bwYmDNYKUlIa/BMa9mTRJVNhl808utb2A3TOgivJr+U
	Aao7XJt+6r1YXgI1Ku6I+h6IV30fcvZAqpUN4ama4Y7Y3ZeCTkmZ3JXWx1R3XvnQ3y8bCx9uoVz
	7OdEHhJLgjcthh/VYr/Iu9uuN3FIByvuGMKDJtrJk3cWnuJF/r8ZpmXjhwDozZK/4QABb9lw/yl
	1QmFXjluqxSqyLrDOePY9//CBObPmYICMmZHy2niEZw=
X-Google-Smtp-Source: AGHT+IEwTUa3IwgTmGSnUUCmqerKUk6GXZhNEurB+ykH+oP746GyfqasSk4VTQ2x2cPNUQvNLBzffA==
X-Received: by 2002:a05:6102:26d0:b0:4b2:5c2a:cc9d with SMTP id ada2fe7eead31-4b690cdd6f9mr25275919137.16.1737728718593;
        Fri, 24 Jan 2025 06:25:18 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c171d2sm453709241.24.2025.01.24.06.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:25:18 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afde39e360so593018137.0;
        Fri, 24 Jan 2025 06:25:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYwls59TbZLcapjuN2R/qtCzxYsbdPxXZlkdNOyGJVm4Za0tvyzQIiN6uZZy9p+hhXGt/t7toShQj6@vger.kernel.org, AJvYcCUektZGnu8UM/nf0f7v9Nzuk0aqnmkUBPgCf6+X7s9fyjml72a/uv9UaLdJYPbh4ZBBIsDoPOfuCYsqo/xNTiLvXfo=@vger.kernel.org, AJvYcCVX2m0C/w9iUz1wS7jpXmLe4mM1ufcYXUc+ERGjIFFx7COHwYWxlc274ciW2tNDyAI7Goy4quZAUOCsAIws@vger.kernel.org
X-Received: by 2002:a05:6102:3f03:b0:4b2:5ce4:2b4f with SMTP id
 ada2fe7eead31-4b690b5d82dmr28671064137.2.1737728718154; Fri, 24 Jan 2025
 06:25:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-10-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-10-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:25:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBe-JGhKcSif=dFVHseknHbixG+Sjza6NACtYqTs5Few@mail.gmail.com>
X-Gm-Features: AWEUYZmhB5b9ZbQuRfYovMvDZ9zr4g8zNa3yEBb5xOxDEFiM151gCdvYTI6weOI
Message-ID: <CAMuHMdXBe-JGhKcSif=dFVHseknHbixG+Sjza6NACtYqTs5Few@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] arm64: dts: renesas: r9a09g057: Enable SYS node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 6:06=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> SoC identification needs the system controller. Enable it.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes:
>
> v3 -> v4: No changes
> v3: New patch

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

