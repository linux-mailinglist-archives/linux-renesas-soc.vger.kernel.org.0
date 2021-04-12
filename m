Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFB335C624
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 14:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240874AbhDLMYq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 08:24:46 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:42822 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240245AbhDLMYp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 08:24:45 -0400
Received: by mail-lj1-f172.google.com with SMTP id l22so7743374ljc.9;
        Mon, 12 Apr 2021 05:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=5PHG89rkHmtJu5sjeUoGT1FTEcW/fFE95LEXIAesfmA=;
        b=Hx8/r/C/Vjj1KvpHowxonVLON7SDT3jnLCtpA1V800HksR9zcpDZPhrM5GFYnAUs3R
         s8lgoHTaPI46Ro0WDk9WDwnk+5MjulHOGgMygoxLX9bgzsEZJZ+WfgxmIdewieOnap7E
         xpDNmBGStJ5vowEzHuFHiaGt8uzAoigy5jMNKVdO7ef7LTkxy70UqAxNJObNTCA3eaQl
         y4FXq7xbmGDO+GX+prd7URP12xKypJuo4ambvzcTMTu2g3OAWQ/D/IwC+jO8Yj0wa41g
         ZqbvZR7FhdCDwmoRdBLmnI6FlZ9Sm3RujhA4nGZDIUp28Kzw14H5ighIqeNZhJ9K30O+
         US+A==
X-Gm-Message-State: AOAM531b+mo4vYmUBbAsSKz4IvdSg7acGbM9hzDD4Fb2oEbHv2oELvsj
        uX/lUMj9s0NDX/+dF+GPKeo=
X-Google-Smtp-Source: ABdhPJz+wZQrXWFGN32X3FcPKz0599Hnf7JphhvJy0mUmk0MZJyizU/mixod1C8XADcLGi19XpK7qg==
X-Received: by 2002:a2e:588:: with SMTP id 130mr15431771ljf.28.1618230266591;
        Mon, 12 Apr 2021 05:24:26 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id m6sm1203846lfu.308.2021.04.12.05.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 05:24:25 -0700 (PDT)
Message-ID: <882c4561ebc20313098312bb9cfae60736d69475.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Kees Cook <keescook@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
In-Reply-To: <dbd6a71b1b907de004d23d2ea4b15045320f1ae1.camel@fi.rohmeurope.com>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
         <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com>
         <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
         <CAHp75VeK+Oq9inOLcSSsq+FjaaPC5D=EMt4vLf97uR1BmpW2Zw@mail.gmail.com>
         <42210c909c55f7672e4a4a9bfd34553a6f4c8146.camel@fi.rohmeurope.com>
         <CAHp75VeX8H5E6GfVHxgu_6R+zbvmFV8fT9tO-nsm1nB3N4NF_A@mail.gmail.com>
         <202104082015.4DADF9DC48@keescook>
         <dbd6a71b1b907de004d23d2ea4b15045320f1ae1.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Mon, 12 Apr 2021 15:24:16 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Fri, 2021-04-09 at 10:08 +0300, Matti Vaittinen wrote:
> On Thu, 2021-04-08 at 20:20 -0700, Kees Cook wrote:
> > On Wed, Apr 07, 2021 at 03:50:15PM +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 7, 2021 at 12:49 PM Vaittinen, Matti
> > > <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > > > On Wed, 2021-04-07 at 12:10 +0300, Andy Shevchenko wrote:
> > > > > On Wed, Apr 7, 2021 at 8:02 AM Matti Vaittinen
> > > > > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > > > > On Wed, 2021-04-07 at 01:44 +0300, Andy Shevchenko wrote:
> > > > > > > On Tuesday, April 6, 2021, Matti Vaittinen <
> > > > > > > matti.vaittinen@fi.rohmeurope.com> wrote:
> > > > > > > > +       BUG();
> > > > > > > > +}
> > 
> > This, though, are you sure you want to use BUG()? Linus gets upset
> > about
> > such things:
> > https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
> > 
> 
> I see. I am unsure of what would be the best action in the regulator
> case we are handling here. To give the context, we assume here a
> situation where power has gone out of regulation and the hardware is
> probably failing. First countermeasure to protect what is left of HW
> is
> to shut-down the failing regulator. BUG() was called here as a last
> resort if shutting the power via regulator interface was not
> implemented or working.
> 
> Eg, we try to take what ever last measure we can to minimize the HW
> damage - and BUG() was used for this in the qcom driver where I stole
> the idea. Judging the comment related to BUG() in asm-generic/bug.h
> 
> /*
>  * Don't use BUG() or BUG_ON() unless there's really no way out; one
>  
> * example might be detecting data structure corruption in the middle
>  *
> of an operation that can't be backed out of.  If the (sub)system
>  * can
> somehow continue operating, perhaps with reduced functionality,
>  * it's
> probably not BUG-worthy.
>  *
>  * If you're tempted to BUG(), think
> again:  is completely giving up
>  * really the *only* solution?  There
> are usually better options, where
>  * users don't need to reboot ASAP and
> can mostly shut down cleanly.
>  */
> https://elixir.bootlin.com/linux/v5.12-rc6/source/include/asm-generic/bug.h#L55
> 
> this really might be valid use-case.
> 
> To me the real question is what happens after the BUG() - and if
> there
> is any generic handling or if it is platform/board specific? Does it
> actually have any chance to save the HW?
> 
> Mark already pointed that we might need to figure a way to punt a
> "failing event" to the user-space to initiate better "safety
> shutdown".
> Such event does not currently exist so I think the main use-case here
> is to do logging and potentially prevent enabling any further actions
> in the failing HW.
> 
> So - any better suggestions?
> 

Maybe we should take same approach as is taken in thermal_core? Quoting
the thermal documentation:

"On an event of critical trip temperature crossing. Thermal
framework             
allows the system to shutdown gracefully by calling
orderly_poweroff().          
In the event of a failure of orderly_poweroff() to shut down the
system          
we are in danger of keeping the system alive at undesirably
high                 
temperatures. To mitigate this high risk scenario we program a
work              
queue to fire after a pre-determined number of seconds to
start                  
an emergency shutdown of the device using the
kernel_power_off()                 
function. In case kernel_power_off() fails then
finally                          
emergency_restart() is called in the worst case."

Maybe this 'hardware protection, in-kernel, emergency HW saving
shutdown' - logic, should be pulled out of thermal_core.c (or at least
exported) for (other parts like) the regulators to use?

I don't like the idea relying in the user-space to be in shape it can
handle the situation. I may be mistaken but I think a quick action
might be required. Hence the in-kernel handling does not sound so bad
to me.

I am open to all education and suggestions. Meanwhile I am planning to
just convert the BUG() to WARN(). I don't claim I know how BUG() is
implemented on each platform - but my understanding is that it does not
guarantee any power to be cut but just halts the calling process(?). I
guess this does not guarantee what happens next - maybe it even keeps
the power enabled and end up just deadlocking the system by reserved
locks? I think thermal guys have been pondering this scenario for
severe temperature protection shutdown so I would like to hear your
opinions.


Best Regards
Matti Vaittinen

