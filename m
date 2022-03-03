Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968A54CBDA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbiCCMZR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:25:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233205AbiCCMZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:25:16 -0500
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A6CF47E9
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1646310271; x=1677846271;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Yf5axKjROfKuKvfCFqp+M8GxRouDBYp/bx1mxWv8bj4=;
  b=dXrAr5E0GMt0ZN3uZAJUOqVU9W0eWEQ+qBjwaHlNGwC2Xf7cZ8fkLC7M
   vjdHjuHXR28sIlRPHNX8p1qU+AUFKQivqo3ctsBljoU6qwTEvMDjzwlWP
   h7F7NAJRHFJaK9mYNScPpjoRA+134C1CeRIEaIuSFYPG3e7r8zj1mYsuN
   mAOceA+Fia2V2UEolGH01P8WE2QLSksPhjQk/CXhg2VIzaHIq8eB6WTP0
   Mt0wfZDl/rRUdI9cZmEICuAuWnt4TXjewnmnSnTxYHRgG089abn4vAUIT
   ODTlRO932pQnab32FhAxXcQeSvPUZ4XiHI3X34hdlViy0HPU4DkuC3r2D
   w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; 
   d="scan'208";a="195347585"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 20:24:29 +0800
IronPort-SDR: icExpktkGhfFWQq4G9arXRieOR0Z4PB6JG9F7xAf/SFrEJGKZkdazuiaXLDhCFwgyyUP9SPdxl
 ONecLFi5AOzKFmpzQyMAF+ofCWdkZur/B9Hadpxs54W4PfxP5k5by5u38EAtpu3mbkrZd4NO0f
 O3uAMXqNkwZz85+xsVyXG2finXV2j87fNzrtazF2ZMKLW6cVl91Op7tIAjmoaTiPn6dev94K6S
 67OEt/7aXn58jJl+2S0GARtOvC/CxF02IqehZczwm41mmpLmtp5PyoGSp2hL/SQjSieb7IwIvT
 j/7LMT29x/JThbr8N7xWJVBX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 03:56:53 -0800
IronPort-SDR: BB99zr56FhobqgvO0pdU9Kf1O2CwY6lUymvmHNYnJY4fVh20zJRcJPoG6khfhDUnwQRsQK+JHf
 PydaEnK5bI9KADfRSjxop8NFT2lZwVLN829CCrRck2Cfo0B2hEHMguBzwq0O5euXdWmfMKlZe6
 BtQYU/kZmoEFFJF0Mx5p8dWh7RWsLKUsbIjOu026bF8p22K5U0AUU5lxyVXyxBJMg4wOfveBwj
 uX968s+3hGkrgh127g/bUKdsyy+ZLdft+U9M4ycKoZrD8gZ1np/vewIyQuyhtPfluOa99Om+kW
 luQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 04:24:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8VXr6HNBz1SVp4
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:24:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1646310268; x=1648902269; bh=Yf5axKjROfKuKvfCFqp+M8GxRouDBYp/bx1
        mxWv8bj4=; b=DyRYjVupRe5v3/qUM+nsTSkXijrJG1D4+fUoFbX9TtFiopcGZUm
        9XGN1E3pE3uWCV76kb0JUOsLEX9sBWfqFp8Za6YiyLbbL6BJsB1wYJkzTTfRZM9R
        CtXf/Lvq0i5L4U8vIliVbbMOP08aY2ZdmRLFri07BLX0rajdBXjVkDBVELpaN4nD
        L3xpi1XAsN5L4qsYGjYzZ9BR7LjGLxl9XltXsglimIPKqWvKGai+sZU9vGx73khb
        FY3SFrcaSIzEskNBhPJonlPfhYJQZLpykb8t8sstZdEpwJ6xwE+k9DLcMElzp3HV
        8liR+WlInMIC6AyIpVfWg83hdt8pBrmYSrw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id pT9wASH3F3h2 for <linux-renesas-soc@vger.kernel.org>;
        Thu,  3 Mar 2022 04:24:28 -0800 (PST)
Received: from [10.225.33.67] (unknown [10.225.33.67])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8VXm47f7z1Rvlx;
        Thu,  3 Mar 2022 04:24:24 -0800 (PST)
Message-ID: <23d62066-1460-2bfa-2922-44c856fa253d@opensource.wdc.com>
Date:   Thu, 3 Mar 2022 14:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] ata: Drop commas after OF match table sentinels
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ide@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
References: <52970494111d9287cc8355e0f2e3de474361c75f.1646296493.git.geert+renesas@glider.be>
 <164630760533.3471399.15267126463863979019@Monstersaurus>
 <CAMuHMdWWYaqxA8W-1CSdOj7HV1V0s_byx=iFe+awbgxwsAh7tA@mail.gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdWWYaqxA8W-1CSdOj7HV1V0s_byx=iFe+awbgxwsAh7tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2022/03/03 14:20, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Thu, Mar 3, 2022 at 12:40 PM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>> Quoting Geert Uytterhoeven (2022-03-03 08:36:35)
>>> It does not make sense to have a comma after a sentinel, as any new
>>> elements must be added before the sentinel.
>>
>> Indeed.
>>
>>> Add comments to clarify the purpose of the empty elements.
>>> Rewrap entries to a single line to have a consistent style.
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks!
> 
>>
> git grep "{ }," | wc -l
>> 2638
>> git grep "{}," | wc -l
>> 2088
>>
>> Lots of false positives in that basic search, but this looks like a big
>> job. Is this something that could be added to checkstyle?
>>
>> Probably hard to match when it's a sentinal, rather than an initialiser
>> ... so perhaps a coccinelle task.
> 
> Yes, there are _lots_ of these.
> 
> I fixed the ca. 50 cases involving Renesas-specific compatible values,
> and picked up the ata subsystem for a first run.  But fixing all of them
> looks like a lot of work, so automation might help.

Thanks for the cleanup Geert. Will apply.

> 
> For soc_device_attribute tables, there are less cases, so I'll just
> send the handful patches to fix all of them...
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


-- 
Damien Le Moal
Western Digital Research
