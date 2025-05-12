Return-Path: <linux-renesas-soc+bounces-16981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0398FAB39B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7668A16C1B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C0D1D5ACF;
	Mon, 12 May 2025 13:53:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19B1D515A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058028; cv=none; b=hIpZhN5ZKdNgjJ3BwUoEDk+RplIYkSq26OhmjmyUAx8saMlLbPLcPCcC/hsBKYORqN3ttYGSXNrp+wcS2LNHJjWfmvLi8HTz0ja5oaVzWVz1798TidtnBT/P0sx5HiS+JQoW5OjDLCYNOAQuD5g9tF0Y2tbB12yWjwGaC2rI4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058028; c=relaxed/simple;
	bh=MgRLxfrNYZN4LM+0Am3VLitWYtDT3E9cGd2PIl5Sm/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+2kBppPj3XbKPO//NCS0DNIgAYzwwuZIePUVn49I/RBsnXpIVfsBhgGEj+isbkxD4VSZ+gPnQDruB5QEI16BEet8lj1qjl8UkfJEdbwG3SQUQieylXnr6qJ18hUlFj3+XOKnroU/h0hN8CSTQ4Tai3qOVMHzOnt9as20ikuF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52c58804270so2629333e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 06:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058024; x=1747662824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=So8Lxqdj5wwQ6/5+KDPX/9yMgGWd9z+u3XeyOvQaCMA=;
        b=ZJeGsmViyreUp6LHt5SiqpthPl78WFjio1MbYddlF6WnZQeB8UB2a4FU6lQ8Qd9VoF
         ejXyExCY7NPQYfPtPcTFkksLE79CnSGNukEQ11nNZwCpk5DT4ckKZLPpzsdlTRWlY5Mw
         aHP527Id88+oXMTaaTab1SuAO2yxE00nixhqCJA98z3NBuuXzJD9d2e+Jv0FWeIILVDw
         K0gb6auHOgqCr3iq73TTU6TflU62Ux7euGv3GNkqUTJyinw0zTveKps9WRhv1WOgvTG7
         lU7x1yZJ1ITWNFYzby3198seieYOLUxVzLaEHKJ9HAex+19Nu+kIiR4wdVMkfV8bYi1t
         djkA==
X-Forwarded-Encrypted: i=1; AJvYcCW6dTftk224Hjj4/BVJ4mcHunjnqMq1n7YeOUgBGmTCSPp0YB1v+bwgkX/Ccn4BLv49zA8dlMLcdW0bpQFaUgWBCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynIQlOBj40faeZbs/+e570U+umYY7+/4Ux3QeltdHD4KjmUBtF
	wfVu7KfzpRsG74c41pGlazrSlzwrvCgwH3FD2J2TFYNiWJqZQlk/GqaEj8Py
X-Gm-Gg: ASbGncsjWySyNjeX/acSorbiPaqotaT+VsuKzn8fqJln7mWXAb505MfcjX2SQY7IXcC
	M7PvvniCSSgDT0RmTOYEKiEgIH7kpcEOxlPRZxOM/nnYvJI9HCQ2blWncDp/TcHi5Z0ecEXuQv3
	2Fkrz8yoyMXpyZhnE8uZz3qi5aQkk70dA0hR5mgn4ODatskZRKqqc2lpfI2htpGta95kirj3U8g
	N59jGlm67asiGWvTNtFG6wyPvG6pFxQbGj/poSoWMLCKwgL3pp5DCqNGtL9VGxeqqtRC/EJNJCm
	VPhBsxwg1b0pEbUNLf5EXrvTSTFYIYHyL0S8tWQsJQgrklVD1nlrI0/cViYKqPXR1g7u/OLVJgc
	NSXFOG4aoJ4efnaVqxzuNOdrB
X-Google-Smtp-Source: AGHT+IH84aL5M3rAjBs6VrWIkUQ/iOOiLL5QQ+044wq6Gu+WUt9I4SLuOPyfFDCwPHHLUDrcPfvwVg==
X-Received: by 2002:a05:6122:3d0d:b0:529:1a6a:cc2f with SMTP id 71dfb90a1353d-52c53d2f883mr10760121e0c.7.1747058024359;
        Mon, 12 May 2025 06:53:44 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c7ff62bbesm982214e0c.29.2025.05.12.06.53.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:53:44 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so4082978137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 06:53:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnAarRGsvNIx8rBcc5NU+WFMMBCtf67HWsF7dXVmJHlAW8UjzoLoDqfhLACn9SE1r4BWXt+hew/k8zly81CgEpXw==@vger.kernel.org
X-Received: by 2002:a05:6102:3e18:b0:4c5:8b12:cd74 with SMTP id
 ada2fe7eead31-4deed3254b1mr11355258137.2.1747058023944; Mon, 12 May 2025
 06:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYRPR01MB142847721F6AAE69FD827C320828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB142847721F6AAE69FD827C320828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 15:53:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWObN4F5j65BPiUe5h=-8SKjk9ZW-1KLG+u_1MxVJGjgw@mail.gmail.com>
