Return-Path: <linux-renesas-soc+bounces-20741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED74B2D406
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 08:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A2BD3B74F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 06:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31394277C9A;
	Wed, 20 Aug 2025 06:26:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFAF1494A8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755671188; cv=none; b=ZXodZuy0IAfli8eCrIb4So0iILqtn3gfPpqzRMmuNxHhmpyY8ma5HFUSRYdYVta0nUG+kF2vGB/gBHvgOsBnv+stGpiNfxHK9AzKuUXanKK4UxmGlLacQWtmXORC8eHAHWPY8h12NAo2Ul4eSplDzLF2+Q+PUgcN7w9Z4w56RtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755671188; c=relaxed/simple;
	bh=EZMh3dI5vd/G0Gl7DZxlIKSPbyjBPKoSNupX0XNQ7cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSnymwqGCBxmq6B5qpzcW4SyiCO+3+2MM1IERzQozqyNce5FRql+PL0FnJU+OCiUR/mt75hnbYOZ1MIfNNS1GKbRHbukhWw5G1ZdVbT7aeEZ3Wvmk4Vy32GMNBTiB1T4moljn/PJRsljp1h96KYi2p4xKMRERm5cBv8sN5WzbUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-89021b256d1so1286219241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 23:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755671185; x=1756275985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5SywV8mgwBB59M1kwsbeTPCiuD/DlGypnC7vUu3n0M=;
        b=XB0z3H/M1gxhVu4yxqQswnKOlq0or7oOGl2XPDSVsEWH0VkPFDGMBg2DWw7ZRx1qXc
         HgoXSO/oi1tCDoDt6Tb/X8+2a/PA/KWqw4JEGk/IlV/DPzZXkYAiZsUmqnWxc+tqEd4Y
         9ysR68vQyQ1r2vbGjDc2li1RIgwe/txZgXAE8TW2qS2Kb5RgBwMk3RER+x9B89hYhr8O
         WC6+WVo/t5pxd340SOx1zhU5Z+xlo7M0DU4uNh0bYo0a3uS9Gr6VhteNLDLsA4bHEafy
         htrNUIGgwPk+exOFxf8OCgOvrwE9AChH7za12xGF25QxZeYyLz7S6AFFRZ2RfNWFgtqb
         dkHg==
X-Gm-Message-State: AOJu0YzfSrWCkuw0cQ948/UIuEyDZiFmXGvh9DfXjUzLIa2f3sxg+8Ra
	9XlJBrTgC87wo9bCJOsjr458LVTVm4o8g4c6hb/gmaC/a3XnZs03D3rLWg7by+4V
X-Gm-Gg: ASbGncueRvW+L9O0opAJgbuT2BN5XcCVtA//sNGqIiJBc02BOFTsp4qpNTn+OsL+Rgf
	3vH7Ut5PlpYK4qpdKXruLTkPRf4Thh65qQgjihphAJuIMA2s1ng7YxpwFLBs2Vfzi/DOfpVSwUq
	7uXYMoHxFmD8zDK/j1G1cC2Jz/BB972Cyeip0GV+8xa1XDTKJ3lO4ZYyvU6yf64HuVvkrhLQHxT
	ZUvh2mvx6SI5dpf9L93Cw/2e6EiglU1U9gPpkHsVT1+mEm0B2D8vjuTtXICGcMruEtlbRgosKKG
	5zUVNkESaY/BusyuuAXBnd8jw1uq9VJAgLgofmM62ZLBjtqa1bKpONyPknPEAT4d6UbZbm9qsOh
	vry6Azppb/5bYCf07zNw7NaWPnTG+5bMsUXn+ZPr55HWibkh3u1SzLozE6/b0
X-Google-Smtp-Source: AGHT+IHPmeRrRp86xqNAIx7+Pv0jbqxr99OuojQ0ftAKlcrsHorx+iKQL3n53Z8XERw0P1bXnBDXkQ==
X-Received: by 2002:a05:6102:3ed0:b0:4e7:dbd2:4604 with SMTP id ada2fe7eead31-51a51197800mr534477137.17.1755671184524;
        Tue, 19 Aug 2025 23:26:24 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-51713f939edsm1867858137.15.2025.08.19.23.26.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:26:24 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-89021b256d1so1286214241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 23:26:24 -0700 (PDT)
X-Received: by 2002:a05:6102:419f:b0:4fc:782c:27af with SMTP id
 ada2fe7eead31-51a4f955d2fmr444409137.9.1755671184045; Tue, 19 Aug 2025
 23:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <875xeizguz.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xeizguz.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Aug 2025 08:26:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHXDd41aDgVEBA-MUkzCS3ugvgRF90pB3ZzVcc47ZNgg@mail.gmail.com>
X-Gm-Features: Ac12FXzPGaBTpdvD25vUglIVY0QZ-kB46RJzg5hUcEej9G_YqyP26LU8MhxXZhs
Message-ID: <CAMuHMdWHXDd41aDgVEBA-MUkzCS3ugvgRF90pB3ZzVcc47ZNgg@mail.gmail.com>
Subject: Re: [RESEND][PATCH v2] soc: renesas: Identify R-Car X5H
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 20 Aug 2025 at 07:45, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Duy Nguyen <duy.nguyen.rh@renesas.com>
>
> Add support for identifying the R-Car X5H SoC.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> v1 -> v2
>
>         - Based on latest linux-next/master

Thanks for the update!
Same comments as on the original v2 below...

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -36,6 +36,11 @@ static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
>         .name   = "R-Car Gen4",
>  };
>
> +static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
> +       .name   = "R-Car Gen5",
> +       .reg    = 0xfff00044,           /* PRR (Product Register) */

Please no hardcoded register addresses for new (DT-only) platforms
(especially if they don't seem to be correct?).
I can drop this line while applying.

> +};
> +
>  static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
>         .name   = "R-Mobile",
>         .reg    = 0xe600101c,           /* CCCR (Common Chip Code Register) */

> @@ -378,6 +388,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
>  #ifdef CONFIG_ARCH_R8A779H0
>         { .compatible = "renesas,r8a779h0",     .data = &soc_rcar_v4m },
>  #endif
> +#ifdef CONFIG_ARCH_R8A78000
> +       { .compatible = "renesas,r8a78000",     .data = &soc_rcar_x5h },

WARNING: DT compatible string "renesas,r8a78000" appears un-documented
-- check ./Documentation/devicetree/bindings/

> +#endif
>  #ifdef CONFIG_ARCH_R9A07G043
>  #ifdef CONFIG_RISCV
>         { .compatible = "renesas,r9a07g043",    .data = &soc_rz_five },

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

