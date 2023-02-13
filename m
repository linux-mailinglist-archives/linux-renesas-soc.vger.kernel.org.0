Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079F4694067
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjBMJKx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjBMJKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:10:51 -0500
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3EE13D43;
        Mon, 13 Feb 2023 01:10:50 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id u21so11910266edv.3;
        Mon, 13 Feb 2023 01:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTKo4FoqFLyfAtCI8jNZy8wGYlrX6dvwhoLTBJbPRdM=;
        b=Xr06SvlAnFYxVAwZ7metj29fpiiJnAoRR5dAdg0/Nh+2YlVnGVeSLwcxBNgNjZwvJh
         JE5zvTtybCiq95TuA61TI05r0HPI2pvnN48z2orDnTBCkZ1Ig7twGnwKx+gc/GO6iXZ0
         6iuWyGeSxcrlTHGudOxK+QNDKJj0PJw4Si3yir4NO2IIxP2LdQfVLrN7ca1ZVfjGF4ex
         nFjkSEPq3kKxAfXOIrQiZkfIlwUgdRHuy9TH1h6ymyh+6R6pm12yGR6lRkvgXElVzwCX
         JATiYiCQXw5+peE+0BvpH17u97rUI88Z/F17IzKWqya1QACQlzlSjxK+g8k+dZBej1uk
         Pddw==
X-Gm-Message-State: AO0yUKUDO8+ofzb3TjzpdVh48qxNeGi4oDgRRArTAr6z4KYJEkdQfSRg
        ry0GNtdtrOQY8KGd7Q/SUTNc/jnqw8M=
X-Google-Smtp-Source: AK7set/7ZlKC4obklQdJYm8oeTdNvzjHuiSkMpN+ZBuFohrBLQUTgfiylqTh94BbkyAlS4BWvaHN7g==
X-Received: by 2002:a50:d752:0:b0:4ac:cdcb:ab68 with SMTP id i18-20020a50d752000000b004accdcbab68mr1071214edj.16.1676279448785;
        Mon, 13 Feb 2023 01:10:48 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id f8-20020a50d548000000b004ab33d52d03sm5331365edj.22.2023.02.13.01.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:10:48 -0800 (PST)
Message-ID: <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
Date:   Mon, 13 Feb 2023 10:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Content-Language: en-US
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
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13. 02. 23, 9:53, Biju Das wrote:
>>> +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off,
>>> +int value) {
>>> +	unsigned int ier, fcr, lcr, mcr, hcr0;
>>> +
>>> +	ier = serial8250_em_serial_in(p, UART_IER);
>>> +	lcr = serial8250_em_serial_in(p, UART_LCR);
>>> +	mcr = serial8250_em_serial_in(p, UART_MCR);
>>> +	hcr0 = serial8250_em_serial_in(p, UART_HCR0);
>>> +	/*
>>> +	 * The value of UART_IIR and UART_FCR are 2, but corresponding
>>> +	 * RZ/V2M address offset are different(0x08 and 0x0c). So we need to
>>> +	 * use readl() here.
>>> +	 */
>>> +	fcr = readl(p->membase + ((UART_FCR + 1) << 2));
>>
>> I don't get the meaning of that comment. It doesn't seem to match what your
>> code does as the code seemingly has nothing to do with IIR (and none of you
>> changelogs refer to IIR either)?
> 
> The generic macro UART_IIR and UART_FCR in linux/serial_reg.h has a value of 2.

Sure, IIR is normally WO and FCR RO and share the same register. I would 
simply define UART_FCR_RZ (or alike) for 0x12.

-- 
js
suse labs

