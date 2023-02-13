Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27EB2694150
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjBMJfl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjBMJfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:35:08 -0500
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C87618B2C;
        Mon, 13 Feb 2023 01:33:25 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id n10so3324719ejc.4;
        Mon, 13 Feb 2023 01:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhhEvjm43VJY/FP/nAi8hRofixepc7A1uPPdXLubIvE=;
        b=t1pAaInt4x6mdUo7oMYklGE1uBBP/uK8btvSY51KuzmAxWLcx/ZXdvEubrhgukAWPc
         aPKo4hcEQpctqBRGdnx6DaXaghVyucCfxEvUN4s5bngoUZcPEhJbP2Qq2yopmjpDSkUi
         f0KkC65FLGSLn1SmVF8jlLDfuc4y0QNucaIi1CfiHl5noBHm2BZ7I3enN36pp5qImmIn
         DDEI9f02u14G84tetSxOrUlFBPrkhM5ezneSW8FlZby+NiL2PweJfg5OqXAqRPDumnay
         UhPDus+eQSOS8zTNhqqm///ZjUd9NE23gmtazc5p0H9/zZWKTvsxGPYR5xZtaMAGRbl+
         j26A==
X-Gm-Message-State: AO0yUKVpin8ZQDjqqIcVqvpKcXDolVhSm5fv5s+B/XGzEzLKj55m9B1J
        lmsEmpBqcv1MCmUtxSIyZxk=
X-Google-Smtp-Source: AK7set/Dp+uv/qPp6IuUgG3yBZL0iXZv9dJ2KcQJlDyRw44fw6BAVXPMKswNGId64WHKgUFQQlkW/g==
X-Received: by 2002:a17:906:6951:b0:8a6:1020:8799 with SMTP id c17-20020a170906695100b008a610208799mr25148830ejs.56.1676280780192;
        Mon, 13 Feb 2023 01:33:00 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id u15-20020a17090657cf00b008784ecb2dd5sm6548011ejr.104.2023.02.13.01.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:32:59 -0800 (PST)
Message-ID: <283b2e79-e992-dc35-2a79-feccc93103fb@kernel.org>
Date:   Mon, 13 Feb 2023 10:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
 <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
 <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13. 02. 23, 10:31, Biju Das wrote:
> So looks like similar to other macros, UART_FCR_EM (0x3) is sensible one.
> 
> UART_FCR_RO_OFFSET (9)
> UART_FCR_RO_EM (UART_FCR_EM + UART_FCR_RO_OFFSET)
> 
> 
> static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
> case UART_FCR_RO_EM:
> 	return readl(p->membase + (offset - UART_FCR_RO_OFFSET << 2));


Please send a complete patch as a reply. I am completely lost now.

-- 
js
suse labs

