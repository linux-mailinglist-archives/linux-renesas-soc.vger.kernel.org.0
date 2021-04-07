Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E81356C9C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 14:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352420AbhDGMut (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 08:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352425AbhDGMul (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 08:50:41 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36A9C061760;
        Wed,  7 Apr 2021 05:50:31 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t22so5832884pgu.0;
        Wed, 07 Apr 2021 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=odfxOgEFbazcQxkiqXGX6mZFpA5eILHnpr17OV2XCaU=;
        b=mVDBTKQv7TfIACEsE4sYigo8uWD52sMQ3BnToMfaYVD6lDp0T0Z2JbvHOJJ+kaFzOE
         cI69GqRWGErXF2LAaOtbVbtn+b00podAXJn7HPczIBrSvvYomeTMFONvZlJ24+JFpigu
         K6dr31poLmQJBgnooY/ZdrfivS3ROE/Ra31uikPwG0pB7yhq0CU3KMQr7pvzGC6PDxOV
         n4bAOpIe7BfMk6aBnfpWaRrURkY+J1dLxH9/yThLJML71lUxjLRMa/KxlNIjFY/4x5LS
         TrUjf+1otxA5rSvWbfk5qUG5cqTP9VXhdyKhTM1xg25u1DN234lJbL8jWW/29mYBQWqb
         bfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=odfxOgEFbazcQxkiqXGX6mZFpA5eILHnpr17OV2XCaU=;
        b=CnPDzPk8DrR0tF7BH/IYZWmVocJFApTQaNXlthbYckkjkxAIUyO034oDqtWjbk+G89
         kVqRbqsnChe80py4hfhDpnKuHCyRejXR287pZyDy8OYrg0w7vwFr48roLkz5icjq+BKS
         uZ6Gi7jEOrPBpq2Vg+8Q0CJ69lVQJPpM4M7C3Q+i/L0zMCed+eWP9SoP9CkQPFbGu1CA
         HaxMTGPuSJ5n9pHUtOWT5qFsldg6qApFDt3ioOCdbITEt7mVgHd060StlhsNztnp3Gd0
         ss9EyyJPVlCVMp+9y6fYUf5LktrkuV8Lcip+OoRrbku1VoEjZ5taNIs5wP/EnLONIG+X
         jWvw==
X-Gm-Message-State: AOAM531Q/LUI0Z3CnBBrlofmgmHJS+3yaBeFxvv1q1HFjHnSAE31wyyE
        Te5fO6eliP5W/jAdDSuHSHUHdRKMPqCM8lZCtsQ=
X-Google-Smtp-Source: ABdhPJy4JG/ZVYTXffsdIvcItw5k2B3Jd2V5+an4bhnjC/ELr1e5u2RCtN6g8dUZfWNgtjc3LJiI6AReou8xgGxQv24=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr3186930pgi.4.1617799831387;
 Wed, 07 Apr 2021 05:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
 <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com>
 <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
 <CAHp75VeK+Oq9inOLcSSsq+FjaaPC5D=EMt4vLf97uR1BmpW2Zw@mail.gmail.com> <42210c909c55f7672e4a4a9bfd34553a6f4c8146.camel@fi.rohmeurope.com>
In-Reply-To: <42210c909c55f7672e4a4a9bfd34553a6f4c8146.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Apr 2021 15:50:15 +0300
Message-ID: <CAHp75VeX8H5E6GfVHxgu_6R+zbvmFV8fT9tO-nsm1nB3N4NF_A@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification helpers
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Kees Cook <keescook@chromium.org>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 7, 2021 at 12:49 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2021-04-07 at 12:10 +0300, Andy Shevchenko wrote:
> > On Wed, Apr 7, 2021 at 8:02 AM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > On Wed, 2021-04-07 at 01:44 +0300, Andy Shevchenko wrote:
> > > > On Tuesday, April 6, 2021, Matti Vaittinen <
> > > > matti.vaittinen@fi.rohmeurope.com> wrote:

Kees, there are two non-security guys discussing potential security
matters. Perhaps you may shed a light on this and tell which of our
stuff is risky and which is not and your recommendations on it.

> > > > > +       pr_emerg(msg);
> > > >
> > > > Oh l=C3=A0 l=C3=A0, besides build bot complaints, this has serious =
security
> > > > implications. Never do like this.
> > >
> > > I'm not even trying to claim that was correct. And I did send a
> > > fixup -
> > > sorry for this. I don't intend to do this again.
> > >
> > > Now, when this is said - If you have a minute, please educate me.
> > > Assuming we know all the callers and that all the callers use this
> > > as
> > >
> > > die_loudly("foobarfoo\n");
> > > - what is the exploit mechanism?
> >
> > Not a security guy, but my understanding is that this code may be
> > used
> > as a gadget in ROP technique of attacks.
>
> Thanks Andy. It'd be interesting to learn more details as I am not a
> security expert either :)
>
> > In that case msg can be anything. On top of that, somebody may
> > mistakenly (inadvertently) put the code that allows user controller
> > input to go to this path.
>
> Yes. This is a good reason to not to do this - but I was interested in
> knowing if there is a potential risk even if:
>
> > > all the callers use this
> > > as
> > >
> > > die_loudly("foobarfoo\n");

I don't see direct issues, only indirect ones, for example, if by some
reason the memory of this message appears writable. So, whoever
controls the format string of printf() controls a lot. That's why it's
preferable to spell out exact intentions in the explicit format
string.

> > And last but not least, that some newbies might copy'n'paste bad
> > examples where they will expose security breach.
>
> Yes yes. As I said, I am not trying to say it is Ok. I was just
> wondering what are the risks if users of the print function were known.
>
> > With the modern world of Spectre, rowhammer, and other side channel
> > attacks I may believe that one may exhaust the regulator for getting
> > advantage on an attack vector.
> >
> > But again, not a security guy here.
>
> Thanks anyways :)

> > > > > +       BUG();
> > > > > +}

--=20
With Best Regards,
Andy Shevchenko
