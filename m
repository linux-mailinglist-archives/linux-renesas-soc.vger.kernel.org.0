Return-Path: <linux-renesas-soc+bounces-12379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED84A1A1AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2547E160DDD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E0420D50F;
	Thu, 23 Jan 2025 10:16:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2320C471;
	Thu, 23 Jan 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627376; cv=none; b=MHeVo2EKGxcVQCmZkJuJSAR6BuLX+56FPM9gxK1iwxfJcZT5LWKGtCpQxK7TEUK3lNK0TYMRCbvLjIDQYqDPT4vQpw8bgV6pAw8aVfRiymIejBz4nFGA0nxEdFKgC6/pJFQUWa5i1lJc4uU0H4m+O/Qf2lVJWx1XJTbh5IZa32o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627376; c=relaxed/simple;
	bh=hxJeX4eHbJhh2VY1xcwuRwiOQNtIGkHvrH6Ey5enBY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVZsE5Z2K9cuDeDHKLJLCXTUXuySddectcT1R6QjXn+V2uqxOEymSPV893zTXayaXyB22uZrdKGbsJey5oURPImMr1c2wDHqkunXCSsrXiCpOmH2NKVo8b5d9XFQAl5VdFxOa67wnW7suWy8FNmAx98PlBDosN7Sl4ojnGLZM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4aff78a39e1so204155137.1;
        Thu, 23 Jan 2025 02:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737627372; x=1738232172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joK1QzdyQ80MdcS3Fia8N4khf8lrHmtDpy5vmEii+/Y=;
        b=tyK3nbaAJwSkwal0uf5ESEZEty/q2JyS7p2glCtenvQQhJ0daMklGfwwru0cBXBGqw
         L4CORCX+9NCfrZkQNaWVi2GZYQQkd1pztu9ZU29wM8Nb3Wd8Lo9VU7F+b6CRY1Hc4GWq
         Ie5ivPHFvNbiVLp1NrxbWiWGdnhLi23Udfjzcq7wNc7BV7GLkNuwTyfFE/knScJ13J+n
         EcypS32yl2lFYVQCvnXBHQSBkTGtSWXZSHFyEz3OqOOGhIJncPp9JyFCr8BNbGxF3Qwg
         VGYd0GmtH6831s+FAtGm1ib/tEhwAWLyBBob/AOPY+Lf6MuPpBu5MHJv7UpjLegOAMsR
         tvZg==
X-Forwarded-Encrypted: i=1; AJvYcCUETm40LyxX0LlrLvNgR3Zm3BNBf3ktkzMxRKvsFmYAvVjbb5owfWVOKWrRNT5ocwqUDMeD/vhl8VagV5+BqCKbnX4=@vger.kernel.org, AJvYcCUjM0+OexXJFzndKNY/KxOFAketShha6SMHNDqCwaDfJ+gkDNQjPJcL0osrb+BUXVeb2dbhGj+SXGFW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsbdw0bjnDFUIvlT1+IWblV5ceHqi8J+xPKxCNtuW1QiRyo9Ye
	dUc7nuKiPmwTUr2gU1slLMs4fZ13uDMmNe8XTxLTnDWwa1ahSfDniFYkN+iX
X-Gm-Gg: ASbGnctjzpt0mjXrSWf+XtoODWyJYcsPJBz8FZISgbjYcyVYjsTBOyFN8ed6Ok1XZmD
	ozh33WjQYdXabcEVd7Bpad0ZujNCzvNcDOrhqsfDH8HcBzSBv/pFjjY4iKuCYZfbcoN2GvVjzBN
	CHWcDSQF3acGLFzN/zN2SAZREh9krIlnTEfrF4r5KLrn0kmsKV1C7mPsG5BPQyiokHD4rHXe9US
	htfL0fCbA47d23tXmUQFxhKOq8gGmu31gn2Mm1Q/30xohhbFk4niYudDtAubERRK1Mf9lZwSwTg
	G72o6gY6Chb1QC6yaN5ZPvBdKFZbztRbAUrTaNcfKT1v5hHhSlnwSQ==
X-Google-Smtp-Source: AGHT+IHDT9tCjrp6GQuxH9pC/t1M4EGsm13eW0jFs2/vjaV/S/uSTLGusucPLHbFFK2AyqQa06Nz3g==
X-Received: by 2002:a05:6102:cce:b0:4b6:1efd:5c with SMTP id ada2fe7eead31-4b690ce3fa9mr20636925137.16.1737627372443;
        Thu, 23 Jan 2025 02:16:12 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4e1sm3350546241.12.2025.01.23.02.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:16:12 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85c48f5e2c1so132083241.3;
        Thu, 23 Jan 2025 02:16:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwD95Sx1fZuskFC/sSlcjdxlqvG3YPZAYIMmBsGAti03oaeOgbL2/WJ2lR4V4qov9MJd9Kn7cOM43CimLggPC/Ne8=@vger.kernel.org, AJvYcCWzBuM7+8lLRcZyegnmg05qz6KRh1xMw02/LZ+WcAxJmnUpV5zye1qzX3bMuo3DoxA2G0OExn8FqY1P@vger.kernel.org
X-Received: by 2002:a05:6122:2403:b0:516:1582:f72e with SMTP id
 71dfb90a1353d-51d51b782c3mr21706396e0c.2.1737627371746; Thu, 23 Jan 2025
 02:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com> <20250115103858.104709-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250115103858.104709-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 11:15:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAe5nxHoh7WhTb_ArEK4_oyGYN3_14Vn-ZnU7iK8eWUA@mail.gmail.com>
X-Gm-Features: AWEUYZnDpVAO5i1MtDYbtZOjEcalUf6iX14XMJdyAIANAM09-KQ06wQVKbAhKzU
Message-ID: <CAMuHMdXAe5nxHoh7WhTb_ArEK4_oyGYN3_14Vn-ZnU7iK8eWUA@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g047: Add WDT1-WDT3 nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 11:39=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Add WDT1-WDT3 nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

