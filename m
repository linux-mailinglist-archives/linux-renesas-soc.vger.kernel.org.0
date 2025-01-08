Return-Path: <linux-renesas-soc+bounces-11953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 333AFA058E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 11:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B041B1884E32
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 10:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9331F8AD3;
	Wed,  8 Jan 2025 10:58:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FB1F869E;
	Wed,  8 Jan 2025 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333892; cv=none; b=mfrjKp7p7As57Qnf47w7DZv6gItGgN1bcE9ynbBcDSp0Fv8oxVKhzW93onizGOY53vulyQhtiAKyVSsXYo1gfshAQHyQGoRAsYjD49Q6VyU0tYYPag6K9UB7awH47IR/J1EK9qqoVv5CsbuUCNnSV2RJ8dQLZiwNssffD0b2pQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333892; c=relaxed/simple;
	bh=IgfkRIrIH0RMY0k48NEmL3C4c5XUZOUlbe0a0KYQxQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=US6D8eY4Aikin+1V7lpSjfUmoTOCw+Bw6XG3DfOLFyW4YYaPhlKF+TPd+NrYLKnalJP+rY8zXB9913dsKTvsFgGSqep7AQTP1EbIifPhcZtdO/FVfueld7vh+GB0zEoYUgaN/mgvfhXuuAkJnsAhvoiRuFqlbHfaI18mRjEZH4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4afd68271b6so4171869137.0;
        Wed, 08 Jan 2025 02:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333889; x=1736938689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qAy8MfUpz5XF23Y6J7TSgyJxjCjgcUeNlspx66UCbI=;
        b=bVFXfY9HFFWCzmGCikShsmt4Gg/uRy9/9mSRkx3uICrhndeDBSaus+8d5Bn8QggpCq
         HXPsDS9EM2ZDujPNHHAtQDSb8F2TT480Dctv8Eoveq9bqnBf5Ca3OzYsqfPdw2Af3G5a
         t4mNcg0ZO9nEYtpxKCbmID0xRIi1IsGxoseXFkJ1TbNY69KvQyWQuREpX4PhFrg31RZV
         iALzbkoHPTN+qdl4rcuLgVFHOxjRHgq1Qyodv56ZfQ5GmyNl12kzxo7IjGUibDKO5Cyo
         hu9BBkTdj0mGyoWaco6kCXTXQmaGZhx83FSyrhuqC55NapgbdEjPF2GPifiAPzVjAUuL
         EfqA==
X-Forwarded-Encrypted: i=1; AJvYcCU/r/fYTqihJhmsv3fiPNXkchEJR6BVG0d8pslHhgzO/L1K0nUyWuqdoib+D9V1MoYYwcP7z8TBKMvxHW0=@vger.kernel.org, AJvYcCVnEfb4IDj+zdp4r4excJG1Pzr3AWMhtCfmtdzcrwDUX2t9MozXYAiB4r5NjnJtyH0zjZI1nd1Q6QJ+oowSfCA=@vger.kernel.org, AJvYcCWAoi6JkeAHRgF0a0Sqh4RlmzKWlYAPfEUr8PZC53itaZ6HaPjRUUwpKj6bMnoNmxrDkH7VFIqK0oLT3vVI@vger.kernel.org, AJvYcCWLkv3ItWTBaUIWY19mE9vEUlj+F8l7UOEW9VEV1kkFzVVYtZk3n+K1xcycTobyL5YHn69WqM1h2RZNc/7H7H1U7ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKt0rOz/iIjI5VjY270FA8haJhWYcxn0n8HAbymSpO8tYhvy8A
	BM7oOdlfzkK3BknVtLa4/DwLytkXFDZ9oWlZikixqsd/wF9sfvXhc+U48DYW
X-Gm-Gg: ASbGncurxhPFQofHzgOWRkpSk092buSTajN94JF1W9kfWzgvrTxIcZt+PKQ19ajzZkb
	D+Vz+/cLFl+4CCxkcUoC3aRvqSdj7rgC3RSihGZmIDPJeH1Y3ypx44iagh7IXUhcnKmW0gUNSNc
	mRfY8cB8NIKJeKC+kEag2zbhodZJLyECrfGHlRAIhHBO3htNO71u4x9z1LvssxKYuOK90o7epZk
	IQLk72mjiK3161LNRctpKVOYL7UzpaMA4hj7s36awLSX5z1pnYuv402eeS858iucJ8n3RViMD7e
	giLjG9Gn3NwJbJL0izaeRSQ=
