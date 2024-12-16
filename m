Return-Path: <linux-renesas-soc+bounces-11404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B29F3618
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 17:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B4551883DBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 16:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5A82066E1;
	Mon, 16 Dec 2024 16:28:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A412066DB;
	Mon, 16 Dec 2024 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366534; cv=none; b=L0P/YRu2Snwj/YPNJizEg5ac7dkiWi6Lq1P5a0PbR55EvvlPgkfXjxkiv1ahj4coCfdXOGIlGaXuIRdbB6xRNPck+wi+fEo2E2O3IFArSfYKBjQfod9rtX3xylaDDzx5Q6krgWLZMBwGo4EYKc5nczkR3xCvNld9glWiYNWSv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366534; c=relaxed/simple;
	bh=0DqXZMCJSXuaxTeVN5UZaGjjKCSnXoDlfkqmEYoMRmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJ/rtFKW7XV8dDnqeaCBBNL629gn36u2MBYp63sTafWMOAheRJDKweLoOffuOL4S/DgK8+ANz9yn0uSUPxCV84E4thtvMtYZJNGygvvw9m5ZiJ5te5SWI/tQ6i0HGF8oi6o9wQJ8TZSNSKZxVPwamJjIRa/QsK5sBcKWEjD7FcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5189105c5f5so2197336e0c.0;
        Mon, 16 Dec 2024 08:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734366531; x=1734971331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HhT9rOmP0FhJurRp+0SFcOixt8A7S08xcNrEog9X4M=;
        b=vPdY8HuYcet8X0CaNJcM+lx0EcVhvRpt29yJsHKaldwqC1FadsqKlUHISnqBYvOVda
         trtDmhaApjqAs6Yrs5yyhmegHDGn+onai+twn7O5qK7Z2qSuTAnd7lq6FWkxinsSmajr
         ojZjPnNbVF5Kb5soReEE5XwDlw93uzFh966S2SLq02RHczinVlSVjd0HpSmVWXJ/wSGp
         msS3PICF/oHSjB9mQ4Hy3zW6qMc3oG6LPb74M/Sbq1o5kXJWvkZjk06o47aqma1suuuo
         UAPHd7K7sKPDP5tvr/MbIySmSEffW0dbZThJVAsO/IGZQmK/GkX+CLspqcudpe4JSPwg
         GJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVFqoToKGNcESB2SNAm+ezJuWOz01c8JponpFz+0nuFem2z4+2c7y2c0XWFs349ZBkMvl2hcsVvmyO+feHCEF9w9Dc=@vger.kernel.org, AJvYcCVviqDGKZN1rU25fd6s9kNpC69zyEK07JB/Cf9/KgAG1s1lWQQPk7viaO7lYO6JFVjhvvTRyNK5i4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLBxaRBMtkSMTV4alIT5M3AbEp06qcjukkX+B8nj6Wkq5SwmP
	axfl6Vb6k+44MXHX5wlWQ6ByvgFczm3NNGtwLnL2UMt2w6NuX9ZMxC806WiF
X-Gm-Gg: ASbGncuxO9ub4ZOvc49ho1DMB9fOmFuPq6DgssxlakycAW/ZCbpQw/DziXDdNUM+PjG
	6MnoMRhNeiG1DJgeFuCZkAE9NHm+6hSr1ApfDlwoF7jY71SOZSRGa9wR0Ol+dzvs3qmqIPsasba
	U5Rz6SjdJbturPQ0bwChoSBwU+sZRXCfjQjdA9q2E5ssY8YA4n0ZrQfcGflqI+VHPAwUHgeQFK7
	9ociVFSmL+WT5MSCTgWm9NIZ61N/b1IunzAcSLzrWADUYiGROU+M6lo1oo7YRn4F+QTb8YzN363
	Ou8bt0INx2TO5qM7G8k=
X-Google-Smtp-Source: AGHT+IHqsCQpSOjneyEBqVqAssp1Secl0Qic+OJpqHaow6zlhGRk8z/k4ksuz/1TKexgsLVlTYyJyg==
X-Received: by 2002:a05:6122:2522:b0:518:a1a6:4642 with SMTP id 71dfb90a1353d-518ca47332amr12540275e0c.9.1734366530526;
        Mon, 16 Dec 2024 08:28:50 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519e30e3a2asm643829e0c.1.2024.12.16.08.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 08:28:50 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b10e0654afso2682484137.2;
        Mon, 16 Dec 2024 08:28:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXqeiHbNdRSAQ+pFsJNQ4c23KjZRCihpZWlLWEO59t+97dfwnS1k8d4Exk/9rKmfErywUVSqPrz+8=@vger.kernel.org, AJvYcCX11x1BYCX4dL38sm032UrcK0ugGb3+vdzhqTU58Sk6FiEoyESxoMHx/ymHZ1EJqlJzSuqroRXOdV9QPYQX76KNZ58=@vger.kernel.org
X-Received: by 2002:a05:6102:5126:b0:4af:4cb0:a310 with SMTP id
 ada2fe7eead31-4b25d9a1650mr13938022137.11.1734366529874; Mon, 16 Dec 2024
 08:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216120029.143944-1-biju.das.jz@bp.renesas.com> <20241216120029.143944-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216120029.143944-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 17:28:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-v2W2wo52PQjD_egD+Z_TVPGGde3vUYbJSDn=6_Re1g@mail.gmail.com>
Message-ID: <CAMuHMdV-v2W2wo52PQjD_egD+Z_TVPGGde3vUYbJSDn=6_Re1g@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a09g047: Add I2C clocks/resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 1:01=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add I2C{0..8} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

