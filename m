Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40DF39B6EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 12:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhFDKXt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 06:23:49 -0400
Received: from mail-ej1-f49.google.com ([209.85.218.49]:36829 "EHLO
        mail-ej1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhFDKXt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 06:23:49 -0400
Received: by mail-ej1-f49.google.com with SMTP id a11so12995642ejf.3;
        Fri, 04 Jun 2021 03:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IOcoLTbwczubHXMVi9npvA46lPAVliRfNTsVYR+8Vn0=;
        b=b0HJQfRr6AwioRiwGi9TiML2/VlQSgWLjM4Z8w5+wh96JMSknCSPudnwxDQi9DAdqc
         Woi6W1EtFxhTl2A6EGrOZrsnz+L6JRHaLIK5dU1TNNfx16xVzzE4Cn4SxU+yFOyGnUbN
         J2YtO2MA/H3NO2o6IupggYDvP0SvbHPxNimPYtwctnJcnggmBVnsPqQgB4CPUJ28Hv3/
         hOmsi5Ap8j5laGTo9rgX7p42OcoH+bU4nZq1+qXowS+5V9uJGsIA2lj3b7HKO3YzLIEU
         w8t7jUbtd6J9GyZx9pDjjv/6hh7Q2ZJP7Mqk8TUNJKNmkbLz4guA8CIFmQ3BD0YBWyXa
         9d9Q==
X-Gm-Message-State: AOAM530220MWV6Ye/8Y/Kkj8n2GXWzUiaCl0SiGw7BSdg9OAmuC3a8Ei
        TzBrBCpfFIIOVv8n61bk9Np74RNYjPo=
X-Google-Smtp-Source: ABdhPJwvsVTzCn3GFgdHI6xU8SqjtvS/pdBn50+v8luBhtvCS+DEwGTHXUb0hKPG59plXJ891oOXww==
X-Received: by 2002:a17:906:3818:: with SMTP id v24mr3360050ejc.197.1622802108000;
        Fri, 04 Jun 2021 03:21:48 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id n16sm3086453edw.26.2021.06.04.03.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 03:21:47 -0700 (PDT)
Subject: Re: [PATCH v2] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        gregkh@linuxfoundation.org
Cc:     linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20210604095704.756190-1-yoshihiro.shimoda.uh@renesas.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <19b2a786-0b32-f26c-efd9-2f5dbd9894aa@kernel.org>
Date:   Fri, 4 Jun 2021 12:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210604095704.756190-1-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04. 06. 21, 11:57, Yoshihiro Shimoda wrote:
> Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> message is possible output when system enters suspend and while
> transferring data, because clearing TIE bit in SCSCR is not able to
> stop any dmaengine transfer.
> 
>      sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> 
> Notes:
>   - sci_dma_stop_tx() is a macro in the .h file because struct sci_port
>     is declared in the .c file and #ifdef should be in the .h file.
>   - This patch uses dmaengine_terminate_async() so that we can apply
>     this into longterm kernel v4.9.x or later.
> 
> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   Changes from v1:
>   - Don't put #ifdef in the .c file.
>   - Update the commit description.
>   https://lore.kernel.org/linux-renesas-soc/TY2PR01MB3692C545672195370487FA60D83C9@TY2PR01MB3692.jpnprd01.prod.outlook.com/T/#t
>   
>   drivers/tty/serial/sh-sci.c |  2 ++
>   drivers/tty/serial/sh-sci.h | 16 ++++++++++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 4baf1316ea72..3793cf9f352c 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -610,6 +610,8 @@ static void sci_stop_tx(struct uart_port *port)
>   	ctrl &= ~SCSCR_TIE;
>   
>   	serial_port_out(port, SCSCR, ctrl);
> +
> +	sci_dma_stop_tx(port);
>   }
>   
>   static void sci_start_rx(struct uart_port *port)
> diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
> index c0dfe4382898..435c674af1ce 100644
> --- a/drivers/tty/serial/sh-sci.h
> +++ b/drivers/tty/serial/sh-sci.h
> @@ -174,3 +174,19 @@ enum {
>   	(((port)->type == PORT_SCI) ? SCI_TDxE_CLEAR : SCIF_TDxE_CLEAR)
>   #define SCxSR_BREAK_CLEAR(port) \
>   	(((port)->type == PORT_SCI) ? SCI_BREAK_CLEAR : SCIF_BREAK_CLEAR)
> +
> +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> +#define sci_dma_stop_tx(port)					\

Ouch. First, why this needs to be in a header? Second, please don't do 
this by a macro.

> +{								\
> +	struct sci_port *s = to_sci_port(port);			\
> +								\
> +	if (s->chan_tx && !dma_submit_error(s->cookie_tx)) {	\
> +		dmaengine_terminate_async(s->chan_tx);		\
> +		s->cookie_tx = -EINVAL;				\
> +	}							\
> +}
> +#else
> +static inline void sci_dma_stop_tx(struct uart_port *port)
> +{
> +}
> +#endif /* CONFIG_SERIAL_SH_SCI_DMA */
> 


-- 
js
suse labs
