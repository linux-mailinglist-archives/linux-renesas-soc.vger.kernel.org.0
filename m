Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 568D1126C18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2019 20:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfLSTBV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Dec 2019 14:01:21 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43511 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbfLSTBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Dec 2019 14:01:19 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so5092363lfq.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2019 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EnctfXeH6eSWsiC3SsB5Huqb0Ku44kDLoFN9p69SIAE=;
        b=lEbPRqMg9JeGspNDXadsO0erORgltj+FUrBlrmYlwUjMc774JfhJ6eRumOi/hEBQc1
         j/UkZlmTqlmFwyEQAz0i+0DGHuUvbLlC4AKLAlUIVPRGHmaqEzY7+6gI88wUx8LOezTp
         6BQkhhD7gDpCJs7CNaKeplHsSflIs3AJgQMoNNyxeUH2ebKSk56q+NCyIZzeeWfZcHFv
         HXQi+nxzjx1jRs9VMt4b6suCTgj9NDXnNpu11YNAKN1Kb+CZB9H1JhhcELAP7azOQw7P
         1t4g9xWB8JNohzB+7BNQ21UOE2bci6K1O+MtXz5/dnZo8E0LfZv8LjVO9BimFwtNU4aD
         h2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EnctfXeH6eSWsiC3SsB5Huqb0Ku44kDLoFN9p69SIAE=;
        b=iJzqdz24XHzRDS/CBbzYTElsqlxTl8hQrISMceNjxNddx6391+nGzWlzsDrS8+MuX4
         Z6jy1eElj8ogi6fvsacGDlM9WIde3KiClKJ2wSGR8N23QlJUaKgSq1yt6JFblv5VVHsi
         hiJ0Zz8xONsnz6DBwIxXDiZkWgZs51nWZtHWqtEhJtzKaLI+nD7uTZL0W5lJsD1UIFLX
         Xp0GEQ+JSlMNoNmLHKxS8ZnBrvmBdLc1jSV9WyMprrX6PhSGWd7K2N0QiCmIAQAiMpW0
         K/R9y21+m7qoo9y83vNmGvogPgZP0Av0n5HzxR+ZVq+ke5+IBX+jPdGaclgCLKynItqS
         3K0A==
X-Gm-Message-State: APjAAAX5bRVEc9E+1a3rAL6u3ewVSLwia9uzVSY/gfFVZKYVQrxjv8Kp
        ac/lojlA6KNZssBAxdXZDar51Q==
X-Google-Smtp-Source: APXvYqznQi99px26YNP9vyR+IDtMFUiA2KIXWA7/G1NfQxBqe4E+4935xoJv7nCF7+iJcnj4xRyJ5A==
X-Received: by 2002:ac2:50cc:: with SMTP id h12mr6326667lfm.29.1576782077671;
        Thu, 19 Dec 2019 11:01:17 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:899:8379:9861:263:6bbe:73b8])
        by smtp.gmail.com with ESMTPSA id z5sm45547lji.40.2019.12.19.11.01.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 11:01:16 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 0/6] spi: Add Renesas SPIBSC controller
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <922cfa46-efb5-9e6d-67ea-3ac505b8211c@cogentembedded.com>
 <TY1PR01MB156215E8668C0317FA0826B18A580@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <e6a73df5-31c4-3472-f7bc-a0984f1f5380@cogentembedded.com>
 <TY1PR01MB1562D343E1AB06DCA2973DAC8A550@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <590840ce-a250-2512-3d04-c2420d83f7da@cogentembedded.com>
 <TY1PR01MB1562B9EB96818DCA507079808A510@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <bb630141-021c-5618-f266-b98b29956fa8@cogentembedded.com>
 <TY1PR01MB1562E196AB1C582F186CC74B8A520@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Organization: Cogent Embedded
Message-ID: <6f4c5d92-3ca4-2d1d-47c4-cbd52ad428b0@cogentembedded.com>
Date:   Thu, 19 Dec 2019 22:01:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1562E196AB1C582F186CC74B8A520@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 12/19/2019 07:57 PM, Chris Brandt wrote:

>>> So at the moment, there is nothing yet for me to 'try' on the RZ/A series,
>> correct?
>>
>>    Why, I can send you a working version of the SPI driver, and even HF one
>> if you're
>> interested.
> 
> The point of this whole discussion is to determine if we should have 2 drivers
> for the same Renesas HW IP.
> 
> There was a RPC-IF patch series that made it to v17....and is now dead.
> 
> You sent a new RFC series for a new method, but all it had was low level APIs,
> no MTD framework, do it didn't really do anything.

   Apparently you have missed the previous RFC iteration, the MFD/SPI drivers posted
at end of May:

https://patchwork.kernel.org/patch/10969211/
https://patchwork.kernel.org/patch/10969213/
https://patchwork.kernel.org/patch/10969217/

   There's not yet merged MTD patch you'd need too:

http://patchwork.ozlabs.org/patch/1199645/

   The MFD driver was shot down by Lee Jones who has advised placing the common
code into drivers/memory/ instead... I don't want to re-post the SPI driver as
I haven't yet addressed all of Mark Brown's comments...

> If there was a complete patch set that I could try on the RZ/A SoCs and 
> get a working SPI MTD device to show up, then I would drop my efforts of
> getting my driver in and just add RZ/A support to the R-Car driver.

   Please try these patches, there's a big chance they'll work. 

[...]
> Honestly, I'll be out of the office until January, so it's not like I'm 
> going to do anything with it until then. But if there is a complete series
> to try by then, I will see how it performs on RZ/A boards.

   Hopefully I will have addressed Mark's feedback by then and post the new SPI
driver... Have happy holidays! (Ours happen on 1/1 and last till 1/8 this year.)

> Chris

MBR, Sergei
