Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661241251F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 20:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfLRTeh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 14:34:37 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42505 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfLRTeh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 14:34:37 -0500
Received: by mail-lf1-f67.google.com with SMTP id y19so2526244lfl.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2019 11:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zv7k1aksETejwDWUWN9UiYVG/dAaMjP+EXzK+A4z4Zs=;
        b=dBqeZoqHlTddFj9hv5eNEjhiq6F8BmzOkJfmi2oU9OLm0uMrlRlQhN39HgxdIb8Joo
         Ap0Qw9CnkVsVorE7auTS1AlyYr6JpfJsv4WmF3XYA7OFiaGckalFesrWYkL64c6OZ5Ql
         tcndHwHGq+QiOSsxhHSavzaLxc+pU1EgFDvCPCHXukmrd+51ey5cJZ+0ISczfQ+7aT0u
         j7sL6jmumu2bPuYu8gG7Ll4bEsVczjAtHioxEQHOBT9p0w0290FrtetBNBl1HWEUklPQ
         GYSkn7VYBInSi82QqXCsochx/nSeRI85Wb2DYKEV+W5uwUiwEcLz9woBQLqitlpJO2hk
         H/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Zv7k1aksETejwDWUWN9UiYVG/dAaMjP+EXzK+A4z4Zs=;
        b=HnDQX4/aFFq3Y4AE8BLOoOdFfHvCZcS3XQqm/WtxRmJAfaCcMbiTPCflQ+EmcOxRuC
         QvWVXkdC0ntzZVQNZ3xfUKNDb0cEaVFS7/7A+RgU4kbhEcyB7TBCpWtzhM6JCaMg6Xjw
         GKy6hprQNjPB7VzS/8/gtBTXE4+XTSkAZyO7OAVjA5/eiDJ8JAhoBUrJM6h2cmcMF5di
         TVejljM6SgHN2+Hpu3+ID9ouXtwbZuUwyykuZUk0nxB+9levEuOt2Cs3S2BTUg5CJrkU
         Est10bW0AGXO+UVhRMedYSfpjnqTOFwgKw/tQgQz0aYhOKDjptt0DO2gyaUyisR68kyl
         yw+Q==
X-Gm-Message-State: APjAAAVh+MQP6gE17wnkHM2QEWj/IhVzS+KnGLAIeWTqos/K+XyTU4xA
        iSg/IYdM71VC2X5rvhBlZNoPYQ==
X-Google-Smtp-Source: APXvYqwk9FFGe6Vk63ThvejpFKVr+bpEmXVmX7L4L1N7Lel8mOX5zbWzDKSdEgiqgt6xoYOIz4Q5xA==
X-Received: by 2002:a19:710a:: with SMTP id m10mr2845712lfc.58.1576697675023;
        Wed, 18 Dec 2019 11:34:35 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:48d1:e89a:1bf6:a9f0:1b42:e170])
        by smtp.gmail.com with ESMTPSA id m15sm1722179ljg.4.2019.12.18.11.34.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 11:34:34 -0800 (PST)
Subject: Re: [PATCH] clk: renesas: rcar-gen3: allow changing the RPC[D2]
 clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
 <be27a344-d8bf-9e0c-8950-2d1b48498496@cogentembedded.com>
 <CAMuHMdVmh6fZ=oRRMA6+H05jdpyPPgK3g=1ivNQUe0LB5sfMjg@mail.gmail.com>
 <c879023c-77d9-5230-7086-4a495999f154@cogentembedded.com>
 <CAMuHMdV_hYNLYxQXvpVLgSphzpJn0NckOu0CvwUO+ggF0thhkw@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c2a1832a-0100-980f-b858-ced6c7c17b97@cogentembedded.com>
Date:   Wed, 18 Dec 2019 22:34:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV_hYNLYxQXvpVLgSphzpJn0NckOu0CvwUO+ggF0thhkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/17/2019 11:43 PM, Geert Uytterhoeven wrote:

[...]
>>>> I was unable to get clk_set_rate() setting a lower RPC-IF clock frequency
>>>> and that issue boiled down to me not passing CLK_SET_RATE_PARENT flag to
>>>> clk_register_composite() when registering the RPC[D2] clocks...
>>>>
>>>> Fixes: db4a0073cc82 ("clk: renesas: rcar-gen3: Add RPC clocks")
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> Thanks for your patch!
>>>
>>> LGTM, so
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>>    Thanks. :-)
>>
>>> Now, before I apply this: does this make RPC-IF work?
>>
>>    Unfortunately, no. :-/
> 
> As per private communication, I understand the problem is elsewhere,
> and this patch itself is working fine, and thus safe to apply?

   Yes, I was able to lower the RPC[D2] frequencies but that didn't
really help...
   I should mention that CLK_SET_RATE_PARENT logic seemed a bit backward
to me, i.e. how the given clock know the properties of its parent clock...

> Thanks for confirming!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
