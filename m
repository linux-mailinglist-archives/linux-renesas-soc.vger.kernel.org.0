Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C12AC18CF54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 14:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgCTNrn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 09:47:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42934 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgCTNrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 09:47:43 -0400
Received: by mail-lj1-f194.google.com with SMTP id q19so6422811ljp.9;
        Fri, 20 Mar 2020 06:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VKSPPi2x0mbXha6B3vaNMiVE/+NX99D1XOzAsrquB48=;
        b=dpZ433uZCMyLV9BuifSS65mWNDp4jlV3JgsDhNikzqruARh3biods61O+sCMUKwaBX
         s21viKClAkIg946KchD2LshlQs2j2vKFuUXFyr8FZ+T3CItVomXlpmPYx8SYq7bfHOrP
         nvKHXHoca99fe90E/tTvWPNZjYdEuJuvC9YG1s1bNi1amXUHlRMNyxCNCQGtxZqm8KAS
         wk/USprwtCpWdkXsKhaPy9s2sjif4TZwF5Vi2jMWyyjLRJf7c/PaG0x2FqzOfrahFmc1
         nLx4jhYTLYkV/oqiLE+u7rBfyo4dx2doypx6E5GV2eJjl/PzXGzoRCwHE/lQx7PrTV7B
         O+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VKSPPi2x0mbXha6B3vaNMiVE/+NX99D1XOzAsrquB48=;
        b=UEJn5RWa+F45+d4VvasINQ0Jy8vYT/BGpya6/AtQtaG7kHOWC2jPMMEud1w56dnycS
         xRPsSlnpSsIr4cZQZoV1m0RU5m7v75gqpTTT/lfiLc+/ef3Tp4GUGURUUy2d5bpnk5/N
         ong4YzKeoqCKF3DW8HoVQWY1xHFsfUJpHyWocGVphRl2hXYYEFCWwXTa5x+Eim8hrB4w
         7QT7YHYQP403ie4W9yhPnFr4kALxv09Ey/Na1XilbGxQSeZo6EVaA15n7F65yL2GoZlA
         i3B84bldfm0/MDkFlnI/m8pJ66Fa5ZXclpcCoyfgzd2r5bWA4O7229ZCO08rttqiAWxc
         9Zbw==
X-Gm-Message-State: ANhLgQ0GrOhhlGFGQYCjfHPjKxdGw93rKNYLUjYU+mx2MskjzjZGs/cA
        5eyzKr6/U5MCRMm6z8G533Y=
X-Google-Smtp-Source: ADFU+vt99INuHz08C5tlxgS3OJpzPHJB8BSC8ImphUWjct0ql7XHffXwNeJN/9Vs2eF9A5fy0VNlCA==
X-Received: by 2002:a2e:9f0e:: with SMTP id u14mr5165941ljk.142.1584712060587;
        Fri, 20 Mar 2020 06:47:40 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id d18sm3432544ljg.106.2020.03.20.06.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 06:47:39 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be>
 <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
 <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
 <75358399-c292-4e60-abdc-bd0729cf5c08@gmail.com>
 <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA@mail.gmail.com>
 <CAMuHMdVwxi57jMrVoH8P2ms0j9YrZvc1Zi+BVR3VDo8QJHaU-w@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4e362c26-84b1-2f94-3659-ab9120927a12@gmail.com>
Date:   Fri, 20 Mar 2020 16:47:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVwxi57jMrVoH8P2ms0j9YrZvc1Zi+BVR3VDo8QJHaU-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

20.03.2020 16:43, Geert Uytterhoeven пишет:
...
> Will send v4 shortly.

Awesome, I'll test the v4.
