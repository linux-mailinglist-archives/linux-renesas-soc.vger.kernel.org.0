Return-Path: <linux-renesas-soc+bounces-19323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC76DAFB390
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 14:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF535420C0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 12:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EBB29B20D;
	Mon,  7 Jul 2025 12:50:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC844315C;
	Mon,  7 Jul 2025 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892625; cv=none; b=Kstdg9Aij7cUk/8BvDCa01dRVaNaEleuQmrLBMDkuFFj3wZPjTSCvfLl56xzn+YcZUxTd958qeeT2HrSElvH+k2DHZEVeeWIYOeDWJ5SX02TgCgaiJboGgvDCPlTXu9EHl1CloTcBVcZzGKa3kBpXY7xJjHkDjajZmEWWaH5oVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892625; c=relaxed/simple;
	bh=GwT868jh0Qxm7S+0u44DTz5mujm9rDPZRJQVcPQdqeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFCjtVq7nhoxSggFwg5TcLo2bZqFz9owUOMO3bnNsYTYyLNTWzyti4yfzV/KiveqrwpZBXltUBtu9EfGG9q7Pc789Q4ygB8yiICnMHd67OIGcGF7nMqWJo+TG/ruKqXLtEkvxYyWyOkDU2hQPlNAVgGOvD/FJEO27rOphX7ouiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5315ebfda19so1132583e0c.1;
        Mon, 07 Jul 2025 05:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892620; x=1752497420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zracpAlWO5/gCbNS7IGfJCZEbRAa9k1rsHViJ/4d7wE=;
        b=t/Anp0tNOGy6hMyqZfbeCjkGqqlZyuZBrU/pnCFumwuZVyKwiF0Z79QrmynLm944RO
         8kdMGUfKURXGY4PpwEyYL7vsqvISn1aVyhCsgsWlsfKxW+4S+i5zikzdrLGY6jiRMNQi
         G41FChrH1X9TTJjVyYpbdy/68Xdv/6BiUESSvge0QnwtP27qNXc1B1Au/+qCAkPCWJPn
         NEspujLnTOytJt3z+RFDa4BgCiYFNmjjJvit6l2zb7PyTOP9b6iLZ3SpPZpnTAf0ad4e
         iAbiiNzneGeSdmalCga6OHKgKWlnYT6IxZt/nwZditJEPHzTBODvazL4o3ijyT3ZyVJ1
         6xhg==
X-Forwarded-Encrypted: i=1; AJvYcCVvqtDaMe4PHeY6S9ZmJ3YgPhBoBQpBDIRhQCyavGpAVlYMqBvSyUJF3UcDcOrfsA/QnarH2lml@vger.kernel.org, AJvYcCWXAZPynSP7OD/68bA7VlhO8BkwglIlCAg4FBUhUAVKIz+RgbnkjeczrzOa/vA4HNYRNJwUEjF5kngvE3I=@vger.kernel.org, AJvYcCX2xNZBKHjfabhhaQxJkQauFlc6ztJ7Vu8yyqpJYJ+kG9pYQliaYDsVdwPhlBSxkuo5UmILzvvlopsMPBl/yff838o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwAKEZnxZAJkhESnbLgIxyhntDtLFsfpSJmaHmPcLuvJ90ecU
	WQHR7i2fj9uh9eVSMR5tp2ASp3PpDQ/csGgP0T/jbyfQjIk0+HZFbps4D/XYgvkt
X-Gm-Gg: ASbGncvmJUh69/3iQywYFJ90ay8lqTReY4ZFnSJ0QAsWIDTK2RXkQJkvfQmP6HSi5y/
	/bYFEGdSe+/AORt5VB5eY+xzLaHtrvy8kwp4smQZsS3nbQrcy50VwP27hyX5b5Ytyl6uxpql5QH
	q7416MjoEYOvYiKiafJgUQB89pe6/NSSJ2xO2RpcZV9W4hbCZLvaVs8aLyyG8DxKthHFOlOQVbC
	rv6q7Tc6xnil/tWEf8xGLLCaNGBjyov4lj396rr5GK3JvBxYWmdAGhfdxGLVA1dxuX6pBjJJa3S
	vqSndResBSUXfeJ/bBiUqHJwMJM70Oupd/JGWJbpwt8ZcIJf4I5nldbqUc51cphKxUjhrj7uvBW
	U65BToBla+x3TMbTgZDgCpJjlJsSZe2mMcuVXz7U=
