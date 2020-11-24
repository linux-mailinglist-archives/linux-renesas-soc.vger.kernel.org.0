Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86262C2FED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 19:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390922AbgKXSZg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 13:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729291AbgKXSZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 13:25:35 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAF8C0613D6;
        Tue, 24 Nov 2020 10:25:35 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id u18so30221112lfd.9;
        Tue, 24 Nov 2020 10:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UJjsUIJzM0L8VpqpnHDH93pDsPibhk+dafDV5ovqlqc=;
        b=U2WSvA3lpYt48zpIrtTW/gYo3QuW7DKx/OacJA/Y3aLva8d5I/YEhhs3il9mYDQnMi
         cbwi3qzI8efVdLDujDtg5W5ZiQP4F4MIWAsyCg7lt6YE7fb+p81fBrs7qDBGMLFdC12W
         ZGRuqtUjhTLen4Qelv8gg/0IlqTSSKuoQNpv7ToiHLE+do8Q7fdZMjqiMeYUusoilkLY
         6zouTTSIIuM53UEq0k+dDV9dTA4TR50SphZB5L8DpHVSlGK3Z3m3/vLTVnxy5lWIo5ME
         PKPZ9+tn8CvmKNioHPFFFUvejMtGOYe7lQ+z0DW27R6FA5HncKGenzQw1ooGS6CeLhVn
         kLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UJjsUIJzM0L8VpqpnHDH93pDsPibhk+dafDV5ovqlqc=;
        b=tFGvgKT78Y7zLyO/7dvd4yDo6IQBLiVeI47OTNNKQ52foHXczyo7pVy3SpGAK7wYXs
         LfnnDEStRcrMIfX2cs1nFvgm5hUlFHcdGAlTkCxe2S/mAB2UBo/lIk7KAev2SM3u/khR
         zY9ape4gxboEsWiWBQ/AqvvFXxkKAXbJSfDPxz4yE7ZIzBBgMS7/l9A66vWUHYigXZ67
         BClunCvbU/UEhpkGryihhOexQdNUUHq9cChZUYCjkG5v3XTWhEa5sKTjLWJ7OgWQqZLz
         3d+EoFUe7OMv+zCO4mqJirjs82j+OLie73M2JPOir4wEQa2sbSYnoxwaIbccSZBs444E
         N41Q==
X-Gm-Message-State: AOAM530+is0XSsVun0bl0RuD/Oy6E86JmfzCdF7Qe+uhJRBI4K9hPnjv
        2KLFV5IacfuQrqc6UM4xPxQ=
X-Google-Smtp-Source: ABdhPJy9+8OYqjiP3vCs5s6cLbl0AVWZ1CAbEIIGjeSM9vsLiwckI8Bq8YMOg9NFtJvOyV2sJXWUBQ==
X-Received: by 2002:a19:ca13:: with SMTP id a19mr2450470lfg.308.1606242334033;
        Tue, 24 Nov 2020 10:25:34 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:651:eeec:8461:5bd1:fea0:1c50? ([2a00:1fa0:651:eeec:8461:5bd1:fea0:1c50])
        by smtp.gmail.com with ESMTPSA id w4sm409357ljd.28.2020.11.24.10.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 10:25:33 -0800 (PST)
Subject: Re: [PATCH 0/5] memory: renesas-rpc-if: Trivial fixes
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8v5iUcK6Hh=3rPiWbFs32U1TjPqT4AuwQniSFguk9-9bQ@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b66509aa-e4fe-1e1f-6261-0f0064db6518@gmail.com>
Date:   Tue, 24 Nov 2020 21:25:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CA+V-a8v5iUcK6Hh=3rPiWbFs32U1TjPqT4AuwQniSFguk9-9bQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/24/20 2:34 PM, Lad, Prabhakar wrote:

[...]
>> This patch series fixes trivial issues in RPC-IF driver.
>>
>> Cheers,
>> Prabhakar
>>
>> Lad Prabhakar (5):
>>   memory: renesas-rpc-if: Return correct value to the caller of
>>     rpcif_manual_xfer()
>>   memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
>>     inline
>>   memory: renesas-rpc-if: Export symbols as GPL
>>   memory: renesas-rpc-if: Avoid use of C++ style comments
>>   memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()
>>
> Patches sent to sergei.shtylyov@cogentembedded.com have bounced back
> so including gmail address (patchwork [1]).

   Sorry, I got laid off by Cogent last May. Thanks for CCing my gmail address...

> [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=390163
> 
> Cheers,
> Prabhakar

[...]

MBR, Sergei
