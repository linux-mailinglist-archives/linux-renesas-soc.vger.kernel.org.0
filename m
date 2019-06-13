Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8241343BB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbfFMPas (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:30:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40337 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728685AbfFMLJO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 07:09:14 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so9655950wmj.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2019 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DB2ymoMUDc6KVKZd31hZLwNlwKiWHLGwTThu+RNF8Pw=;
        b=NKNfBrS3w1T+MzUAyWsWKKnkqjXhfCQWp4viwIcR2G4X3HXuCScV0Ib7cTIugkm4up
         RaUBuzrS3VquYgjUQXxKH4zYX63mlqATkLxSholHDkrUc+zw8jgkZiKyuFeggN4UFOe7
         OxZo8c1eSGq+vCm+Yg6R8h+FVEwIjZDlTsRBWF3sMxvlD2HZ5nCumB5/YakwqBXulMvg
         UD+n7H14NB+Dk3XU5QofIOsso9yAEqRwy2ZZzWPEZXDcE3agXilEwFnI8qVya3+TQVtz
         JJyhU0LXQXlvFWx08y1xsh9u9U6e7Blx/jcOHaDerqf8QFGQqrJ58pjwbU3YqkefXe36
         601w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DB2ymoMUDc6KVKZd31hZLwNlwKiWHLGwTThu+RNF8Pw=;
        b=BeNxL+86toA+9ugyKkdBUkh6Tvl5fAw9kr71qVkqNtsFrSs9/HzZbLXQcDjwVnbRq1
         GqrhP/t5dsONozpAXL3h6LoCAo0zfar5k2CuVu2jFqsgJ/Nuq6OUbsZOiKbbN5EoL+OF
         FXDlGIDS/AagJX3v2t4W68NfsQ57nxC8CwqjNlmKAKklfEaHD+KHAlZ8YxsMRsS/ROEh
         GAGaIE+3VNKNxS45AeQa2RAC7cm54ldgCgYZa8SYdTlqIj9wy6IRXo6nOGfV07dezIak
         6CsQlqyq/vV8hW57dmwMDBv1GkWwHvU73UEr5/x0h4m7F+OFel5O3ZWagZWR+tudykmx
         6IOQ==
X-Gm-Message-State: APjAAAXDuMmI0IBKcrXirJlG9s8vMVNHFtuxTzsocQmY/escD29gy8d6
        eJbPJXVntjCB5NChP9uzAsPA+g==
X-Google-Smtp-Source: APXvYqzxwXUvpJu+eTgSRHDqK5JGjU8X0kpO9Gv/9ntBMljsVPhU15lFTS4qww9Baz7A+LqxxJIL1w==
X-Received: by 2002:a1c:c003:: with SMTP id q3mr3300657wmf.42.1560424150892;
        Thu, 13 Jun 2019 04:09:10 -0700 (PDT)
Received: from [192.168.0.41] (sju31-1-78-210-255-2.fbx.proxad.net. [78.210.255.2])
        by smtp.googlemail.com with ESMTPSA id x17sm3139429wrq.64.2019.06.13.04.09.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 04:09:09 -0700 (PDT)
Subject: Re: [PATCH repost] dt-bindings: timer: renesas, cmt: Document
 r8a779{5|65|90} CMT support
To:     Simon Horman <horms@verge.net.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Cao Van Dong <cv-dong@jinso.co.jp>
References: <20190509122949.23256-1-horms+renesas@verge.net.au>
 <20190613101219.vx4ht6dixxu7fioi@verge.net.au>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7171405c-4647-173f-2883-c7a281e998ea@linaro.org>
Date:   Thu, 13 Jun 2019 13:09:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613101219.vx4ht6dixxu7fioi@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13/06/2019 12:12, Simon Horman wrote:
> On Thu, May 09, 2019 at 02:29:49PM +0200, Simon Horman wrote:
>> From: Cao Van Dong <cv-dong@jinso.co.jp>
>>
>> Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.
> 
> Hi Daniel and Thomas,
> 
> would you object to me taking this patch through the renesas tree.
> It has been outstanding for some time now.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


>> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>> ---
>>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> index c0594450e9ef..c5220bcd852b 100644
>> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> @@ -42,12 +42,18 @@ Required Properties:
>>      - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
>>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
>> +    - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
>> +    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
>>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
>>      - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
>> +    - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
>> +    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
>>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
>>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
>>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
>> +    - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
>> +    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
>>  
>>      - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
>>  		and RZ/G1.
>> -- 
>> 2.11.0
>>


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

