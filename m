Return-Path: <linux-renesas-soc+bounces-12675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56421A20CB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 16:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3CAE188549A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3798F1A8401;
	Tue, 28 Jan 2025 15:14:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0821A2630
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738077278; cv=none; b=egTKE7otkhQThQk3jVq8b1C5WWNnUwNJbrxrV0GNMwKkDpP0HQ5GAVg+O1dhImdR7NxbJOWpFEg6By8hQillGO43n/3zpNtIubMC7fQOyHCRuOVSwroP0sOEIj8ir3mTfxabCCH8Wyg6qT/xC8n23YdFTcosufJ4Wze1mw/ivjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738077278; c=relaxed/simple;
	bh=Y76qjgytNTDQ9fRcLaglSmGAwsf/GiHaQYKjiUzlO0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4Fmw2qsucYTjCeGHujo0j0ygCN29ksGHcywPSMoz3EqDwtFK5i930NYxbOG3bYMphLGPI9QZqzJvJ540uMm0bsqzi85Jv+GvbDiAsG+9NoD7MrrKBBoLCGvcUD1hVHqw+GP5jSwcLz8xXZiwDJkNja97EcjMZ7O4q2skBdPPKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467a1ee7ff2so55476721cf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 07:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738077275; x=1738682075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNdI2NXkP+eX2fpEqXdKvuNn+o0xY4RPa2W1EFBRTck=;
        b=kRvoofPJjp8xAdZS+UEWSXG98RgZksf2GNd1AfJ//OgnGXgxKppMU9R9yBlXHOoCbM
         CTVfLefYVvdXVBIpMP47O0ZFGcOgWcT6er6JEVc32nVwT1BlQcSViINyS+sdqz6FVZ+o
         IQMPtUjx99tlf6R4aItFkMM4bzQTRL2JkbD52orSld+OiZN6QUqOD7AZw0jqYCaWu03L
         SnHXAi0+AkakBzPvUB1ziCiWIdjm7lH77Pm4VLOeHw+hmLqZkUjzIbrGvvNj6X7kYKf0
         Mv4zuvIABV7Vk9m5+2Bs3Z4OUh/kOvRqC6+TqjyfdUksAx51U/Lj01zRlkPiMzuK2jS6
         Cp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFH/0il60GyMHuKMS/obPNx+Dap7p+FynTLTHHdEUXSGSOjUDPzg831XX+w78oa3yiU0skMORX+TdrxboR2uqfIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBQB0uiie/SPoXthKrKTkpQl02xVgZaNpQ9vBnywLbtcUGQSO
	oufNO1BEPQrfiINE8dxoYJT8r9f6TV5BUaFD7cnv3eTJRyAlQgCcPhrhe6c0
X-Gm-Gg: ASbGncsoQzHYQFo87DatYlR7LsaUm9MdCvJvqh0TgmR+31kl5m3PLerUbVCVU49+BsZ
	E1WI5IkxIle0K/sKMW/nDWzxAXFs1XLpfaUvHUErB7O7RsZmXoi1dfQ1h09qyB6enalnmpAPnQT
	zX0Wtzzl57s4tgEHbB6pMBwurlcb6Uj9t5wTFOMPO7SsJ3YXTW1us3HDUaj2RQmHkcSOtpgSRiq
	neouv6UT00uC/YFcF2m0zhOSg6rsWXd2Ve1gG36rAtZdt1FdvsT03lLTDzAsK9f1PjEA7+MoheP
	PH7PMaFdFmYNVPxkm20dOM2Nj7NThKjTisoa9OBVO12Ftj+xqAwAAi9lTA==
X-Google-Smtp-Source: AGHT+IHPGyYQZ7QM+E7gPHPiYAy+Xvm6CtMse00yKbbSaBLfkYHiM4L8VPbE2TWDoiQrzz3+/yiFNA==
X-Received: by 2002:ac8:4715:0:b0:46e:549b:3e79 with SMTP id d75a77b69052e-46e549b3eecmr346862941cf.16.1738077274992;
        Tue, 28 Jan 2025 07:14:34 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e66860246sm51689321cf.11.2025.01.28.07.14.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 07:14:34 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6f19a6c04so534268185a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 07:14:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7unhfVJ6IZEQWWim02DzW5fbftee2RpiF+qGaApueBXJ7RfqBLzKnr1VliVHXvUkoNfK4g/oCXMV5xELS2jXfqw==@vger.kernel.org
X-Received: by 2002:a05:620a:14e:b0:7be:6eb1:f4f0 with SMTP id
 af79cd13be357-7be6eb1f724mr5701532685a.49.1738077274459; Tue, 28 Jan 2025
 07:14:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 16:14:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUzu=cduKKvdNOKOBbJFX4n8uGOGm7MZrD9E0j+WAu8A@mail.gmail.com>
X-Gm-Features: AWEUYZl4cyzeiq36_4fmzbBlCFPBltx0IJX85qTvYYixeYYmtWKPfp9Ru_28b7E
Message-ID: <CAMuHMdVUzu=cduKKvdNOKOBbJFX4n8uGOGm7MZrD9E0j+WAu8A@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] irqchip/renesas-rzv2h: Add max_tssel variable to
 struct rzv2h_hw_info
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The number of GPIO interrupts on RZ/G3E for TINT selection is 141 compared
> to 86 on RZ/V2H. Rename the macro ICU_PB5_TINT->ICU_RZV2H_TSSEL_MAX_VAL to
> hold this difference for RZ/V2H.
>
> Add max_tssel variable to struct rzv2h_hw_info to handle this difference.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c

> @@ -517,6 +518,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
>
>  static const struct rzv2h_hw_info rzv2h_hw_params = {
>         .t_offs         = 0,
> +       .max_tssel      = ICU_RZV2H_TSSEL_MAX_VAL,

I am not sure using this ICU_RZV2H_TSSEL_MAX_VAL intermediary brings
much value, compared to the hardcoded constant, as the definition is
used only once.  But it looks like Thomas requested this explicitly...

>  };
>
>  static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

