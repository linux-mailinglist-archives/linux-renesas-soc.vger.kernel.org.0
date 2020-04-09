Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1921A31BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgDIJ07 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 05:26:59 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45115 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgDIJ06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 05:26:58 -0400
Received: by mail-lf1-f66.google.com with SMTP id f8so7343481lfe.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Apr 2020 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=785ve1kYqq72ZnoZIdw7Mq9AwtBztA+CS1slLAh1Ioo=;
        b=ajHLyTL6VSV4GJDDwB6mf2xIC7K7pX0a56ZMguQ7Jkple/01OdHr6c7ByJP7aFIxxD
         ybIqLtY+Jayv9TQXp2bUDNvqtgDSjNMnhb6HQHXujv3bx2DwRCNJXfZqaffHqqKAX1cv
         TuXkifKu2knNYdibTCu7WY78iEIT/7zBMcK95ZHe6y2GW2WNcOamY9nKscFugnmHpdT/
         z+0kHZRbuoprwJ54DRPmCd75tdnuQ8Cug2zMuOo5n/2qHQ1m/MfmW2reWv0jUN731wTE
         pXakjhbH1GHMLnw02Pakc/SX5AC4NtiIPzhBdTy9iSBgDAWgXuHmfDVaVftouPcDS00O
         HxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=785ve1kYqq72ZnoZIdw7Mq9AwtBztA+CS1slLAh1Ioo=;
        b=oF+mm1MfcSw+NrIDIkK86nnMEgBIHvH0hxWNOJRCxUkXVV3uMjGM4ashB1WzzaASkR
         6MQXEz8tTMV1yBLCzocgtnu7dIAiieoTqV+WBeOaJ6rC/Oq6M6etWFgTvkfEDBixQgOu
         tB4BD4YTVfE6ffARkLi2/jTq3rl5yZJYG961KAckBJH/9Q+FuKBlNtItXJUkRKGEbiai
         3uEvtQre/2Ioym/8iI4Hgak+PXfRXWq2ToSsdmJYJEsbILlZk9zp/xOJN0vH+6RttQya
         WDY1jECh5oTSBvxqFQIDGD8coAi/rZWVIYcBqKL+cTrAxcPOPa+YMVlWCbdqE5Qk15h7
         Je9g==
X-Gm-Message-State: AGi0PuazCyS6c7jPD2qw5XBRhaUjJACvpryuLzsJh3qStjmJM1m0bFfs
        miOf6xW93VFxPJLX9t6urKq1cA==
X-Google-Smtp-Source: APiQypIcRf76WjN45F7H2dMUBzoO0tD6yy1I8Ubb5zMmzxhxeY7qVl4frDOnHsgQbsV6Ivur5sfiHw==
X-Received: by 2002:a19:ca48:: with SMTP id h8mr7346704lfj.211.1586424415343;
        Thu, 09 Apr 2020 02:26:55 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:429a:a2f1:594e:c9e:26a1:8a11? ([2a00:1fa0:429a:a2f1:594e:c9e:26a1:8a11])
        by smtp.gmail.com with ESMTPSA id s6sm15227121ljm.58.2020.04.09.02.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 02:26:54 -0700 (PDT)
Subject: Re: [PATCH] ravb: Fix RAVB_RXTSTAMP_TYPE_ALL value
To:     Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, Julia Lawall <julia.lawall@inria.fr>
References: <20200409061509.13385-1-dirk.behme@de.bosch.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <14e0c265-5cb6-0170-e673-8300eddc417c@cogentembedded.com>
Date:   Thu, 9 Apr 2020 12:26:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409061509.13385-1-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 09.04.2020 9:15, Dirk Behme wrote:

> In the function ravb_hwtstamp_get() in ravb_main.c with the existing
> values for RAVB_RXTSTAMP_TYPE_V2_L2_EVENT (0x2) and RAVB_RXTSTAMP_TYPE_ALL
> (0x6)
> 
> if (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE_V2_L2_EVENT)
>          config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> else if (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE_ALL)
>          config.rx_filter = HWTSTAMP_FILTER_ALL;
> 
> if the test on RAVB_RXTSTAMP_TYPE_ALL should be true, it will never
> be reached. Correct this by changing RAVB_RXTSTAMP_TYPE_ALL to 0x4.
> 
> While at it, drop two unused macros.

    Don't do 2 things in 1 patch, especially when you're doing a fix
and the other thing is a cleanup.

> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
[...]

MBR, Sergei
