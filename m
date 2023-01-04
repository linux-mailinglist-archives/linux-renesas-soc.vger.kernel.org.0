Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4666165D5D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jan 2023 15:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbjADOhO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Jan 2023 09:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239563AbjADOg0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2023 09:36:26 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07882AE6E;
        Wed,  4 Jan 2023 06:36:25 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 36D3380A55;
        Wed,  4 Jan 2023 15:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1672842984;
        bh=uffYZKPXvjVSC7XAikS/rhQKBWutQ2M2kKamCE8f87Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=anLpg4CgBs0OTFv+xPm31IVMsIDPZn4nBFUMxXK4UbWeWbiGL4t0y3pqKviZQ31Jr
         mwUgiQFwroowbIqpxfqJCqG6UoszIoWilxygsQ5FeUn6wcBaPiEBnoa15Z508ayUU0
         pvoUIz+DoKrFFo8U8ABwCr3lYVG95x0bZNn4lz50n3uIl1RX8tmxuUoUJV2ogrXXri
         Yvm1b6/owMmbV/5ro4d72aSBIsy0J6fGmDmrsOUjGF7uHuC/e5cn+V/1GkqH0fYx0c
         XMBzhFw0E+YJ2S1bR5h3WjA5nmKIHY74afvI2h6vtBN9SI3KQwW+l4qUoOl0fLyDfg
         ZtgDkolXYhn2A==
Message-ID: <496c40b8-38f2-4a53-f5c7-d75654c6d245@denx.de>
Date:   Wed, 4 Jan 2023 15:36:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] clk: rs9: Check for vendor/device ID
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
 <2ba4e002-9f27-2e36-2bd2-8753c455b21f@denx.de> <3826066.fW5hKsROvD@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <3826066.fW5hKsROvD@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/4/23 11:27, Alexander Stein wrote:

[...]

>>> +		dev_err(&client->dev,
>>
>> return dev_err_probe() might work better here ?
> 
> How? This error branch always returns -ENODEV, so no deferred probing will
> occur at all.

It's not about deferred probing, just that you wouldn't have two lines 
of dev_err() + return -ENODEV, but just one return dev_err_probe() line.
