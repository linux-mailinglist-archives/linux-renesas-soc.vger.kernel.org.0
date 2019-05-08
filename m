Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDF317727
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 13:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfEHLam (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 07:30:42 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:54238 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbfEHLak (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 07:30:40 -0400
Received: by mail-wm1-f53.google.com with SMTP id 198so2808669wme.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 04:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7wo0xeH7Gdn/HELAU8WFnvdTZX2nJ59bX/nCW8NZ0FY=;
        b=j+zELxsSXdW/tQNvHC2akMxyyXKCd7s58qQpvvu8KtjC3FWzJ5eNvTnp4HcebHBZrj
         pYKbz//70oeTkQDyS6ojoSch6Lcw8HN5P2pZt0aYWrj1TB4pCHNn35xcVOvEHBZmhsZR
         Y6FW9IeJAwDh1RKi9PyxmzcWJsbGjHz226MSSyPmHn/wbZf8rgKi3q/Zuz8ByH7lSjMM
         g7xTETIXZ4PK0h6p7sJMaU5vZn0b13sJXSrNjaWdASbDRGXh6mmGCjAONruVK5/9/tZ5
         AjXboupAWOXfunJOU0yVOBDMYtXkz9XMdBJfZKlaMAHpnm4Wg4z6u0N0v61s/YP6cH74
         SxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7wo0xeH7Gdn/HELAU8WFnvdTZX2nJ59bX/nCW8NZ0FY=;
        b=Oy/yyQ9tF26aNC4yqf8JGZs2pRhgb2xyyAhSaExrBAqAeSeAtMsKr4cqnTfr/sPqFx
         frvubSD2Zv/Y18WlXTxyJslb6unccLIjsL9QwDKs7uNGzRrspckckdzRcBpCQPFyXb/q
         WfmthPi8vRTMbm266weDf1E08u85NdvS6eVQ8ZyQoHMTczuhc6Bs3s7ioOsgbJpXUCBR
         XU26YayMIlXsGvPIHjsx2Z5YfGFGigwS/4h0HqgayyNGI5sizGJk9hrTH3Ldz3nlNriU
         OKyoKGurYlqXNZH7Pwc95ZGSX1Vy6RLb9JHbYXYX6NAO7roBhhQJP6hVje/3Ul2np/5h
         kDxw==
X-Gm-Message-State: APjAAAVT73IWCz9ebXcepJn5CAIq/WjLKhesi9drEKUANDslu4Qq7jgE
        0hZYW35x4f2CaD7dzhmQr6nYkplc
X-Google-Smtp-Source: APXvYqzbUiD70WPrhVxK1WCt961qBsfNGtWAhZPHzvXW/395ZKPKCj0eoiqQRHWNxgjCfhjJMmUYlg==
X-Received: by 2002:a1c:cc18:: with SMTP id h24mr2642329wmb.13.1557315038217;
        Wed, 08 May 2019 04:30:38 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id m6sm2917903wmc.32.2019.05.08.04.30.36
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 04:30:37 -0700 (PDT)
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
 <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
 <20190508093210.GA17684@vmlxhi-102.adit-jv.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <6622b090-c04d-ac23-73b5-2c26b9ac536c@gmail.com>
Date:   Wed, 8 May 2019 13:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508093210.GA17684@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/8/19 11:32 AM, Eugeniu Rosca wrote:
> On Tue, May 07, 2019 at 06:09:10PM +0200, Marek Vasut wrote:
> [..]
>>>>> 1.d. Use CPLD Configurator
>>>>> + H3_M3_StarterKit_Configurator.exe is a Windows tool shipped by
>>>>>   Renesas, hence readily available, which allows to modify the MD
>>>>>   pins, to conveniently switch between QSPI/Hyperflash/SCIF
>>>>>   boot mode from a GUI
>>>>> + Most of the advantages pointed out above
>>>>> - ULCB-only solution (i.e. does not apply to Salvator-X)
>>>>> - Requires a Windows host
>>>>
>>>> Where can I obtain this and are there sources / documentation available?
>>>
>>> I am able to find below related package freely available:
>>> https://elinux.org/File:H3_StarterKit_CPLD_Update_20190408.zip
>>>
>>> Unfortunately, it doesn't include H3_M3_StarterKit_Configurator.exe.
>>> The user who uploaded the file is https://elinux.org/User:RenesasJa.
>>> Are you aware of any messaging/commenting feature on elinux.org?
>>> If not, I hope Michael (CC-ed) can answer your question. Hopefully
>>> he sees this message. If not, I can forward your question to him via
>>> mantis.
>>
>> It would be also interesting to obtain the CPLD sources and be able to
>> synthesise custom CPLD bitstreams for automated testing.
> 
> Is my understanding correct that these "CPLD bitstreams" (once known)
> could be implemented in U-Boot's board/renesas/ulcb/cpld.c?

No, the CPLD is a programmable logic device. You synthesise the
bitstream with Quartus, program it and it stays programmed (in case of
that maxV on the ULCB at least)

-- 
Best regards,
Marek Vasut
