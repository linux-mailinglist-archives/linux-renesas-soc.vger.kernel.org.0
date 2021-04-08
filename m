Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4A135801A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Apr 2021 11:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhDHJ6f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 05:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbhDHJ6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 05:58:34 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5541BC061764;
        Thu,  8 Apr 2021 02:58:22 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id g35so1037766pgg.9;
        Thu, 08 Apr 2021 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ue40ewHAI4uiQ6hRTjLSskTwbkPepkxZffVqOvWwGN4=;
        b=VX75hB/d+8mMCu+ggSpvi07Uyq0zK9BR4PklvQ7ruLPi36idGsDdUPHfPOlCHA9VQ3
         JJUJ7hwV81tIZHUOOaxjLJLt/MqaochvcFVikB9Mhtfo3xcRdtoeFJQfmN+HHAL7B7d3
         X+dZIkmS8SLKm2S93v2ImIp+TLL1FGkxkHZ8jti2WFDQ9ohzdGRGOZmt/mXQZSCC6FBx
         sZAHf0MJFFMG4tNjYwwvIhQom4WxjwcGEcfbvtWEEKqmJUJ0aGOhx5v/qbyGnn9dVzSy
         CDlEQWlCu/TQ1EGEbu2XbAY2E5CoLuItZBiDojeuo3SMH+YhE/Ntr7khPCvvC46s/UqZ
         9zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ue40ewHAI4uiQ6hRTjLSskTwbkPepkxZffVqOvWwGN4=;
        b=pZNSL3OmZFUy7QxigNcD4WqPYxK+hMBlQS+D4zxOPw0mCBhj7kdYDriO7n6cS3K+Az
         Puc2ryYH9Uyub9xUobtj/+pxyg+J/75ZJLijEhe2iouxx5Cr1RFH6NG0c0ZZdmQGnuAY
         pGXIMvi0WyOFjHW85DCANclMb8qxqKkA0cEwH20INq0XrQRHNUVpUpTl3EB3jIZG4gZ8
         AiJbUTOUOfChgE0rXbIOyhtAbSxwBxivb7vzCCGlj97HU3m/duEHT8zii4YtbYWJiLy6
         HUX3Hu2N53+UiXXawigFg7Mt/AR2HMB8ANB/uWTH5e3WGSUwEbBPLgVPsCFx5I7dgqXM
         CHvQ==
X-Gm-Message-State: AOAM532nWkTgKCVQZYtGbCdvVTg4KKLSvc0WcugLJ/1+XazkkIlGCTBe
        gJzKCXZXLQHIwtn30ukGJ3xFj1clSTfdZPkAyZFwkNrB6UKydQ==
X-Google-Smtp-Source: ABdhPJx9AwLvhwo6wJE4rPBHzpfPbvHAuy9BGwJ0nE8DHgZJjggU7EWcYKPyDPQ3akekICOsHGK5x7y7uGZZ22sP3+Q=
X-Received: by 2002:a63:c48:: with SMTP id 8mr7279097pgm.74.1617875901727;
 Thu, 08 Apr 2021 02:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
 <0862bbb6813891594f56700808d08160b6635bf4.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VcHeiQgvZ5e+Dz+gpKghCo5RSTQLsyHGGSgdVQbVu2t+g@mail.gmail.com> <23c73081365fddce2950c101a51fc2baaaa37aa5.camel@fi.rohmeurope.com>
In-Reply-To: <23c73081365fddce2950c101a51fc2baaaa37aa5.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 8 Apr 2021 12:58:05 +0300
Message-ID: <CAHp75VdYniyc8jovg9VDgwQ+_VjYOoAubB_QSokEN+REcnKTrw@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] regulator: IRQ based event/error notification helpers
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        linux-arm-msm@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 8, 2021 at 11:21 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Hello Andy,
>
> On Wed, 2021-04-07 at 16:21 +0300, Andy Shevchenko wrote:
> > On Wed, Apr 7, 2021 at 1:04 PM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > Provide helper function for IC's implementing regulator
> > > notifications
> > > when an IRQ fires. The helper also works for IRQs which can not be
> > > acked.
> > > Helper can be set to disable the IRQ at handler and then re-
> > > enabling it
> > > on delayed work later. The helper also adds
> > > regulator_get_error_flags()
> > > errors in cache for the duration of IRQ disabling.
> >
> > Thanks for an update, my comments below. After addressing them, feel
> > free to add
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> I (eventually) disagreed with couple of points here and haven't changed
> those. Please see list below.
>
> I still do think you did a really good job reviewing this - and you
> should get the recognition from that work. Thus I'd nevertheless would
> like to add your Reviewed-by to the next version. Please let me know if
> you think it's ok. (I have the v7 ready but I'll wait until the next
> Monday before sending it to see if this brings more discussion).

Looks OK to me.
Just rename die_loudly() to rdev_die_loudly() and in any way of
conditionals with that, please mark it with __noreturn attribute, so
if (bla bla bla)
  rdev_die_loudly();

will be an understandable trap.

-- 
With Best Regards,
Andy Shevchenko
