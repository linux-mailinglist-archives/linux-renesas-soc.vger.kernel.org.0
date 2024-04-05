Return-Path: <linux-renesas-soc+bounces-4359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF82899F27
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Apr 2024 16:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD561C21B1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Apr 2024 14:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E46F16EBE6;
	Fri,  5 Apr 2024 14:13:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831F3EA90;
	Fri,  5 Apr 2024 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326406; cv=none; b=KIlvmBLhA+QSth9TiG/3R9Mr0WRiA0Worzmb334qI1ux/rVfiRrDMGrM3raULwr/MpsWX0qUIEwe9LL7XOXVqoiwHglb3fUHyII+zA4W16O7yET4GeaXi/+dq991yI6CRt30lR4oMbuOp2uzt5zJF4uYdufYHiU9oZb1rxX0RZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326406; c=relaxed/simple;
	bh=Y8dxBvV5oWr30NzhU15JG0u1QH7YZz4SXe9i03Iw6I8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qx/QyPxjGKOPVWSIjMQpAxd1caD60TeTWbVqimj0Y6SPHSGaMuJiDBtaUs59ydGP8wB1n9AXsYhSHkaqKZK7POFYMxSqbAJOWdpiaWhuoVIci7rlbazCrI7szm+ludr8ZN782rtBzxuCO2ZsTKQUuzGNfbW/Q7zwIzuGLe/rRuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6150670d372so23055037b3.1;
        Fri, 05 Apr 2024 07:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326402; x=1712931202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+9sCeCmLvKolNpPlc4emNIQVjHRAHNF8JHTV4vGUWk=;
        b=ozXFQozjNjpf/ik9R4KuxTdQNvyQ3LMMLIIzxOIZkjXZwMcbK+YwxB8lw1gd+S1WEo
         ry0Xgh4kiCjXrgPHioTNW2CA/SLt26/yUkbsV1bC4NXYAaGWIchOTLBqddPpbBOPbgVf
         6CbX2XulCH5TpCQx4WI1SDKCPHrd7lW16KxnyYcKtpkWlz7Abb6/cO6152HAm69ej/k6
         BafDzQ5G7LCJD1ov0nemLvzY7Sp80f3Se80AIC4NB6Jd7ih9SP5rB1Q4sSSEBDD6Kz4I
         IFxuKMCU9uclISwQgN0DA2lwlyUf5oA2ErndKaWaxoXCybpb7asDRjMTF5mx4GiBjvYr
         xLKw==
X-Forwarded-Encrypted: i=1; AJvYcCWG/qnlh+KWzRASJVzeSEOdLT/x6XGqAxPhJcK/wDbz08I1awsJsCiMTNvsmqUsvDCAvvdnikrWoRpkB/nm9EKl1m+xSmi4vu7i96ZKTTza0c79gxeoY+p8hE53wQJqh1YIVhAKD4cJle2zU7VFu9gL/SlFm6LP8aakZr6BaCMrL+WxN9C57b+V
X-Gm-Message-State: AOJu0YxmaCThMN9o0x/tJtZQct5BZuKSakGKiy6Rz7zZjBNeagxXCtzI
	weavqH1hqaHlA4Tdgmn22/ZoyAOvWSn+cwOF6RKJ6yMB55uK4UPbCqNJTI/kIg8=
X-Google-Smtp-Source: AGHT+IGV2RCX9iyI1mxhlxDPhBlprUGBKDRHdXwZqVlXIRs6i/L63E0unbYciggUDDD4UFEHtGwmwQ==
X-Received: by 2002:a81:4f04:0:b0:611:242e:4116 with SMTP id d4-20020a814f04000000b00611242e4116mr1289142ywb.34.1712326402102;
        Fri, 05 Apr 2024 07:13:22 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id jx4-20020a05690c380400b00615bd0701c7sm364652ywb.118.2024.04.05.07.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:13:22 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6152be7c58bso23595827b3.0;
        Fri, 05 Apr 2024 07:13:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ3YVm/CooF0GXdnVfEQ3tRQ0LyOJ8Yd2KlLZLB9PWAEn6DbZiMACt5zepFV8grLJ3c+8RgH1Y2tXdLJb6aBm7dMijCGI8lMVfTYfzPlEKVgDwQHRZSttvWn5tjxVZVc+h+ELqdaHQI2e6rIU4/K0hSsxLmSdRZ0/4NnQa8bQOyOQ+1hc+FeKg
X-Received: by 2002:a25:14c6:0:b0:dc7:48d7:9ed8 with SMTP id
 189-20020a2514c6000000b00dc748d79ed8mr1138711ybu.20.1712326400634; Fri, 05
 Apr 2024 07:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403053304.3695096-1-yoshihiro.shimoda.uh@renesas.com> <20240403053304.3695096-6-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240403053304.3695096-6-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 16:13:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbKgqFr93x+0PCzGrRyW2bL69oTp+zsZ2SZ8mh0Fk36g@mail.gmail.com>
Message-ID: <CAMuHMdUbKgqFr93x+0PCzGrRyW2bL69oTp+zsZ2SZ8mh0Fk36g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] PCI: dwc: rcar-gen4: Add .ltssm_enable() for other
 SoC support
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jingoohan1@gmail.com, 
	mani@kernel.org, marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Wed, Apr 3, 2024 at 7:33=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This driver can reuse other R-Car Gen4 SoCs support like r8a779g0 and
> r8a779h0. However, r8a779g0 and r8a779h0 require other initializing
> settings that differ than r8a779f0. So, add a new function pointer
> .ltssm_enable() for it. No behavior changes.
>
> After applied this patch, probing SoCs by rcar_gen4_pcie_of_match[]
> will be changed like below:
>
> - r8a779f0 as "renesas,r8a779f0-pcie" and "renesas,r8a779f0-pcie-ep"
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c

> @@ -513,6 +536,14 @@ static struct rcar_gen4_pcie_platdata platdata_rcar_=
gen4_pcie_ep =3D {
>  };
>
>  static const struct of_device_id rcar_gen4_pcie_of_match[] =3D {
> +       {
> +               .compatible =3D "renesas,r8a779f0-pcie",
> +               .data =3D &platdata_r8a779f0_pcie,
> +       },
> +       {
> +               .compatible =3D "renesas,r8a779f04-pcie-ep",

renesas,r8a779f0-pcie-ep

> +               .data =3D &platdata_r8a779f0_pcie_ep,
> +       },
>         {
>                 .compatible =3D "renesas,rcar-gen4-pcie",
>                 .data =3D &platdata_rcar_gen4_pcie,

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

