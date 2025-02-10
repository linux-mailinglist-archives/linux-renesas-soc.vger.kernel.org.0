Return-Path: <linux-renesas-soc+bounces-13009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A972BA2F1DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 16:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6709166272
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DABE23F264;
	Mon, 10 Feb 2025 15:36:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56823E246;
	Mon, 10 Feb 2025 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201804; cv=none; b=Q+iY/Ml6YsK0BSaO4FnPRZUoyowJg1gcthNs/vgj1oAmIwc4bMx8IkYDrDyyfWQkiXGZzrZDszeMHWc5/wrGV0j8zLsfEwgDX5jSmFdDMARgnX/0gIZhOcLtth2/P5rq/JetJ95/v3McDHIbsvTk5XcLJWUTvter2hvw5tvCDvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201804; c=relaxed/simple;
	bh=8uVfs/aG4YnHpNLZxvcGpef4XZx9t4Ld5yo1LSV6aO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+vKxPpxA2Y2dC8jD1nY5YMztGc17C0lXQVSdH5x6k+ap3hayMNBv/YUjAhrYincdiv3w0K2FzTUD8HizwDiYwH0dzqPjrbnGh0QcLD5mtJJuQlYXvwsVItOC1fomMqyLnKZHFtn9RBQ2W02JzDcpgStIfcpykm/Tm3N66t0vcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4bbd394e0ddso245925137.3;
        Mon, 10 Feb 2025 07:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201799; x=1739806599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1bFeL+nSrBiBiPg1cidpZULBVfMrReHY5NMj4mDP5Y=;
        b=Q627IDNj+Qrcofh1S7xJDueM07WRShMR0L4QinOsGaDAU5MHV1PupGY6pVYOeGqG1n
         guI63jnJ2xwF9dYVQunU7GWuX3WHlxXgWddRNqY9tiTtIN1G//8nvrbcbh1B8oB7BA6q
         0gYfd2CpD64mLGGSC86liLBhAl7E/nU4dubL5dAk/YBFd1AlMUdHk+u9iRj7cTbYOUIL
         ezPDM/c9XG8hz3E41mu6vbm5hFFtUfYuuoR4Jt0vtJ5k2EVfL7cXwN68IVDfuYQKZAtZ
         bTERtv/pySdd6NOBl3uMwT2xWeJyamrJTsvm/W6RLOoRkdOa0l4nUSD82ARZyFW81V7C
         o3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu0XkcVnSGHdfVlN2UieM5f1MHpNhMr8WItyGJ4S/VhF6QTEvMqdk5DoT3d2Eom9FlThkCstHrYhNPa1ML+QHaCig=@vger.kernel.org, AJvYcCXVXf4JpUHfubm9W8K3DHQePUHy97nmf+F1cAVYQ0QW7K6y2La2kr5fa+/U88LKg93nnc7jldG8ikDCL8k=@vger.kernel.org, AJvYcCXcWbV0yYdlOqcOtc2gt819gyk43YnkVL7XMi0On94gVPmDQTbq4aoAUtTwKXuBe2JivsbC6x9BJsq885g+@vger.kernel.org
X-Gm-Message-State: AOJu0YwR73GBK2M9bLyN/SbJPMH7DONe2NG/5OBR6JGa/9myrACgTjbM
	Rp53Yh+P9W9ZNhCNySOOID7MI3ZVpv1kqSDHzLnch5ofd+wJpm8JFICVcnPy
X-Gm-Gg: ASbGncvEnR8VGwLluWDCEwDN3uODS/QaeL838LeGrn1yxt4BFdCng+aETV2xA5Z/Asy
	LGZ5IRWoI/22ztvdMU89fOlhQlvA9ztBZR8/DEiTGYgAYWGGSC+wzGELFkqvQLGi0vrw+EctWsS
	S77EvEbZJHUXcfU8PC+BkVlaRg3BLltzTsfLII+hAOHYzDodG+Tl1IydHvQ1MAxQV2VqX7VyxL3
	f9BL4lSJsCOSoVF+c2/BazrOLO49GXy9EjiZSL3eRvH5LkmOEPqWHGixoIO7KQ/cFXoH7BEwEnV
	RE9tALFOUgYAgQLrCWoW5QlpnLan+btyRn1MEJWwI8qxaSLmimt59A==
