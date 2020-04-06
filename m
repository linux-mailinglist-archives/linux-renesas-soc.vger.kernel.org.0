Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7850419FFFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 23:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDFVOM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Apr 2020 17:14:12 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:36584 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgDFVOM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Apr 2020 17:14:12 -0400
Received: by mail-lf1-f41.google.com with SMTP id w145so671345lff.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Apr 2020 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Xd1xzbAohX/FqkqTk1cM6F9kOwM40uvkJrnhkR7+Fo=;
        b=1MwGnWt2vQYBfJnOaGiMooJfZu8yPk9Lnh8IpQq4l4Fbk8acKx7Q0J83j4fbMJhmTX
         Bz+eZjKKF+Ub1qTlSs94FqivztSEebggGwKqOO2o5c+66jj41PmWZIOIuYytFsaBqmG8
         vbyS8SUkw8WPy8l9fXvKJ/eTAO6MGiT8QjtZbd1sQ9eBCMAg61zLKtD8blKSPCHXxeBc
         XiVn5iAZEWta1iZrNBRvwoGTxeux9ycBqcHT22tBvWp4wUHFIRiKeN3mDGTuN9nsKMVN
         8v0178c+aA+YlM+cBBDnBIF5MieLOOec2d4ecPVr44unPekjdEqBzjzuGLrRYzF7VbXT
         XeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+Xd1xzbAohX/FqkqTk1cM6F9kOwM40uvkJrnhkR7+Fo=;
        b=egQh+RHVVEkQZHc+4TpU5TghAcQXjcfvp7bqpNkgNxPJ+boU5lmImvCyUKCYj8yqZs
         J99t0kbe7iOm3mBuFyIxpbQMr4Lcm8Am21Q5MskXTGu5CXrAWcTL0bywKXC24OXsYDsP
         VDdQXl2tjuILSezuy/vCmwjHZdtM9ZMSoboQ0RlzEcRDBq0eZOFM1Qib8VVYRdBj2KHk
         fM3AXhFm9betBYf80dhStSuvYZyFDSGTY2GlJ2EFfVEXlE5WGGxHlcni5KW4KZfxiTio
         MbLrTkbYqZjToQwAzxQ69iIHdbn+RSocV0guV4lx3wZWRroaudCdndl/p9Ap49l+RyQF
         OW7g==
X-Gm-Message-State: AGi0PuZ54CEneb22p1HZZr6Od9seKIjH7iRX0zZAN9XjH8at5n+Ycjlo
        U+odw43RWqINbUZ7VYK1V5Ya9PhqP64=
X-Google-Smtp-Source: APiQypLi+4wO9Y/cU95F3kWj2BAO3JcE28FDvZp9goT7P7q6xIUprCvzvB04YOF9s/5Y3E2PeokoTA==
X-Received: by 2002:a19:40d0:: with SMTP id n199mr14028200lfa.161.1586207649535;
        Mon, 06 Apr 2020 14:14:09 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:462e:583f:4b1:b175:1ecb:fb31])
        by smtp.gmail.com with ESMTPSA id h16sm10509386ljl.73.2020.04.06.14.14.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Apr 2020 14:14:08 -0700 (PDT)
Subject: Re: question about drivers/net/ethernet/renesas/ravb_main.c
To:     Julia Lawall <julia.lawall@inria.fr>, horms+renesas@verge.net.au,
        tho.vu.wh@rvc.renesas.com, uli+renesas@fpond.eu
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, joe@perches.com
References: <alpine.DEB.2.21.2004031559240.2694@hadrien>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <4c39386e-4259-ba45-1f7f-1e6307a7753a@cogentembedded.com>
Date:   Tue, 7 Apr 2020 00:14:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004031559240.2694@hadrien>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 04/03/2020 05:04 PM, Julia Lawall wrote:

> In the function ravb_hwtstamp_get in ravb_main.c, the following code looks
> suspicious:
> 
>         if (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE_V2_L2_EVENT)
>                 config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
>         else if (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE_ALL)
>                 config.rx_filter = HWTSTAMP_FILTER_ALL;
>         else
>                 config.rx_filter = HWTSTAMP_FILTER_NONE;
> 
> According to drivers/net/ethernet/renesas/ravb.h,
> RAVB_RXTSTAMP_TYPE_V2_L2_EVENT is 0x00000002 and RAVB_RXTSTAMP_TYPE_ALL is
> 0x00000006.  Therefore, if the test on RAVB_RXTSTAMP_TYPE_ALL should be
> true, it will never be reached.  How should the code be changed?

   After looking at the code, I think that setting RAVB_RXTSTAMP_TYPE_ALL to
0x00000004 should be enough. BTW, the RAVB_{R,T}XTSTAMP_VALID don't seem be
used anywhere...

> thanks,
> julia

MBR, Sergei
