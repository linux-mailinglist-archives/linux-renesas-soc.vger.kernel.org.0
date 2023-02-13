Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97EFB69407C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjBMJOf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjBMJOe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:14:34 -0500
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BDB13DD9;
        Mon, 13 Feb 2023 01:14:31 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id v13so11852495eda.11;
        Mon, 13 Feb 2023 01:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ju+gZWq3U4XTI6R7xlBINfhvSvbEIHp0L2PkQwswBZc=;
        b=vgtQlJemu5ivB/FPVPhieCbv29sFh+N7I0mHbtWdlzkzsZ88oBj3ActKNuCVtBxanA
         A9hZD5Kxy8Ghl3L2JpBICaLHaFUIba+awDZgf/04AplPZx86zGvipriArzfYo9dimGAw
         LA0Pb8n7Gd/dP0xvF+5/VyeCnkOY1BgOLAYhEE3MpfGBExdazc2AyK5Wzm0g9dUwwxVi
         mt/3ekzH+QmDmjCrzUnNrXbEVQPsKJf7+qMLidNieolSgeT6Qtav875/1eeGa0SAAGA+
         1YuFkS3gxDSH7aPP1Dhp9qTgYi4X8TfEXegeplzoBztghUFiHu8p1yLWaiU90pIo0Lvc
         s1sA==
X-Gm-Message-State: AO0yUKWYd/WlJ/Ia9WjAEpoa0Yown/nrS38TOrGl9KsGo/8lti88zJWl
        j9TNFBWXRHejoXGJDXOm6B0=
X-Google-Smtp-Source: AK7set/SC2YARAB5/bPUFvmc7xhj+6sFEFSyFEQ4LbuctVt5XrG53V/Lz41ImTmn0Ak+5ISoAGsOKg==
X-Received: by 2002:a50:a445:0:b0:4aa:a4f1:3edb with SMTP id v5-20020a50a445000000b004aaa4f13edbmr23905755edb.29.1676279669658;
        Mon, 13 Feb 2023 01:14:29 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id dk19-20020a0564021d9300b0049e09105705sm6211006edb.62.2023.02.13.01.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:14:29 -0800 (PST)
Message-ID: <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
Date:   Mon, 13 Feb 2023 10:14:28 +0100
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
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
In-Reply-To: <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13. 02. 23, 10:12, Jiri Slaby wrote:
> On 13. 02. 23, 10:10, Jiri Slaby wrote:
>> On 13. 02. 23, 9:53, Biju Das wrote:
>>>>> +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off,
>>>>> +int value) {
>>>>> +    unsigned int ier, fcr, lcr, mcr, hcr0;
>>>>> +
>>>>> +    ier = serial8250_em_serial_in(p, UART_IER);
>>>>> +    lcr = serial8250_em_serial_in(p, UART_LCR);
>>>>> +    mcr = serial8250_em_serial_in(p, UART_MCR);
>>>>> +    hcr0 = serial8250_em_serial_in(p, UART_HCR0);
>>>>> +    /*
>>>>> +     * The value of UART_IIR and UART_FCR are 2, but corresponding
>>>>> +     * RZ/V2M address offset are different(0x08 and 0x0c). So we 
>>>>> need to
>>>>> +     * use readl() here.
>>>>> +     */
>>>>> +    fcr = readl(p->membase + ((UART_FCR + 1) << 2));
>>>>
>>>> I don't get the meaning of that comment. It doesn't seem to match 
>>>> what your
>>>> code does as the code seemingly has nothing to do with IIR (and none 
>>>> of you
>>>> changelogs refer to IIR either)?
>>>
>>> The generic macro UART_IIR and UART_FCR in linux/serial_reg.h has a 
>>> value of 2.
>>
>> Sure, IIR is normally WO and FCR RO

What was I thinking? Switch that WO and RO, of course.

> and share the same register. I 
>> would simply define UART_FCR_RZ (or alike)
> 
> Or even UART_FCR_RO_RZ?
> 
>> for 0x12.
> 
> I mean 12 or 0xc.
> 

-- 
js
suse labs