X-Google-Smtp-Source: AGHT+IGLX3bJgFsWU60BI5QcpPD819ccwThR9xJr+o8GJDzuU426t1shwi9V0ezIgIvqoWcdCZAipw==
X-Received: by 2002:a05:6102:4bc2:b0:4bb:d394:46da with SMTP id ada2fe7eead31-4bbd394585dmr1660462137.6.1739201798181;
        Mon, 10 Feb 2025 07:36:38 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba9aa45be2sm1047748137.14.2025.02.10.07.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:36:37 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4bbd394e0ddso245912137.3;
        Mon, 10 Feb 2025 07:36:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTOW6Tr0INJbpZZgBxHJIO3IQp7zXaUn95hiUaOIaFLMw+hyRz6xRm3H9X9GMz8yj/pZh8bp6d2FS4KcTa@vger.kernel.org, AJvYcCUaQH/TYOySccpXaEzK/ATQ23Yb90KsjmC3vdx5juibdpKOEJGWW8FLIWFig+sGoVSQcwsf38mx/ckKKL8AWRzSzA0=@vger.kernel.org, AJvYcCWui2TieI05a6AyFJJQt68EiwscYQDmamjaSCPAjVuNdLZ6+1IKzg7219MWhojszC5zf3tzF0MNwrFU7Ls=@vger.kernel.org
X-Received: by 2002:a05:6102:4b8a:b0:4bb:d062:44e with SMTP id
 ada2fe7eead31-4bbd06213dcmr2190050137.1.1739201797741; Mon, 10 Feb 2025
 07:36:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-10-thierry.bultel.yh@bp.renesas.com> <CAMuHMdVD1dLP53V_zOhxpqazDdPDVafJ6iohY8u6WPQrmYH5Sw@mail.gmail.com>
In-Reply-To: <CAMuHMdVD1dLP53V_zOhxpqazDdPDVafJ6iohY8u6WPQrmYH5Sw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 16:36:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVc435-0TDheV_r56Am=REx_eD2baKQFW=YzcsBiLgZ0w@mail.gmail.com>
X-Gm-Features: AWEUYZkb5Ge2ONaFnqqebJfE-1yZ0lNIfDqp-u30dHNAHwBHf2save9f0Esu0nE
Message-ID: <CAMuHMdVc435-0TDheV_r56Am=REx_eD2baKQFW=YzcsBiLgZ0w@mail.gmail.com>
Subject: Re: [PATCH 09/14] serial: sh-sci: Introduced function pointers
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC linux-renesas-soc

On Mon, 10 Feb 2025 at 15:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Thierry,
>
> On Wed, 29 Jan 2025 at 18:03, Thierry Bultel
> <thierry.bultel.yh@bp.renesas.com> wrote:
> > The aim here is to prepare support for new sci controllers like
> > the T2H/RSCI whose registers are too much different for being
> > handled in common code.
> >
> > This named serial controller also has 32 bits register,
> > so some return types had to be changed.
> >
> > The needed generic functions are no longer static, with prototypes
> > defined in sh-sci-common.h so that they can be used from specific
> > implementation in a separate file, to keep this driver as little
> > changed as possible.
> >
> > For doing so, a set of 'ops' is added to struct sci_port.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Thanks for your patch!
>
> I can't say I am super-enthusiastic about this approach.
> The SCI variant in RZ/T2 seems to differ a lot from the already
> supported SCI, SCIF, SCIFA, SCIFB, and HSCIF variants. The latter
> are very similar, but usually have just more features/registers, and
> further differ in a few different register offsets and bit locations.
> If you compare the RZ/T2 SCI block diagram with the SH7751 SCI block
> diagram (or even the R-Car SCIF block diagram), the most striking
> similarity is that both have a baud rate generator that can divide
> Pclk by 1, 4, 16, or 64 ;-)
> So perhaps you're better off adding a completely new driver?
>
> What do other people think?
> Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

