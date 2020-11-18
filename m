Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12552B78D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 09:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgKRIcr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 03:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgKRIcr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 03:32:47 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FE2C0613D4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 00:32:47 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id l11so1782502lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 00:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=frwilUsR2jJYx+sJpOmqWqPjoJfxROZMlkJkXkBBZxI=;
        b=mUq/9n5KL8yOSAnKnn7YORvyLBx5JjNeGeEqgftY67VHRafu5vQtBel30dA/3JBRq2
         W5Y0kFbYOXcUN+MKoYM2263UTtqdT5yd782Jtl5hJj1oHRZHYuwv23EhIxPjNJqOCnhG
         5b1Rdck5VMhcl70g/Mvo1L4DInaJXSQvOTODOSN20HdayhLOcoqMO1Ig78YTey4FsM6m
         ZP6vDK1wNmi62zVtXDwhPy2w+GOmTP2nIKTXS5bkT8rp1835EzTW2a+df0IsdLgt9ouV
         WhI/bFOWZmLisM3JDrGq+LdhSY41cQ4cpxwBgFHEs8Xyo64k0DRDENWefPgKLaAHnQ57
         XurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=frwilUsR2jJYx+sJpOmqWqPjoJfxROZMlkJkXkBBZxI=;
        b=aXGLN9EpW4FB3iyaIdF/7T2vnitfPj/7Tj4oV8W708LMXKkQIN4lvsS5uvh9ImuQXv
         Huf1UU7Lnn230109Jy//Z/ovBgd7uzlTGq7D11yAjTJXHcyqMokJQTwddrmjSxLDI/jU
         F0120VWc4yqk5KUzb/ASB+mFmpn7gipZ+14iQ64Wy9f+2S0hCEsSROjI28IAV5kdurOE
         6HdwIydN/e4ZGIGo5eLkskofVZ2bCzKZnCCOTQd/AF8pveWAU4AsrXZE6Q/V9EDDi8kr
         qQ7TIcJNPrVGMlRSibNC0i8vm2mZwp4nnBJg95hN6xr+qZ7OIZTbj16rZyIJ+o/hb9r0
         t21g==
X-Gm-Message-State: AOAM53065S4lYnN0IDkbHzad5y1kerTdXs0FWYfe/saIXtF37ZLyBaIl
        AEuVJLL8xO47cTGTuc9N1Kk=
X-Google-Smtp-Source: ABdhPJyQJyZDOh6fdLI4VLHBsYFdqoOT6H1RYLPw2K8N4g8slKaq7wrf6aGxgQLK4tXuUrqZFO3zgw==
X-Received: by 2002:a19:dc07:: with SMTP id t7mr3215756lfg.208.1605688365725;
        Wed, 18 Nov 2020 00:32:45 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:401:c2f8:8882:a0cb:e27c:5eb5? ([2a00:1fa0:401:c2f8:8882:a0cb:e27c:5eb5])
        by smtp.gmail.com with ESMTPSA id f1sm3482481lfm.184.2020.11.18.00.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 00:32:45 -0800 (PST)
Subject: Re: [PATCH 5/7] ARM: shmobile: sh73a0: Use ioremap() to map L2C
 registers
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-6-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <d46368c6-5528-e39f-663a-950e026b84e4@gmail.com>
Date:   Wed, 18 Nov 2020 11:32:35 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201117103022.2136527-6-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 17.11.2020 13:30, Geert Uytterhoeven wrote:

> Replace using the legacy IOMEM() macro to map the L2C registers by

    Mapping? Else it doesn't rhyme. ;-)

> ioremap().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]

MBR, Sergei
