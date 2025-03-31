Return-Path: <linux-renesas-soc+bounces-15163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D4A7661C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 252C61887F6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AA81D5CFE;
	Mon, 31 Mar 2025 12:35:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933E61E1A05
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424554; cv=none; b=i6hCT4++fB8STajTvy1Wafi06BL07NV3Z15vGk54bjWIoRzkmNBgQv3BP0pkCC1Zhp7iTwvcdZO2tsIkk0EBQN3v2WGzfs/Ui/jlR35QGjTV75RzinBsQ6hXkgTqhcH/mm60a8YPo13XXVD32rzptQudXIVaGmSYS/+F9jw207o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424554; c=relaxed/simple;
	bh=5sWBWIaP+e1KLITr+g8YasRZ5v6E/iTVcoQpS6/jEvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ko0UjaiXhOjCvKwPnY78EXjOzVGzi4bRlbmF/mDB6zPP6ITZQmUj1VKuXGrdG8de6hb8G6Atzv9TMVM6ngufLbuP689c6G8757mIY3y5PqNoPFvJEzBBLbzefpBQdVHh+YcZrVxiytNH6DsAqW3IXuJDrUhR20xLxXrAixfXuoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d36e41070so1929943241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743424551; x=1744029351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdzZsZY7ZnqkE7qj6+ErTTrxURnfoL96GIEHYfQHTVI=;
        b=K0nJBSmwQNG6kgK+UUw0/woKhug6r8+83wykIcj125XAx0Sjt2AWWoSRN7GikpP08S
         3mp1UcCDdsaxkbdyMhk9bKBThNDmmosRTDKsXvXvwejYxMzKOLtu3Lq0b+beuLN+DDMG
         x9e9FaZKy/FoIZ9ilaIf0yFf6IH1tgNRh1skrl6cAUw/ONnp7UdhUQROpPiuDdYyfgy0
         zxC8wvg3++WR+ARlk0dTeBjNzirdtolCKP3OjpnbVS59oc70jhr8ttvfPKVrJM6Wmx6v
         qtgMHxScOzG87g4W0vzuiOqlTzVhT9yKWOw2XvmeV+Rm+zzt0efBjS3tL/xy4mq/TrDV
         AO0A==
X-Forwarded-Encrypted: i=1; AJvYcCUBCl9cmZGMLicAOh4+AAhqUUayVFCk8lmuxwYcIAGGZPJeXZcn0S7lezbOAvR63rMFz3GJKrUu04hanJnuGsK+aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVX7eLLABXY3vzOkHD3Nw5IdKzLChLxjM6ELggny8j+xsfTovb
	NeBf+81Lwg7YJG387zKmEcWWJ2r55il6Kd+jHiA43ffzsOgCOwBEW8qFacwU
X-Gm-Gg: ASbGncuX5LYI8NRm/3Gyp6BRB+rQjEDC8Rsw+zCXxzR+rhey4+qTrp7+RIw6Sum3GNB
	V/wXX+UMQzwYqCEr6rhWqJWTEB0bGBySl/70WY7IqZ/tx/QH8sF2kuhdx8FqRomOlRUjU66cDz4
	EaXtyl6tIK6X6GbJOpWLrqEL+WHVqiHG2dGqB2QloIQcNbnWp70n0AQMungkiHm97FmIa0Sj0Sn
	5N1CKB9k7QMKOV6rffa53xGTzeQOJWxdQHQpb3v1lBF3ZkQo8fBb8KaNd6ONbpOaYtKigki/PSg
	+C8gXN2Qsfk9XPpNlMraBwEpeH/cQv59UjXtRSFkiOyBgR3HgFw+8RJTU4Oj8sCOwGeGEPOgZAq
	rrxV1iaealrU=
X-Google-Smtp-Source: AGHT+IGkg7Fm1iLZa/T8y7Do0haJ/x2Ed82kxxj3tVMxPojsnW/wb1JfnYyWohBMpzItOFLnA7smog==
X-Received: by 2002:a05:6102:8025:b0:4bb:e2a1:183e with SMTP id ada2fe7eead31-4c6d39af699mr4726652137.18.1743424550836;
        Mon, 31 Mar 2025 05:35:50 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-871a33a12b6sm1540861241.26.2025.03.31.05.35.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:35:50 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523dc190f95so2134470e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:35:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWW4g4t935B//vUw0F2hHTbrZ4DOK1Y1ERj9s+nYEUX0LnHFivdqAbhIpngBFY35882w2VEBnmcU3uZ9wyesk9h7A==@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:4c1:86a7:74e9 with SMTP id
 ada2fe7eead31-4c6d3886c53mr4234910137.10.1743424550305; Mon, 31 Mar 2025
 05:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com> <20250311113620.4312-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250311113620.4312-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:35:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEAVfQ0_Ffbw0eexhTnDDZFu2mDwx3zvL4s66XsBN6fA@mail.gmail.com>
X-Gm-Features: AQ5f1Josxqi6SzHlbAAtsbuJykJa-iBhd-uw4c7iLpKR2hz3I9BdLPkLA63pZk0
Message-ID: <CAMuHMdWEAVfQ0_Ffbw0eexhTnDDZFu2mDwx3zvL4s66XsBN6fA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] memory: renesas-rpc-if: Add wrapper functions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Even though XSPI and RPCIF has different register layout, reuse the code
> by adding wrapper functions to support both XSPI and RPC-IF.
>
> While at it, replace error check for pm_runtime_resume_and_get() as
> it can return positive value as well.

While the change is fine for me, the function cannot return strict
positive values:
https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/pm_runtime.h#L418

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c

> @@ -519,20 +543,15 @@ static void memcpy_fromio_readw(void *to,
>         }
>  }
>
> -ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
> +static ssize_t rpcif_dirmap_read_helper(struct rpcif_priv *rpc, u64 offs,
> +                                       size_t len, void *buf)

Now the function can no longer fail, it can return size_t.

>  {
> -       struct rpcif_priv *rpc = dev_get_drvdata(dev);
>         loff_t from = offs & (rpc->size - 1);
>         size_t size = rpc->size - from;
> -       int ret;
>
>         if (len > size)
>                 len = size;
>
> -       ret = pm_runtime_resume_and_get(dev);
> -       if (ret < 0)
> -               return ret;
> -
>         regmap_update_bits(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_MD, 0);
>         regmap_write(rpc->regmap, RPCIF_DRCR, 0);
>         regmap_write(rpc->regmap, RPCIF_DRCMR, rpc->command);
> @@ -549,9 +568,24 @@ ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
>         else
>                 memcpy_fromio(buf, rpc->dirmap + from, len);
>
> +       return len;
> +}
> +
> +ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
> +{
> +       struct rpcif_priv *rpc = dev_get_drvdata(dev);
> +       ssize_t length;

size_t read?

> +       int ret;
> +
> +       ret = pm_runtime_resume_and_get(dev);
> +       if (ret)
> +               return ret;
> +
> +       length = rpcif_dirmap_read_helper(rpc, offs, len, buf);
> +
>         pm_runtime_put(dev);
>
> -       return len;
> +       return length;
>  }
>  EXPORT_SYMBOL(rpcif_dirmap_read);

Nothing critical, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

