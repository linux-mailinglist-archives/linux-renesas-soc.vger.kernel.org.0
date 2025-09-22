Return-Path: <linux-renesas-soc+bounces-22169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B5B92019
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 17:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B902E3A5C9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BED2E7F17;
	Mon, 22 Sep 2025 15:41:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004327B340
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555711; cv=none; b=AQInBOE4DBUUI2x8rH5MMZ9VOOkbT08Xx+UlF7p7qhKl4njjWGy6/DV+tBapZ4Al5jaDsuZAtRssyv00F8dz8IVp9PmczOYEQiwhJnbVcXnSOuUy571m3JdNTDajNR/dOH7hg+r8bJvc3Q7nL1iZHm2oXH4vRRplhaP6aXj8ExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555711; c=relaxed/simple;
	bh=LPaxUgjulCIZky3hRfMrs4SMdXdUnOG63nKkquHAkQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBAq4FkM2kEZIarawTDExe1jf6TgB1CTMzhXZRtOEAU4wF/YIkJfdapxkq15E/ZYqGpQY1/oh23g+CCInl3L/XuQ+h6DcaNTEHJHdrSsa+6VnNGjJ349/aAeHyJ2Yd9Vz9hR5MYHCyG2HZNVmjgOmd+I4PKthWCXXcaSuPgXiVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5838680e242so1338769137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 08:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555709; x=1759160509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkETsZJNMYJYRULnxLtQXFZTQmJ76gdUN2IchMcg1nI=;
        b=Rkkkoz7FOYUEV3SYJndA0Z9kc6F5Hpy0xVZp5NG/82G3aRdqqrT4yh50LtscJv03gZ
         YM2ocWCNN/rnpSwpampuddomnPiUQoDR/DOStmUEY+oL5XXdJMCTsl8eP5Y/e6Jt9qHk
         3I9uqMvpifCQJ96U9E8Gx9u3DdaUD8e5cRrNbyp65TRPLaFPSk43gaNqUYEw9GzzFoZu
         6OhHOxPHuuLrcsfYnJe2jKL4u3e81FgkN0eLr9rP616F3DOnVANirO4kDP17rhnsjtN9
         k8qBCG8l1POTDdKonWtAR66yIzTpQpiiPWTyfIkGmy9ptNpgwzYm11iiFmOHE5QiszHl
         lwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMeuzpMk9LeBZVEstaGj7NBxewlG7/YSJ/x6JHGkB+QK79o2CpzFaZQnPEKMam8X9diCu9waiHjIZN0sIiFPMoEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZJf6O9ZYawIlKIhRVR/hBTFcl3FYaG/zTu+7ShZ9x5CZee2S4
	Pp0vS0acS2J+FF0us6VOuLZHXnOM2DRjuAcTXC4YfGjFvI5yjumYpYTwCOnhrqSB
X-Gm-Gg: ASbGncuVIO/4tW1sd6poImXCyPWxsbQ037t0KKsSSLZ4+h0QqoZYHsv4I5aatuUTnVH
	HEBkfLX3Qu1eFiX0kNh51dzYFcMjJZhXN0g7/8dXcaqgvXGDoQrhYNnSdFkDPG46YCIODNjKTh2
	bR4gpCN3ZqPxSh1NUdOuLE4Ztvk5oZjrJZQjjofKeX6qndGrrFd1t9A7UKXla7IPaj7SKNcspTD
	8eSwKgFJppsXu1Oxu+VYKnRRfvdFIIf4Wa/cacaD8AhMr+IfHO9+3cJPsd05jvKE3QikIcJu0R/
	BX8T08RgTczn2m/qujlgaj8Bpv/5hmzYgACMgeFR+0ZbkdUxRNCmeMEZzJsNnF+vHWVSIG2aciv
	Y9nCZHIQV8yM8rqRisuKv37S8y8o4nrH7cVQ5BNXfAoyDpioXAhlz/ShLRO8qgGT6bINssTk=
X-Google-Smtp-Source: AGHT+IFl3qnP2uQWwE9nIushypL0asf61LtLF5cAAsOMG7aKUUlSLZ427JyLTlxG4HVXegdTEpnilA==
X-Received: by 2002:a05:6102:f0c:b0:52a:4268:7618 with SMTP id ada2fe7eead31-588ed04e702mr3177040137.27.1758555708835;
        Mon, 22 Sep 2025 08:41:48 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5a3d7d08f7esm318438137.17.2025.09.22.08.41.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 08:41:48 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-574d36a8c11so1312065137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 08:41:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJtRgRWFwd29xmpETdha+1qc/BC6U54N/x+B6zMlTvV4K3iAiUngt7SWxy3HZpo+/oKuPkm7sq6Jmb9Zg3AioNoA==@vger.kernel.org
X-Received: by 2002:a05:6102:6890:b0:534:cfe0:f83e with SMTP id
 ada2fe7eead31-588d388f544mr3285300137.3.1758555708237; Mon, 22 Sep 2025
 08:41:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922153352.99197-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922153352.99197-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 17:41:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG_y-gb6kGd+Bgo5AQvqv009RYwVjwN5dDC0WFOuyPcg@mail.gmail.com>
X-Gm-Features: AS18NWCFEiYkOlpoRVmaYaX7WRJp7yXl-rQ_0FdjEskYo2uwSKVFu_hC0WhJkpE
Message-ID: <CAMuHMdUG_y-gb6kGd+Bgo5AQvqv009RYwVjwN5dDC0WFOuyPcg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-host: Add static assertion to check !PCI_LOCKLESS_CONFIG
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Sept 2025 at 17:34, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This driver can not function correctly without PCIe subsystem level
> config space access serialization. In case PCI_LOCKLESS_CONFIG is
> ever enabled on ARM, complain loudly so the driver can be updated
> accordingly.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/pci/controller/pcie-rcar-host.c
> +++ b/drivers/pci/controller/pcie-rcar-host.c
> @@ -35,6 +35,14 @@
>
>  #include "pcie-rcar.h"
>
> +/*
> + * This driver can not function correctly without PCIe subsystem level
> + * config space access serialization. In case PCI_LOCKLESS_CONFIG is
> + * ever enabled on ARM, complain loudly so the driver can be updated
> + * accordingly.
> + */
> +static_assert(!IS_ENABLED(CONFIG_PCI_LOCKLESS_CONFIG));
> +
>  struct rcar_msi {
>         DECLARE_BITMAP(used, INT_PCI_MSI_NR);
>         struct irq_domain *domain;

This causes a build failure when compile-testing, e.g. x86 allmodconfig.
Using "depends on !PCI_LOCKLESS_CONFIG" instead would avoid that,
but indeed has the disadvantage that it wouldn't complain loudly when
PCI_LOCKLESS_CONFIG would ever be enabled on ARM64...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

