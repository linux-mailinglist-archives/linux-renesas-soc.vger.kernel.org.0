Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C112F3B7414
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jun 2021 16:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbhF2OTU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Jun 2021 10:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbhF2OTT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jun 2021 10:19:19 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6B8C061766
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jun 2021 07:16:52 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id y21so9823236vsm.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jun 2021 07:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=HWQ9MW7YWTP/ceIFfdVdffnRl6GhXqntP/PkJVsTCoo=;
        b=qGmVRC5L4DoR1psM3qUc4PEgofhpTETrrU8ovAe6mhclKt3yzCAZTh/1JnFuYJq5ft
         VcRGnnV9asGE5ElWiWU6SKQc6r4khHK1OdQNaOEUqLGNOA3RQ7PZo4PBQKT3TJuBXrjh
         bytvILYzqOWJfNCmbaR/oHgWTXlm1KwYc6JStSoeOrkNgScWd9XBEat8oQVHsm2TCvki
         8ND1FaWO+ulhBG+p3ZC/sTZNSJk4OV/qoYY+k2W5XBIF7rfHMKBcEUDapvAEPerqmEqL
         m2Ure4muGYWqcaau3owThuZ/DidkOXUxcIo0rTfqI7HJsqkeLo3SYk/CLQzXzfySb+/U
         HASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=HWQ9MW7YWTP/ceIFfdVdffnRl6GhXqntP/PkJVsTCoo=;
        b=mUKfJXSt9/kFKvF1tJMNhtKE7KQnMRzkURPF04nF+Fly3+Ga+TbkmSiz4BWaQlHyJZ
         32so36An5jp1wFMYVxJMRfIWUxL3fU8vkjxVVTZFwHE4N5oviyVREERGyI8ZDvMvuDE8
         8dK1FYF35nghl1KV2EHxr9shH8ST9Kl5IaNCWTyg3Ld7XueAXhzfXDFJqtHi+Kd+3fHW
         mc5kulsSKP+15AxiqAsSpSqXvoKSeuF1mK52hXPz3InO5rSB7BYzME36CYdRjG4nf+4i
         t+imLkKNUT5eEBOB+EOMKXeKoCI+LJ2+YafyCptsmb6UyR4pHp/L5A2uHdfXALttF+fd
         G3HQ==
X-Gm-Message-State: AOAM533x454NKROSsZqyVTvn+xgCEOqw4D/hugai4jh7pqESpPUYMlJe
        EJ7WAsY9T/gE9ylNWvmDdoYMIvZ/TBNfoaF2wnr0hUK6eQs+lw==
X-Google-Smtp-Source: ABdhPJwSBlZnBEZput0nn2MXxc3HAW6uF5RaxUsT8WJmJcVcukAcIMo/bVZcnhdSO/K72EmzYAP78laJorBHdn6w6w4=
X-Received: by 2002:a67:8783:: with SMTP id j125mr1483147vsd.42.1624976211220;
 Tue, 29 Jun 2021 07:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
 <bbfbed66-5058-1263-159c-dabd345286c8@intel.com> <563832257.373371.1624260736936@webmail.strato.com>
 <5adc8601-23c7-4378-94e2-cb3641d9039c@intel.com> <YNBJq7Lrtlc/qExN@ninjato>
 <b5062770-ba5c-32d5-15f0-505a09bb4a2e@intel.com> <YNd4vIJjpaSmFD9t@ninjato>
In-Reply-To: <YNd4vIJjpaSmFD9t@ninjato>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 29 Jun 2021 16:16:15 +0200
Message-ID: <CAPDyKFrA--dB1G4wNpo825EQcRDSVmT5mjVoMLK=ojU0k49JAA@mail.gmail.com>
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulrich Hecht <uli@fpond.eu>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 26 Jun 2021 at 20:58, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Adrian, Ulf, everyone,
>
> > With the code above, if the host controller knows the card has been
> > removed, it can return -ENOMEDIUM from ->execute_tuning() to suppress
> > the message.
>
> On second thought, I like the idea with -ENOMEDIUM. Because tuning can
> still fail for reasons other than a removed card and we want to see an
> error message then.
>
> So, I checked when/how to return -ENOMEDIUM for the SDHI driver but this
> lead me to more questions. The few driver which return this error code
> all follow a similar pattern:
>
> xxx_request()
> {
>         if (host->get_cd == 1)
>                 submit_mrq
>         else
>                 cmd->error = -ENOMEDIUM
>                 mmc_request_done()
> }
>
> So, my first question would be if we can't apply this pattern in the
> core before calling the .request callback? A lot of drivers are not
> implementing this pattern although it seems useful. Is it required?

It's required for some sdhci variants, because issuing a command when
a card has been removed can hang (or completes after quite a long
timeout, I don't recall, Adrian?).

> Recommended? Nice to have? However, I could imagine an answer for moving
> it into the core is "no, that should be checked atomically"? E.g. sdhci
> does it, but atmel-mci and s3cmci do not. If I just look at moving the
> card detection call into the core, I don't really see the reason for
> atomic. Am I missing something?

My main concern would be performance/latency, as we would introduce
some overhead for every single request. So, no, we don't want this in
the core in my opinion.

Kind regards
Uffe
