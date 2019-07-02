Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FD65CC09
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 10:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfGBIcc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 04:32:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39492 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfGBIcb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 04:32:31 -0400
Received: by mail-lj1-f195.google.com with SMTP id v18so15976858ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jul 2019 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DmqrwTHjfkaw6DWjr4Cbs4K0oJ8BnhFOTTJpMoFxJPM=;
        b=jpQ2tXf9OCSzNOpICtFt9afURdUJ9vFtPz6sTjbm9O3u0f5kxwA5/Z7wkmAuc23f33
         QzqNIzyHQL38crvViMcBZL7VLAwJFTsNHxdrgBf6x67an15cZJuKp6mRDVmbI/Ds0VIs
         IRSmdFg9xdM76tXRXaXLEc0ad4AsjNPMxXpM4EOBc3QqEAqGWu1eozGSZPvnpKqqt1ko
         1V9cmhMlhW8GSEYMOuYY5E5BaVF3DoRniDRvEPt9fFaCrtjtE4cXt9qmjgyVGVV9oN/4
         dHx6q/F/7lz4d6x2L3F/DkXh2niIkpH+QVcZ8mTf23gS3xfWICay3ipN6i604iyG586B
         QmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DmqrwTHjfkaw6DWjr4Cbs4K0oJ8BnhFOTTJpMoFxJPM=;
        b=p5Y1TJDBHx5uW8UTtwaicnjuQQ8eyWnwMUNhfI50FEwvFj+JWaSpJ4lhMfc+/vbbam
         QzFDaDi7y4hN3zQgxCXL3q8Q13WXjTUoUusDnvOsEdg3MSnBThEUklrRtDtJaPudZf75
         M2m5vsyLLaazevv0zTwr+FXcR8qoa2elY7gujH+oHdfQmkNa1+rGdtalTwei6dwUmpyy
         AH8RPtIDnVnoVkyzPSwMVle6TQfu3gGvfautSUdax+lOCSbKJmBkB2FfnLP71pkdIh51
         IuVtjfN4IT3imqBc2whFpKZG0Vckgo332UDc+xUo+8ZxbztwDTvdszjW0PEn4+cRXN4q
         oqyg==
X-Gm-Message-State: APjAAAXASgOyX8DJsSI3ySq1Yv411VA5kzgTjHmjNAlRgCpBV0Ve4NbW
        XU2JGbzojRh3pVvae5EyuubXcBgFN38=
X-Google-Smtp-Source: APXvYqw0tuTW4xik5BIflWFMhdhzYmhxSOCUVGnppHrPl2zhMi4ESt0xyQN0SSEI2EO7LIcmabutuQ==
X-Received: by 2002:a2e:12dc:: with SMTP id 89mr16855960ljs.40.1562056349481;
        Tue, 02 Jul 2019 01:32:29 -0700 (PDT)
Received: from [10.113.10.14] ([185.244.172.16])
        by smtp.gmail.com with ESMTPSA id e12sm2856376lfb.66.2019.07.02.01.32.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 01:32:28 -0700 (PDT)
Subject: Re: [PATCH] rcar-vin: Clean up correct notifier in error path
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190702012458.31828-1-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <54345d51-6161-46f2-65ac-faaa4eeac924@cogentembedded.com>
Date:   Tue, 2 Jul 2019 11:32:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702012458.31828-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 02.07.2019 4:24, Niklas Söderlund wrote:

> When adding the v4l2_async_notifier_cleanup() callas the wrong notifier

    Callas? :-)

> was cleaned up if the parallel notifier registration failed. Fix this by
> cleaning up the correct one.
> 
> Fixes: 9863bc8695bc36e3 ("media: rcar-vin: Cleanup notifier in error path")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
