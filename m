Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 181DA49A9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 09:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfFRHay (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:30:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43330 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfFRHay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:30:54 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so11990891ljv.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lzMoIK1vee4P4mPO/slx2A6Tsr0AJjn4J96SipEBO/M=;
        b=o2QI4NVMdxH3WE0Sv7g2Wd2KSi1zyz1KrSd63ZH1h0e9j819uRnJyUWyNiNgg7eNOB
         4wtbLPamVk2ak7wVfJsi8cJyYYqLe/r2yx4Ez+0w9ptwxP/5sQqZFd6imrNDOmvpTJtI
         rYj0Lc3ob4OdqCPaRunnvn1hXl6ypYjoufx0iAYz9U7FgkK5/sc+gI6tTplCkkpnrjGp
         bZLlACnOnh0hfNRgBgvZbWYVhzEm3KU0y7wdsrPchbuE9P11+bbRgtD2fUxcQ1i3Iazn
         RW4WSRUDBhJZTWYQxy++MQN0EHKTU/9W8VaJdpzO/1FxzIDr2ilPBqkOjp+zRz8vx18c
         QQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lzMoIK1vee4P4mPO/slx2A6Tsr0AJjn4J96SipEBO/M=;
        b=cvuRcOqyDynXz/zzwVv4ACQo0wTo2JyfHAqnB78zuoGIlJDCcmu7R9q+MLR1GvScjO
         Z96sGUzXWxDZext0IVfgUIw6K7pNXkk2B/GiZ7tWeZ89TJotLbmJSIphhiivnNtpzKSf
         zj/NLjJTm2f6NoDrEZch9Zztq+p206BfzyD6ORCLa3C5amBtMI0cX/OcnZ8j9PzCfxA0
         rATR1dd8O29tJOX+egrWF1Q7uW9TW2du4YszSksSCpiGAQWzfJUj8UDWPK+dRY4MKOon
         lHbHOVaLwxeH4P/c6k7o3D9Yjf2/iIT6xIzZK3wRv6po3FQjxDk64qJdWulj1zVZc0hN
         rfFw==
X-Gm-Message-State: APjAAAUQ/lPf/W3w1PdFgrBFRzWUQ9pTGzLfv1VQhQHCFOyy1FnoMzCG
        e0wvOnAqPSfFX6B31gY+3pUQWA==
X-Google-Smtp-Source: APXvYqwGExLOK04QgdAg8HF247qc6qSalgLXbN68WY9cjm5Unagl1DuNFRQCTUcc1/cSOLB4c3Q+yw==
X-Received: by 2002:a2e:824f:: with SMTP id j15mr4508805ljh.117.1560843052049;
        Tue, 18 Jun 2019 00:30:52 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id z17sm2477188ljc.37.2019.06.18.00.30.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 00:30:51 -0700 (PDT)
Date:   Tue, 18 Jun 2019 09:30:50 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: watchdog: Rename bindings documentation file
Message-ID: <20190618073050.GA28646@bigcity.dyn.berto.se>
References: <20190617090953.8770-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190617090953.8770-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for your work.

On 2019-06-17 11:09:53 +0200, Simon Horman wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas WDT documentation file
> from renesas-wdt.txt to renesas,wdt.txt.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../devicetree/bindings/watchdog/{renesas-wdt.txt => renesas,wdt.txt}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/watchdog/{renesas-wdt.txt => renesas,wdt.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> rename to Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