X-Google-Smtp-Source: AGHT+IGlta3OccSl8X/5m7W5W92aQV1qMJhWZ6wQf56o1o9rAvQuzuc4sb0JPiYfxRXPU78t9E5pGQ==
X-Received: by 2002:a05:6102:b02:b0:4b2:cc94:187e with SMTP id ada2fe7eead31-4b3d0fb4cfemr1417056137.18.1736333889051;
        Wed, 08 Jan 2025 02:58:09 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf81560fsm8810256137.0.2025.01.08.02.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 02:58:08 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5187f0b893dso5367834e0c.3;
        Wed, 08 Jan 2025 02:58:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNPi06WZ6bpZhtQ8om5RsmNH3Z6hOVOlttn7im1vU9wCPfKC2xyPek4OcDPNh2o2lDyEJ3vEJRuQ8SWB8=@vger.kernel.org, AJvYcCUSQ96CrbFE6TC6RZS1I/l32iGsCvR1SxiffNcnt1JAOM+UENa0r3/3o2JuMDhRutRsI7LZ1yW6FzBiX0sCBj1AEnU=@vger.kernel.org, AJvYcCVE+KmBI++LlGRR3DZ4tmyB+UTAqnA5g6/mtnSFLzuDgqJbtb1aAXoo4HVo07kPuydBEpEbE6ymTTLQBsMiJ4o=@vger.kernel.org, AJvYcCVQN7pUHV/hS09RkN7WpNKd5r/ZcAObJCoRRpFUEMUx+OXh+B52ktKm/edtMISb7/p7nAfsAP90LX+vnUtW@vger.kernel.org
X-Received: by 2002:a05:6102:290f:b0:4b2:5d63:a0f3 with SMTP id
 ada2fe7eead31-4b3d0f2d89cmr1249926137.15.1736333888589; Wed, 08 Jan 2025
 02:58:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain>
In-Reply-To: <e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 11:57:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRm0UtJ+vZgmizjHW6y7gCfLoWapjC3Hh0w3ABWOG9YA@mail.gmail.com>
X-Gm-Features: AbW1kvb5i2-wZANeYH767MiRLuwQWXqzOunWrI-QWkodDd2bRT26PqJpN_LSZ2Y
Message-ID: <CAMuHMdWRm0UtJ+vZgmizjHW6y7gCfLoWapjC3Hh0w3ABWOG9YA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: renesas: rz-ssi: Add a check for negative sample_space
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Jan 8, 2025 at 10:29=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> My static checker rule complains about this code.  The concern is that
> if "sample_space" is negative then the "sample_space >=3D runtime->channe=
ls"
> condition will not work as intended because it will be type promoted to a
> high unsigned int value.
>
> strm->fifo_sample_size is SSI_FIFO_DEPTH (32).  The SSIFSR_TDC_MASK is
> 0x3f.  Without any further context it does seem like a reasonable warning
> and it can't hurt to add a check for negatives.
>
> Cc: stable@vger.kernel.org
> Fixes: 03e786bd4341 ("ASoC: sh: Add RZ/G2L SSIF-2 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for your patch!

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -521,6 +521,8 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, s=
truct rz_ssi_stream *strm)
>         sample_space =3D strm->fifo_sample_size;
>         ssifsr =3D rz_ssi_reg_readl(ssi, SSIFSR);
>         sample_space -=3D (ssifsr >> SSIFSR_TDC_SHIFT) & SSIFSR_TDC_MASK;
> +       if (sample_space < 0)
> +               return -EINVAL;
>
>         /* Only add full frames at a time */
>         while (frames_left && (sample_space >=3D runtime->channels)) {

In practice this cannot happen, as the maximum value of the field
is 0x20 (=3D SSI_FIFO_DEPTH), but better safe than sorry, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Biju/Prabhakar: The documentation for the TDC bits in the FIFO Status
Register seems to be incorrect (in all of the RZ/G2L, RZ/G2UL, RZ/G3S,
and RZ/A2M documentation):

    TDC[5:0] Bits
    These bits indicate the number of valid data that are stored in
    the transmit FIFO data register (SSIFTDR). With this flag as H=E2=80=99=
0,
    there is no data to be transmitted. With H=E2=80=9910, there is no spac=
e to
    write data.

As the FIFO size is 4 bytes x 32 stages for both the transmit and
receive FIFOs, the above should be H'20 instead of H'10.

The documentation for the RDC bits has it right:

    RDC[5:0] Bits
    These bits indicate the number of valid data that are stored
    in the receive FIFO data register (SSIFRDR). With this flag as H=E2=80=
=990,
    there is no received data. With H=E2=80=9920, the register is filled wi=
th
    received data and there is no free space.

The documentation for RZ/A1H (not yet supported by the driver)
is also correct (8 stages and H'8).

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

