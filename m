Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91449694071
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjBMJMW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjBMJMV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:12:21 -0500
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E267B12070;
        Mon, 13 Feb 2023 01:12:20 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id sa10so30067881ejc.9;
        Mon, 13 Feb 2023 01:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GkZyme7+G3d29MGhuqmm58onlZJGtyz3L1Qh5Vcgd8=;
        b=lNHZA5CWANzo5CyRsuZuY5rkkKjX65zLwjYN/5DXuCs9VVwq0Lf2GGfJ7OjIGSfXz/
         01Mz+NCzfTjSiRRL+6YlvuDh4mayLPX3KGNI9OuE7q5UAF2KdC7jll+LhWZXELmLRoB5
         tWCCa5YGd7EbjI5+/E8PhzddQH0hxwmaUGK2XAxoqY+PkcZqYPyUbHHvGrYoSJ1OAA9s
         I8KgOLEB0+a1284m9CJ5dIL2Q7BTyT7M9MJVOXjOWKznj4t2IQ2oVpE3BANizqbs3wkB
         1Akpzz5hPbr/AlSUfh/siQ0mAsBN0lLldbu6U6ZtAgw1JsI7UhAEIuOB7UjbTQUtqYw0
         RXVw==
X-Gm-Message-State: AO0yUKV63N4RjOhVppwNiz6QubqCnnqVAdymgR/DFzGrfSbTtqkQNrqg
        nKha6tZWfFaIV4WNd/LVsEiC2TXPDyE=
X-Google-Smtp-Source: AK7set9u1BZFWlQhrEfr3tvZim4KtiCQhpa+3yQU/rdcpggr7bkGLdbczaUbQZbV4RBBrzDHZSmk0Q==
X-Received: by 2002:a17:906:f8d9:b0:88c:a43d:81ba with SMTP id lh25-20020a170906f8d900b0088ca43d81bamr25364235ejb.11.1676279539329;
        Mon, 13 Feb 2023 01:12:19 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906684b00b008aea5e0938esm6441403ejs.183.2023.02.13.01.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:12:18 -0800 (PST)
Message-ID: <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
Date:   Mon, 13 Feb 2023 10:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Content-Language: en-US
From:   Jiri Slaby <jirislaby@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
 <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
In-Reply-To: <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13. 02. 23, 10:10, Jiri Slaby wrote:
> On 13. 02. 23, 9:53, Biju Das wrote:
>>>> +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off,
>>>> +int value) {
>>>> +    unsigned int ier, fcr, lcr, mcr, hcr0;
>>>> +
>>>> +    ier = serial8250_em_serial_in(p, UART_IER);
>>>> +    lcr = serial8250_em_serial_in(p, UART_LCR);
>>>> +    mcr = serial8250_em_serial_in(p, UART_MCR);
>>>> +    hcr0 = serial8250_em_serial_in(p, UART_HCR0);
>>>> +    /*
>>>> +     * The value of UART_IIR and UART_FCR are 2, but corresponding
>>>> +     * RZ/V2M address offset are different(0x08 and 0x0c). So we 
>>>> need to
>>>> +     * use readl() here.
>>>> +     */
>>>> +    fcr = readl(p->membase + ((UART_FCR + 1) << 2));
>>>
>>> I don't get the meaning of that comment. It doesn't seem to match 
>>> what your
>>> code does as the code seemingly has nothing to do with IIR (and none 
>>> of you
>>> changelogs refer to IIR either)?
>>
>> The generic macro UART_IIR and UART_FCR in linux/serial_reg.h has a 
>> value of 2.
> 
> Sure, IIR is normally WO and FCR RO and share the same register. I would 
> simply define UART_FCR_RZ (or alike)

Or even UART_FCR_RO_RZ?

> for 0x12.

I mean 12 or 0xc.

-- 
js
suse labs

