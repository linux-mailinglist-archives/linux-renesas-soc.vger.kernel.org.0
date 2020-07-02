Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D6E212DEF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 22:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgGBUfm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 16:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGBUfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 16:35:41 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F96C08C5C1;
        Thu,  2 Jul 2020 13:35:41 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id u8so12612580pje.4;
        Thu, 02 Jul 2020 13:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DSQtDmDwucGHW+dyhDgb6+R095qO1fx3h8Uf/2X+M6Y=;
        b=boqHnuI8LgsJYTz1OpOIgc2s2YJSdoYR+AUIPrICTmMCP8GT3rACsG5saJjOoKmDAl
         KJREttdk9LzumI/TCe1LNDr1u2NZANlhqW1Ne74pqUuL2qBBiAflc0cSu/OXnyYvEqwC
         1wvUrknlT//euWpnVwxZUttVddC2WmTuDxXd+E8AgxYbyDE+ornovXSFTaHX1KziBuRB
         VHBbhlhFdGEwQ3DLYoV8L1kmSGzBO1KgRJNpOUJ7B51m8e+EaGHwtL6Zby9/8jfPMiql
         OVfTFVcr5J/W2MnQemxxwg7XIRWldN5J9/NFTup8eK7z2h9N4h71eDgdq4j44i9jwbUm
         y6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DSQtDmDwucGHW+dyhDgb6+R095qO1fx3h8Uf/2X+M6Y=;
        b=FvbJgv4VgjYra8Kefi7jRglH2NhfLbgqZyo4XpMPxOqXEoCTk/EbxH6g/gCmVXIn0t
         OpxnkR7khnfeQcHKJTnjxQOjZlRXnMvFYDnU9h7lyxARadLbYVYy7/GYBSLk0toQKrlh
         wxO9nGsMbhZDxBHqZfmlsl/JfWipPSCFVI5HLcossemAtL/2sXIyTrw3u71fMUMWbJR5
         ANaeDdUjcVI+mRStgX3S6I2eSggN6cSFF17gxLgKVUtaIlWKmyeLSYtK6xP0d6bltnyI
         cXMMarsw+Kz0Nk8QSC9jHo+Qi0UipDMW5NY2tYH3HqYiSHl4RPfUKZfZAWBe8c/aBeLy
         Hs9g==
X-Gm-Message-State: AOAM5312na5+UPQeyF6IxWmOcGXGumwOU+UyeoPccq4QDRonDMMojbp7
        cFQ2eWgMiISzZ0BvJKNaXTlQ9pCNy9A=
X-Google-Smtp-Source: ABdhPJyI4cibRqHiSdTi3Zlz08Rrt+4rJpYFbqcILvlyUDhBCC/dETu04ILosMwTLXO6D9UDwp5j+A==
X-Received: by 2002:a17:90a:800b:: with SMTP id b11mr18878612pjn.105.1593722140865;
        Thu, 02 Jul 2020 13:35:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m3sm10912059pfk.171.2020.07.02.13.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 13:35:40 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] serial: core: Allow detach and attach serial
 device for console
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20200217114016.49856-1-andriy.shevchenko@linux.intel.com>
 <20200217114016.49856-3-andriy.shevchenko@linux.intel.com>
 <20200524171032.GA218301@roeck-us.net>
 <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
 <20200702193553.GN53169@atomide.com>
 <CAMuHMdUn5MK6tTd6ohFxa=K9NNHRbDp9P7gvPD52fCp2OsLnYA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <10ce8238-2c76-98af-baec-832cfa03711e@roeck-us.net>
Date:   Thu, 2 Jul 2020 13:35:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUn5MK6tTd6ohFxa=K9NNHRbDp9P7gvPD52fCp2OsLnYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/2/20 1:03 PM, Geert Uytterhoeven wrote:
> Hi Tony,
> 
> On Thu, Jul 2, 2020 at 9:35 PM Tony Lindgren <tony@atomide.com> wrote:
>> * Geert Uytterhoeven <geert@linux-m68k.org> [200702 14:50]:
>>> On Sun, May 24, 2020 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> any special reason for this change ? It is not really explained in the
>>>> commit description.
>>>
>>> Indeed. Why this change?
>>
>> For a kernel console, we want it to work for important oopses
>> etc without trying to enable DMA or power on regulators for example.
> 
> [...]
> 
> Thanks for the explanation about irqsafe consoles!
> I think I cannot disagree with that ;-)
> 
> Sorry for being a bit unclear, but my question (and I guess Günter's
> question, too) was about this particular change:
> 
>      static inline void uart_port_spin_lock_init(struct uart_port *port)
>      {
>     -     if (uart_console_enabled(port))
>     +     if (uart_console(port))
> 
> This change seems to be completely unrelated, is not explained in the
> commit description, and is the cause of the regression we're seeing.
> 

Yes, that was my question as well. I still fail to understand what exactly
the explanation has to do with the problem. The same happened before,
so I concluded that I must be completely clueless, and gave up asking.

Guenter

