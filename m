Return-Path: <linux-renesas-soc+bounces-9189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F4A98A6DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE97B280FBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3082413D539;
	Mon, 30 Sep 2024 14:17:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886217C22F;
	Mon, 30 Sep 2024 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727705878; cv=none; b=uN8a5+ypd4P21tcO4gUo8/FbPN4ZYk3RJmz9eBkMgll8cADQt6yiIJ4a7nd3pt9aURyK9nhWWiDSjpFljujJds71Q6VySByQM3F4soo7fnQ2H2wsApZLGVm04XFjz3P061lZaycXYGm6zxKNwt1UFO4kBNYbjUSHlS0LLLNuCRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727705878; c=relaxed/simple;
	bh=y/F1NBCTnAB3UuPVjUX5FuS5if9jSL5+KRpqoTut+kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ng1Jiu0Aqidi7mI4jz7eSDtWtvBORwDwLvYG8Wu3qHbNkxDcMWn0uPnBuUwBx6mXhvjEaR7TL5VoLnUsrOF7a7WqmtWpSSYxiPbU4dkB7ECGDn4kzPmpCMnIJb/RtuQtl11IeS+lmEh6XtnSz0nQCW6J9Uwtj81yD80kWTr22os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e25d405f255so3644667276.2;
        Mon, 30 Sep 2024 07:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727705875; x=1728310675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vsPdt8dp1EhWLsYJbbEjP53Z7pKpAwdym21sKtiHvQ=;
        b=obuNrdPKdSX13FiwmsiPNqpPB3FRKy1WQupEdz5SHAkqAwGfFAkKBNibQOam2SX/1S
         Tdips8Bj5PcMJISnCCvgToRxLz/ZCujx6XCwk3HOYEQV27X4X0zItibAzrzrPXATq8BG
         ifHUqSzA45Eu0uMc6jXFqY0laO7/vVOQIlMAUNx8xs5qL0FVGGuB56rfbk8JZguUtbQo
         6wq7dgkox96ezj4aQoMaF0nvPxB5a0g5Mx66tYnUw4b+i2UpYoSohsyQCThYsfIgpzEh
         22xHI/kiLCyKn9CFLLB7wHR5OvHpiz10T2YI40OZIsGt9J+wiMS4/oBsMaZhE5mr1FGY
         ez8g==
X-Forwarded-Encrypted: i=1; AJvYcCUPYs438X7HtSaIIEQK9WdI/P5rt6SPTGshH5SY287RQzu3HBxUaOYdmDErklLVrDfxfHlMBWkm7po=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQTj44svzVX6/vasPtLmzR2zYNnYVpUnRES9k16h3UBq2ggW2y
	Jogae1YDn3SSv7u5bvCpgWiofJn9u0yjTiHBy5llJhLtnv6eEfr4+OpFC+K7
X-Google-Smtp-Source: AGHT+IEX5gRaVm5hFOGP8R3g4dlZBZR063j5AwtYNY88TL6va0wndk7rRwKmTXHLWNayou6bza8Otg==
X-Received: by 2002:a05:6902:18c6:b0:e26:d31:7b8c with SMTP id 3f1490d57ef6-e260d317c5amr5933819276.57.1727705874674;
        Mon, 30 Sep 2024 07:17:54 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e4015fe9sm2342323276.26.2024.09.30.07.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:17:54 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6c3f1939d12so35744027b3.2;
        Mon, 30 Sep 2024 07:17:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF8NC0YTIXwxGcI+a3wjCXxMXsb3ovgID3Km8K7aPUy3xmuJwRwKp/QOI3bzEdgv2PAAWy/0byk0k=@vger.kernel.org
X-Received: by 2002:a05:690c:dd1:b0:6e2:636:d9ba with SMTP id
 00721157ae682-6e267118e38mr43153857b3.3.1727705873617; Mon, 30 Sep 2024
 07:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928094454.3592-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240928094454.3592-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 16:17:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6tv-Z2ZisYg3ridB5M28+vnGzEyC9CReeUWRUQJPA1g@mail.gmail.com>
Message-ID: <CAMuHMdX6tv-Z2ZisYg3ridB5M28+vnGzEyC9CReeUWRUQJPA1g@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: correctly report success when obtaining
 DMA channels
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sat, Sep 28, 2024 at 11:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The debug message could still report success when getting the channels
> was OK but configuring them failed. This actually caused a minor detour
> when debugging DMA problems, so make sure the success is only reported
> when the channels are really ready-to-use.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -439,14 +439,15 @@ static void sh_mmcif_request_dma(struct sh_mmcif_ho=
st *host)
>                 if (IS_ERR(host->chan_rx))
>                         host->chan_rx =3D NULL;
>         }
> -       dev_dbg(dev, "%s: got channel TX %p RX %p\n", __func__, host->cha=
n_tx,
> -               host->chan_rx);

This was not a real success indicator, which could indeed confuse
people, but an obfuscated NULL-pointer still prints as NULL, right?

>         if (!host->chan_tx || !host->chan_rx ||
>             sh_mmcif_dma_slave_config(host, host->chan_tx, DMA_MEM_TO_DEV=
) ||
>             sh_mmcif_dma_slave_config(host, host->chan_rx, DMA_DEV_TO_MEM=
))
>                 goto error;
>
> +       dev_dbg(dev, "%s: got channel TX %p RX %p\n", __func__, host->cha=
n_tx,
> +               host->chan_rx);

This means we no longer see a debug message in case only one DMA
channel could be requested, thus requiring manual addition of more code
to find out what was really wrong?

> +
>         return;
>
>  error:

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

