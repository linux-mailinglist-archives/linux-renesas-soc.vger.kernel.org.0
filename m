Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E3340598A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 16:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240206AbhIIOr2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 10:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245352AbhIIOrG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 10:47:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C72C04E203
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Sep 2021 07:36:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s10so4126457lfr.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Sep 2021 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=nfWuSYzOTRC59I6qOR1SYjFia3S5j3gRmLTCIne6P4w=;
        b=gv1filuwoj0quZ94cE+P7k2HrzlA86DLQyp/KFSQcMddUY50QDF5PXQo4FKTrN+E1k
         2oeIzYOsMUCIEGPP5DLfBk7GLfGmxF5arlIos/kVpbwIbokkO5H9JGrMGyfjbRrag+7b
         GL4htI7Zup5tJ5I/oZwE8xpxRfWikWjh7G0Imo1V6rCvtO/F291ATBkUqqvNEeNWJYSt
         jZiEZBfAXRTFGKAm7KH7JnTB7iTCHVN7xpoZCsDUmcixxPx3KAUlK+yE3bFXqsatW6kU
         e5m8bkUZac7uz/zFTSrOmpEgYZXcse/3Z6deYhACYniCrX6oTmoJpMrD9q6sWpUWsVnl
         nYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=nfWuSYzOTRC59I6qOR1SYjFia3S5j3gRmLTCIne6P4w=;
        b=vk1DSAopLEKJU7vgFhSHCdbHXteRpopRlIdkT2ifPYDXXffyCZAMKsilENLgW6bFDn
         a17uQQS8qGEtgzvJfp3uDzN8SWGVDS8tTnSNNzSsTZx2ta/pEeAz9PRZV3NqC49SgM75
         nTb/PPX6uI1JB/qGJ3WonBp+RhD7unuZ7kDUitlzVS3c4OOYhvKWfa3JrjkRYKSbv8GQ
         Su6C9/ErSJhMFk23pRvYmUpFDHzzjSVeXIPhTU1MYlHhvQAErXnBXWRhrpAAShUPUSiv
         Q7IRv5H0uunDqLgLfZMeldDGLgOzjtLTT52gqfQ0dTY62B2BgwWtWSozHOXCi6pYSIsS
         1B7w==
X-Gm-Message-State: AOAM5313cTwwG7DqS2sE5Vz5x+79okcFamCC2+/RlACVjr54i6fKTQhb
        C2LpE9V3aUhGg9vJaqtFfS6Cva48eEc4wymEhjKhUkb2Xi4=
X-Google-Smtp-Source: ABdhPJz72X997WnFW2qZfhlhkH7As4zPBZKYQUMqXXBf92uIDZfUoMxjzPK3+3Lgd8EFuR5giPXv2D7+L/O6lKYQcrQ=
X-Received: by 2002:a05:6512:1043:: with SMTP id c3mr149496lfb.358.1631198165457;
 Thu, 09 Sep 2021 07:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210831133349.18203-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFptgZgDsKyHt-sO6yyRBm+LqeWkwOSoB9ED+b3QTPqD-w@mail.gmail.com> <YToGHbgakZdrY/4R@shikoro>
In-Reply-To: <YToGHbgakZdrY/4R@shikoro>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 9 Sep 2021 16:35:28 +0200
Message-ID: <CAPDyKFpRA79THAEsuuNj36UY5KtsMJRP4suUDJwQNjwTkfo+vw@mail.gmail.com>
Subject: Re: [PATCH RFC] HACK: mmc: core: also abort tuning with CMD12 for SD
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 9 Sept 2021 at 15:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> > > 1) despite not being mentioned in the spec, do we want to allow CMD12 to
> > >    abort tuning for SD as well?
> >
> > It sounds like we should give it a try with the CMD12 command for SD
> > cards as well.
>
> I think so.
>
> > > 2) If so, how to make sure not apply it to SDIO but SD only?
> >
> > For now, I am fine with adding a new bus_ops callback
> > (->abort_tuning()) and then let mmc_send_abort_tuning() to call it.
>
> Cool, I like that approach.
>
> > I have some additional plans to improve life cycle issues for the
> > bus_ops, but let's ignore that for now. I can deal with that later.
>
> Ok, good.
>
> > That said, mmc_send_abort_tuning() should no longer need to take the
> > opcode as an in-parameter, thus some additional cleanup should be
> > needed in a few host drivers because of that.
> >
> > Would that work?
>
> I think that would work nicely. I will have a go with the above approach
> and come back then. Or do you want to implement it?

Please go ahead, I can review it.

>
> Thanks and happy hacking,
>
>    Wolfram
>

Kind regards
Uffe
