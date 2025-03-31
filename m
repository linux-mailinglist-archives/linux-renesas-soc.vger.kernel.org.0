Return-Path: <linux-renesas-soc+bounces-15168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF651A7665A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82A9E168179
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3312101B3;
	Mon, 31 Mar 2025 12:51:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563FE2AE8D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425518; cv=none; b=BEqDryyreRh706kDNbXadBZpxfTj24Ar8qHng1IzBjU9c6lWqA0ukv5KQgUh7gYZB+2MG3bGd51HPNGBOTS+N3OtXdS5a9kt0WMMSrFq7Zv3l9OoSKUtdJnZwZ1wlEi2undQxPV/NiAMHKuncrpEAIVgV31g+gagTblKxDGnl7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425518; c=relaxed/simple;
	bh=I77eKCVNT8OxUCnoq0UdZYGJ3ogJ6h71+4IapbgqmWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmAZ9FuhX10g10izeZ+Uugp1Pi/KYBgb7vnwP6GES+xtxVzJCso1BORcl/B00s1edanXgHLjZGV/v95DIf4AYeyriMbJS/8QHsx9zKho0z1G9pbCrX4cJytysIaq+FdsbzBWaZtbmyd5UyDQg2sM7M36oWozVoY0eb25mUm9WoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523ffbe0dbcso4924759e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743425515; x=1744030315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvcU26I4AeHBgWZltswP2FjRZ3nrtCuiUHP6TVob01k=;
        b=polnfYDhRJMfXr8d6jph2otMf1DbsZFuJB5jUhi9iWx9aeX8BHEDBWZP8DEXQsW+k3
         tr1wG+2CZuNJR+MYIjPJ1MJqSLKSDP6B8lBzZdJ2KNjsD6M7b3bSii7eOeztVCRFpP6w
         lzjJ977CNvNzakZ2OU7dQpK3KVpMAMDbEpLSDlEtgpTDtF+LJeZxMDORdCFEnv6YNM6+
         v01MeJDf//Luc4I9Xu0AUAMByk9Tk3HZsT2nrTRDJFUxqF4KPkbBOFNwVaoXcYr7Ra/+
         1LfX8k5OaaDUMhc0kQa3bstnxs8etyPcEkYB70E+0hWQs94XSIoduBXSuDHmZgqmH3Or
         HH8g==
X-Forwarded-Encrypted: i=1; AJvYcCVR4z2swSBtj0xq7Q+Q1sF4l82ER08wWhfBoAuxcv/5Od1v1GNXLIthsXzG0tjtlO79L67fxn79ytZsWWB6V9Facw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIKNqBCf06Y056hatwtI0hf3FfYls8RAyK4KbaPmKwvXbwIjDH
	l2/mdadigyrz52hyBC10V9gQvWPrUf1dwkobZD0rdexOMYFRE1TAdkmSAI5w
X-Gm-Gg: ASbGncsQOIhTw14pbsmp7kljlhILlTKj5RwWW0dvYQkLIyqNhOTvfAoskUEdfNdUumg
	YWQrVjSoGYbnaUVHFcVLVyyrr4OAnn2SodqD1zSOjUjJODoPOG04nC22zG9pENzSptZbAShXTMQ
	SZhAkCOUPzSazI+INdBOWqHl0NDW5I68vdzcgHqfMQzl+7HviNJW7HNVzjy+XJWRyFjuxSbc8Jx
	a2UMZCrZ8uykrkjaNpvPzuInKzmKlhEQkpNwg6PM2mfNHOicTnbaoeEOuuyaUhp97HenlL4KNHM
	up1zW14FHH0OfRrC+vLW8smIAlT5kL+nJmcDGgt/IhMWJaloZtlWqnaXBhDOpoEhS+1/uyPWJly
	bQNmDSyM=
X-Google-Smtp-Source: AGHT+IHTx8FXSj6kJWjaDC7LQ4soLE5FiSPAYxnwfuKNEGGPgD699tcVRXTylkp6Mak/VKyQTqTxmQ==
X-Received: by 2002:a05:6122:da9:b0:520:61ee:c7f9 with SMTP id 71dfb90a1353d-5261d44cdb6mr5244220e0c.7.1743425515112;
        Mon, 31 Mar 2025 05:51:55 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260eab303csm1585113e0c.36.2025.03.31.05.51.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:51:54 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d2fba8647so4316442241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:51:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS/rKrT5yTeUuLbfQtZ2dOlptUSYDJSin5c++MYFNpjTpfiM/+SUG8dSxHuE1H3MDSJRR11fEjrAdwYs8c6g3tWw==@vger.kernel.org
X-Received: by 2002:a05:6102:510c:b0:4c1:869b:7db4 with SMTP id
 ada2fe7eead31-4c6d3886c27mr5242175137.9.1743425514524; Mon, 31 Mar 2025
 05:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com> <20250311113620.4312-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250311113620.4312-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:51:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfB5ctpojfFF=vDWmCQRX8k+L0GEkQXP8osE=CEsdUYQ@mail.gmail.com>
X-Gm-Features: AQ5f1JouVfBYixZaKcIiNgdYDgeaGkcWxZ4wU9PVhkWzWh2eYYxyCVyzZCIOViY
Message-ID: <CAMuHMdUfB5ctpojfFF=vDWmCQRX8k+L0GEkQXP8osE=CEsdUYQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] memory: renesas-rpc-if: Add RZ/G3E xSPI support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for RZ/G3E xSPI. Compared to RPC-IF, it can support writes on
> memory-mapped area.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -49,6 +59,8 @@ struct rpcif_priv {
>         enum rpcif_data_dir dir;
>         u8 bus_size;
>         u8 xfer_size;
> +       u8 addr_nbytes;

Please add a comment, as this is used only on xSPI, just like the
member below.

> +       u32 proto;              /* Specified for xSPI */
>         void *buffer;
>         u32 xferlen;
>         u32 smcr;

> @@ -240,7 +307,10 @@ int rpcif_hw_init(struct device *dev, bool hyperflash)
>         if (ret)
>                 return ret;
>
> -       ret = rpcif_hw_init_helper(rpc, hyperflash);
> +       if (rpc->info->type == XSPI_RZ_G3E)
> +               ret = xspi_hw_init(rpc);
> +       else
> +               ret = rpcif_hw_init_helper(rpc, hyperflash);

I think it would be cleaner if you would call all actual
implementations through a function pointer table in rpcif_info.

>
>         pm_runtime_put(dev);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

