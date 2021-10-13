Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7F542C55F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 17:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhJMP51 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 11:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhJMP50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 11:57:26 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46BCC061570
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Oct 2021 08:55:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x27so14045889lfu.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Oct 2021 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=axGkz281Fx0bGHtLGIoK2Y+pxSY/HdjWvV9POSBJxNI=;
        b=QLa30Wn2knYqrSUKcT3onDos06JpjNeTjzjfCVM6WxBzgQc+vOYc3tg8FHrB2ffVvs
         dyain5JtZKcslx0fz7zfg9LKigL9aOEhN/ppN/vMY0LDu7YRlAItMv6RuEx4zQh3iTx0
         tHyAVP0l9u6ADmDXweXx2+6Ts2k6MSZVDsYzGxukfwz8J8g8igKGEBvZQxT+PlG7oFtZ
         geYLTaNob/bMcSM9qxYNuc5dRTrruNowltu8N5fkrlb/ntfYsz76aLRPhAJ2I+lw7Amw
         UeJpwv19RQ6mA8Mzu64xGsGCSKmCYVA5A8krdX1gh9vf4xdP1F7ypOBeysao2wM/2YV8
         AgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=axGkz281Fx0bGHtLGIoK2Y+pxSY/HdjWvV9POSBJxNI=;
        b=QFFPJj1j0FWJOicM0g+FvABBo8J/dr04ppU8MkhAkHzVoE5XoTus5J1vzwpjM8LP6b
         sEz9PbQ5rycPtJjRTrAc7uEhEipUk69gydRCb0SUQleDoOiGnvw93+xFsCevs3ezhXEI
         rYUCK8+ritYbRKgansKSU+uzoCCm3lVubtS6ySM/Q4gX9mF6pxKHqQe4RakXHtQyEZnU
         4WjcE5t6dUgr6hNB+G6+mmgZelfMqGuR2uTLiA6kv4M8Jyz+pq2602IQ3rTpqI1t0pyc
         vTJuVyqQaaRp4CtrsUuwtLKatgYmet4gSOMsyh2dq2czc8FLWv9zyJO8mfxprgUaWrvE
         4Qew==
X-Gm-Message-State: AOAM532m1twdFvTrw4IObVE9qV2DVXJcTNFcvmYuEYWKB/pq4qfy0BYx
        moTXcnpI7rHq2ldID3uDQozsY3jSaak=
X-Google-Smtp-Source: ABdhPJxpn4HTBviqu+kgPonFKyYTek2difLVpEDMV4qd2cxEcOkslgfZQE+28qJaxFgCFllUm1M1lQ==
X-Received: by 2002:ac2:5d69:: with SMTP id h9mr39766749lft.675.1634140521038;
        Wed, 13 Oct 2021 08:55:21 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.86.216])
        by smtp.gmail.com with ESMTPSA id i13sm1360851lfb.45.2021.10.13.08.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 08:55:20 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20211012183431.718691-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWwrjw7t6SL3OQ==_BsB-phz=iFoyRdGAcTUbLhA1DmTg@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <6f8947d8-792a-feac-3451-d49abb756bc6@gmail.com>
Date:   Wed, 13 Oct 2021 18:55:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWwrjw7t6SL3OQ==_BsB-phz=iFoyRdGAcTUbLhA1DmTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/13/21 5:57 PM, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Oct 12, 2021 at 8:34 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
>> The different port@ entries of the adv7482 nodes shall be encapsulated
>> in a ports node, add one. This change do not change how the driver
> 
> does

   It's tautological either way. ;-)

>> parses the DT and no driver change is needed.
>>
>> The change however makes it possible to validate the source files with a
>> correct json-schema.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergey

