Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A7F16777
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 18:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfEGQJP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 12:09:15 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:38266 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfEGQJO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 12:09:14 -0400
Received: by mail-wr1-f41.google.com with SMTP id v11so3011638wru.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 09:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dc8eWd3p3O2exi9/WGCRsaZwMkBG+ssCJBr+oveD5R8=;
        b=J2HwugxgK4oz8uLJxwaQjrDP3YozkPKhSfEoR7UMlM8bsGdCewNHVxadG3kTMIcnKH
         JqFg956qvdENWmkYI1ckpqA7ffUrQXirCr/SfU26syzDY9Wg9ou7vPp4rf9ArnTrXPC6
         vHK/X4R/J0yAljBpEgrYJHC4rvRcHjW78DJHw8cytPOpuZOIKNW+I4zL91NCP4NToG29
         ORGylTo1pG8kv4pPDRWkgkBwUI35qbcEXjF9Q/DgK7PZ9wafeTD50dbhiFK1NlmNquoZ
         gk8z06MTHl77QVkpV8T2G9JHHG53SzpGwfmRqnRwp6of9WuJXYJkeMS/1btGsd6tb8Gv
         Ot6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dc8eWd3p3O2exi9/WGCRsaZwMkBG+ssCJBr+oveD5R8=;
        b=twLs/tDnjHJ/zTwlOUwtkhqjk3z1FeeZbYi8EAUhoK/R/4PSYTnseVqDMeC9hUHT7K
         hpRj5uSS96fVkwmFprAUkFUj6kM6dcO1LhmLuPHN42OaIx/bDgLT7pd1Ob52G1eBoQBz
         RcGpMVcRXzPlb1R3IKTQ+XEc24m4E0XieHlIveErIGrXUVgzvBqY/63cHzu9J0KuW8PF
         K7lkCxNV4YBhgxO7LIyjk9cB4eoLuoKGkVAxxKLjwmygY+IQIwdQ1VSKDn1vftDmAVEx
         OFIg7ntgt3f8vSaDLLFPInWvEYM0bqQ/P9NbLHNidxKqBSBosjHoIHEtoGKbZDH/JfQQ
         r+CA==
X-Gm-Message-State: APjAAAXaQRdBiHwWloR6vxyLcIbmxfa/EHX14FFAwPlXyDJznTFYKJXG
        O152NgScRf8wwZnHHJNyx7hR6sUc
X-Google-Smtp-Source: APXvYqyXV0GZwW33XVgn072gZsIezFT0c2f/RcP8wYzB2SDLquqxo5wup38KsgyItuPu18RNKXoamA==
X-Received: by 2002:a5d:52cc:: with SMTP id r12mr23472808wrv.163.1557245352461;
        Tue, 07 May 2019 09:09:12 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 91sm23374846wrs.43.2019.05.07.09.09.11
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 09:09:11 -0700 (PDT)
Subject: Re: Automated/remote flashing of R-Car3
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        u-boot@lists.denx.de, linux-renesas-soc@vger.kernel.org,
        Michael Dege <michael.dege@renesas.com>,
        Gotthard Voellmeke <gotthard.voellmeke@renesas.com>,
        Adam Bass <adam.bass@renesas.com>,
        Bastian Farkas <bfarkas@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Philipp Ahmann <pahmann@de.adit-jv.com>,
        Simon Maleyka <smaleyka@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <20190507104115.GA27355@vmlxhi-102.adit-jv.com>
 <79ae01fb-6945-05c5-a08d-92aaffeaa6f0@gmail.com>
 <20190507155308.GA1600@vmlxhi-102.adit-jv.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
Date:   Tue, 7 May 2019 18:09:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507155308.GA1600@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/7/19 5:53 PM, Eugeniu Rosca wrote:
> Hi Marek,

Hi,

> Thanks for the swift reply and for the useful references/links.
> 
> On Tue, May 07, 2019 at 03:23:12PM +0200, Marek Vasut wrote:
>> On 5/7/19 12:41 PM, Eugeniu Rosca wrote:
>>> Dear Marek, dear Kieran,
>>
>> Hi,
>>
>> [...]
>>
>>> 1.c Use OpenOCD
>>> + Presumably same advantages as using a Lauterbach
>>> + Based on Kieran's https://github.com/kbingham/renesas-jtag
>>>   and on Adam's https://github.com/ntfreak/openocd/commit/1afec4f561392
>>>   the solution is currently in use.
>>> ? Any ideas on the model/price of the JTAG adapter?
>>
>> Any FT2232H (the H is important, due to MPSSE) works.
>> I like Flyswatter2 from TinCanTools.
>>
>>> ? Not tested. Any patches needed on top of vanilla OpenOCD?
>>
>> http://openocd.zylin.com/5149 and related ones, it adds RPC HF support.
>> However, there are two problems with this:
>> 1) Even with buffered write, the programming is slow
>>    - This could be improved by running code on one of the Gen3 CPUs
>>      instead of whacking registers via JTAG adapter. I believe that's
>>      what lauterbach and everyone else does too. The data upload to
>>      SRAM/DRAM is fast via JTAG, register IO is not great.
>> 2) LifeC locks the RPC HF access
>>    - This is a problem, since the JTAG probe cannot access it once
>>      it's locked. There might be a way around it, but it's rather
>>      nasty -- use boundary scan test mode to either flip MD pins or
>>      access the HF bus directly and bitbang at least erase command
>>      to wipe the first few sectors, then reset the CPU and have it
>>      drop to SCIF loader mode, then stop the CPU and reprogram the
>>      HF (since the SCIF loader runs in EL3 and does not touch the
>>      lifec settings.
>>
>> Neither of 1) and 2) is implemented, but can be implemented if there is
>> interest.
> 
> 1) looks like a performance issue to me (suboptimal flashing time).
> To be honest, I don't think this is a deal-breaker, assuming that
> erasing/re-writing the whole 64MiB HF doesn't exceed ~10-15min.
> It is also my understanding this is subject of future optimization.

It will have to be optimized further.

> 2) looks like a functional issue (insufficient permission to
> write-access HF). To make things clear, could you please stress if
> http://openocd.zylin.com/5149 already allows updating ATF/U-Boot/OPTEE
> on HF of R-Car Gen3 or is it still awaiting some fixes?

You can read/write/erase the HF with it. Just keep in mind the HF has to
be unlocked.

Maybe there is some magic/sectret way to unlock the LifeC RPC access
restriction via JTAG, but we don't know about it.

>>> 1.d. Use CPLD Configurator
>>> + H3_M3_StarterKit_Configurator.exe is a Windows tool shipped by
>>>   Renesas, hence readily available, which allows to modify the MD
>>>   pins, to conveniently switch between QSPI/Hyperflash/SCIF
>>>   boot mode from a GUI
>>> + Most of the advantages pointed out above
>>> - ULCB-only solution (i.e. does not apply to Salvator-X)
>>> - Requires a Windows host
>>
>> Where can I obtain this and are there sources / documentation available?
> 
> I am able to find below related package freely available:
> https://elinux.org/File:H3_StarterKit_CPLD_Update_20190408.zip
> 
> Unfortunately, it doesn't include H3_M3_StarterKit_Configurator.exe.
> The user who uploaded the file is https://elinux.org/User:RenesasJa.
> Are you aware of any messaging/commenting feature on elinux.org?
> If not, I hope Michael (CC-ed) can answer your question. Hopefully
> he sees this message. If not, I can forward your question to him via
> mantis.

It would be also interesting to obtain the CPLD sources and be able to
synthesise custom CPLD bitstreams for automated testing.

-- 
Best regards,
Marek Vasut
