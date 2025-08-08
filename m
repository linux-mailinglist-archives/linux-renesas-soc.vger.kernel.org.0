Return-Path: <linux-renesas-soc+bounces-20134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71144B1E59C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 11:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27DE73BB5A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 09:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DA826E16E;
	Fri,  8 Aug 2025 09:29:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42D2C181;
	Fri,  8 Aug 2025 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754645362; cv=none; b=oy8fIHsQFk6BH7SVBeZGw5N/auAwNI+cbKR61FpM32m59mKvBdCTMKrgJYxmNrQ+jUSxiLW4VnwsfoVhi0WNzRxbm0KfKYGQn75zeOb2eg/ACzLEUNjA0NQtWo2p3lTp0sT6RYRB6nG5jAwj4FdaYWdWwe6EvjbJJ3+d6KhnnmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754645362; c=relaxed/simple;
	bh=IiJTQErPW5NICX7cRxQTeWwtpyUdxFcaFOuxYeBGaXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iiiy4i79CmyqW1GCcXbezhcLm24bdic+ln7VWseL5wAlvl9hFVpBqkpIrHyq9huKEpuadV4Gwr4cNCZ4t/BQRLLrBFVfFanS1I1ptJkVguCCGi9Cav8rxds4njV3fwQYsYnXqCB0R5NZ8ur26ES/lawECvyXpJHoHn+lGzPIlpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4fd210f8448so2563970137.2;
        Fri, 08 Aug 2025 02:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754645358; x=1755250158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONUQQjbxoiIGrp2xGll/nfaLwIlt2Mqw8O1vqEtflFg=;
        b=rkYfFgxMzD+xlD6xD3/sPjROVf3X4cdukKsy8sbK7PbcDME3J5GNKcXqLxN4l4J3XL
         4kQFZ13oeRiYrmCLosAAHaX157ML/QJY9QwJ4PettEP+eXYugeSYeyA2FIit5kkHGftX
         k1X7Ty676ciaTekcqWDk52Ij+K7q3D2ln2sHqbIbrEocQOEYsXIDrv037ogciq2MqzPd
         PBwIp3bf/t7XUgPyR22ixaRXKptf9/iWDxi0O3W1cI5ewt2othUbzZjv8kXHLYSk8hvo
         t+y13+RCiLd7O0y/6wbk9l3CIUcwo9OXyXcVpDf0p7skBcrl/WZ2WBMUgsPAX0O4IB9d
         WfoA==
X-Forwarded-Encrypted: i=1; AJvYcCWUJcZIQttHw5u3UsYBrqKc+qG2bNgb35OSnJmR0O8dO4GoIBrsWa9jAi2vID9B1rhh3DZM8Xm8NnhqYdm6gztWA3o=@vger.kernel.org, AJvYcCX34Tw9vXZ+Pepy6c6FIWyCq5JZpZ5Bm1pDty8LsrHIWCdLrv6FBTy0g8zXrdUqc512nM4wCYdUL9p82KmB@vger.kernel.org, AJvYcCX3J8TxmvkU3gwVyK05I2w7y33MzELmkTTjCH9lneozqulja0tKWikJMYt12wdIRWI1FjklAbpREU89@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxy9iyJh61b4fOJXe1Qls9L2wFT7a5cS+qQw75cXQWZ2pbaBg3
	SLNcx9erf+sTk/fEuY4mgnNUfucNRb8sjjWZuuprGkEIjsLVXUkSScX9/7wzFLcN
X-Gm-Gg: ASbGnctd0M7kzZaip6svPpDONeBtVMYGTYQv9IsSu+9LuNI/ChTITuslgXyYTfk3uuU
	6YInm0+6yDlphMrJ6rm3dncAdQpb8kf4Axf4B2TAVmfrQfza+lUNsK/hJ5cpBxSJjJ0Nb0kHKlm
	deF4lf5YR2HtmxmqbAOY4QcomuzePjF4vtxEUUxWHo8xtKNoUDwAH2A+eu52Fz5QbAB9eaN6Ju+
	5U1EcOhL61lLbs9C2Mgo6DaNlRmUo4GFvksoULB2YQIGXh55qdJx+4saewZXNee3qXfS4qvJyOd
	jxEagCntMhyJfskvWOn6dHgOf/ElGDB+vj9gX8W731ak+6o8PvNO6Hq+DyNOttBMBoKGchGcERv
	N0LiAZDrnlAeqZ6ycF4bpNUE7byj6/EM+x2pSGInaimOqV2ZfN6offaVzjP/07jHb
