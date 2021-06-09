Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C38B3A1479
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 14:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbhFIMc4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 08:32:56 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:46809 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbhFIMc4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 08:32:56 -0400
Received: by mail-lj1-f172.google.com with SMTP id e11so31401764ljn.13;
        Wed, 09 Jun 2021 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0ouZ2IrElWSPapbXOTCSJ51EhmhFQFFSG0D3L9FAdKg=;
        b=iLn48fTW/uE5Tl0qkJ8aWHDZgLQ+lS9Aqhc0XO6kLcZS6WzavR1tD5FZ6u4Rj9F47a
         oALc+vcyhcM9bqeD8xcqhJCbkpa48ODa9jWad0/5zUtTY7lfZ+kMsK1DNWkuQ1luZcxh
         2TmxqLCs99lZ0uNNv7iGUZ2Orm/vkQd35N4Oa5vN/EQXs7RMC4Ry3pfV47FvMyZel6qo
         G9l+ti8l4YqWLx1P1BeEznZDU/E7rIqEDhNlWKhtPhyvi/JP26WYCxexOSyP7kVySe0E
         muddddNJhLDT2wzl0fUBcXNCPlNMtMFrKRJSlGBILD6xmKROCAdvML/we6pxV4H29voX
         OMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0ouZ2IrElWSPapbXOTCSJ51EhmhFQFFSG0D3L9FAdKg=;
        b=AAqyetVHwQQhywx9U/kQRDyc9r19NEZk6Uq7SclvfJ+cWpPUlQ6zSBETCgmhpPpWUZ
         j5FCADTnEeupMylAGrMrT6r+pIMKXOmDWxjPX0X9A+IIR9EqWWr4xJJmfLDb0tt5zIqk
         ook4zaeLB00jiOXtgCWybJuNL2TCsUJ7snxq4YqNb8Lx6wtod7xeh3BQNEYITC4okFaZ
         WFg19vDCNoCg3ujR8qXHKi8tvHGmHcoOiUe+W45a9KVTS9Bd1y6M4D05GQt4TxI2G9sv
         E6EAMwfr0axNoNPM+7Nv7Hvp83Rq/Rm3pWSd19ltKep+zESdVfNYmzYVbE79uMy5zHoL
         C2qA==
X-Gm-Message-State: AOAM532+6ZLLjbh/lSGeU1fI+DFXY5V7tSTMnMYv6TopYV0OB5uKJrVt
        HvGnsU3Opu3tsbQvXXuwOXS5exPXy/Q=
X-Google-Smtp-Source: ABdhPJyGeXGlAAJXWhE97PKbLYE89nonPkTBJr1T3EBK6HcbazmhZ23x25y66tmKar8XzTcoDA6kvw==
X-Received: by 2002:a2e:7008:: with SMTP id l8mr1968994ljc.462.1623241786226;
        Wed, 09 Jun 2021 05:29:46 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.77.194])
        by smtp.gmail.com with ESMTPSA id y20sm345852lfj.236.2021.06.09.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 05:29:46 -0700 (PDT)
Subject: Re: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <ac930164-6150-4358-8fe9-ab87654f68ce@gmail.com>
Date:   Wed, 9 Jun 2021 15:29:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 6/9/21 4:49 AM, Yoshihiro Shimoda wrote:
> Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> message is possible output when system enters suspend and while
> transferring data, because clearing TIE bit in SCSCR is not able to
> stop any dmaengine transfer.
> 
>     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> 
> Note that this patch uses dmaengine_terminate_async() so that
> we can apply this patch into longterm kernel v4.9.x or later.
> 
> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v2:
>  - Don't use a macro.
>  - Revise the commit descrption.
>  https://lore.kernel.org/linux-renesas-soc/20210604095704.756190-1-yoshihiro.shimoda.uh@renesas.com/
> 
>  Changes from v1:
>  - Don't put #ifdef in the .c file.
>  - Update the commit description.
>  https://lore.kernel.org/linux-renesas-soc/20210602114108.510527-1-yoshihiro.shimoda.uh@renesas.com/
> 
>  drivers/tty/serial/sh-sci.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 4baf1316ea72..2d5487bf6855 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *port)
>  	ctrl &= ~SCSCR_TIE;
>  
>  	serial_port_out(port, SCSCR, ctrl);
> +
> +#ifdef CONFIG_SERIAL_SH_SCI_DMA

   Why not use IS_ENABLED() instead? Gets rid of #ifdef. :-)

> +	if (to_sci_port(port)->chan_tx &&
> +	    !dma_submit_error(to_sci_port(port)->cookie_tx)) {
> +		dmaengine_terminate_async(to_sci_port(port)->chan_tx);
> +		to_sci_port(port)->cookie_tx = -EINVAL;
> +	}
> +#endif
>  }
>  
>  static void sci_start_rx(struct uart_port *port)

MBR, Sergei
