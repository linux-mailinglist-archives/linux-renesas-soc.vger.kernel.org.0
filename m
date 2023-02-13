Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E85694132
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbjBMJby (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjBMJbb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:31:31 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4B816304;
        Mon, 13 Feb 2023 01:29:47 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id p26so30157467ejx.13;
        Mon, 13 Feb 2023 01:29:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwHrDGcIjUkjASIYS1Cbpe361083KU7EHiDJQo73TLA=;
        b=3lFKxwnyy0d9zk3xVdGWoHPavPblAK61VCHVnlWSRhwP9mZyzej8FLEe3DHE2OX9ES
         krJLWX+8ZQRdhvimmLo5UdPcyYT1/WKtYJQqqWWjGv06k/EB6yhd0tcQUF+vb9SKk8hC
         B9c3uzenuClOpDBtNgJFps8KHY4xEQb/rBwk9aPdWZK37NYcJX5UJT0eTrKNXFe4jygt
         Jh+8dvasY1I9WscvDXsHe1xUjd0kxs8OdLsgAuFXPbwWltKjXJeorsjYyQ/JFJZtH1/o
         H8J04J/RILd7DEaOHtjl/OqAvT2ZUjTxb5i09kWD9nkhEpldBQUOEI4aYAEwqwLJsaXs
         7VgQ==
X-Gm-Message-State: AO0yUKVSjqYqWJZtGKOJxS7SobM4ZEVqwgmVItNaoAJ08zaZNqj3aW1M
        T0TdMSZ16zQkByzjP5WFQSI=
X-Google-Smtp-Source: AK7set9zHc7rLHPY9v7ZS6tcujL+NrXDM9VrQrpkOWp0b7yreJp+Hy+qsf6aU6kUsJnucrkDlVESqg==
X-Received: by 2002:a17:907:3fa9:b0:889:794d:f412 with SMTP id hr41-20020a1709073fa900b00889794df412mr31375987ejc.10.1676280509632;
        Mon, 13 Feb 2023 01:28:29 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906711000b008512e1379dbsm6626844ejj.171.2023.02.13.01.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:28:28 -0800 (PST)
Message-ID: <4dfbdc92-bc49-11b7-932d-806079ede9c9@kernel.org>
Date:   Mon, 13 Feb 2023 10:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <9d141bd9-ca58-4ea-e17b-4a3229eda9b2@linux.intel.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <9d141bd9-ca58-4ea-e17b-4a3229eda9b2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13. 02. 23, 10:22, Ilpo Järvinen wrote:
> On Mon, 13 Feb 2023, Jiri Slaby wrote:
> 
>> On 13. 02. 23, 10:10, Jiri Slaby wrote:
>>> On 13. 02. 23, 9:53, Biju Das wrote:
>>>>>> +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off,
>>>>>> +int value) {
>>>>>> +    unsigned int ier, fcr, lcr, mcr, hcr0;
>>>>>> +
>>>>>> +    ier = serial8250_em_serial_in(p, UART_IER);
>>>>>> +    lcr = serial8250_em_serial_in(p, UART_LCR);
>>>>>> +    mcr = serial8250_em_serial_in(p, UART_MCR);
>>>>>> +    hcr0 = serial8250_em_serial_in(p, UART_HCR0);
>>>>>> +    /*
>>>>>> +     * The value of UART_IIR and UART_FCR are 2, but corresponding
>>>>>> +     * RZ/V2M address offset are different(0x08 and 0x0c). So we need
>>>>>> to
>>>>>> +     * use readl() here.
>>>>>> +     */
>>>>>> +    fcr = readl(p->membase + ((UART_FCR + 1) << 2));
>>>>>
>>>>> I don't get the meaning of that comment. It doesn't seem to match what
>>>>> your
>>>>> code does as the code seemingly has nothing to do with IIR (and none of
>>>>> you
>>>>> changelogs refer to IIR either)?
>>>>
>>>> The generic macro UART_IIR and UART_FCR in linux/serial_reg.h has a value
>>>> of 2.
>>>
>>> Sure, IIR is normally WO and FCR RO and share the same register. I would
>>> simply define UART_FCR_RZ (or alike)
>>
>> Or even UART_FCR_RO_RZ?
>>
>>> for 0x12.
>>
>> I mean 12 or 0xc.
> 
> Won't that collide with LCR reads then? They are currently mapped by
> return 0; but after adding a case for UART_FCR_RO_RZ they'll read from
> what is the FCR register on this HW?

LCR is WO, right? But maybe I'm confused by this really weird HW design?

-- 
js
suse labs

