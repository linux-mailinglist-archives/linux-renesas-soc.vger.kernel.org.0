Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B537564DBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 08:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbiGDGgA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 02:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiGDGf7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 02:35:59 -0400
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B152273D;
        Sun,  3 Jul 2022 23:35:58 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id g26so14954063ejb.5;
        Sun, 03 Jul 2022 23:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KSz1fScBhXiduYX3MNiAd7k7qd90lzeP7i9sOOLLqvE=;
        b=C3rFLik7d8D0/b14j3IRnI4DZnryqLBFRDaI4czdB6QqA+SHyOYMlAPOpWAdUZmvtU
         ax+jkO2v4zjGKblO6J12WiUEOBM5M6TVLO53YjJwXjh+lDO62llcBhJdx71aSe9io8QQ
         9g26wqEYlOMWPOd2Ml3tqjLvmd9WxUyHvjySGjjDAVwZIxhlx3hq0P5+y/cKXAFBzOuZ
         hopahKwKtkJXoDapzOja7WndHMAEySmeZ8v+UQf5Qkhln97H4kCmwdVMwD3wmLpBI6L0
         EwVu2xkmDPRfdFZscuGXUmlqSXlratnMjob9tawP0rUFwcArqq6H8W8levNn0YIdGqfy
         GxPQ==
X-Gm-Message-State: AJIora9DCOpR8j6acdlrx2S0YPg5cpbfMJlGA7mTZqPYyKDtbJmuGczo
        zTZA6zsjOEVLT6ZmNi43y1o=
X-Google-Smtp-Source: AGRyM1vPq7L06s9wgk51OG/cBNhL2ZdNJUx+ue7Iw7v5MYKvetYYXMxlWV3D9ow0uvGAJrXcqvN/jQ==
X-Received: by 2002:a17:906:9508:b0:726:9589:6da7 with SMTP id u8-20020a170906950800b0072695896da7mr13595564ejx.505.1656916557102;
        Sun, 03 Jul 2022 23:35:57 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id w3-20020a1709067c8300b00722fc0779e3sm13851750ejo.85.2022.07.03.23.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jul 2022 23:35:56 -0700 (PDT)
Message-ID: <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org>
Date:   Mon, 4 Jul 2022 08:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Johan Hovold <johan@kernel.org>, linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30. 06. 22, 10:39, Biju Das wrote:
> As per RZ/N1 peripheral user manual(r01uh0752ej0100-rzn1-peripheral.pdf)
> rev 1.0.0 Mar,2019,

Is this public anywhere?

> the value for 8_WORD_BURST is 4(b2,b1=2’b10).
> 
> This patch fixes the macro as per the user manual.

I'm curious, is the bottom bit from "3" ignored by the HW or does this 
fix a real problem in behavior? Stating that might help backporters to 
decide if to take the patch or not.

> Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA flow controlling devices")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/tty/serial/8250/8250_dw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index f57bbd32ef11..931490b27d6b 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -47,7 +47,7 @@
>   #define RZN1_UART_xDMACR_DMA_EN		BIT(0)
>   #define RZN1_UART_xDMACR_1_WORD_BURST	(0 << 1)
>   #define RZN1_UART_xDMACR_4_WORD_BURST	(1 << 1)
> -#define RZN1_UART_xDMACR_8_WORD_BURST	(3 << 1)
> +#define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
>   #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
>   
>   /* Quirks */

thanks,
-- 
js
