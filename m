Return-Path: <linux-renesas-soc+bounces-8291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC695F2F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 15:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F22B280EEA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 13:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598FE14D44D;
	Mon, 26 Aug 2024 13:34:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5253362;
	Mon, 26 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679270; cv=none; b=gGLUN9pTa84J+LsQNSzkaBypn34kpINMlfMGmMVtVCTdk5XncN4oCw2JF0Thv4axvYIPyYAu4tdW3Jz2X0WFciNOiz2iShCXxOTlsNT7gAyC4lxPkuWVN03ZxjtYBaSQKhm4y/n6apfSeUyMW8TwiiW/kMdqvp+kfgNGJn5EwAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679270; c=relaxed/simple;
	bh=9k9/5gI/iC9n1d3p2dgCLcApTdyK3eFpFtG0njcovcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OumtFQMHIbssVIK6ef9KPuoH9/Hp2mcSF6VFPazrvvnAkmXfRKcdxQ9QgO1T+ucnHbydYF0k0OD3IdDzSIBLCWgv+PB1bKdQFFT3gYbIMokyYhsTXavAoi54Qjx3jh4b8UpRwa1VXwe6Pif9WMKgnR3ubL+pbVJn04D4tN2RJUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e02b79c6f21so4547899276.2;
        Mon, 26 Aug 2024 06:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724679266; x=1725284066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZbdblcDNT8GZP9ChcDYCER0K22dBrCIi3spdBLOpfM=;
        b=bQRck9UfJacjBulz2ELd2CwVp0mvGhHBLq4J9646onelq6n/nN5VthIzoSV+tTtCT5
         +CYyzn7hP5++FlUbWXcvPZc2OcStoWDRjh9G1BvHGeuGGFMotb/Zx2wJPf03GPi8L0wY
         F3++Tb77dvEIULpDdm8B9t6FRjR0be6aZqYroUvbn9gF4zZHzBhSt4aHzps8MrgnvpcV
         lzPmW2EpyMOVB1MFtJVoj04/TqxmbhHBQr5hQCo5HA1tu4FSnm+XnW+Uc7OkzTgZwqWG
         GbZ/ruvJL4YtSunQZjL7vgjIx2cLf3SUAOnH79blbJDkr0oFqo78HS7K4fIAmUSDKmGN
         Kx6A==
X-Forwarded-Encrypted: i=1; AJvYcCVRvQoTwbDUzX44KwVQcxXN3ei9+DOHXHS+R4OImk2FX+kLuOReQXNnJSljG1Vpp0f/KqE6luOuQwSHIomN@vger.kernel.org, AJvYcCW7XvfTeOY9CfCYrlzTnvlqFnVOdauEgivwp8d/fphxMKDXeYC8mtIFp0G8MLB3Wu50KkhMiYlDywHw90KxdewIJy8=@vger.kernel.org, AJvYcCXkqRKDPXIvlGV5dezV+sy0FXg7cz5vDDS/3WYKq7M2pPKRwinG6USCJ7fWVdD5Y/okpWDcDnYI9ZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGzTflKt0NoPCWHUmO2Y4kJ50mgIDfuzDsB5uLVwYaUAnIwz/
	OXvVRYgKj3ieElZKN8EvjAxI5/hoQNW1E37hwhWnK+HSy7IjLHrdABTbFKtJ
X-Google-Smtp-Source: AGHT+IH2vZbD95QinbvyqmENyH2Fb5tiX3/TdznklyiAIluD/VEXP1i6yWVGeiOx3IM3yGSvoqXiog==
X-Received: by 2002:a25:a549:0:b0:e16:700c:4b63 with SMTP id 3f1490d57ef6-e17a88be277mr9681677276.3.1724679266379;
        Mon, 26 Aug 2024 06:34:26 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e5696dcsm2046882276.46.2024.08.26.06.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 06:34:26 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6bd3407a12aso40132537b3.3;
        Mon, 26 Aug 2024 06:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQXYobNAaI7t+2Uuh1nqx1MjTmBlgm3uESN2zdirtyzBcDFsKeH1zfHlKvv4+jSiVJNhNTCusZy8ukP11M1TQnu3I=@vger.kernel.org, AJvYcCUjHEd9JBlkXUygOi0/Bk6frsmNhdSj779xkfiWTvlD+ovL0dQsjvSbbALwA8KgOyUbfsRRfQNnjfFl07w2@vger.kernel.org, AJvYcCW6kXgPG/3Zu/1rGLi83LESd8NIawy8nrDD3tyINlap6F6CaWgUYEc4qHoNLarwrFY7H9OOmlNr12k=@vger.kernel.org
X-Received: by 2002:a05:690c:2c81:b0:6ae:dab5:a3b5 with SMTP id
 00721157ae682-6c624fb4900mr88162487b3.13.1724679265567; Mon, 26 Aug 2024
 06:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822111631.544886-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240822111631.544886-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240822111631.544886-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 15:34:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHuej==aKo+6CTeo00cJLb59wDGu3Rq-ECRq7=cU2wdQ@mail.gmail.com>
Message-ID: <CAMuHMdVHuej==aKo+6CTeo00cJLb59wDGu3Rq-ECRq7=cU2wdQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzv2h-cpg: Add support for dynamic
 switching divider clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Aug 22, 2024 at 1:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for dynamic switching divider clocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Dropped DDIV_DIVCTL_WIDTH
> - width is now extracted from conf
> - Updated DDIV_GET_* macros
> - Now doing rmw as some of the DIVCTLx require it

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -45,14 +45,23 @@
>  #define PDIV(val)              FIELD_GET(GENMASK(5, 0), (val))
>  #define SDIV(val)              FIELD_GET(GENMASK(2, 0), (val))
>
> +#define DDIV_DIVCTL_WEN(shift)         (1 << ((shift) + 16))

BIT((shift) + 16)

> +#define DDIV_GET_WIDTH(val)            FIELD_GET(GENMASK(3, 0), (val))
> +#define DDIV_GET_SHIFT(val)            FIELD_GET(GENMASK(7, 4), (val))
> +#define DDIV_GET_REG_OFFSET(val)       FIELD_GET(GENMASK(18, 8), (val))
> +#define DDIV_GET_MON(val)              FIELD_GET(GENMASK(23, 19), (val))

These are not register fields, so you might as well just use C bitfields
accesses instead:

    struct ddiv {
            unsigned int width:4;
            unsigned int shift:4;
            unsigned int offset:11;
            unsigned int monbit:5;
    };

    if ((shift + core->ddiv.width > 16)
            return ERR_PTR(-EINVAL);

(you can put cpg_core_clk.conf and cpg_core_clk.ddiv in a union to save spa=
ce)

The rest LGTM.

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

