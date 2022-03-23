Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 513DA4E544F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 15:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239152AbiCWOhp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 10:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbiCWOho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 10:37:44 -0400
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1857CDE9;
        Wed, 23 Mar 2022 07:36:13 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a8so3230373ejc.8;
        Wed, 23 Mar 2022 07:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=9+oziuct3CAitsgTUnYQuBcd4UOBzHktk8xbsb7d1O0=;
        b=csfduY7C3HFsG6cOIOBIF/04NcFFhHn7PVDai8USAWQ8eCyWUl8x5QlxgrDHFqrr1r
         bqqLE5LQZCKzGPRt8oerl3BhuKXeOz83BAzfKHMUUto6VZng8Ulc3ohOZk6FUSalIDbq
         qi429mLHHT1BPRXzBHDGwtbQOYGv+xNwt1adawInJQ+YMMA77lLafjdfSCqlpN0V2JOG
         jM586ggvt7SDFHgNdAsdHw8jV9LeTw+wlr2JIFspH+qltq+EZ/XDVkryqDoU7AretStK
         ku7cTqARuPT+0UWWfXkju5dTwf4aZwoA0DZbN0JtaU1q2Gcdq1MxO4VLoZBDqkgMVuB+
         YMkg==
X-Gm-Message-State: AOAM533WcO/vYkYWRHX0aX4a5ADoA7Vpq5wq9P1lspeSKW9Lr99O6Ls5
        kz3ANq9OQCTUMtpQo/TUUGg=
X-Google-Smtp-Source: ABdhPJzXpF4l4uLsYmzOQ6w0q6cxu8lWiHaNZfTXr9D1cTaf8TzlD1JCVy1aSnese2vWl/U02eURLA==
X-Received: by 2002:a17:906:7307:b0:6da:92db:c78f with SMTP id di7-20020a170906730700b006da92dbc78fmr250261ejc.35.1648046172103;
        Wed, 23 Mar 2022 07:36:12 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id z12-20020a17090674cc00b006df9afdda91sm13721ejl.185.2022.03.23.07.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 07:36:11 -0700 (PDT)
Message-ID: <aa2900df-2e4f-2107-7332-48484dcb44b2@kernel.org>
Date:   Wed, 23 Mar 2022 15:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 04/14] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-5-phil.edworthy@renesas.com>
 <b00a4cc8-c8b8-60ab-9891-e6cb44c8bf75@kernel.org>
 <CAMuHMdXFOjuvWiORs_CNt+xgm4QWgDaHvzb0Q0OPibmKP7uhRA@mail.gmail.com>
In-Reply-To: <CAMuHMdXFOjuvWiORs_CNt+xgm4QWgDaHvzb0Q0OPibmKP7uhRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23/03/2022 15:29, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, Mar 23, 2022 at 11:44 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 21/03/2022 16:42, Phil Edworthy wrote:
>>> Define RZ/V2M (R9A09G011) Clock Pulse Generator core clocks, module clock
>>> outputs (CPG_CLK_ON* registers), and reset definitions (CPG_RST_*
>>> registers) in Section 48.5 ("Register Description") of the RZ/V2M Hardware
>>> User's Manual (Rev. 1.10, Sep. 2021).
>>>
>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/r9a09g011-cpg.h
>>> @@ -0,0 +1,337 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> + *
>>> + * Copyright (C) 2022 Renesas Electronics Corp.
>>> + */
>>> +#ifndef __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
>>> +#define __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
>>> +
>>> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
>>
>> Include only headers which you use here. Do you use it directly here?
> 
> Technically, it is part of the clock bindings for the SoC.
> That's why it's included here, and in several other *-cpg-mssr.h files.
> 
> So I prefer to keep it that way.

Sure, thanks for the explanation. It sill makes header decoupling more
difficult if ever needed, but it's ok.


Acked-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
