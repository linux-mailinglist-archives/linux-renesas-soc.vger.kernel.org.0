Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6762B3592FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 05:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbhDIDUb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 23:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbhDIDUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 23:20:30 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959F0C061763
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Apr 2021 20:20:18 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id b17so2833700pgh.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Apr 2021 20:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OCOuP77KzsERfjtLD3+g0QTNYiI6uzbUte1pk8VLigc=;
        b=fs6OIzMHI1Ukfun/q5z5kfC91OWHpE3PcQFCPRODEkoEe2j/xEt8Lplg7E+tcAaQ97
         0q9SYV703eJz04xUzhlXRrvjdcKy1rgUVEd5C+nwUNq4HN6QVapc45uVFOQMiG5UtaR0
         IpVgH0IQ0TtYgrnVa/m3OwpnwYk1FsC6uHBjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OCOuP77KzsERfjtLD3+g0QTNYiI6uzbUte1pk8VLigc=;
        b=QR3O9f2WxjZscuWR4hnEBB6eKPPGAqpmY/Y1xef04Cj5g6WbIVDa6WIOJrUuftIPUY
         8G2h91Bsy+8rRV7sxxt6S3Og1BkGpl0lvo6UT5unYYvNzdi6TdmJg+hFptS9syVZEQXD
         9CnJyGIJPoC2DwiXMEqZkOGTiHhe++UqQE4fdIXpOjOtnzUhgcTp5lTfQWeBwXzRST8S
         kQ85IknMG6bDD75rzC2MOfxA0Ax+CdF9P4c16kKAY7HzcX69ucYu1g1dgzMp8i7t4mK7
         NmPcgmSzB4X8vr2n7OIfTDK3qRQ+stQrdA9gAQJVvmBE7vj22LVGwgaDP0lQQ99CeYcP
         b75w==
X-Gm-Message-State: AOAM533NhRufjzk8OQyFK/0ajJRenUbxrT0FQk4ktyv5QfEm5yLGDS1d
        +Edqlotj0cC3fyaO/+E7VgNv4A==
X-Google-Smtp-Source: ABdhPJzC0bLiabjaxIzlhcuh3ox2ZRB+HbY3l9M8hv1k1EI9wdS1NnBB85gLT5oog9ql76p4icDRyw==
X-Received: by 2002:a63:9dcb:: with SMTP id i194mr10564176pgd.87.1617938417994;
        Thu, 08 Apr 2021 20:20:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j205sm683087pfd.214.2021.04.08.20.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:20:17 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:20:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "agross@kernel.org" <agross@kernel.org>,
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
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
Message-ID: <202104082015.4DADF9DC48@keescook>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
 <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com>
 <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
 <CAHp75VeK+Oq9inOLcSSsq+FjaaPC5D=EMt4vLf97uR1BmpW2Zw@mail.gmail.com>
 <42210c909c55f7672e4a4a9bfd34553a6f4c8146.camel@fi.rohmeurope.com>
 <CAHp75VeX8H5E6GfVHxgu_6R+zbvmFV8fT9tO-nsm1nB3N4NF_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeX8H5E6GfVHxgu_6R+zbvmFV8fT9tO-nsm1nB3N4NF_A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 07, 2021 at 03:50:15PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 7, 2021 at 12:49 PM Vaittinen, Matti
> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > On Wed, 2021-04-07 at 12:10 +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 7, 2021 at 8:02 AM Matti Vaittinen
> > > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > > On Wed, 2021-04-07 at 01:44 +0300, Andy Shevchenko wrote:
> > > > > On Tuesday, April 6, 2021, Matti Vaittinen <
> > > > > matti.vaittinen@fi.rohmeurope.com> wrote:
> 
> Kees, there are two non-security guys discussing potential security
> matters. Perhaps you may shed a light on this and tell which of our
> stuff is risky and which is not and your recommendations on it.

Hi!

> > > > > > +       pr_emerg(msg);
> > > > >
> > > > > Oh là là, besides build bot complaints, this has serious security
> > > > > implications. Never do like this.
> > > >
> > > > I'm not even trying to claim that was correct. And I did send a
> > > > fixup -
> > > > sorry for this. I don't intend to do this again.
> > > >
> > > > Now, when this is said - If you have a minute, please educate me.
> > > > Assuming we know all the callers and that all the callers use this
> > > > as
> > > >
> > > > die_loudly("foobarfoo\n");
> > > > - what is the exploit mechanism?

I may not be following the thread exactly, here, but normally the issue
is just one of robustness and code maintainability. You can't be sure all
future callers will always pass in a const string, so better to always do:

	pr_whatever("%s\n", string_var);

> > > Not a security guy, but my understanding is that this code may be
> > > used
> > > as a gadget in ROP technique of attacks.

The primary concern is with giving an attacker control over a format
string (which can be used to expose kernel memory). It used to be much
more serious when the kernel still implemented %n, which would turn such
things into a potential memory _overwrite_. We removed %n a long time
ago now. :)

> > Thanks Andy. It'd be interesting to learn more details as I am not a
> > security expert either :)
> >
> > > In that case msg can be anything. On top of that, somebody may
> > > mistakenly (inadvertently) put the code that allows user controller
> > > input to go to this path.
> >
> > Yes. This is a good reason to not to do this - but I was interested in
> > knowing if there is a potential risk even if:
> >
> > > > all the callers use this
> > > > as
> > > >
> > > > die_loudly("foobarfoo\n");
> 
> I don't see direct issues, only indirect ones, for example, if by some
> reason the memory of this message appears writable. So, whoever
> controls the format string of printf() controls a lot. That's why it's
> preferable to spell out exact intentions in the explicit format
> string.

Right.

> > > > > > +       BUG();
> > > > > > +}

This, though, are you sure you want to use BUG()? Linus gets upset about
such things:
https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on

-- 
Kees Cook
