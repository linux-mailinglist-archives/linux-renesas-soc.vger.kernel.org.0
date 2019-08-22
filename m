Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D098F98FE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 11:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731340AbfHVJoE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 05:44:04 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:35775 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbfHVJoE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 05:44:04 -0400
Received: by mail-vs1-f65.google.com with SMTP id q16so3430446vsm.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2019 02:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fHF0uBZmXPLrSwiBYQkhsTMGlZc4A942rWI92bbgZxE=;
        b=MZ6oy5MOHmgY8+3P355dvmoZnjP0ZrV2P4rJUVUSXRO7/cPovtoFdVcLJrTsvSZrO2
         nx0eXO/WhkLkTEEZyY2ckuc71hEr3vyflRJW9AlwV+sP1Ax4i6vtqmmFpTzv0BkhtoVK
         JTPCQzOfrdvheY/FUR3eNCPDWW1/5d42P9ghVac9L6KiLwq7Q53cIpu2P1N863SBErE+
         VaxvAnOne+T1GlMT0RFiIKb94s9QL1QQM258G3kOpbiKrqqr+SrgLagSFvqLX+Vy/ZfH
         nEvisEg9IWgkYlvd9E2dzr4W1eIKIjZWgqRlZmAMEPoUJ3o3aZ8QXTGrAl9AtL6AjQed
         GCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fHF0uBZmXPLrSwiBYQkhsTMGlZc4A942rWI92bbgZxE=;
        b=ljZ0gk1MxNPLOjuR+F9Kmt+QhjrYFblAIi5ZxZlXHAiq2zQAaSy5CMEiCQwm+t4obC
         q7UK+SGfEN/oDwq+7q/Rqi4Zj4fK8JESo/Jf8y4fAFROMfNn+SgF+95IeFU0Fo1lf6fM
         1cuqPx9IbGyiTKRasg5X5b2YQaiBJzBPpaESkYt9n07RWfpSaml7SU00XDm3vOkHWuq4
         x5BHzAYEn1fqrEpaboNenlG/qFkMkfFZ/t6YSSivKpm5lTU/XYy5F+kTMySh7icTGp24
         UCvwptqCC58YgmvUdjFUgBrxcm/mMNb5oHQsJqLBiXp6cFOG/+r1xMc03Jf7rXyH0OJ3
         2xug==
X-Gm-Message-State: APjAAAV4l61vvjmkCVWDv/2V23HzUanGeXAaa9LY5ae0QJnLa3/PgNZI
        WeQrmKgiSBIErz0Bl4RJKA/sKfntAqT9HbmQWqGCTA==
X-Google-Smtp-Source: APXvYqz7PeVkGEjpUb1qE1OdErxOLOD8Y4dpB0ePKdGMA4v84aOewfJ4bZxRilyRMJRTdsSR1I0ACb/LC1QzOpbMsEY=
X-Received: by 2002:a67:61c7:: with SMTP id v190mr24305726vsb.165.1566467043632;
 Thu, 22 Aug 2019 02:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu>
 <1564589857-17720-2-git-send-email-uli+renesas@fpond.eu> <CAPDyKFotQvTAC8OVVRiEqLc0ij3XNVdL3eyNHioK0YEWxvER0A@mail.gmail.com>
 <20190822063530.wzee6gy4d2lisj2x@katana>
In-Reply-To: <20190822063530.wzee6gy4d2lisj2x@katana>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Aug 2019 11:43:27 +0200
Message-ID: <CAPDyKFojrZB819DvViyP_cAf=s1y4jpHjYKis37XO2ZOSkH1Eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: tmio: leave clock handling to runtime PM if enabled
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 22 Aug 2019 at 08:35, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi Ulf,
>
> > > +#ifdef CONFIG_PM
> > > +       /* PM handles the clock; disable it so it won't be enabled twice. */
> > > +       if (_host->clk_disable && pdev->dev.pm_domain)
> >
> > Hmm.
> >
> > This seems to work for most cases of yours, but it's fragile, because
> > how do you know that the pm_domain above is managing the clock? You
> > don't.
> >
>
> ...
>
> > I am going to think a bit more about this, but at this point, my
> > gut-feeling is that may need to add some helper functions to let genpd
> > and/or the pm_clk framework, to share some internal information with
> > drivers.
>
> Any outcome of this? Do you want to do it?

Sorry for delay, it's been vacation period. I have some ideas that we
can try out, just not yet being formalize them in code.

I need to catch up a little bit more on mmc reviews, so unless this is
urgent, I can offer my help and post something soonish.

Is this fine by you?

Kind regards
Uffe
