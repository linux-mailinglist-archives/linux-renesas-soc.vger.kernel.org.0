Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E94203BC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 18:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgFVQCK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 12:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729095AbgFVQCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 12:02:10 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6D7C061573;
        Mon, 22 Jun 2020 09:02:10 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t6so519280pgq.1;
        Mon, 22 Jun 2020 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ex/MGtr6XdjZi3YBBL+34LNCdYlRi5rhRR2vn23AB2k=;
        b=eM0HtgeggVNiS7XaE8CRSBLD+N1Ut5qHkgwpv8YgG5OR+kXCcKQbG+d8qlkijLilkR
         2ppAeN8IKYAv90p1pS3VTynI3pX5S/hbkOXhgv6HTFPTdtZ7ISIS2pMDyiOq7qBvaCRf
         uF6vLI6hujEPdQ29jsBtigVIIvisXv0Y6SRaV9lZ0Lx4MYOqyWNJUYkfFuoEc//fIED1
         KhXtpJqUqVeJ4fvF17N0Sd23zP7YTZvBj9AvaULGB7fSlmKjW/1mxeRx3cQ0u6GcV1w2
         caP9/zVw7MstLqsUJpmSJA51dahorK4NRDfPRU6aE2DVWTMwyWVzlS4QntgxTPqPMVlP
         y5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ex/MGtr6XdjZi3YBBL+34LNCdYlRi5rhRR2vn23AB2k=;
        b=g1hmFX1kuJcLPPKUODjp9cSsbFtQMtg6K/6Er3cvCAr3lru/faj16KLTPWL8ZAEnrz
         3pJNzZWrjJXEsGGQvQol7bSqRZGRm9kMg1a/XurXXVIQk9cORE5jG1eLcfM50QEYBD19
         8xUk0GcmkmnA8UyjQAmy1oxl+2EZM+mR/4EeZ89qhf/hcc0DVsGjX4unqNAa+yPanBce
         rmv9VG+JbmDQLnoGxv5L/WRcJRrnEt4/b138M88XsV2lWSpw2Ps/C3XDoLV07ECh2mhH
         s6FX104sY4VoKRWCUSpnsqvIm95wCW2zZzARIox7v2XZFqhOgXd5OGB9atJOxdTxqKfb
         VxNg==
X-Gm-Message-State: AOAM530MpRxWcfue08+895Pgt05TbzwfqNVGv7AVrIKbXjcPVGVs9RBO
        6W1Etr2eUZMvtgpBh2j2llRGEEuZVS1CeZESKN7GmBDq
X-Google-Smtp-Source: ABdhPJxNQ4G7r+VSYQX5hUPYo6VQs2EuES7DBCQNe4WwmL5LXpVMt7McByXIWcHbVOVmQ7h8SaXEKAdBkr+Oc2TVivc=
X-Received: by 2002:a63:f042:: with SMTP id s2mr13109042pgj.4.1592841729640;
 Mon, 22 Jun 2020 09:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200612124844.19422-1-wsa+renesas@sang-engineering.com>
 <CAHp75VdMPt60CKnP1HtkN8=3iY7+Kgrv6b9DTjcj-KMKaRknvw@mail.gmail.com>
 <20200613113924.GA5578@kunai> <CAHp75Vckh3NERodBs3e8wo3NxbrP=BPRY5g7MLmA4szqLFcfjA@mail.gmail.com>
 <20200622155616.4rbhhiuce36aqc4b@katana>
In-Reply-To: <20200622155616.4rbhhiuce36aqc4b@katana>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Jun 2020 19:01:57 +0300
Message-ID: <CAHp75Vc5+8Sw2uOtZofYi4vzSWJmZVtZry35B39zJUz5oO5dzQ@mail.gmail.com>
Subject: Re: [PATCH] lib: update DEBUG_SHIRQ docs to match reality
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 22, 2020 at 6:56 PM Wolfram Sang <wsa@the-dreams.de> wrote:

> > > Maybe your case was like Krzysztof's case where the issue turned out to
> > > be the extra interrupt on deregistering after a deferred probe? He
> > > thought it was the initial interrupt but it wasn't.
> >
> > Commit
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iio/pressure/bmp280-core.c?id=97b31a6f5fb95b1ec6575b78a7240baddba34384
> >
> > The relevant IRQ core code
> > https://elixir.bootlin.com/linux/latest/source/kernel/irq/manage.c#L1774
> >
> > It runs it at deregistering, right.
>
> So, can I read this as an Acked-by?

Yes. It means I agree that text should be fixed. Alas, I'm not native
speaker, so I can't check the text for (stylistic, spelling, etc)
correctness.

-- 
With Best Regards,
Andy Shevchenko
