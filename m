Return-Path: <linux-renesas-soc+bounces-11717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089D9FD527
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 15:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBCF41884ED7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 14:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006AA1F473C;
	Fri, 27 Dec 2024 14:14:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132D91E485;
	Fri, 27 Dec 2024 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735308852; cv=none; b=dDz3lxVFLH4R4qMsbs4FXEnY15BYxcM/DHU4WDF3HC3vXTvAzhI7JcRy+s/DOTvG2NLmTSb70qEzbVm8Xg4flcr3g8feUDKB8liO0yYCf6cROc2cWZgbdE4c8mZisbJsYFcLK0aZc/1F7Xjdm+C5RaZWXJYZlwYjpgaxYKnPjMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735308852; c=relaxed/simple;
	bh=eqaRSDYKDS9mkhWhCXJIsGwQhmvG1/TjF/QKXMCcf5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrIjv+idDP+tVZxiBxpCok7D0/ERhONZdSQmy5TEapm05AaRd3lbFdJPUadIIdqpEwGJparmq7ZYcXrkjeeBVcXsffRhMK15RbSjyMysRlwE63LzbiH03ebZFt5gZGg7cn0jJBRuO0PxGX6laHILVg0hHOk4JOWNcuUL0K1CmCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso1451052241.1;
        Fri, 27 Dec 2024 06:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735308849; x=1735913649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIE2Itq6eGB21ifoEktIgnqp0F0YUiki8t0JsOc+HQM=;
        b=fXV38xbRYziqmB2HkUq/hAppTKbmSJLQhbQsswn8GWyW2MU07jnQRo6RkQlCrP4Ttm
         aXqnNwBDPqWSVTIGZOMCPXqr+f0M7ierEHQIy8BB3dCgTb/O7y55h5GdstAuH+w3TsBw
         EDQNC/e3fQ08TXInszuF+52L5e1dMwb8rl3OIWO+o7tuv0YQAliKDQwWiZq3QeDG7isl
         pJGeWQNAwWlHWnhEQntEciHxgJG59IklIaFvpWK6Rys6349TFcKcbBCQLiz6hEVl+h0L
         10l7wc27aMrwijMIQy/6uUm6YX/kG3U/Wo1bc1IqacW3lr49VxaQjfwFpOjK80cw7xuT
         9Nmg==
X-Forwarded-Encrypted: i=1; AJvYcCVSgzMvTNc4BAJ2n6FxOAPGw5InmxjrE+tlVOzqVGMqJ8tSif4yYmElgd2YnLPlMQtleEtOGt8wBgcSOq6P@vger.kernel.org, AJvYcCW5i7wVX0qCUNTZCECdI2B+lF2Hyb8C+wwU+EbMpe3a4pl9JgW7I5dyGCFodB2hLzgeb9FyBSK5gBg=@vger.kernel.org, AJvYcCWdrXv+meKnGPuxSceZsbUqLu/5M+/WcLm1VJUogCA6oN9BEgw2GuCwHY1ize3+AQBKtoHz/FJj/jpujLVu7nofE4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgifd7naON5/mbxaWXRcPVyqwS3cfA4AoInGKC8wjphAYyqyXk
	EWgmZ2HgkqG88MfT2aqGozOjGKyqruDwZFPLh1ktoKrfXYH2mFxZLCp+w2Ei
X-Gm-Gg: ASbGncv5Oa9R/kEAd2v69DDlyBAoIXHx/xuMpGDYICbe63OhHAIjQMpe46BhXtzMhhW
	nQj19xQyrlPdhoeXtVZDk2ZEaf8Ff3Fs5Msg2KurAZSub/JSgVEt9tgP6v+ZSmv+KiIVJaR4+oH
	k2N+p5hrrKEK1atZVmL4LYz6AbGMjhJ+i16HttLTlD3wusyjW1MJXRTE71SBwbS4dnQN3D4nKNU
	krziKcKfE8qKP52/GnIHE/28/ByMKe9kFoy4cdojv8WR5BtDFUS43Fq3serCpSYR09OWpCfaM7x
	TlM+2pYVqCYPt38SQGI=
X-Google-Smtp-Source: AGHT+IGv7Pvp3/cWqGrNBxA31KiTAdWIzQp++7E/2Zr+Vk6to8lVmh5fykGjwIAnHL80yPCG+si+TA==
X-Received: by 2002:a05:6122:3213:b0:518:a261:adca with SMTP id 71dfb90a1353d-51b75d4100dmr19255294e0c.8.1735308849301;
        Fri, 27 Dec 2024 06:14:09 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68b7d61csm1741619e0c.9.2024.12.27.06.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 06:14:09 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso1986303137.3;
        Fri, 27 Dec 2024 06:14:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBQfZ7juuVXMn9B54Qq5ZE/gBVnCFsxNPKqi88x1u/d25v+abVuYCPYQUPUVLoKeXZzhFLcFiFF7s=@vger.kernel.org, AJvYcCWDdjWdnmOJibecgD/7elwmZcfJmM9kR98ZiZiWR7XkkYauM1zgw7WHYdN5cXYhMjuQhBl5P8bJvTXQMG+G@vger.kernel.org, AJvYcCXwr6wQeN46K9A/vTgQoexrmNgCn5ZhMT88FM+vdAbE69IiLa9Sd20h7sdleGm5z5o5d+sfpkwV6gr6p5vl/YjuwOg=@vger.kernel.org
X-Received: by 2002:a05:6102:2914:b0:4b2:5ccb:1596 with SMTP id
 ada2fe7eead31-4b2cc493fdbmr20919652137.24.1735308848921; Fri, 27 Dec 2024
 06:14:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241223173708.384108-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241223173708.384108-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 15:13:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUngMtpBKnsoEhxDioe9NgRPbwq1rh=Sbzkad9STxK4bA@mail.gmail.com>
Message-ID: <CAMuHMdUngMtpBKnsoEhxDioe9NgRPbwq1rh=Sbzkad9STxK4bA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] clk: renesas: r9a09g057: Add clock and reset
 entries for GIC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GIC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

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

