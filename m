Return-Path: <linux-renesas-soc+bounces-3667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4834F877CCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 10:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DD88B207C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 09:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C563317996;
	Mon, 11 Mar 2024 09:32:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217B846F;
	Mon, 11 Mar 2024 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149571; cv=none; b=MFrnsOgPwXB/QdCd0Tjsl36zncNS5A4U3EGxR5NJhD+5vDmlPsUnYAc7ZXyBa+ZD4Zie40xYrlsp5KOcvlnESpbQlOZVsLHzMzZHAuIr77fpko+l+0iYBm13Bn5VbJCefkxFYb5OKaC0iO+qUUhTmtU+j81w7A+XgK2S/DCwcNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149571; c=relaxed/simple;
	bh=9L2q8IWV8ciQU7w9cR8aXQ1J7WBFC0RkSMlR3McwBrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ/+noiBEfpU69f3D7JAhr6xBjwa1NjKTtjVqiGB3/dFXVAZiUutEG7XXYhl5AYVnrMsaLV+yY7Dl4qI1yDxt4k757HPYKzVdEP+6EQaSNK4HMXDDowudQoFVvViU/wPUqRFReI0YVPlJ47ESordNAWoEwClP4anp96heVjH4Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a0579a968so25962967b3.3;
        Mon, 11 Mar 2024 02:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149568; x=1710754368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxkLql1J93Mj1S+moTpzlL/UTwnc20Dr8uURDPyQWRY=;
        b=GQM48t4VJwD98RuStFJcH1/SI6FBRjluhxpVpmceVNxEUE3mrb33aMddlriHi2JVqI
         fVx9D+LIwKMszpSNhbqEZXPEiRXPTa3PmH0nIardKADo+3cbYdauJkFRsTZdFZGjqdy4
         2pOLN5xbOdUZLSRcTcs1FJmx3Qjh7cv3pSE3aQ+54A5i8uZRB+df+czICciKL5YpTETp
         8wrPkaaV+VMbqOmUirm5RjiFxLHleqfyIL7ptj113L20nVMJLlu+ftXyZkeyRaTSG8BW
         9GKkORpwzAY3vtPVs+TO7lcoLJ1PxavgTz5BGdc/Pe6e3l+i752RJmLkAEWPlp35/XU8
         ULdg==
X-Forwarded-Encrypted: i=1; AJvYcCVvryNmtV7ZG5qEGaMUDjbhlgRLGFEZsDUfdBRiJAfETfzVLbAsmVekRNRsacr+dGfzpTy3Qw+BG7qwdoGW53u+9tkTxi3WTv6bugIFmVjhIoEUz8jBEYFavfeYTs7fUEdB1tn2V4DSAQEEjaH3VJ6kbJKUfLqnv5lSS6pUISn8Fj1zmqb6
X-Gm-Message-State: AOJu0YwKlQ5s5sySVQV78h4o5rJ2NrVR87DAcJZLUtlp8nbM9wUt7JCE
	YUqbiV8waXvVZDgmdv33G7QFqvQ0IDpMkjX6FaO87IZkoKsKU3GkltSdJyPcTco=
X-Google-Smtp-Source: AGHT+IGiewMNPKo0jbS3DwptKzblyLhRkes4n5Qt9fCQLcYwDs/NSYoOirsIlf128gpiUHJVYgimlg==
X-Received: by 2002:a0d:f244:0:b0:609:f353:d2ef with SMTP id b65-20020a0df244000000b00609f353d2efmr6057697ywf.38.1710149567838;
        Mon, 11 Mar 2024 02:32:47 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id p68-20020a819847000000b00609b391fa12sm1250535ywg.123.2024.03.11.02.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:32:47 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso3958715276.1;
        Mon, 11 Mar 2024 02:32:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIryBadGVJ2whXDLdTtMevNR+hNssmG1XAKrrN1l8wmh7xlg6JyTnzopdHWvVNh1AfuIxVuft1sGnucrB201wLOrl8IiAwT8GpqH9DeilS4OCDPeBPEceKqo4CztEfCy4RBAWOAgkZ/RoBovXr8RWtK5bxQFfsXimT4y1K5g4mZuUQenV9
X-Received: by 2002:a25:8541:0:b0:dd0:6f7:bc3b with SMTP id
 f1-20020a258541000000b00dd006f7bc3bmr3592307ybn.10.1710149567490; Mon, 11 Mar
 2024 02:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se> <20240309155334.1310262-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240309155334.1310262-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 10:32:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRftTVMmnBX9YH50jau-GJEM+Lmq8tVh2ynrCRsZU46g@mail.gmail.com>
Message-ID: <CAMuHMdVRftTVMmnBX9YH50jau-GJEM+Lmq8tVh2ynrCRsZU46g@mail.gmail.com>
Subject: Re: [net-next 2/2] ravb: Add support for an optional MDIO mode
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sat, Mar 9, 2024 at 4:55=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The driver used the OF node of the device itself when registering the
> MDIO bus. While this works it creates a problem, it forces any MDIO bus
> properties to also be set on the devices OF node. This mixes the
> properties of two distinctly different things and is confusing.
>
> This change adds support for an optional mdio node to be defined as a
> child to the device OF node. The child node can then be used to describe
> MDIO bus properties that the MDIO core can act on when registering the
> bus.
>
> If no mdio child node is found the driver fallback to the old behavior
> and register the MDIO bus using the device OF node. This change is
> backward compatible with old bindings in use.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2582,8 +2583,20 @@ static int ravb_mdio_init(struct ravb_private *pri=
v)
>         snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
>                  pdev->name, pdev->id);
>
> -       /* Register MDIO bus */
> -       error =3D of_mdiobus_register(priv->mii_bus, dev->of_node);
> +       /* Register MDIO bus
> +        *
> +        * Look for a mdio child node, if it exist use it when registerin=
g the
> +        * MDIO bus. If no node is found fallback to old behavior and use=
 the
> +        * device OF node. This is used to be able to describe MDIO bus
> +        * properties that are consumed when registering the MDIO bus.
> +        */
> +       mdio_node =3D of_get_child_by_name(dev->of_node, "mdio");
> +       if (mdio_node) {
> +               error =3D of_mdiobus_register(priv->mii_bus, mdio_node);
> +               of_node_put(mdio_node);
> +       } else {
> +               error =3D of_mdiobus_register(priv->mii_bus, dev->of_node=
);
> +       }
>         if (error)
>                 goto out_free_bus;
>

Perhaps the code should be streamlined for the modern case?

        mdio_node =3D of_get_child_by_name(dev->of_node, "mdio");
        if (!mdio_node) {
                /* backwards compatibility for DT lacking mdio subnode */
                mdio_node =3D of_node_get(dev->of_node);
        }

        error =3D of_mdiobus_register(priv->mii_bus, mdio_node);
        of_node_put(mdio_node);

When deemed necessary, you can easily replace the backwards
compatibility handling by error handling later.

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

