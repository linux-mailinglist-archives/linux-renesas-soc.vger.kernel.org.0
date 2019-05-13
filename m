Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 490731BA80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 18:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729943AbfEMQAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 12:00:40 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36862 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfEMQAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 12:00:40 -0400
Received: by mail-lf1-f68.google.com with SMTP id y10so9493399lfl.3;
        Mon, 13 May 2019 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=z8CoKhwBZZ+WN7WIq6kiZqXUYgO4LKmPTb53WftMZmU=;
        b=ASPC0nz8z1rQoBUTP4uEWYF+eOTt27EeVCUCyrxVb5N1322we0ec/Pwlj5Y9SvYHGt
         sAbtidOPRp8MPVWkRz3tM9QQUdfJmGuRGwEEXpxv0BTfeu41LcTueSMp0T1iyWyEKq9X
         brwnZAkcrBBHhtq4Np12xJnXg9OKBZfWMGNASQgcfeUOKxkTs+xSMRDw7VYms7RCvrGg
         FwXRTUEYfCMWFMnUqj1csAMwg/CxKAiwtZOPRYH93D4llYG1oOw1lh8AZH19oDjfSezY
         TOGhVhRn2ZqlHWqQ2zZkEYbw/PlNIdZj5PRHH658+GnnTCaJ81+HIKOzHOmmCtWKxO72
         tYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=z8CoKhwBZZ+WN7WIq6kiZqXUYgO4LKmPTb53WftMZmU=;
        b=rOKU0Zs8xoYHxNnRomyPlfLduMqIK6uJ9QWk+9+vcQCDCfLMB7G7Dq7CKN2jIHRtJo
         Qc8034ZivE/LiwSHXNDwN53i9St5TrjD9TRC0AhxM6xPri79CA9QvvKfjEX1a6p27usi
         3bGS/K5rf8VP0boFCl+2As9o0x78PVf8vTOTkJGv2PUyPxfCsR56SA9sfc9ek9WcxKry
         uhtP8ed/LEr84L8K1/y6okQRf4Y7ndcwoKLZMDtrza/DQ5iIVhtvA7gZ8bymB9BYRcEd
         d+e0+0iqziylvr3mvY8z64C1PjW//FZiKxhJYmnR6foxTQONbZsJap20ElZuLwCSBYH5
         9c4w==
X-Gm-Message-State: APjAAAUPgF0q7yTg3Vhmzu55Ty+LaCNnwg6NfQcYbWG/xkodndZ7H62v
        7tHdK5mWnEFyr23VwcXf9lQ=
X-Google-Smtp-Source: APXvYqyZJ+Orwj9Q22E9uhFuhDamxIJ9cXJWWS7hMjQ2z+c0b2OVuwCY/9R7JIydOZRnK1UjV09x+g==
X-Received: by 2002:ac2:5612:: with SMTP id v18mr4565138lfd.15.1557763238025;
        Mon, 13 May 2019 09:00:38 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id j27sm3209888lfk.97.2019.05.13.09.00.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 09:00:37 -0700 (PDT)
Subject: Re: [RFC PATCH] ARM: mach-shmobile: Parse DT to get ARCH timer memory
 region
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Julien Grall <julien.grall@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1557505377-28577-1-git-send-email-olekstysh@gmail.com>
 <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com>
 <cc9c5c48-2bc1-be49-4188-8b26dbf7ecc1@gmail.com>
 <CAMuHMdWODzaHSeXyB5CgGmq3ZumFGVZYOUT1v1_Ps-RguPLseA@mail.gmail.com>
From:   Oleksandr <olekstysh@gmail.com>
Message-ID: <25f5f60e-46ff-18af-2a65-1e3f6719ef49@gmail.com>
Date:   Mon, 13 May 2019 19:00:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWODzaHSeXyB5CgGmq3ZumFGVZYOUT1v1_Ps-RguPLseA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 13.05.19 18:13, Geert Uytterhoeven wrote:
> Hi Oleksandr,

Hi Geert


>> So, if the DT bindings for the counter module is not an option (if I
>> correctly understood a discussion pointed by Geert in another letter),
>> we should probably prevent all timer code here from being executed if
>> PSCI is in use.
>> What I mean is to return to [2], but with the modification to use
>> psci_smp_available() helper as an indicator of PSCI usage.
>>
>> Julien, Geert, what do you think?
> Yes, that sounds good to me.
>
> Note that psci_smp_available() seems to return false if CONFIG_SMP=n,
> so checking for that is not sufficient to avoid crashes when running a
> uniprocessor kernel on a PSCI-enabled system.

Indeed, you are right.


Nothing than just check for psci_ops.cpu_on == NULL directly comes to 
mind...

Have already checked with CONFIG_SMP=n, it works.

Sounds ok?


-- 
Regards,

Oleksandr Tyshchenko

