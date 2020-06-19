Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E05920125E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2020 17:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405345AbgFSPwJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 11:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393174AbgFSPXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 11:23:24 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF14C0613EF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 08:23:23 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e4so11951445ljn.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cl/Yq46Aj1MXkK7BGLiJxgnywWCQ++rL2EZcWoa35wk=;
        b=AvTTY7ue/Z3mH+yjrNB/4Nxwb5Jy2rqTRK397awvdBpWp2lMrgXwLEFmaAT3QYtLAu
         4+nq7/h2/AB2p8tm2i+Wb/Z1hBPbCwJeYnLrWCD2SP8ZUI91GY1vn0Op/g6ce9D8Vv8A
         571GYgCMAvzTZxDEIaotEpNjz5FljZTXIfrHheP3a3pTaVTAGaYnFIugWQUVCsvSVnMT
         1+pjAbPCT1ZI+URrflvd7NT5gqPImsVGon8jD2iSPrBdtwnCCq/4k9bElVoJf5F5DHvP
         8Ey5LNyxhv6GbPEcHO084qpZrSWaX2Imr5AKqRS46m3GpN/vUrIRXoxWYT2lJjlHMFvX
         kaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Cl/Yq46Aj1MXkK7BGLiJxgnywWCQ++rL2EZcWoa35wk=;
        b=RtJ9O6KhWYv79HeUonzZJxKcYOAqAfkZwdTqFsLIfV79QOfCUi6hxWKPIbwkIZyGF0
         WxRaO8AjmGP4advAx9V9T5ViARoMtQlY4qQZIrH0KgXv4QFp/UemtGsNOcVA0Uikq5wt
         BvQ5VdeVwmuWxvgA1amYmt06lLYQ0nkVr6EyhA0sXM1GMm/G/6PowGWHin0ozRiiIFag
         dnssu3wRv2qO6+dEE9yJEC/E/Dn4R6oNuC40BH3Da0vVQfFDgb8Y9iGjn5H2Jvd47/6n
         qWNxQTzvmHe6uonEHvcJkyH3234lIniWVEk9u5qEkLLrD8t9HZeZeSJh8IoCiUw7zDSO
         sOTg==
X-Gm-Message-State: AOAM530Vd39483pHY7vOwlIiNfXPMATor8Yl7/UKXt+OBXpQl7ADTWSU
        J0bpxtS6knLzkTGXb8I5wdkYO75665scXw==
X-Google-Smtp-Source: ABdhPJzVpgtOC3TKJ/S3v4IUBARQQ+8dkG5syCgx9u1sP9uTqNcCdmoOEfpTl5nxDjThrVj/8hMEtA==
X-Received: by 2002:a2e:b889:: with SMTP id r9mr2161171ljp.92.1592580201437;
        Fri, 19 Jun 2020 08:23:21 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:441c:ac8f:7564:6e7d:9e36:7ded])
        by smtp.gmail.com with ESMTPSA id b6sm1457357lfe.28.2020.06.19.08.23.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 08:23:20 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: add RPC pins, groups, and
 functions
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
 <d3907b56-e346-f246-694e-6088d060bd27@cogentembedded.com>
 <CAMuHMdV=f7iUA+SV72C++xjWQjxh=fwt+JWCU=R6TQQht-qOKQ@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5a4b6d59-96fb-e046-3ec5-ba0b8d8be899@cogentembedded.com>
Date:   Fri, 19 Jun 2020 18:23:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV=f7iUA+SV72C++xjWQjxh=fwt+JWCU=R6TQQht-qOKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/19/2020 03:58 PM, Geert Uytterhoeven wrote:

>> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Subject: pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions
>>
>> Add the RPC pins/groups/functions to the R8A77970 PFC driver.
>> They can be used if an Octal-SPI flash or HyperFlash is connected.
>>
>> Based on the patch by Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
>> --- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
>> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
>> @@ -1416,6 +1416,64 @@ static const unsigned int qspi1_data4_mu
>>         QSPI1_IO2_MARK, QSPI1_IO3_MARK
>>  };
>>
>> +/* - RPC -------------------------------------------------------------------- */
>> +static const unsigned int rpc_clk1_pins[] = {
>> +       /* Octal-SPI flash: C/SCLK */
>> +       RCAR_GP_PIN(5, 0),
>> +};
>> +static const unsigned int rpc_clk1_mux[] = {
>> +       QSPI0_SPCLK_MARK,
>> +};
>> +static const unsigned int rpc_clk2_pins[] = {
>> +       /* HyperFlash: CK, CK# */
>> +       RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 6),
>> +};
>> +static const unsigned int rpc_clk2_mux[] = {
>> +       QSPI0_SPCLK_MARK, QSPI1_SPCLK_MARK,
>> +};
>> +static const unsigned int rpc_ctrl_pins[] = {
>> +       /* Octal-SPI flash: S#/CS, DQS */
>> +       /* HyperFlash: CS#, RDS */
>> +       RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 11),
>> +};
>> +static const unsigned int rpc_ctrl_mux[] = {
>> +       QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
> 
> Shouldn't the above read
> 
>     QSPI0_SSL_MARK, QSPI1_SSL_MARK,
> 
> ?

   Indeed! Stupid copy&paste error... :-(
> I seem to have overlooked the same issue in commit aa2165cf2ece9176
> ("pinctrl: sh-pfc: r8a77980: Add RPC pins, groups, and functions") in
> sh-pfc-for-v5.9, which I can fix myself.
> 
> With the above sorted out:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> and will queue in sh-pfc-for-v5.9 after fixing.

   So I do need to repost? OK...

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei

