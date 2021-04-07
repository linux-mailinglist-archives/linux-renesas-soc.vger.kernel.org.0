Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E4A3567BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 11:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234489AbhDGJLJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 05:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234354AbhDGJLJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 05:11:09 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEF9C061756;
        Wed,  7 Apr 2021 02:10:59 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so2739543pjb.0;
        Wed, 07 Apr 2021 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K7hu9kGELgUjGIjS4qqBRxqSMaLtA2wJeoBEwdN1MX0=;
        b=F5gvw4nUin11lqcfN6/v45ZomSGAgxK5pNw2w6iaL60+3LYOLHXqA97wE/ImXGcmMf
         y5ewmVFDg1eoLMu40CytsFgUllYRySy9e9bcmlHiduUnnq60xZWkcbYfmGPck3uFJYLl
         tOSlkyVk2MhS9h8CL3zVRFA2NEPVlBP9NaucyoRT/ev/zR51e1qU7eU4gHALHobnXowc
         q2nyphTZTVQDnG8GHtdOZ8ECiqdEvIjijS2/Z9JHwl7rI+berCEfHG0F2Vaj9kJOwokL
         mQVV8w8AAb1sWlWpLM6fjB9eTppBxY7pd8A4rOYiYEb2fjP2D3awd6F4I/6mzsbEb28p
         leEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K7hu9kGELgUjGIjS4qqBRxqSMaLtA2wJeoBEwdN1MX0=;
        b=Ubi9KRHfOnkeiNGQmY8gIndm7hYgwoKqkKHgG+LIqhG9e6dK3Qahv9Jn/gTfD7e4vZ
         BEvQcfYxCZQ/gOMEWgm2UWOM0vkQ33QfjixW0uaAqqt0ot41dspLkUYBJm7S7giCJTQt
         ia5+qv/OvwBpjx4i4yUzPDvrwxoSBO4+zLPx0bomqySZZVXuHFkoPSdqwISmireiShbe
         2JIIvG8WdquoxQr04S+zIwHCLFe98fLgpnKm3NrW5lq40oPSjfj1yg1IYA6wjMmfpBOG
         rWuGlNizURmyqD/JgUEKj2jk67iiEh67NArnwZUQAq6y4932Ngzkm2mrXPSV+2oV3oDj
         bfIQ==
X-Gm-Message-State: AOAM532aQ/txsaIX0ipzgwhChLUEfRwl4oBq8T33AGlcFd5tffK4SyCV
        eMyBbXjxwRrMf/tKQ6oeBx9diHGUJTfOIKj82ww=
X-Google-Smtp-Source: ABdhPJz7TkStYXyOjkc24eFSydCkbC4QU3yD2JU5yIJwmqLMJtS7V1zKdLsnuEc6bMLgLcE7XtLotI7WUCZuOu1KM1I=
X-Received: by 2002:a17:90a:5407:: with SMTP id z7mr2397529pjh.228.1617786659334;
 Wed, 07 Apr 2021 02:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
 <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com> <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
In-Reply-To: <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Apr 2021 12:10:43 +0300
Message-ID: <CAHp75VeK+Oq9inOLcSSsq+FjaaPC5D=EMt4vLf97uR1BmpW2Zw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification helpers
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 7, 2021 at 8:02 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Morning Andy,
>
> Thanks for the review! By the way, is it me or did your mail-client
> spill this out using HTML?

It's Gmail from my mobile phone, sorry for that. We have to blame
Google that they don't think through.

> On Wed, 2021-04-07 at 01:44 +0300, Andy Shevchenko wrote:
> > On Tuesday, April 6, 2021, Matti Vaittinen <
> > matti.vaittinen@fi.rohmeurope.com> wrote:

...

> > > +       pr_emerg(msg);
> >
> > Oh l=C3=A0 l=C3=A0, besides build bot complaints, this has serious secu=
rity
> > implications. Never do like this.
>
> I'm not even trying to claim that was correct. And I did send a fixup -
> sorry for this. I don't intend to do this again.
>
> Now, when this is said - If you have a minute, please educate me.
> Assuming we know all the callers and that all the callers use this as
>
> die_loudly("foobarfoo\n");
> - what is the exploit mechanism?

Not a security guy, but my understanding is that this code may be used
as a gadget in ROP technique of attacks.
In that case msg can be anything. On top of that, somebody may
mistakenly (inadvertently) put the code that allows user controller
input to go to this path.

And last but not least, that some newbies might copy'n'paste bad
examples where they will expose security breach.

With the modern world of Spectre, rowhammer, and other side channel
attacks I may believe that one may exhaust the regulator for getting
advantage on an attack vector.

But again, not a security guy here.

> > > +       BUG();
> > > +}
> > > +

...

> > > errors will be
> > > + *                     or'ed with common erros. If this is given

errors ?

...

> > > +       if (irq <=3D 0) {
> > > +               dev_err(dev, "No IRQ\n");
> > > +               return ERR_PTR(-EINVAL);
> >
> > Why shadowing error code? Negative IRQ is anything but =E2=80=9Cno IRQ=
=E2=80=9D.
>
> This was a good point. The irq is passed here as parameter. From this
> function's perspective the negative irq is invalid parameter - we don't
> know how the caller has obtained it. Print could show the value
> contained in irq though.

> Now that you pointed this out I am unsure if this check is needed here.
> If we check it, then I still think we should report -EINVAL for invalid
> parameter. Other option is to just call the request_threaded_irq() -
> log the IRQ request failure and return what request_threaded_irq()
> returns. Do you think that would make sense?

Why is the parameter signed type then?
Shouldn't the caller take care of it?

Otherwise, what is the difference between passing negative IRQ to
request_irq() call?
As you said, you shouldn't make assumptions about what caller meant by this=
.

So, I would simply drop the check (from easiness of the code perspective).

...

> > > +void regulator_irq_helper_cancel(void **handle)
> > > +{
> > > +       if (handle && *handle) {
> >
> > Can handle ever be NULL here ? (Yes, I understand that you export
> > this)
>
> To tell the truth - I am not sure. I *guess* that if we allow this to
> be NULL, then one *could* implement a driver for IC where IRQs are
> optional, in a way that when IRQs are supported the pointer to handle
> is valid, when IRQs aren't supported the pointer is NULL. (Why) do you
> think we should skip the check?

Just my guts feeling. I don't remember that I ever saw checks like
this for indirect pointers.
Of course it doesn't mean there are no such checks present or may be presen=
t.

...

> > Why not to use devm_add_action{_or_reset}()?
>
> I just followed the same approach that has been used in other regulator
> functions. (drivers/regulator/devres.c)
> OTOH, the devm_add_action makes this little bit simpler so I'll convert
> to use it.
>
> Mark, do you have a reason of not using devm_add_action() in devres.c?
> Should devm_add_action() be used in some other functions there? And
> should this be moved to devres.c?

I think the reason for this is as simple as a historical one, i.e.
there was no such API that time.

--=20
With Best Regards,
Andy Shevchenko