X-Google-Smtp-Source: AGHT+IF/aDwRW36hiwVcAsW6nYorGluS6UK+xnJp4ngBdOkL/zMfNoYywa9i/8z7M7YvJy3I/+YBKA==
X-Received: by 2002:a05:6102:d93:b0:4fc:1987:fc5b with SMTP id ada2fe7eead31-5060e9e6216mr834969137.15.1754645358138;
        Fri, 08 Aug 2025 02:29:18 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e0296af29sm711462241.20.2025.08.08.02.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:29:17 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5393cfc2e77so1249450e0c.3;
        Fri, 08 Aug 2025 02:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURQiZIxk9OElVfjvsDXb9zVvn31n/thrF17QnTN5trIB0xIe7ouBTLktgMaJEDpGi9o5JlWjRWL9QO@vger.kernel.org, AJvYcCX/kTi9kgzeSABHqbzqSG6rZ9TCdo+RaUmCXco7bWztDUEuuZAicpk2uu3iOLYaU4iTtE1p/pShIgCmgpknGCtt9H8=@vger.kernel.org, AJvYcCXp4U92R+70mJjqrtslJftFS0yH6q30kO3ekKy5q+zfiU7thogEpiSjxMRnMCmj+T1lPBUdeEMZ1G+hZrDR@vger.kernel.org
X-Received: by 2002:a05:6122:8285:b0:535:e35d:49f4 with SMTP id
 71dfb90a1353d-53a52f1316bmr853973e0c.11.1754645357385; Fri, 08 Aug 2025
 02:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com> <20250808061806.2729274-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250808061806.2729274-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 11:29:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsFFd+orb17oQqoEidzYWMRjPoqMyzpgrdnicc=MRSYQ@mail.gmail.com>
X-Gm-Features: Ac12FXx8i1QT-zXz7J1iKPWv5wh3EdWdZPqRg8Ft3ReMHz9bkxHLJxwo8ny7LqM
Message-ID: <CAMuHMdUsFFd+orb17oQqoEidzYWMRjPoqMyzpgrdnicc=MRSYQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] soc: renesas: rz-sysc: Add syscon/regmap support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 8 Aug 2025 at 08:18, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>
> The RZ/G3E system controller has various registers that control or report
> some properties specific to individual IPs. The regmap is registered as a
> syscon device to allow these IP drivers to access the registers through the
> regmap API.
>
> As other RZ SoCs might have custom read/write callbacks or max-offsets,
> register a custom regmap configuration.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> [claudiu.beznea:
>  - do not check the match->data validity in rz_sysc_probe() as it is
>    always valid
>  - dinamically allocate regmap_cfg]
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - adjusted the patch description by dropping "add" from
>   "add register a custom regmap configuration"
> - updated the list of changes from Claudiu Beznea
> - dynamically allocate the regmap_config as proposed at [2]
> - this patch is needed for proper function of USB (as proposed in this
>   series) that being the reason it is introduced here, as well
>
> [2] https://lore.kernel.org/all/CAMuHMdVyf3Xtpw=LWHrnD2CVQX4xYm=FBHvY_dx9OesHDz5zNg@mail.gmail.com/

Thanks for the update!

> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
=
> @@ -117,7 +125,26 @@ static int rz_sysc_probe(struct platform_device *pdev)
>                 return PTR_ERR(sysc->base);
>
>         sysc->dev = dev;
> -       return rz_sysc_soc_init(sysc, match);
> +       ret = rz_sysc_soc_init(sysc, match);
> +       if (ret)
> +               return ret;
> +
> +       regmap_cfg = devm_kzalloc(dev, sizeof(*regmap_cfg), GFP_KERNEL);
> +       if (!regmap_cfg)
> +               return -ENOMEM;

Is there any specific reason you decided to allocate regmap_cfg
separately, instead of embedding it into struct rz_sysc?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

