Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9B141811C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 12:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235805AbhIYKvE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 06:51:04 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:21814 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbhIYKvE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 06:51:04 -0400
IronPort-SDR: mLI3V6cSwiHi8gja0CvPKJMRz8k/9q0lSDp1+zrSJHE3kGSnnmW6JW4nBmAI4Mu8l5+EtIwfXR
 +1FebL/aCLofWYk4zjqkQqNHQLBfECR/RBJ09sbFn/ChUV10Go4r1V+I+2QLbLDhN7L105UBBC
 DlVWj7ieOuxxtYIsqeWpE5YBrs+3geCK7kQWfKhfHCjILfVP0pOplvqnc0MXctpOHaWDgcXVEj
 Gsrcj2J5EQen68GST4lFrJ9DyJj0ngXZvRQitMbmXblgqUDXtVh7rIvCe0OkQIQ0bINdxNPAmN
 HeE=
X-IronPort-AV: E=Sophos;i="5.85,321,1624348800"; 
   d="scan'208";a="66321087"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 25 Sep 2021 02:49:27 -0800
IronPort-SDR: 7/xLU5DcmWK0K+6/AIcAGRFZkhjeyUdlZhm/58JVwNY9emkiW7JNl1WFy6FkSCKOm7+SHUVglP
 E/SHyn0Fkg7Nr3W9NJkbTk04Fik/gDmSulmLaYRy8xTUnT5TzxZ20UANFqdL2i0aUHw1WJOXUt
 0g0qCn2cfwETknbk/qlzDMnHsAFMHbg8X6eVmo6f4IkYuJ+yyv765HxuedvQDZXMhj/qum1fnu
 P/cFianEcy6/K1GJ3UGalGkwTpR6BAJtwKns3Q4ICcFkLT2pZoRi2fQNheJN/tH7j0A9bO7fsU
 v4Y=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     'Wolfram Sang' <wsa@kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210922184830.29147-1-andrew_gabbasov@mentor.com> <YU7x8cabSsQiUJuE@kunai>
In-Reply-To: <YU7x8cabSsQiUJuE@kunai>
Subject: RE: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for HyperFlash
Date:   Sat, 25 Sep 2021 13:49:13 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000901d7b1fa$ff9b57f0$fed207d0$@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXsfNlhFdr88sfGEGUtgyCIuCyuau0iuYw
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wolfram,

Thank you for your comments!

> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Saturday, September 25, 2021 12:55 PM
> To: Gabbasov, Andrew <Andrew_Gabbasov@mentor.com>
> Cc: linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Krzysztof Kozlowski <krzk@kernel.org>;
> Sergei Shtylyov <sergei.shtylyov@gmail.com>; Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: Re: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for HyperFlash
> 
> Hi Andrew,
> 
> thanks for this patch!
> 
> > +	const int maxw = (IS_ENABLED(CONFIG_64BIT)) ? 8 : 4;
> > +	u8 buf[2];
> 
> I could imagine the code becomes more readable if we make use of
> something like:
> 
> 	unsigned long from_ul = from;
> 
> and then use it throughout the function?

It could make sense if "from" would not change along the function.
But in case of this function "from" is changed between usages, so
it would be necessary to synchronize "from_ul" with "from" again
(make "from_ul++" together with "from++", or re-assign it)
before we could use it again correctly.

> > +#ifdef CONFIG_64BIT
> > +		*(u64 *)to = __raw_readq(from);
> > +#else
> > +		*(u32 *)to = __raw_readl(from);
> > +#endif
> 
> To keep the ifdeffery minimal:
> 
> 	if (maxw == 8)
> 		*(u64 *)to = __raw_readq(from);
> 	else
>  		*(u32 *)to = __raw_readl(from);
> 
> and let the compiler do its job.

I don't like #ifdef's inside the function body too, but the problem is that
"__raw_readq" is defined in arch/arm64/include/asm/io.h unconditionally,
but in include/asm-generic/io.h under "#ifdef CONFIG_64BIT" only.
This file drivers/memory/renesas-rpc-if.c can be compiled not only
for renesas/arm64 architecture, but for CONFIG_COMPILE_TEST case too.
It means, that the file could be compiled for some other architecture,
that does not have CONFIG_64BIT, and in this case "__raw_readq" function
will be undefined. So, we need to hide it under "#ifdef CONFIG_64BIT" here.

> I wondered if this could be a helper function somewhere instead of open
> coded in this driver. However, I did not find any similar code in the
> kernel yet, so it might be too early to make this a helper. Have you
> looked for similar code? I might have just missed it.

I looked through the whole kernel code too, and unfortunately didn't find
any similar code that could be re-used or had some parts, extractable as
a common helper. That's why I ended up with a local custom function,
at least so far, until it could be found useful by somebody else ;)

Thanks!

Best regards,
Andrew 


