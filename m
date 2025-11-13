Return-Path: <linux-renesas-soc+bounces-24546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09455C56692
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 704D7346C83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD8F302146;
	Thu, 13 Nov 2025 08:51:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DABE330B01
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023877; cv=none; b=B2Jd91OIPi1Y+ktzNV7WlVAXiXqZ28uahpP3ETTKiA+QsYR+ZYruuqUk+DwyY7RB/k5H28AmJ4fsq6TDA+XxYHLWQSy5hg24W2ymf40MI2WXxm82ZzWvaz756pW/KW6VHfZBSSHOmwX26gCOQQ1CN1SVLs5hX932ytgAfNLlIo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023877; c=relaxed/simple;
	bh=Y3cJxBYr0FtmmjeUHDLAuwvYPIolcl+a0e64J8Sa72s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksUVxSmrVeNGK48JEhxXIYV1JkXc77dmycVYaTRRYDSyRCjLExifjs5kqcBJNgxVBYBdB4AqrzJG/axmQbJje/48Ra3nhzDRFZuTbEtroa+KyTSKdW58CfzyoBYyyoga6OOK/VpAKTtqfnACApr4xr+ibwmUXqtBXJ/WN6YHd0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so333876e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763023874; x=1763628674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jppCAljRnFmNoD8IBybx1rRIy6Hth1Yqeh1nYPEFHA=;
        b=LFs7QultKq8L7m7aPCKon4R0YbyjBlrGvuvqRUUrXdHLf5oPPJZ+ZxCQj1q8+/HL3i
         1JcGX2VTL86ovGUNV84agV84OQhr9+34vS783rzRyopAPZzf8b6MP/1ru4uTB0cOHnrF
         ih90GVHlI86l4RfI8A6JqWAbXXt8Aq1XVwniKd23jWSzepZmnFBgYPOXJATDDnIySVYD
         7ee2K25XlOP+6YR5O+DtqnW2Q0YH34zk2dsfizum/mh7rVtexm4gDhbz/JXREf50R+fM
         y/MXZMwdFnRcdY2ie8iUIEB+3p4515xnMZFRFiOBqjvpMxvPkg4b3N/alYxu3VkcprSl
         TFDg==
X-Forwarded-Encrypted: i=1; AJvYcCW9SksMM8CE0sKoJq+Demmhl9chk54l/zLsAikTaxXo/zDl07/qaoOZkA4VS5EgV6eXi8ir8x+c6DzrzM6drp6xCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGaGXgmV42wUMbPwc0K4LT+vagnN9UWBsuLvr949uwTvoWetLY
	8AGNLToDhVk0cVx8+8nzrkMN4mpMyC5FRVj0DBu/gX0Bpk88aWtmZXqgpCbpiHC5a70=
X-Gm-Gg: ASbGncsLB3ILcg/copTxxm8HC/sk3taX2+DL+3BrsT89ueWLxtjRHu3/IM1gMSklkmr
	mgCdDkjQ6Fs9a22in0sFOX1GnXdxc3GqBL0p4pBBr9S5sjQPDqWDVsR7Oy1TQNJaZnlaNNIUkMN
	3gApG3zAlun3aOuz4Ae/oPPPHcNP9h0gVRFA0DQIAzlWLfMcBv4UMdSzOhN+qaCLmmpdlYKJN4W
	Ki5Q/cr02yWbYZePh1ZmdWXR1VKLKZimfGsc+kK78XI0P4hv27cIodg2KcQ5F3Z9F9K2Z30q0/N
	lcifN6frHL+IZfdnPu6DR+xPhlIoi5V5nwgAMpM5NIWoQgjwR3n0D6kU1868Tw+x9746AmZ3Spt
	nl5XddHjlAqR21gAMelkX1xoM4KaM6rFszIRamU+0c65Ys1twiM9pOp+PuOUaiv8VDY6jA/xpKx
	1dGh3EiO3G9Oomh0OfAzuhUTjbD0tQxalH9hmpLMVBOg==
X-Google-Smtp-Source: AGHT+IHwrxCyrDOaTKGlgLwBJh10Hz9UXdoWJ7XNKlMmWm7aE8DtLhTp5s4wkchVGKGcCZqXqmZzVA==
X-Received: by 2002:a05:6122:4f81:b0:559:6f4b:7511 with SMTP id 71dfb90a1353d-559e7ae92e5mr2156011e0c.3.1763023873834;
        Thu, 13 Nov 2025 00:51:13 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f499dc9sm491128e0c.23.2025.11.13.00.51.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 00:51:13 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-559748bcf99so464149e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:51:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURCOermw99xC/Yui5AnisTCfddhuw7nVXsEVQVaR02Oq5j4O84nuAqMWWnxjReeBQkBXa+1WwnZchjZyzEVqSnsw==@vger.kernel.org
X-Received: by 2002:a05:6102:2b92:b0:5df:b1f4:77d9 with SMTP id
 ada2fe7eead31-5dfb1f4937fmr1427327137.17.1763023873293; Thu, 13 Nov 2025
 00:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113082551.99595-1-biju.das.jz@bp.renesas.com> <20251113082551.99595-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251113082551.99595-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 09:51:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdiczsrB8H57VjPbcaWWS22HmUvc_iU3rs84qHAsfB6A@mail.gmail.com>
X-Gm-Features: AWmQ_blLiZfPk5wgCv0WpvOv1cvXZLyFXHVM_u5r95hEUYF3wWO-Xhplpf5nrtE
Message-ID: <CAMuHMdUdiczsrB8H57VjPbcaWWS22HmUvc_iU3rs84qHAsfB6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: renesas: rz-ssi: Fix channel swap issue in
 full duplex mode
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, stable@kernel.org, 
	Tony Tang <tony.tang.ks@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 13 Nov 2025 at 09:25, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The full duplex audio starts with half duplex mode and then switch to
> full duplex mode (another FIFO reset) when both playback/capture
> streams available leading to random audio left/right channel swap
> issue. Fix this channel swap issue by detecting the full duplex
> condition by populating struct dup variable in startup() callback
> and synchronize starting both the play and capture at the same time
> in rz_ssi_start().
>
> Cc: stable@kernel.org
> Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
> Co-developed-by: Tony Tang <tony.tang.ks@renesas.com>
> Signed-off-by: Tony Tang <tony.tang.ks@renesas.com>
> Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -374,12 +379,18 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
>                               SSISR_RUIRQ), 0);
>
>         strm->running = 1;
> -       if (is_full_duplex)
> -               ssicr |= SSICR_TEN | SSICR_REN;
> -       else
> +       if (is_full_duplex) {
> +               if (ssi->dup.one_stream_triggered) {
> +                       ssicr |= SSICR_TEN | SSICR_REN;
> +                       rz_ssi_reg_writel(ssi, SSICR, ssicr);
> +                       ssi->dup.one_stream_triggered = false;
> +               } else {
> +                       ssi->dup.one_stream_triggered = true;
> +               }
> +       } else {
>                 ssicr |= is_play ? SSICR_TEN : SSICR_REN;
> -
> -       rz_ssi_reg_writel(ssi, SSICR, ssicr);
> +               rz_ssi_reg_writel(ssi, SSICR, ssicr);
> +       }

You can reduce indentation by restructuring the tests:

    if (!is_full_duplex) {
            ...
    } else if (ssi->dup.one_stream_triggered) {
            ...
    } else {
            ...
   }

>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

