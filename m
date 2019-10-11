Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88640D3BD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 11:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfJKJAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 05:00:47 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37861 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfJKJAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 05:00:47 -0400
Received: by mail-lf1-f67.google.com with SMTP id w67so6489418lff.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2019 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D5J4x6iVABhyT7MQ535l1DTGxw0inOgPAWVql4OaM3E=;
        b=GVa5+K0sA3bT0teEuW8q6lBeCPvC/40O+4wY6c68FbMZ+KXqDbDDktIBeN+MBHZl2n
         iQ2m9GnynAMroFRCCyGrM6OSITGyeEOmhKXIAj9oVcwbq4c31d0RQ2x5Mcv+VnOAW87p
         fRcgD9E5A0Wz/TtGb1c5+1VYwrJEdc1trrhZ7/TOHkttJD6Id9n8G0yXSuIVeqWa/mDO
         TJGLfem2Ft1XoHqjIpY2SVWVFCz7sravp3VkL/oT5KLmf37DL7Fti8eqAC3507+C6Til
         qeLoCJ4FSx5t2mOzru0EFZlur2UdQBepGMVJp2dzcVhjOBFxdOxQ80bfbw8o/JXdnLrm
         F5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D5J4x6iVABhyT7MQ535l1DTGxw0inOgPAWVql4OaM3E=;
        b=PHgPBVsZM9jHGOXJA/V4FMm0zZfiVGIGjLOwDcZ1qHJuztz0cnoItRhAENE5jbap2x
         S04czk1+XXXZlDl3ZnFecv5/st2XFCPqU0MQr3mjwbdMPMa68cfEXsmE3k20U3D0M6IC
         UTDwl4Tdfvmn2tVj6GdNcJQx+woWaOysI5SPfsplXIbTIfioDHRpBBqh0roUmImIdE6a
         g9PCJoTWqFuo/F7ITDfxXwwRzDM466TdGewYQ+0uM6M2Jft4bresxGgLk8SjD7V6sWmz
         O5ETKGnOqOacBOdkLdiTcwAvVTOL63pEVCUIAgxUSur2qSyYm2uR7dYZCohQ9tgWhG1Z
         sm8Q==
X-Gm-Message-State: APjAAAUmqUnKDKMd+F2s1B6ZZ0dBLqsXK2nzocPM+GPkWLk+gxzwQake
        AArWwSJTxwlrrrC9QTKMvf9Pag==
X-Google-Smtp-Source: APXvYqwQtqvuB1NOLWSlqNK6UF4AaRNCs+oaXZCrTHa1FIXAYVyqdbzs7ivri4cr5rF8kRboVQEyHg==
X-Received: by 2002:ac2:5610:: with SMTP id v16mr8173294lfd.93.1570784445097;
        Fri, 11 Oct 2019 02:00:45 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:86c:2e5e:9033:59d0:e194:cd55? ([2a00:1fa0:86c:2e5e:9033:59d0:e194:cd55])
        by smtp.gmail.com with ESMTPSA id g27sm1806349lja.33.2019.10.11.02.00.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 02:00:44 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Remove Simon as Renesas SoC Co-Maintainer
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191010123046.15291-1-geert+renesas@glider.be>
 <20191011073515.2933918c@canb.auug.org.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fc7ec17b-c61b-842e-13d9-1e154ce2a654@cogentembedded.com>
Date:   Fri, 11 Oct 2019 12:00:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011073515.2933918c@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 10.10.2019 23:35, Stephen Rothwell wrote:

>> At the end of the v5.3 upstream kernel development cycle, Simon stepped
>> down from his role as Renesas SoC maintainer.
>>
>> Remove his maintainership, git repository, and branch from the
>> MAINTAINERS file, and add an entry to the CREDITS file to honor his
>> work.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> So, I will remove Simon's Renesas tree from linux-next and rename the
> renesas-geert tree to be renesas, OK?

    I thought Geert's new repo is called renesas-devel?

MBR, Sergei