X-Gm-Features: AX0GCFuyYAs2Kzh94RE0hGtr2cGdbFat6-4e5Z0igBtfb9ZYvQ_lwpthkq5mpok
Message-ID: <CAMuHMdWObN4F5j65BPiUe5h=-8SKjk9ZW-1KLG+u_1MxVJGjgw@mail.gmail.com>
Subject: Re: [PATCH 7/9] phy: renesas: ethernet serdes: add support for R-Car
 SoC X5H (r8a78000)
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Fri, 9 May 2025 at 14:07, Michael Dege <michael.dege@renesas.com> wrote:
> Adding support for a new SOC device.
>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/renesas-ether-serdes.c
> +++ b/drivers/phy/renesas/renesas-ether-serdes.c
> @@ -14,11 +14,13 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>
> +#define RENESAS_ETH_SERDES_MAX_NUM             R8A78000_ETH_SERDES_NUM

I think you can just fix this to 8:

    #define RENESAS_ETH_SERDES_MAX_NUM    8

>  #define R8A779F0_ETH_SERDES_NUM                        3
> +#define R8A78000_ETH_SERDES_NUM                        8

These are not really used.

>  #define RENESAS_ETH_SERDES_OFFSET              0x0400
>  #define RENESAS_ETH_SERDES_BANK_SELECT         0x03fc
>  #define RENESAS_ETH_SERDES_TIMEOUT_US          100000
> -#define RENESAS_ETH_SERDES_LOCAL_OFFSET        0x2600
> +#define RENESAS_ETH_SERDES_LOCAL_OFFSET                0x2600
>  #define RENESAS_ETH_SERDES_NUM_RETRY_LINKUP    3
>
>  struct renesas_eth_serdes_drv_data;
> @@ -35,10 +37,21 @@ struct renesas_eth_serdes_drv_data {
>         void __iomem *addr;
>         struct platform_device *pdev;
>         struct reset_control *reset;
> -       struct renesas_eth_serdes_channel channel[R8A779F0_ETH_SERDES_NUM];
> +       struct renesas_eth_serdes_channel channel[RENESAS_ETH_SERDES_MAX_NUM];
> +       const struct renesas_serdes_hw_info *info;
>         bool initialized;
>  };
>
> +enum DEVICE_CODE {
> +       r8a779f0,
> +       r8a78000,
> +};

Unused (see below), so please drop.

> +
> +struct renesas_serdes_hw_info {
> +       int renesas_eth_serdes_num;

That's a rather long name. "num_serdes"?

> +       int device_type;

Unused. And it's cleaner to use "feature flags" (like num_serdes above)
than to check for a specific device type.

> +};
> +
>  /*
>   * The datasheet describes initialization procedure without any information
>   * about registers' name/bits. So, this is all black magic to initialize
> @@ -82,7 +95,7 @@ renesas_eth_serdes_common_init_ram(struct renesas_eth_serdes_drv_data *dd)
>         struct renesas_eth_serdes_channel *channel;
>         int i, ret;
>
> -       for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> +       for (i = 0; i < dd->info->renesas_eth_serdes_num; i++) {
>                 channel = &dd->channel[i];
>                 ret = renesas_eth_serdes_reg_wait(channel, 0x026c, 0x180, BIT(0), 0x01);
>                 if (ret)
> @@ -265,32 +278,34 @@ static int renesas_eth_serdes_hw_init(struct renesas_eth_serdes_channel *channel
>
>         reset_control_reset(dd->reset);
>
> +       mdelay(1);
> +
>         /* There is a slight difference in SerDes hardware behavior between
>          * each version after resetting. This step is to ensure the stable
>          * condition of initialization, especially for R-Car S4 v1.1.
>          */
> -       mdelay(1);

Why move this up?

> -       iowrite32(0, dd->addr + RENESAS_ETH_SERDES_LOCAL_OFFSET);
> +       if (dd->info->renesas_eth_serdes_num == r8a779f0)

That test doesn't look right to me...

> +               iowrite32(0, dd->addr + RENESAS_ETH_SERDES_LOCAL_OFFSET);
>
>         ret = renesas_eth_serdes_common_init_ram(dd);
>         if (ret)
>                 return ret;

> @@ -430,12 +456,19 @@ static int renesas_eth_serdes_probe(struct platform_device *pdev)
>  {
>         struct renesas_eth_serdes_drv_data *dd;
>         struct phy_provider *provider;
> +       const struct renesas_serdes_hw_info *info;

Please use "reverse Christmas tree"-order.

>         int i;
>
>         dd = devm_kzalloc(&pdev->dev, sizeof(*dd), GFP_KERNEL);
>         if (!dd)
>                 return -ENOMEM;
>
> +       info = of_device_get_match_data(&pdev->dev);
> +       if (info > 0)
> +               dd->info = info;
> +       else
> +               return PTR_ERR(info);

of_device_get_match_data() returns NULL on failure instead of an error
pointer.  But it can never fail here, so there is no need to check.

> +
>         platform_set_drvdata(pdev, dd);
>         dd->pdev = pdev;
>         dd->addr = devm_platform_ioremap_resource(pdev, 0);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

