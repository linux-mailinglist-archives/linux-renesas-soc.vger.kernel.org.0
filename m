Return-Path: <linux-renesas-soc+bounces-9718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E5C99C1C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 09:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5D7B283430
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 07:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E54F14A4C7;
	Mon, 14 Oct 2024 07:43:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CDE14E2CD;
	Mon, 14 Oct 2024 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891832; cv=none; b=UbcccX1RBhhGc8XRHrg+fovowr+tFM9QtWUl1JnVAVcZiU3ZyA3k4Co8y922LVs9uwCz8rT5auTMeTc7k6JqdRAzM1YshhROHSW4PfbxEm73hU8wQg3fQ+Vz/GpjD6r83uk8iEHa2dsTTIu5GPb3+6GZgNVdRJ2t2FFDXjMQ9ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891832; c=relaxed/simple;
	bh=XQISXwjUj3n+ceIg5AVZa6nnDLC6uDG24LQDrWhgg1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEg4xywa5D4PkxQxtBQklJcvWkKmFR21wfe8SZhqeYB+/U/CO06D+0Ruf0HCWnxa2VU++A+QsIam6oUuTby0wfQQsfbXoC88gdJNQDweF+wZlYf/rKOf7Moeunglfw11tJC1n3FJx+dFD/luTf7rGl9tygBLufco2QmNfGlgErk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e20a8141c7so32090167b3.0;
        Mon, 14 Oct 2024 00:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728891828; x=1729496628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIC734HMoZfJGgcComHxXaWPfJqwv8pYL/r4zfguqp8=;
        b=RGjDHqNFSNeic+pPHKegX9cdanB/ZnRLGtaoy/vRsPfgf+NpCXI2V4PJURML/4QJjL
         UFb8JZgWZs6dY24+V4G3+Lgy0jWFQR2rDgT8bqb574+ln700QLYkH1QZJJ+eqoV+ZPut
         lvHGi8wN/fzBHNghzt+c4qS42sYJH11L3Qj54EvWGpvnxtW6LVMsA0t8K/RCguQzDrI5
         twin0eBcQqB4UmoaaMh2IVAdEdqTIBoHTnHSbaObCdiiRCdsLEjGuIEdOwielo/HoQLd
         NJlFW8hpPg32xe7zdrFMcmoNeq1B/DWql9avwsNRbrbpPrrW6wc2Bj249aJ2OGtIFivj
         C4lw==
X-Forwarded-Encrypted: i=1; AJvYcCXmnVkJPbXLWpXcMfdUltGID0YpUUZLfZLwZV8n4j2qyrIYOjmqhKSrsvyBwyexSMYbTu+RpARjY+9ySvRFFrneExs=@vger.kernel.org, AJvYcCXs3L6m/oiEVzXVJuxJVUanDC7Gqz64zD8ZDXmdYb8nWyglInwhVKQnDoHdVQYXvsBrvGvSxmZAOi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0s7phfvTr13WaHZ0ohd39Hha6bw3VEGOrA1UjMifxvcYQ+FV
	KOQuan2UpH8lpgJrVfJxoHZhf0mNpQqOBLNNOKQBmgAbywuIKQAm1uXOltmx
X-Google-Smtp-Source: AGHT+IG+t1AqwIfvT7gM3N7YpCRRohKjEGUWcafiT0lRskr2mGJcX/HlZfw8jBVxiSgqQA1tQe9hFA==
X-Received: by 2002:a05:690c:f0a:b0:6dd:cdb9:cf2a with SMTP id 00721157ae682-6e3477b968bmr72733847b3.1.1728891828254;
        Mon, 14 Oct 2024 00:43:48 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332bab60asm14477497b3.64.2024.10.14.00.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 00:43:47 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e20a8141c7so32090027b3.0;
        Mon, 14 Oct 2024 00:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUI+yYfOgqRKjlucEQ24SkIbq2IMEI02VS6Gk3QzHQ+ptKq+hmWfC4N0tskcvi80wlS3OFE/FODJb4=@vger.kernel.org, AJvYcCXGI4t/elXch8djU9HfWfytCp5WMQuHkoyyC1XcrRQdQYR4Uvls6YbiD0mBiyNDViqPn4sIaDon5H6lrRZj6v2Bgr0=@vger.kernel.org
X-Received: by 2002:a05:690c:f84:b0:6e2:f32:bd2c with SMTP id
 00721157ae682-6e347b4b28dmr70629707b3.29.1728891827231; Mon, 14 Oct 2024
 00:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Oct 2024 09:43:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com>
Message-ID: <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Hien Huynh <hien.huynh.px@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Oct 11, 2024 at 6:20=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> While computing foutpostdiv_rate, the value of params->pl5_fracin
> is discarded, which results in the wrong refresh rate. Fix the formula
> for computing foutpostdiv_rate.
>
> Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
> Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Improved the precision by division of params->pl5_refdiv
>    done after all multiplication.
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c
> index 88bf39e8c79c..a1e22d353689 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -548,7 +548,7 @@ static unsigned long
>  rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
>                                unsigned long rate)
>  {
> -       unsigned long foutpostdiv_rate;
> +       unsigned long foutpostdiv_rate, foutvco_rate;

While the resulting 64-bit value fits in foutvco_rate because unsigned
long is 64-bit on the target platform, I'd rather play it safe
(reuse!) and use u64 explicitly.

>
>         params->pl5_intin =3D rate / MEGA;
>         params->pl5_fracin =3D div_u64(((u64)rate % MEGA) << 24, MEGA);
> @@ -557,10 +557,12 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_pa=
ram *params,
>         params->pl5_postdiv2 =3D 1;
>         params->pl5_spread =3D 0x16;
>
> -       foutpostdiv_rate =3D
> -               EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdiv *
> -               ((((params->pl5_intin << 24) + params->pl5_fracin)) >> 24=
) /
> -               (params->pl5_postdiv1 * params->pl5_postdiv2);
> +       foutvco_rate =3D
> +               (EXTAL_FREQ_IN_MEGA_HZ * MEGA *
> +               ((params->pl5_intin << 24) + params->pl5_fracin) /
> +               params->pl5_refdiv) >> 24;

Shouldn't this use mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
((params->pl5_intin << 24) + params->pl5_fracin)) instead of a plain
multiplication?
See also the comment for mul_u32_u32() in <linux/math64.h>.

> +       foutpostdiv_rate =3D DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> +                                                params->pl5_postdiv1 * p=
arams->pl5_postdiv2);

Unfortunately we don't have a helper macro yet to round the result of
div_u64(), so you will have to open-code that (for now).

>
>         return foutpostdiv_rate;
>  }
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

