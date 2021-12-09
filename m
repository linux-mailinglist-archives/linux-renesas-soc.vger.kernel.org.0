Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCECD46E8D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Dec 2021 14:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbhLINN3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Dec 2021 08:13:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237601AbhLINN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 08:13:28 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2AEC061746
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Dec 2021 05:09:55 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id i5so9634131wrb.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Dec 2021 05:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3bjwCxLCEkEf4XktkLjCNVUh5mwuThyxbAeXZ9+rfcY=;
        b=ng8nx6MqlJ0q3GIgG5KIEaWMgd0z7E/22KvDDJebp1cXFJ8msc6LFRPT0uN5PI3Bi1
         zgsJmXpWYO8uWagW2HlxSHniV5t+Sxs6qRMmPanGZk+vGPcgdcZT2l1sNqVsDIlL3MaV
         oc1EqMmzz/tUOw0EKEAXjRY5UKldAJIpGdPeKEWz2etc5lQpqbW5HBjVcRRsRc6qSD0f
         1Yj4UPBe3vSpkO+Nv+skcDQeLfhZCIcLHogcv6a69I2UKO1yVSo8hr4y3eiJpT6Q4o3O
         Wo/+RWm09THjtBDY7/pQzsiJqKpveO2riAihkuOqajyzoBcLGaWaa9KVJnjkg8XEC2ur
         O9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3bjwCxLCEkEf4XktkLjCNVUh5mwuThyxbAeXZ9+rfcY=;
        b=FBOczwltLgdsyp3u5UWracB4GuRoS/fPBUeWmr5ro7YqMGZcsXemJh32i1UKBTt5gp
         +xr3uVbr7lcFhACOYfUxcoDOrosPnqUWIiRcxpX7cKFM2PgvdxeB+wrNgffBUCTAICF3
         sxzpwtx8b1O7BRkoaMCr6zsctbg7x0+/KZuWVC0H56x4L7mMa3B3GzC85/GdzAUX6U6x
         gNc8m5Kwan9HoTeJn3gvFdCkVEV+RuzQO3FUPT/yBvsAeZ8ZzenYThyAAGgqXl8+H8t9
         1Ir+zvFLxBz1jXFSf7ez4yHx9MSgY0+uQcYlUVYJCqupa+rGCsxRyRS3345WRNn3zZNf
         6u+A==
X-Gm-Message-State: AOAM532FZ6myiyDPETp+p6gEzTfhRNH0RVKVqTY6JIds3qhJ5BIWVJiu
        OjRybFXlg4MWqoIKdjYT40EFxXE7vCArtg==
X-Google-Smtp-Source: ABdhPJyXkT1PNpxQ/++/AgG+2uT8SpL6qRoMakrkAoO0HNxkF57px99gYEv85WlGQy2q4AAkTnmXZw==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr6618994wrj.84.1639055393703;
        Thu, 09 Dec 2021 05:09:53 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8ae8:ca1f:ff1a:a23d? ([2a01:e34:ed2f:f020:8ae8:ca1f:ff1a:a23d])
        by smtp.googlemail.com with ESMTPSA id b15sm7855534wri.62.2021.12.09.05.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 05:09:53 -0800 (PST)
Subject: Re: [PATCH v3 1/4] reset: Add
 of_reset_control_get_optional_exclusive()
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-2-biju.das.jz@bp.renesas.com>
 <b3bfa4b6e96f8a057c0ee7743a4e11aa9be4e8bb.camel@pengutronix.de>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a8acecc3-203c-6551-987d-14e73cd8a785@linaro.org>
Date:   Thu, 9 Dec 2021 14:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b3bfa4b6e96f8a057c0ee7743a4e11aa9be4e8bb.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 19/11/2021 12:37, Philipp Zabel wrote:
> Hi Daniel, Thomas,
> 
> On Fri, 2021-11-12 at 18:44 +0000, Biju Das wrote:
>> Add optional variant of of_reset_control_get_exclusive(). If the
>> requested reset is not specified in the device tree, this function
>> returns NULL instead of an error.
>>
>> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v2->v3:
>>  * Added Geert's Rb tag
>> ---
> 
> I've picked up this patch for the reset/next branch:
> 
> ----------8<----------
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux reset/of-get-optional-exclusive
> 
> for you to fetch changes up to c4f5b30dda01f2f6979a9681142de454991182ee:
> 
>   reset: Add of_reset_control_get_optional_exclusive() (2021-11-19 12:23:45 +0100)

Thanks, I've merged your branch. Please do not remove it

  -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
