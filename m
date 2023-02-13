Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1D346941FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjBMJx4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:53:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBMJxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:53:55 -0500
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC733902F;
        Mon, 13 Feb 2023 01:53:54 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id fi26so12011842edb.7;
        Mon, 13 Feb 2023 01:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVvxLRij4B+6shuquS3bFQ2OQdTwCvEUOTYuhcRlRfo=;
        b=RCpzL+PJ38+Lzi51S8tz8F4xLa7swW9NZPukQT1iUg3ESlNtmUo0pyAnRy6JGHXrWu
         EHOI6uJ4rmUtyEL0ikxX8rbJHfMphSHFPSVsFsS3KrRTKEkntOWuYMlIKG02My1mdPll
         Bmkl/dwaUSKKjp2klEJ0TSR7eomHWuAoLr/bs/ClgzSbKsc5Aq5r1eZg1orAmGhgUwZK
         kLiTgL0hvbG00zmjHRMXEhIy60rvwJfriszNAY1bMfi/b71jeDbw9zBnZDdljnEw9UjX
         Ky02JB69QAPenhskXGtYwOgLwBOknfuUZYl0HexoXxIEiHopE8u4q1IV403hYPXa6Cd8
         FPYg==
X-Gm-Message-State: AO0yUKVwV4YMZOY8/agvj0dsM1L3UWz97qceSeFRBozBXiWUKdmky1Iu
        paRGZeQsvDIKS1qIBSb3RlTh7LoE5Tk=
X-Google-Smtp-Source: AK7set/8NQQTd1JErs0IBj/b5DVXMjLawSEjDzNa9uPtKpWcgchUHhbrrPrkPN6NCKvFMzoMNPkP5w==
X-Received: by 2002:a50:a6d3:0:b0:4ac:bf55:e943 with SMTP id f19-20020a50a6d3000000b004acbf55e943mr4363076edc.34.1676282033413;
        Mon, 13 Feb 2023 01:53:53 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id h11-20020a50c38b000000b004a0e2fe619esm6422436edf.39.2023.02.13.01.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:53:52 -0800 (PST)
Message-ID: <c9f43d58-24bf-0311-d9e4-f7c0510be718@kernel.org>
Date:   Mon, 13 Feb 2023 10:53:51 +0100
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
 <4dfbdc92-bc49-11b7-932d-806079ede9c9@kernel.org>
 <7a1379c9-99cb-e955-4f69-e360743ad44a@linux.intel.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <7a1379c9-99cb-e955-4f69-e360743ad44a@linux.intel.com>
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

On 13. 02. 23, 10:40, Ilpo Järvinen wrote:
>> LCR is WO, right? But maybe I'm confused by this really weird HW design?
> 
> LCR is not WO and it is read during autoconfig too:
> 
> 8250_port.c=static int size_fifo(struct uart_8250_port *up)
> 8250_port.c:    old_lcr = serial_in(up, UART_LCR);
> 8250_port.c=static unsigned int autoconfig_read_divisor_id(struct uart_8250_port *p)
> 8250_port.c:    old_lcr = serial_in(p, UART_LCR);
> 8250_port.c=static void autoconfig(struct uart_8250_port *up)
> 8250_port.c:    save_lcr = serial_in(up, UART_LCR);
> 
> Although the only thing the value is used for is to write it back to LCR.

Yeah, of course LCR is RW and is NOT shared.

-- 
js
suse labs