X-Google-Smtp-Source: AGHT+IH3JoyPP1AO2NSsZ0CAd8HQmyfwLPo2aIATpzY4TdQT6mXw5J9S7fZGfjYamU3PMntgPDUcOA==
X-Received: by 2002:a05:6102:8016:b0:4dd:b037:d239 with SMTP id ada2fe7eead31-4f2ee1ab47amr7966058137.14.1751892620528;
        Mon, 07 Jul 2025 05:50:20 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea541f7csm1118480137.8.2025.07.07.05.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 05:50:20 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-531a1fad7faso1061740e0c.2;
        Mon, 07 Jul 2025 05:50:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdQuB5NL8+Xj8pyoGZcTO/ovLfOkyYKPxcui+vvYfomo6uWw8ILnl+acYxNhUB6Nzbx6H4DG7tqxRJAi4T6t/H2DU=@vger.kernel.org, AJvYcCV1qRw71dLqLRVtjfOilxfkIGJVaSqFrfpO7Es/wZJ3rar+qrSwYVtPmn2/RF861sjxopi7h6TP@vger.kernel.org, AJvYcCWNQh9kveJ5KVF65fbfelQ9BelPCgiP51uo5PD19ki5B4+qfouGP6eRURhzPf1ZXMfy58N6qMrQq2kn1Z0=@vger.kernel.org
X-Received: by 2002:a05:6102:2b86:b0:4e6:a338:a421 with SMTP id
 ada2fe7eead31-4f2ee03d97fmr8080361137.6.1751892619438; Mon, 07 Jul 2025
 05:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com> <20250704-add_l2_switching-v1-3-ff882aacb258@renesas.com>
In-Reply-To: <20250704-add_l2_switching-v1-3-ff882aacb258@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 14:50:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUerQwRS7vX7UtaubgvEKjBzRXUR4PsJzxkeYaf9KaiaQ@mail.gmail.com>
X-Gm-Features: Ac12FXyiSPYj31DBsG8h4WX8xUJaTIcUGjmMZWTM6hBt-xpHoxMZAAnHIaStaE4
Message-ID: <CAMuHMdUerQwRS7vX7UtaubgvEKjBzRXUR4PsJzxkeYaf9KaiaQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: renesas: rswitch: add modifiable ageing time
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Fri, 4 Jul 2025 at 07:52, Michael Dege <michael.dege@renesas.com> wrote:
> This commit allows the setting of the MAC table aging in the R-Car S4
> Rswitch using the SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME attribute.
>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Thanks for your patch!

> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -849,6 +849,7 @@ enum rswitch_gwca_mode {
>  #define FWMACAGC_MACDESOG      BIT(29)
>
>  #define RSW_AGEING_TIME                300
> +#define RSW_MAX_AGEING_TIME    65535

This is not needed (see below).

>
>  /* TOP */
>  #define TPEMIMC7(queue)                (TPEMIMC70 + (queue) * 4)
> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index 242beb1f15c089585f5fe5019f626df8824b971a..c8a8a60a20e70f7ce421280ed35c0c4afe1ed039 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
> @@ -196,6 +196,30 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
>         return NOTIFY_OK;
>  }
>
> +static int rswitch_update_ageing_time(struct net_device *ndev, clock_t time)
> +{
> +       struct rswitch_device *rdev = netdev_priv(ndev);
> +       u32 reg_val, time_val;
> +
> +       if (!is_rdev(ndev))
> +               return -ENODEV;
> +
> +       /* Although brctl accepts the ageing time parameter in seconds, the value
> +        * passed to the driver is multiplied by 100. We need it in seconds.
> +        */
> +       time_val = (u32)time / 100;

switchdev_attr.u.ageing_time is clock_t, which is long, so no cast is
needed before doing the division.  Actually the cast may truncate very
large values on 64-bit.
However, dropping the cast means time_val should be changed to clock_t.

> +
> +       if (time_val > RSW_MAX_AGEING_TIME)

if (!FIELD_FIT(FWMACAGC_MACAGT, time_val))

> +               return -EINVAL;
> +
> +       rdev = netdev_priv(ndev);
> +       reg_val = FIELD_PREP(FWMACAGC_MACAGT, time_val);
> +       reg_val |= FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
> +       iowrite32(reg_val, rdev->priv->addr + FWMACAGC);
> +
> +       return 0;
> +}
> +
>  static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
>                                  const struct switchdev_attr *attr,
>                                  struct netlink_ext_ack *extack)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

