Return-Path: <linux-renesas-soc+bounces-10222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACD9B6880
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 16:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08C21F226FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 15:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE8F213EFF;
	Wed, 30 Oct 2024 15:55:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA57213159;
	Wed, 30 Oct 2024 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730303706; cv=none; b=tFf9TTv2sTJjUQifPGrqUxyD+y4mbGCWOuTAYbqiexNKuLUJD4x9ZNrMGHupig1NEwyM2cvz6zzQWtj7bKzOLTIVCBTTyTQOyiGlO8DrqDXUg/fmxcBXYKsL0pva5c8544rAlMmnHJ0FLB4o9DBaxUVeRElPvZnCQkERz128HoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730303706; c=relaxed/simple;
	bh=9cmfTty+Ipu13L9T8CQ1vS7VMrr0rkjnBonrJEz97Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L794ouGIEoqLJ7zWQDXpfC1o2CVgqU2MehRrejPiaeyI6IuO9PPcFLwCdU3RoB6+Nq9qqKvvh6GHrDKELFKahu+ZhLk0gxFy1CiZJYs98I26eAszTTCJbS9xxZILoXAkyiRoPRQr47WIKXh+/AT1vnUzYJj6HZiBGY3mvbOfkTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e38fa1f82fso61818687b3.1;
        Wed, 30 Oct 2024 08:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303703; x=1730908503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dRvzEBRsZkD+ke4A1uzj82RQvXDshPwi69THlS2muo=;
        b=PcW3ROfmFgdBJuOSs4oBjTkr3W+zQ+tV46ivOLfl1Fa/L7vzCnpLlUXP+VfhJxV2YW
         Z3ZTa7lck8qPDYXFlgaTSSB7x7vhup274rj2bbvVCkeUkFhVap2ut0HUDWGN5Sn3mzs/
         7ljrslIJEpXmXpo1P/GV/WKUSxGlVLSrlsUjTIsK4OAQYeJ9Z+zqX4o4+AZjuOPbeGPZ
         r/FtrY1mzM+DBtJiHCWAspd/3RWc95kjDAab2BX/4edHTd9dB2lP27od4ZX53FTHUXaw
         rhD4PFmTPRDgx5xLaUzzxkzTUPn4m3W2Xtsj6qmOAJDFdz1YYwyqaRtwtM47lnc7tmwk
         dnUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2e7nZkVNaSEzvjKxWvPp1xvCZDP+WtvVlNXjNf3R160A3Ir3naTgVI3tdo71KoMmd9qscGxdCXHE=@vger.kernel.org, AJvYcCWyjRUGxr6c5wdRbhpmiOB5iXu9EyHLofnuR1AXkRCOv0yHs1BvmP4QEhwbE+VpkT0sJdgiSe+zghajPQUumUcpzEU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkts7Ps6KC3MeSlcJEYLnhZtHyvwNhNMW/xFAIcuAuvyl5DIpT
	3eovdbwfvHmokX2reesUrJULGLH0x5AJbq3HaZn7eTPmedrjeKxVKn9jCfvH
X-Google-Smtp-Source: AGHT+IFYRn+mE09+LEgTs381khOLWVxnqJDCr5EF7XIUhukg41GUG/COgq9U8F3FnmzfaSSXeqbqgw==
X-Received: by 2002:a05:690c:5:b0:6e3:29ae:a3a5 with SMTP id 00721157ae682-6e9d8b001eamr167270117b3.34.1730303703521;
        Wed, 30 Oct 2024 08:55:03 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6caf8b8sm24333567b3.140.2024.10.30.08.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:55:03 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e3e4f65dso72178757b3.3;
        Wed, 30 Oct 2024 08:55:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8qYKNI+EqgfPk1tNpC02vXr9hybRDFFm1PdvnroL3MMLKWvCJ+iLJDrWKOVd2EnAXwjGnNbek1q6FZ9ttAodLZCs=@vger.kernel.org, AJvYcCX25++SDDPWIsRE15k/QoYzO/4/t63DtsvRuabndBX2bQY0UzcT2T+2jE0KB/GlYTz1fbVyjkqkX5E=@vger.kernel.org
X-Received: by 2002:a05:690c:45c4:b0:6e3:23df:cc25 with SMTP id
 00721157ae682-6e9d8a76a3emr188156517b3.26.1730303703108; Wed, 30 Oct 2024
 08:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024134236.315289-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241024134236.315289-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:54:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkUuqgvAdOo+hBOEYxBs5bKvsBEJjL8SPMS4+nkKVVkw@mail.gmail.com>
Message-ID: <CAMuHMdWkUuqgvAdOo+hBOEYxBs5bKvsBEJjL8SPMS4+nkKVVkw@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Hien Huynh <hien.huynh.px@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 3:42=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> While computing foutpostdiv_rate, the value of params->pl5_fracin
> is discarded, which results in the wrong refresh rate. Fix the formula
> for computing foutpostdiv_rate.
>
> Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
> Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v4:
>  * Used div_u64() helper as the division is a 64-by-32 division.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.13.

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

