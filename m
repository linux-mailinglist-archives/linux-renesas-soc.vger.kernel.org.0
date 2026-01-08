Return-Path: <linux-renesas-soc+bounces-26402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4AAD0237A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 782AF30E07F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFE84884FF;
	Thu,  8 Jan 2026 10:21:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7694884EC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867666; cv=none; b=amefgavP4pONGWjahwVanSpQBWwOA+nHzJaNxBVdVnqhpzh1HA2OX5HEEe6RmL1Y6+KmZ6FxDM7x+k7wuu1uNvQnLwyvsKx7s2ISIT08flPqee0F37Pf22SZIEVNGhIQUlY9xBn9yA694+hsxB7ExQOkUlJTXgUEUQaSYbBb88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867666; c=relaxed/simple;
	bh=pGg9zkdVQOf89+usv8Daa9DstO50p1qO1Ru3e94qQX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssP4yTwnOtQVi7/7b2on8U5YMR6EoJvK9RdvEPdYHrnQUl5n52xSPlxSgzT4SvfeXDnh62wd/C0NzMGI+7vV1QgY+tbVfhxa1ciKSfgF4M0tPpwFger29SHiPAzCCH7iYEMWqcI07S95PAM4NSdhrYGIeEyeDx98G3kWBdQmimY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55982d04792so2167189e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867663; x=1768472463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KYTwUPo18TQzTPppR+0uTL0qRsTCN2Iw6Xw2gz/T9k=;
        b=fvXU0sByhVF44npSTHDjcJ+PinUJdEytX2gM+krXy/YirGAIzHuLkI6Eed7CrGKptt
         3WwPqMxEM1ZwYzmdNLCpkDgcAeT/rQqdaKojNxcE7zJTFJUIqRswmUdIll9c7gfrh4E2
         gNdSRSFIUlEz22a/eLE3Ii8vNKvxLFwbuLZgpZF9U5jQMTpCgup/ZtN1fwtREUwnALhh
         yoNtITuWGecQFr0jc08rWBhJgcUvWTRl/sY7hgdZ9tCQzE1/rPl+JoOEFJZVw4M7++R5
         +0uCJJZDwB3pIIOcWgXH1zUFt963G0aptSIRftMG/h3+lvLGox/fBRtVjtRd+/ZJGFwC
         se/w==
X-Forwarded-Encrypted: i=1; AJvYcCXkwuFBJxvVNgyrbu4dYoy66bGLdXRZdbnRXnwxi42hF2/nDgxxDjJZk6AWWnLx2yANhUi5Y43SzD+bnRV2GWSEwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQsq8vxm9fDspvZYQHiLF6rAGKBkZ/Hh/KbiuxHUH+mJuahfH
	hCq3CV4lPc/aZQVYofLjw2zUOfyBx+s3+O3WnCiensl+0OtRlQXWtSiwZ0uaSW4i
X-Gm-Gg: AY/fxX66gEJzlGTrnsx3HZRCU0Sm19sv77ReKuCSVEhRNdoW00xOf6RMsikRKJZgte6
	Vbxd6+IusW4rMe5I3MDPQg4JJ/Qx8bFEf5BUUds42vw1AfUlbIWPi36ZEXxW3r9YytuHhW57p9+
	OOySVZ+q7EqJnK78SCRBRl/OU8MEEiB5ym4RdIZuYil2pORhbTnqrvzv/zPGZXDRvzsr1naCiu7
	LaiaMJo/AoSGv95mrvU/zmXrP+hGoBCUBjwpWwnOx8DE23j3Ow9NXkAkDHxpuZKeJ24NQN23MN9
	l+T2BqSNhNu9Nhywsz9wmZ2AE28hP4hrjGTZ77bL6JzhxJXgd5wvVKZx8BEXBAtGATj30xfsGJY
	YirMtjGxug6xpwaUcGxG1VaxNUNFyTGh54zRgik0m2NOaKc0WWlN/LIfrte8c7mQYSc4ACOPr8z
	hm7AxcHxjneoqIUzE54wgySIN8EN3WUeRs4K0QIYIK+mX7CHClUNWss81FNfM=
X-Google-Smtp-Source: AGHT+IGBJNfVy2h96rrFx6IUYq4Te8FiLa2847BOiZN0eFRK0iYG8SWL5W78b0dW52Jg9xOlmkj41w==
X-Received: by 2002:a05:6122:3654:b0:563:5e42:4731 with SMTP id 71dfb90a1353d-5635e424a8cmr94606e0c.15.1767867663136;
        Thu, 08 Jan 2026 02:21:03 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a20a183sm5587869e0c.9.2026.01.08.02.21.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 02:21:02 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ecb1d9ac1dso1159023137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:21:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeyUb7d6hc+nT3cJ2nXQvlDd5QMQpSeu7+kaGz02wBl3kYW9EiyDg1RGmP5cwj6vcn0whjhrYY6t3dzaQaWjOxZw==@vger.kernel.org
X-Received: by 2002:a67:e716:0:b0:5d7:de28:5618 with SMTP id
 ada2fe7eead31-5ecb1e6f437mr2335328137.5.1767867662424; Thu, 08 Jan 2026
 02:21:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251230115814.53536-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX5_TkFmgqv29Nddo4bZzEWQrL87kwqTdiLwfq+qMtsXg@mail.gmail.com> <CA+V-a8to1W2xbA7LpzLa5RSy02hyUFG0AeDR4iSsj7jt36VKVQ@mail.gmail.com>
In-Reply-To: <CA+V-a8to1W2xbA7LpzLa5RSy02hyUFG0AeDR4iSsj7jt36VKVQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 11:20:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUe6gkbgQj7cjeZ5w2Mn_HPDwiuh5yEp8nQEE-vQPLqQg@mail.gmail.com>
X-Gm-Features: AQt7F2q329GKSf7dgOJYdzgZ3DUM2vDua1zqaJTIpmI1KP2q0zp9hslKg4nKf7k
Message-ID: <CAMuHMdUe6gkbgQj7cjeZ5w2Mn_HPDwiuh5yEp8nQEE-vQPLqQg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] can: rcar_canfd: Add RZ/T2H support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 8 Jan 2026 at 11:13, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Jan 7, 2026 at 4:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Tue, 30 Dec 2025 at 12:58, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The CAN-FD IP on the RZ/T2H SoC is similar to R-Car Gen4, but differs=
 in
> > > the AFLPN and CFTML bits and supports two channels with eight interru=
pts.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > However, compared to other SoCs, CFDCnNCFG.NSJW[6:0] has:
> >
> >     0x00: Setting prohibited
> >
> Sharp eye!

I knew what I had to look for ;-)

This one was indeed hard to compare with other SoCs, as the structure
is completely different. For e.g. RZ/V2H and RZ/G3E, I could just use
diffpdf, restricted to the pages I am interested in.

Still need to enhance diffpdf with shift up/down buttons, so I don't
have to adjust the page numbers manually when a few lines are suddenly
moved to a new page...

> > Perhaps this is a documentation issue, as the same limitation was
> > dropped in RZ/V2H Hardware User Manual Rev.1.30?
> > Linux also has no can_bittiming_const.sjw_min field.
> >
> I've notified the HW team to get it clarified.

Thanks!

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

