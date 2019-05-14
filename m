Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 075441CFAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 21:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfENTNQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 15:13:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35018 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfENTNP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 15:13:15 -0400
Received: by mail-lj1-f196.google.com with SMTP id m20so291171lji.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 May 2019 12:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D9Mpv/Ka19QUo3Yv5Zhhwcz4xrs+t6R8N4bDjTao8es=;
        b=Ys3HnMH7gqlpLEQvfGsqQZ4AH4oXF6E5Gqeqt6lGXM7jy1UDtYkN7zSaLXd5m2pybT
         6wDT/W77uvNxhmxxg4kp3LXnUKSIqFNRKQxMgKTY8Fo2PItl23nFlf60IyEo2v77Oth6
         GCi6QhUOGTP+vmUmi/za/YMXcqF/0Cx+3vcj5MiM5vCT+TQ1lHqNcNmHLPAT5opZTIWt
         KUSfYl5MtAXHgabGz4+yepAvC2eaNcvqHqOQqkRKMgNQHajJXkki+uvNN2xzwhOQ4b1M
         Uqr4mUaDmxeOP5IizAvYf7jqF+TBQwQ64ALXtmswKcPSWJv6MdhbHovSCf9FLMtfCe8D
         tHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D9Mpv/Ka19QUo3Yv5Zhhwcz4xrs+t6R8N4bDjTao8es=;
        b=NLZu6hXn3kM0VGO7Xwvmz4FZqANsivLFWR3g7ImfHJ96E8KPApP7cE1PGyh8tCQDOw
         46Y4Xo00figbAlb3RcxkjROVpz03q7nOQzFaaNyucSoZB+3ADkEgdCxBXIC75WtiM9Tx
         E1HPiR/H2iVkvz4WXjq5Qh3bfF+Aiuon2zGVGitBi6zBh44MB4EoNkQMCODT6DkNHFQ8
         RTPeXz2LnBIaItDrN3aJYWwti0H3SMy5HArtrAN7gXkDotHa2l+AYAFA3y9qQYwUxior
         tHSnfNsEAiQlQPk7kpqazC3ZDrS7eA0z5/yIeUURZVSwKnv7Y+LOUVVE1bo0O1k3bGF+
         T6PQ==
X-Gm-Message-State: APjAAAWqvcjot/QpMtqIoknkvHd0Djd9IZ5jMuAzRXCRhFlnxWtT+JHF
        1mDn4wCdSOyonNL6jYWBM1Qh2w==
X-Google-Smtp-Source: APXvYqwXJTBropO/IuseO4C6BcaScEWNBOPLrfNNCs7d2/NB2FanDtYgGeWtEAPIqS/TZDJdqvd8Gg==
X-Received: by 2002:a2e:92ce:: with SMTP id k14mr17873191ljh.83.1557861192675;
        Tue, 14 May 2019 12:13:12 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.86.127])
        by smtp.gmail.com with ESMTPSA id q29sm3826886ljc.8.2019.05.14.12.13.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 12:13:11 -0700 (PDT)
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     masonccyang@mxic.com.tw
Cc:     bbrezillon@kernel.org, broonie@kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org,
        zhengxunli@mxic.com.tw
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw>
 <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw>
 <1e2bf23d-db39-0d1d-0bcc-6d9cd2935a82@cogentembedded.com>
 <cdee3d53-6ee3-4435-117e-8ba4a58ca72b@cogentembedded.com>
 <OF82CE76E9.E6395EF7-ON482583DD.000E37D7-482583DD.000E5077@mxic.com.tw>
 <3d334751-8fd4-7db1-9deb-e6c94936df13@cogentembedded.com>
 <OF4ABCC306.B053BA23-ON482583E0.000F480C-482583E0.000FAD4A@mxic.com.tw>
 <3971c669-9095-9d18-d029-37f9663a54b2@cogentembedded.com>
 <OF58AAFF49.C4593DEB-ON482583E1.001D551E-482583E1.001F089D@mxic.com.tw>
 <9014077e-2648-adad-72c1-baf834f5a511@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <e0720e41-23da-2aa5-636b-777568974b17@cogentembedded.com>
Date:   Tue, 14 May 2019 22:13:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9014077e-2648-adad-72c1-baf834f5a511@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/14/2019 10:06 PM, Sergei Shtylyov wrote:

[...]
>>>>>>>> Have you tested reading? v8 patch still works while v9 patches
>>>>>>>> hang on doing:
>>>>>>>>
>>>>>>>> $ cat /dev/mtd<n>...
>>>>>>>
>>>>>>>    Sorry, 'od -x', not 'cat'.
>>>>>>
>>>>>> root@draak:/# cat /proc/mtd
>>>>>> dev:    size   erasesize  name
>>>>>> mtd0: 00040000 00001000 "Bank 1 - Boot parameter"
>>>>>> mtd1: 00140000 00001000 "Bank 1 - Loader-BL2"
>>>>>> mtd2: 00040000 00001000 "Bank 1 - Certification"
>>>>>> mtd3: 00080000 00001000 "Bank 1 - ARM Trusted FW"
>>>>>> mtd4: 00400000 00001000 "Bank 1 - Reserved-1"
>>>>>> mtd5: 00300000 00001000 "Bank 1 - U-Boot"
>>>>>> mtd6: 00200000 00001000 "Bank 1 - Reserved-2"
>>>>>> mtd7: 00480000 00001000 "Bank 1 - Splash"
>>>>>> mtd8: 00040000 00001000 "Bank 1 - Device Tree"
>>>>>> root@draak:/# od -x /dev/mtd1
>>>>>> 0000000 0000 d280 0001 d280 0002 d280 0003 d280
>>>>>> 0000020 0004 d280 0005 d280 0006 d280 0007 d280
>>>>>> 0000040 0008 d280 0009 d280 000a d280 000b d280
>>>>>> 0000060 000c d280 000d d280 000e d280 000f d280
>>>>>> 0000100 0010 d280 0011 d280 0012 d280 0013 d280
>>>>>> 0000120 0014 d280 0015 d280 0016 d280 0017 d280
>>>>>> 0000140 0018 d280 0019 d280 001a d280 001b d280
>>>>>> 0000160 001c d280 001d d280 001e d280 1000 d53e
>>>>>> 0000200 f800 9266 1000 d51e 3fdf d503 3ba0 1005
>>>>>
>>>>>    Still hangs for me. After I patches spi-mem.c and the driver to
>>>>> call RPM for the MFD, it started working again. Perhaps, that clock>> >> is still enabled on your target. What does the following print (for
> 
>    Even with these issues worked around, I still see strange behavior on
> writes, e.g. after I mount JFFS2 partition, remove 1 file, unmount, re-mount,
> and mount again, the removed file is back! :-/

   Too many re-mounts, one was enough. :-)

> [...]
> 
>> thanks & best regards,
>> Mason

MBR, Sergei
