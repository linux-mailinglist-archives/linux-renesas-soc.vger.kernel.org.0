Return-Path: <linux-renesas-soc+bounces-28848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P/+Itg+qWnK3QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 09:29:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB8F20D73C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 09:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FA6A30214CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 08:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CAE373C12;
	Thu,  5 Mar 2026 08:29:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88759329E7E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 08:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699344; cv=none; b=f+IwGfURgZc58PnzVW8Pdesw1HKEZUaOF2dbt+QW2o2wMgmUmHj70pH+j57Z5b4BS+VwoC11fCjzODo7MqpEB+4kY+j4wnx/eahWnyox++AyNzK8uVszmzxPfX7o+eEQDk7gb1EJggsSFH1xwREN9Wb1+OJte1aHI0VEtCnhhWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699344; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGzOMc0xW+QboeFQOxhuGqYIKTo5r/ijiRAwr3hgwWJesDSbbLp8PtRovHhSlIisk6NRTJSBoHFHINi0FguSZc6LoDwnp/GuibjVizyBQkS6P1MJrvLOVnyFrkZ3vLSjXq0X6raCNYHy3fNiVyvNALoGUwhYxUg+iNnPXXgE6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso2333505241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 00:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699341; x=1773304141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=Fa1AjHWZoPqEOJo5yLNyTKXJ3YoA98KVNGykGf1+Ey+OuKMzddeHPVYkhY+6FcnvIA
         HNf+lKsHcUMQcQhypW/BcNV6WxMNN2TTTzHpwj96r/oyICpISLJlk0LQmHGweS5sbBZe
         oFAeOCfctrLGYPrcPRR3bOjrF1HCIBMPPwgUJyMP3EjXsKwGTJqma484GQUl83iCfNS6
         sMN9tiRO841BI8B9iT0nyKPi32AUEYVD9oLSV7Vs0kGuUUnOSXhpqjmDw67oEzL2t5sR
         vUjdNIv52MyP5qBPGTLY9Rld95R5jdGYJ/xwYix7pCZL99nqsU23Nx+ANFeb5d5op9lb
         CqGw==
X-Forwarded-Encrypted: i=1; AJvYcCX3S0jrrQUYhRN42sLmE9Hy65VJ0x1/N7mgBzW+ta0SRtrPy0AZFSLvO7cFMd4jAjYRLhFPbDTOtvk/HEeMAbagzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0tAgyIC/hFGiHJdbgDTZgE3/0tuMQTdtBdfYwcK6Ruv4tFWqx
	gdc5ZW/IASXZOZDg36mygSTd1njfda96N1hwWsYn8te1D/Iu/+3WE600dykd5KbA
X-Gm-Gg: ATEYQzzxXVanDqinhyAgPRt9xT5dZnY7RxZiHY0esaZODWjobjSG/hkPJ+4HLT+j7G6
	+pDsjEnxjDoyN6DfWkHaP3hQDzKHUifTJajD0435OBM2vn6IvRwQ/VSszxrd3iZiDBARf1KJlBB
	nmYhOm7SfXpugv0h6IovP8Eb6HRj6nuT539WuSkLNNGGYbna2EZrtMgPnN1ZAWM0R4aq51RyBOW
	kaMvX4ZnBYCYPmiG5a9KbHOQsJTwotZa2OrCFGkgxorQJo8pclFENLa+OlxPtXS4VhUKWKH6A/u
	4rdLeoQm4qwf7EsaORHVjYV5s9IkJKQmfEapjPIPbjI4fz6PvCZPiS4PItFEM0UxUA+TmSSeGQo
	xK3YaKn/pMLGEDEEoP5zHdyNNE6AXS/mipaP20i48JEkIkIVrvCZsYuhMsfA3BOzs0D3VrxxVoE
	rpJPIHH2C2K5vvy+jYpQBI3dhBX1JM6DlUeUR+OZvZ7V4aevg09IuKkHbXxam3
X-Received: by 2002:a05:6102:292b:b0:5ff:c0e8:d8b3 with SMTP id ada2fe7eead31-5ffc0e90ea5mr1274543137.1.1772699341515;
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df61672ddsm20653531241.0.2026.03.05.00.29.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94dd687e040so1817721241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwzpsklsU7uV+3e7rLu88gQ4yWlxEfpYKi6iBs3/38ip05b++K78eCjm8t/CKxtXHIrlaU/cyOm/i52ZtvVz3XOw==@vger.kernel.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2CB8F20D73C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28848-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,nxp.com:email,ti.com:url,ti.com:email]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

