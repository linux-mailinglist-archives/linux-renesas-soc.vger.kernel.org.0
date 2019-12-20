Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA9F6128050
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2019 17:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfLTQEb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 11:04:31 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45296 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfLTQEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 11:04:31 -0500
Received: by mail-wr1-f65.google.com with SMTP id j42so9875909wrj.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2019 08:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G0otMJ/P5j/A7r6OJHr7sY4j2z/RS/XRR4LqCs5JkgQ=;
        b=YKRxUYX+vQFUe7rLI/QeT5I2hNxj2/L0oFL9MwLaOb/Y90fvNvInpE60bMkYwuyOP2
         p1B6jh+M0z0cs2pCNJUiwbkoSDZGILY/UUOarK9rq+lJ1aLVxphC1YRnmaUfSwO96s+t
         1o2k4QOOcOoVv9TsyG0sFnwfQWT2kjMwZ2U1OCwh+5YgZsBMnkmfjiyry8ew3pd4LeAq
         x0jAYJp3a8//LFvUX+Kw1K2ZoV9/Fnq38GHTMISlJ7o1epB2xGmLKVks9I1Q+mf09QOO
         tIjMPB+yWEcjoLzpG/KJROLoqhWTQEqbomFlOqFlA/BrviaTgnZ270tkHeTr4MZoMCUm
         gvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=G0otMJ/P5j/A7r6OJHr7sY4j2z/RS/XRR4LqCs5JkgQ=;
        b=pPsdyQ+bAzbzr8q3OR6coTk52Yb8VLrNHeHLeiuI/cEzdhtrlnpLQSIWsiFbVdJiyU
         jJ3dRtxGD1NJJvUaOa6fNXd6iC2/QvuogrGOaoGRLbUlf6z2IeAxh0n595lciEAjGoiy
         4Nx/97VBA8wAViW13u48QoULtHnjTFDJw2HUKKEji+mmnTtp2m5fZvox6AVV1n0YGwwP
         eB8/MOtz5qin5+gUaXPo+nfcocGLHXulpuTAjIHRxnfQZCfZC6+/oswLIRbazRhoPPlQ
         cj/+y1oORgQh1XaqEjW9Lz1X0IHPALvKH9cd/MbhY4cZ3xsWwOUQSyuw+KBZ30/Bnshw
         z2hw==
X-Gm-Message-State: APjAAAVEKhDn2Qt6z0wNS5H2/JcUKuiUlDGsHKAQmtPfjwlM+KYbfYmd
        ZnPZl05UkUNLhBNCoHuuQzTmk1RqbnA=
X-Google-Smtp-Source: APXvYqzroXpBjfPCYHTm/ql7jvb9diktPj2Fd3oUkY0/vP1ilvMWYMkLvmOTMA02x96rbnYJyWrg0w==
X-Received: by 2002:a05:6000:11c9:: with SMTP id i9mr15636458wrx.164.1576857867660;
        Fri, 20 Dec 2019 08:04:27 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:b5e6:e6e5:2d70:a031? ([2a01:e34:ed2f:f020:b5e6:e6e5:2d70:a031])
        by smtp.googlemail.com with ESMTPSA id s82sm10760162wms.28.2019.12.20.08.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 08:04:27 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: timer: renesas, cmt: Document r8a774b1
 CMT support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <1570104229-59144-1-git-send-email-biju.das@bp.renesas.com>
 <5af2669f-b977-1c36-95fb-ad006548b0d8@linaro.org>
 <CAMuHMdVTTiMj+7bF0_TbX9k+QUKpsTto4aut=d0pkwz6_rOVfg@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fc6de29f-2933-acde-c08c-25c2be9483b8@linaro.org>
Date:   Fri, 20 Dec 2019 17:04:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVTTiMj+7bF0_TbX9k+QUKpsTto4aut=d0pkwz6_rOVfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/12/2019 16:04, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Wed, Dec 4, 2019 at 5:36 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>> On 03/10/2019 14:03, Biju Das wrote:
>>> Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
>>>
>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>>> ---
>>> V1-->V2
>>>  * Rebased to tip/timers
>>> ---
>>>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>>> index a444cfc..a747fab 100644
>>> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>>> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>>> @@ -29,6 +29,8 @@ Required Properties:
>>>      - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
>>>      - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
>>>      - "renesas,r8a774a1-cmt1" for the 48-bit CMT devices included in r8a774a1.
>>> +    - "renesas,r8a774b1-cmt0" for the 32-bit CMT0 device included in r8a774b1.
>>> +    - "renesas,r8a774b1-cmt1" for the 48-bit CMT devices included in r8a774b1.
>>>      - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
>>>      - "renesas,r8a774c0-cmt1" for the 48-bit CMT devices included in r8a774c0.
>>>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
>>
>> Applied, thanks!
> 
> Thanks!
> Looks like it's been a while you pushed your local branches to git.linaro.org?

Right, fixed.

Thanks for pointing this out.

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

