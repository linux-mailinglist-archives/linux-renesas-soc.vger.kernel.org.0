Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CC61ABD67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 11:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504483AbgDPJzs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 05:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504147AbgDPJzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 05:55:46 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE658C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2020 02:55:45 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v9so7073688ljk.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2020 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9WKmF+4ozCpGRoW6Pz2JMOueuofo1K6+sB2uikrRjTM=;
        b=qYpzs390kkO/mgi0lv+TJwgV1cxiEeziddUOt2AKHPohkft9gn4q46TD5wrKZX3wiA
         PglSy+O7e521RYnjVatIoQdTxfWI8GVNVQ1o/mDfpHMEglL7Zj1dfG9EQHEq22ypn2X6
         GF1CCnsxxJNjVxFSSITlPJiJ+uZCKu0aJxw2KzvPM1AoVIGd1UO8jG5Yhs/+8dyq9qPz
         O94N6ghSlpZLWCL2AcXolHmsTPvNIlxXqVPvqUadw7UDCOgSdkb7ehz9SwxPD7rl/KTg
         gyrHdquzcwVGXZGH67XXbC9GzQIV1JNxGINv0Cb0Tmur7ywdXN4W4jxiIVOXZrPIE0r5
         8Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9WKmF+4ozCpGRoW6Pz2JMOueuofo1K6+sB2uikrRjTM=;
        b=LQaxpKahWEAYzidD7mBIXmVZ6sYRO+l6OVMhvXJkuGqmP5eqmbNJqqO23UGhbQQjJK
         EY4tGJQ9K5wj92cdy7lkTZ7fMkLPBc3AmN5jFVCZkJ6APtQen93n2UIa0MNuBcqghc47
         LWIK2cZ1tZ+KnlqVITBWRIrLROFSP0TS0XhAJV9TtcezoQeXY+6T75AN0/5q7VwQj4gL
         yXYqXFhGiWEQ049w9Dh+/zXM0GAoDr2ECg5jkkobzH8qdVuf/L11IhstZ6pocmD62ZZs
         umTLbTKqHW8MPxzgntTlbVw+SRiuDMmxBz9JFIRsPhcgRJXFjhMyn/JHoriTWfXZz0cP
         GVhQ==
X-Gm-Message-State: AGi0PuaaV5uEmA4ztpvHXNuVPRGXP0DwNDk3hOafQ+nxOGBUKTtN9xSj
        i6KhvVptGtj+Y5NHK+FIPD6Xb1I9oXU=
X-Google-Smtp-Source: APiQypJyeNOSjI1BuHSHKV+0gN0D1Uo/s1EuNv/Hh/VokJti2tWLrj5DBSXBplRvwwZAFWHq2vEVNQ==
X-Received: by 2002:a05:651c:2046:: with SMTP id t6mr5521104ljo.275.1587030944191;
        Thu, 16 Apr 2020 02:55:44 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4832:17d6:f588:52ab:5d6a:f5f3? ([2a00:1fa0:4832:17d6:f588:52ab:5d6a:f5f3])
        by smtp.gmail.com with ESMTPSA id o17sm14817068lff.70.2020.04.16.02.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 02:55:43 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ravb: Drop unused RAVB_{R,T}XTSTAMP_VALID macros
To:     Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be
References: <20200409094851.22142-1-dirk.behme@de.bosch.com>
 <20200409094851.22142-2-dirk.behme@de.bosch.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a9cff1a0-24b3-13a7-d316-f2f7f4770ae3@cogentembedded.com>
Date:   Thu, 16 Apr 2020 12:55:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409094851.22142-2-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09.04.2020 12:48, Dirk Behme wrote:

> These macros are unused, we can safely drop them.
> 
> Cleanup only, no functional change.
> 
> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---
> Changes in v2: Split fix and cleanup into two patches.

    Don't mix fixes and cleanups in the same series, especially in the 
networking area -- the fixes are merged to the net.git repo and cleanups are 
merged to the net-next.git repo...

[...]

MBR, Sergei
