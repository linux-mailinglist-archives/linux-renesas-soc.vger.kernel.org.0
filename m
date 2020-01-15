Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6184F13BB42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 09:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbgAOIiR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 03:38:17 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43669 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAOIiQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 03:38:16 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so12034264lfq.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2020 00:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z0Y12tBy5eHi+yDV3iOK2P12WSwrSuIg90dqSAJA2T4=;
        b=Tf8LClkB0ZUJCGuLC+5MpLYSkUH7UBpfaoOm+/PGEgceH77ZPdtByVSfH4gYjSFFHz
         dq9WiP/7yMggg5AgRClKW2NtejridSdj81v//yZE1KeP6Nf8bN4vpxxkUL2ruLtOuoCI
         mFyAXKLR4JAqvc816zOLqJv1RkAemI/ebzLSD2m1QLwQoNYvYd3HpwgqziJqShvVJMus
         EM42YKaQleoHSI7kIM0S8l+/MY6YrOG3U/Fd9qDzJ+mp3rlQL57N7D+vZmFgHPdPPTOH
         y4YzByZDA06/nqJElB/StzgYBD1t5QLNHJrhKxjzrC1ise/GK04YQNoCQrQLdBM7Oa6y
         x+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z0Y12tBy5eHi+yDV3iOK2P12WSwrSuIg90dqSAJA2T4=;
        b=e41JE3UC6Fs+4HVE9Q6jvaWqE1eJkuv+uLQ0YUm+3xbGlDQkKwKcO0SC357nxfcE76
         B+ZYPqJFyhgMIMSEov0qmDKCWP2rSvN7lrOFw0HbVssXz8Ibzm8TB13H15p/6Ob0gO9o
         QMSC6pKJsjueMHiUIrAbrjiot/QlkP+0Oa84BgCfMIIOc6e3Gc4WFeOiP9uuIwH/Em4p
         QrH2UdDqLtrQFfvu7YjuxyJR872fHEre6fmXJZUgqTpca/3uvZL9u7HYTxhTWCzVExBt
         eLQ4nkVST8iFJVShFWg9BGhcttvDA4KJzvPAJmveOPInp6ezas4yV1t9Le6BynghyiKD
         qbxw==
X-Gm-Message-State: APjAAAWlBUqKbVmauFodIK+CWTKi5mbnCZ1nRxKkbxHJcyrzMHP7E7f8
        GmrT2O5Iqja+6p/lgSFWRWdLgS99/7NPag==
X-Google-Smtp-Source: APXvYqwQSXHAfen8Vudqq6AYTOO6wkq4LHdkhdZsD9ais6oFiejiQPMt9LksuasNK6KC87IZni441A==
X-Received: by 2002:a19:4b87:: with SMTP id y129mr4124726lfa.32.1579077494150;
        Wed, 15 Jan 2020 00:38:14 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:426b:3345:a13e:7db5:2067:8d62? ([2a00:1fa0:426b:3345:a13e:7db5:2067:8d62])
        by smtp.gmail.com with ESMTPSA id q17sm8841744ljg.23.2020.01.15.00.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 00:38:13 -0800 (PST)
Subject: Re: [RFC][PATCH] ARM: dts: renesas: Add missing ethernet PHY reset
 GPIO on Gen2 reference boards
To:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20200112191315.118831-1-marek.vasut@gmail.com>
 <CAMuHMdWc97=-9yBF0CJDZpWH9ZGX9uoDY_t6E6TQNc4MO93W_w@mail.gmail.com>
 <cfb752e0-46b5-1936-c3f1-8c6d781bebb5@gmail.com>
 <CAMuHMdWeo3awiD7iAfWFXc01isnmsBc6CuQ6X4s3CO7pNXjfJA@mail.gmail.com>
 <TYAPR01MB228521B36B1B1DC67F187663B7370@TYAPR01MB2285.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9c687d6b-cbec-2c30-4e4e-39ac57bcca60@cogentembedded.com>
Date:   Wed, 15 Jan 2020 11:37:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB228521B36B1B1DC67F187663B7370@TYAPR01MB2285.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 15.01.2020 11:26, Chris Paterson wrote:

>>> On 1/13/20 9:58 AM, Geert Uytterhoeven wrote:
>>>>>   arch/arm/boot/dts/r8a7790-lager.dts   | 1 +
>>>>>   arch/arm/boot/dts/r8a7790-stout.dts   | 1 +
>>>>>   arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
>>>>>   arch/arm/boot/dts/r8a7791-porter.dts  | 1 +
>>>>>   arch/arm/boot/dts/r8a7793-gose.dts    | 1 +
>>>>>   arch/arm/boot/dts/r8a7794-alt.dts     | 1 +
>>>>>   arch/arm/boot/dts/r8a7794-silk.dts    | 1 +
>>>>
>>>> I believe all of the above (except for stout) are available in Magnus' farm...
>>>>
>>>> r8a7743-sk-rzg1m.dts and r8a7745-sk-rzg1e.dts need similar changes as
>>>> r8a7791-porter.dts resp. r8a7794-silk.dts.
>>>
>>> Do you have those two boards / can you prepare and test a patch ?
>>
>> I don't have those boards, and thus can't test them.
> 
> Sorry, I don’t either. Perhaps Sergei?

    Me neither, I only have Porter and SILK.

> Chris

MBR, Sergei
