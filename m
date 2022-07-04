Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB7DC564FE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 10:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiGDIna (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 04:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbiGDIn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 04:43:29 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF2226D2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 01:43:28 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a11so10200453ljb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 01:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ed/qMEdf4OB0tsKJiJ7HiwjJkr5g8WP8/vEPjXMTDqY=;
        b=BTjdgA7+dBscLL8o5jISNR9HfALwy+P49zc+9PZJVpAYf/KudhqBGW7eFlPzpey9dh
         6Mjcv/VCRzUrraPDywZNjY210fCr0DS46a7RBbuwyGgDHj4FC5bD8Pd0RVaArhgXoh+A
         0xRt2+QPDzAf4Sszgt4h3Uv2tzpQ4DgwJp3GMJ0LD0vcPIRkKVAX6zeDqhsd61RP6o0g
         fLO3pis5ueFz9FJ8imPn4xrtB72Szqsj+6dvm7xbxZdyZUOAoClMjLHSdev0Jxto2cfG
         uLHh9UCfWhLJo42ovoWL2gF4Vkj6oT5D2PGZ6d0ZSc06r2msgC6UDa1UC91/wlyh/zy9
         b0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ed/qMEdf4OB0tsKJiJ7HiwjJkr5g8WP8/vEPjXMTDqY=;
        b=IiQZ+1VUx+mgM7Pey+p4hZvLDTzu8Am7wstzTcF0CFgpSctExAD7BbT1WTxYhIvo3J
         LG2MDq02/qUJS6DC1dM1QRFUppTh7aOMZCi2bS6pqZq9jA//NO2NvtA5gmtTInJ+phWp
         WZnIKDLkPR9WoLwgR8ZO+y+QujsxAi1fceWcGk5m0nk/iSQ51yeRx5K65sFnsS5e+GPD
         g9VeqJvUKFloyn31rrNQByRjWu4fVlBt7opqQfY0vA0ZdFF18eBRwWpVSRszFeyrO+kR
         OfQH5+EvF+SzmneUN/F7QKPIJpXNvQLdOVGOCN+M/2jUHgjVg1cDNjV1g9a6NJz94eSR
         DsaQ==
X-Gm-Message-State: AJIora9GM/qS0fdgu03jedC99wW3oUaqhQhmwwXa9zdsU16i44rBdRLX
        F5a/0bMCkgN812IOM8Aa3ToGIJCombQ=
X-Google-Smtp-Source: AGRyM1vs6ARyFkNzhr2ajH5lTJ1ujbbrH1M/bRDQyriOTPpIoZFi5jigTcsWKRGTRtbBAHNRhpRfCw==
X-Received: by 2002:a2e:8e79:0:b0:25b:fc32:b2da with SMTP id t25-20020a2e8e79000000b0025bfc32b2damr11664438ljk.151.1656924206809;
        Mon, 04 Jul 2022 01:43:26 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.81.186])
        by smtp.gmail.com with ESMTPSA id b8-20020a056512218800b0047f7c897b61sm5030371lft.129.2022.07.04.01.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 01:43:26 -0700 (PDT)
Subject: Re: [PATCH 1/3] tests: Support enum property type
To:     Takanari Hayama <taki@igel.co.jp>,
        linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
References: <20220704025632.3911253-1-taki@igel.co.jp>
 <20220704025632.3911253-2-taki@igel.co.jp>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <c49456df-7f49-acf8-9bfa-cecf9b85f45f@gmail.com>
Date:   Mon, 4 Jul 2022 11:43:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220704025632.3911253-2-taki@igel.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 7/4/22 5:56 AM, Takanari Hayama wrote:

> Add a support for enum property type to AtomicRequest.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  tests/kmstest.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 11cc328b5b32..224c160e32fa 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -269,8 +269,18 @@ class AtomicRequest(pykms.AtomicReq):
>  
>                      min, max = prop.values
>                      v = min + int((max - min) * int(v[:-1]) / 100)
> -                else:
> +                elif v.isnumeric():
>                      v = int(v)
> +                else:
> +                    prop = obj.get_prop(k)
> +                    if prop.type != pykms.PropertyType.Enum:
> +                        raise RuntimeError(f'Unsupported property type {prop.type} for value {v}')
> +                    for value, mode in prop.enums.items():
> +                        if mode == v:
> +                            v = value
> +                            break
> +                    else:

   Hm, doesn't seem to be correctly aligned?

> +                        raise RuntimeError(f'Enum value with name "{v}" not found in property {k}')
>  
>              if not isinstance(v, int):
>                  raise RuntimeError(f'Unsupported value type {type(v)} for property {k}')

MBR, Sergey
