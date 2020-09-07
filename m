Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D8925F49A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 10:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgIGIKU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 04:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbgIGIKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 04:10:10 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3FFC061573;
        Mon,  7 Sep 2020 01:10:09 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so15013098ljk.8;
        Mon, 07 Sep 2020 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xDotO2hIGScy379wQahz2M8ztp2ZYXXRt81YQ3ss4Dc=;
        b=msB7OU2C6lpqrvWjU5mynyi/AaWRIZpWT7OdJNJZar90EMPKIjbjrY7+YNSZsXIAIg
         fO67nUaPkNlL00hW0fh95bP/BxXjC07MLRocHkg4A5+nz/sJ7Q5AcT9p/aLq93on33bX
         8dCf8HLPjYCbsIhB67O9HfEFH7xTdYmYdK0MCV3tjHPRdpA1I4NY8vXWurngNB/SkZxC
         RruyXTnwmmb44N2Nh8kPrSVvfuVEwc3ndKgZNAWr9qU4w7qUKnI/eiZz2XJAzjdN1Jav
         Dks66b9luVSZJDiYXAIPSrp9RI9Shncznxp7WjkTVPPzpggT65T+WUsxSFR0SCC6NPy4
         ZZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xDotO2hIGScy379wQahz2M8ztp2ZYXXRt81YQ3ss4Dc=;
        b=A9SsFBZlilMZSELpDSkOOQ53s1XYwFi8pGdn7gH+5F4UduvOZ/XfupJhhaJMLQA/AZ
         CHAmT66RDTKHBPYUFvKyMFAjSmeQh1pn/9YqR/UQUFiQ/f6CPJnVwwQ+F+F2VaHqacl1
         ReuN+lSYTwlPwZpT4Ev2LFsAevq0WMJl+p94O8vyLKiD0w/vOy0pll1bmhEELz9VWoqJ
         Qc90j+p4l/cICkbgeJA3euqzteTR63tYwLj+BUe2+sUA7ak6QALrVYwIaH1F5U13GE79
         pQnSnBL6IUQWYltJI84/kp0oMwXrvEXvNjumf/EMgXuTvQHRs34Kr5nDrgpL02TS0Fbn
         9vgg==
X-Gm-Message-State: AOAM532101fZL1QWDyL09IR4Ai3SaSAU9dVUdbM4o5OUZc1EqfWcghkm
        v6A3WCraV+kt3SE+8LhoHAk=
X-Google-Smtp-Source: ABdhPJzNlKcJI7jtGEMuFEx/r/EP1I4zmImDZ2D8wVruQ/zbs+0BIL12VhKglLQyvxFgHbntWx1GYw==
X-Received: by 2002:a2e:548:: with SMTP id 69mr10216545ljf.386.1599466208061;
        Mon, 07 Sep 2020 01:10:08 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276? ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
        by smtp.gmail.com with ESMTPSA id p18sm4538854ljg.26.2020.09.07.01.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 01:10:07 -0700 (PDT)
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
 <f106c6df-b85a-1850-d36a-ac18ec629986@gmail.com>
Organization: Brain-dead Software
Message-ID: <fc837810-9d86-df62-94b2-a2976f6d5463@gmail.com>
Date:   Mon, 7 Sep 2020 11:10:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f106c6df-b85a-1850-d36a-ac18ec629986@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07.09.2020 11:08, Sergei Shtylyov wrote:

>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
>> This patch is test on R-Car M3-W+ Salvator-XS board.
> 
>     Was tested?

    The same comment to the patches 6 & 7.

>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> [...]

MBR, Sergei
