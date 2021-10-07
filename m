Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472C9425CF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 22:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241854AbhJGULb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 16:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241736AbhJGUL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 16:11:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0855CC061764
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Oct 2021 13:09:35 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m3so29884838lfu.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Oct 2021 13:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tNYc9N5wA2dHAgeVOQF26AsRlfvK5B8e1wZ8lVV84+E=;
        b=bx6QWhPL/4Wa0AAtXhs5CSKa9o3lioGisuzsJtke3H2JyZS9AM5Wpa9bAFXra/C3K6
         TXOU/VgOIca4za0TTAydSzonRyXy/i4TYLu74r0yO3XDbJm3gPEhkAyw9cAQdLdoHfB6
         rpNcAU6GD0fQSOZepC0CbZZX/g9d9/UpZAURCJKJ5sClFoYjHgdWDPlO8kigfGkHiIs8
         TSq0Uz+Jl50eOgj2eV+5V6IrysH0E9sX4xxBo52Fnc5LAab1EiTbkkFSuuYXXTP70tm1
         UguDBieeW4h9xViW6K87QrlnYY3EsPyyeFdUvMJR+H4AL5RoEQVLKgyWYdc71ciYUk+C
         OmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tNYc9N5wA2dHAgeVOQF26AsRlfvK5B8e1wZ8lVV84+E=;
        b=o/uzzC8rO55qh2IvCwM4Q8xxQV9aa4jytLXeNO5av/7Tdxo3y+bDpbfoD5ZOSWTENF
         27kSv4R1uDcABLs+ymEeI35EDO7bByX6ey9BpBz0wDzjBiW+sEq+WeRE/o3O64SFWHvd
         YtA8ZZoW/F6bKc+wpkSqPIhvhEbhF65XmirwTdtNvcWvMRcwT87Q99DS9cADzrjiZYo4
         EUOplMOz8RouRavWvFawT3pfxLvvyYyOEKjhs0TU2L9xLIdSU5+JUvqn5YXP+/n2DzBk
         T19RoRB+sx0Ua/ZbIyr0kt080q2InjzBIoNp/cCqgx448d62XOibsY2AaG/UGLt2JhDI
         Jjgw==
X-Gm-Message-State: AOAM533mjENFwCKHjxS2Nty8zsC1c7a8aGeyW5NUvyKNaRye7BVZW9m5
        CR8Uu1c/PszFYV7xAAEDcxgU1g==
X-Google-Smtp-Source: ABdhPJxg46kr59ekcCaJqXKFbIuLyss2b8rs7FGamRNJ3/kucNcSAAnD9kUxnAxbfYdB7e7eXlSzAw==
X-Received: by 2002:a2e:b949:: with SMTP id 9mr6751593ljs.400.1633637373436;
        Thu, 07 Oct 2021 13:09:33 -0700 (PDT)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id k16sm28153lfo.219.2021.10.07.13.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 13:09:33 -0700 (PDT)
Subject: Re: [PATCH] clk: renesas: r8a779[56]x: add MLP clock
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>
References: <20210929213431.5275-1-nikita.yoush@cogentembedded.com>
 <CAMuHMdWBJSPWR+Tb87GcJiv_xkYjToOarTcHu8doAFsCECEd=w@mail.gmail.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <173675cb-53e4-8d7e-eb6e-83824877da1b@cogentembedded.com>
Date:   Thu, 7 Oct 2021 23:09:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWBJSPWR+Tb87GcJiv_xkYjToOarTcHu8doAFsCECEd=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> These additions look fine to me.  I'm only wondering about the
> actual parent clocks, which are not well-documented in the Hardware
> User's Manual.
> It does say that MLP uses the Audio main bus (AXI).
> The related AUDIO-DMAC uses S1D2, which runs at 266 MHz, while S2D1
> runs at 400 MHz?

This patch was included in this form into Renesas BSP for years.

Indeed, the information on the parent clock is missing in the manual, and can be inexact here. I've sent 
a question to our contact at Renesas but not sure they will reply.

But, AFAIU, these parent clocks are not software-controlled, so having them wrong does not result in any 
issues other than inexact information exported via sysfs/debugfs.

> BTW, do you plan to enable full support for MLP in the upstream kernel?

Yes, we are upstreaming full KF board support now.

Nikita
