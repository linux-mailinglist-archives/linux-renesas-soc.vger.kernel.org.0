Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F1556502C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 11:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbiGDJAv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 05:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbiGDJAu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 05:00:50 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DF31AA
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 02:00:49 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id l7so9514666ljj.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tkMdjkYSwWckI1PA3wi0v4y05wuFsPLy2CPwKmSD+Ow=;
        b=JCIX5QXxIWetDFbG0R534KTt6AIN6MA/tPKb9MPxv5JGa+mJfhctJEYl4XXzunZIjn
         wIKyVCUNRZdtcNKXZQTLXgVKZa5BMsoAeN4C1MWJipzLEld3gz/g4ESgNZngave8k29R
         AD/zlscdIGyK8Uo6pY4/8QKxQDzhfbiJ39nTRi2HDkQoGl+I84IuIwAqEwKuRV5usxCg
         3OtmoFQamsAsq1+UGSY8y/B8FZUYr7gkNw+q+hRe7LaIC+w9au/5/4YdgjwjhxmfTr2h
         zTljjtfQDbOHleM+u2oXgZ5wL1dUpjDx/CS3vEqt7angQxuwxDu+PoR0IzRzfiO1gW3b
         40Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tkMdjkYSwWckI1PA3wi0v4y05wuFsPLy2CPwKmSD+Ow=;
        b=408ddFu8PHo2hNBPKqo7sUnXs+4ai4K0Q0wqIzlW8z6nv6aIyzyH1X56JOo+Ryfz8X
         G4eaMADsXnMMhqWQu0w3eK5IlrGlmJTwo3jr5JX931lbqvuv0Pv7SyIg0FpUSTgNL063
         aZ7gxc4uwHeh/Eg+uN4SArygJwLhly3l1wkHf15p7STgHen+SstUHZDdgPbkwCUfD/9l
         6AAOW+TIFHPU2L9X0nRo6KXTReZKY77AJp29QqQhdMR0eNh5PRXYt2a7Pu0qMQ6AYnWa
         j3OBhAK1i3TOjVXSIfy4xqRJ9vqWxlXCQ9omVcj52snAmzrwlh+hG6VwRWBDG2Fv11sU
         Y2Dg==
X-Gm-Message-State: AJIora9++9+aHQ99kpfDLQHwfgyhN7eiu7mlkXTYEcKbIfJfbE+EBB5e
        SEmaQq959KT7Siy6v/Vq9rU=
X-Google-Smtp-Source: AGRyM1sZAcLqSz/f5+o9VA1TeviY4Q+GIAjGg/or7dFFsQNxtGdp5A6sLTjKde8t31tPXMnGPmhGdQ==
X-Received: by 2002:a2e:8217:0:b0:25a:7232:b3d6 with SMTP id w23-20020a2e8217000000b0025a7232b3d6mr14921842ljg.463.1656925247817;
        Mon, 04 Jul 2022 02:00:47 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.81.186])
        by smtp.gmail.com with ESMTPSA id z8-20020a2e9648000000b0025a6e47056csm1603988ljh.124.2022.07.04.02.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 02:00:47 -0700 (PDT)
Subject: Re: [PATCH 1/3] tests: Support enum property type
To:     Takanari Hayama <taki@igel.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
References: <20220704025632.3911253-1-taki@igel.co.jp>
 <20220704025632.3911253-2-taki@igel.co.jp>
 <c49456df-7f49-acf8-9bfa-cecf9b85f45f@gmail.com>
 <546B54F4-5931-4CAE-A910-A6ED2F3C311A@igel.co.jp>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <743e8135-391b-e00c-2493-4b4052a66ea3@gmail.com>
Date:   Mon, 4 Jul 2022 12:00:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <546B54F4-5931-4CAE-A910-A6ED2F3C311A@igel.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/4/22 11:53 AM, Takanari Hayama wrote:
[...]
>>> Add a support for enum property type to AtomicRequest.
>>>
>>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>>> ---
>>> tests/kmstest.py | 12 +++++++++++-
>>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/kmstest.py b/tests/kmstest.py
>>> index 11cc328b5b32..224c160e32fa 100755
>>> --- a/tests/kmstest.py
>>> +++ b/tests/kmstest.py
>>> @@ -269,8 +269,18 @@ class AtomicRequest(pykms.AtomicReq):
>>>
>>>                     min, max = prop.values
>>>                     v = min + int((max - min) * int(v[:-1]) / 100)
>>> -                else:
>>> +                elif v.isnumeric():
>>>                     v = int(v)
>>> +                else:
>>> +                    prop = obj.get_prop(k)
>>> +                    if prop.type != pykms.PropertyType.Enum:
>>> +                        raise RuntimeError(f'Unsupported property type {prop.type} for value {v}')
>>> +                    for value, mode in prop.enums.items():
>>> +                        if mode == v:
>>> +                            v = value
>>> +                            break
>>> +                    else:
>>
>>   Hm, doesn't seem to be correctly aligned?
> 
> That ‘else’ is for ‘for’-loop. Am I missing something here?

   Hm, I don't really know Python, can it actually have else for
a loop?

>>> +                        raise RuntimeError(f'Enum value with name "{v}" not found in property {k}')
>>>
>>>             if not isinstance(v, int):
>>>                 raise RuntimeError(f'Unsupported value type {type(v)} for property {k}')

MBR, Sergey

[...]
