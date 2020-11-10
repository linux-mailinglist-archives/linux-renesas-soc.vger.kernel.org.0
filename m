Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBE32AD701
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 14:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730344AbgKJNA6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 08:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJNA6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 08:00:58 -0500
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A366C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2020 05:00:58 -0800 (PST)
Received: by mail-ua1-x943.google.com with SMTP id q4so3902589ual.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2020 05:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/6YurlLlicIVj7vLlm8si4vZRusPlgVaXDTWA7wmn+g=;
        b=rDNNZITX2eio3Y2gggFJkipPaqFZoZQ3tJdsafYlzEG4BApRQhWQFPJDQF//QFxRya
         hUiOKYI6hcoVOROiTkiedKf2AEc98+40lH8xz9TTtY1F0mg1BUw8ECnE7rclmWMzz0e+
         qxTnzDE3DBtGZwoScLgnikl5ly0U6vleBlO9WEynAQ5nlxswg6+tcFAqgC91LQiosFKh
         hilZI/29fQQLxqr+cbXrndzeA2hSTAEBmoW46D6JvX+h2Hl3LAnXGt1YWaMBvLhQrGBQ
         E4SJf6uLfHubJB99tf60FUa5hUaK2kKE++miD3zZzsLSNdjw9wN0BGK3FGAJD64rhRe1
         yXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/6YurlLlicIVj7vLlm8si4vZRusPlgVaXDTWA7wmn+g=;
        b=ez4u+DVQE2aOHKr//BFQY9+ORooQD72fheHlTdW9zaD6+GYLrIh0TO5rto9V8MivUL
         /XHDAWYaCuUlJ3yK7jGin2hpsR1Pk8C81+YE/+SJ8QOl3jNZNx0KDxMhYphksn04ORaI
         C1TNFATItaONr0oDyZ1amM/npXW9bV50PwWtynyncwoMwCmKbVpqyeCtKc5uZaDwOyZF
         Wmc2IuAdbQQFBQ0ncEPEx5gobQDAhX9mLExxwK4MGr8ratywsN5PXkGUd0gR8grzWZuy
         3FFVxMWQ0bpohoeNo5wHZKGMN/BYbEBSro3xAEXaAPxyojECDzlvcYEYIqie6BtUiEr6
         lB8g==
X-Gm-Message-State: AOAM533yPzUVyJMwWucwjDhxQkX4GaaXq2913lorpmvtwHC3KXgSMG0q
        uVVYzOuPmjYULm4M/attFpeIj02nBRnJw58nO0QcZxp5VGOa0A==
X-Google-Smtp-Source: ABdhPJw3KTVisdj01eFLXUGuNaz3s+PkFiTbMVxRTquH65s3FQzzLHnoZJSAsiB0Ngt1mKU7ftVcAST6y5t4FF5A2hI=
X-Received: by 2002:ab0:7103:: with SMTP id x3mr4441288uan.100.1605013257136;
 Tue, 10 Nov 2020 05:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFpGX0HOQr4z4LEH9FLiqeRJzNiUpBLpCNquJGJnZNFycg@mail.gmail.com> <20201110124018.GA3612@ninjato>
In-Reply-To: <20201110124018.GA3612@ninjato>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Nov 2020 14:00:19 +0100
Message-ID: <CAPDyKFqT0Yz=aKku_OFj3=dDaBpK6kdvAPOOV9_xAvQ_yt+1bg@mail.gmail.com>
Subject: Re: [PATCH 0/3] tmio/sdhi: fix workaround for a regression
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 10 Nov 2020 at 13:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Nov 10, 2020 at 01:26:08PM +0100, Ulf Hansson wrote:
> > On Fri, 6 Nov 2020 at 08:26, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > After some refactoring, I had to insert a workaround because a
> > > regression was discovered when re-inserting SD cards. Now, this series
> > > implements the proper fixes and finally reverts the workaround.
> > >
> > > This has been tested on Salvator-XS (M3N and H3 ES2.0). These patches
> > > were already discussed with Shimoda-san and the BSP team internally.
> > > However, I'd appreciate Shimoda-san's tags be given here to make sure
> > > the patches are exactly that what we discussed.
> > >
> > > Thanks and happy hacking!
> > >
> > >
> > > Wolfram Sang (3):
> > >   mmc: tmio: when resetting, reset DMA controller, too
> > >   mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF
> > >   Revert "mmc: renesas_sdhi: workaround a regression when reinserting SD
> > >     cards"
> > >
> > >  drivers/mmc/host/renesas_sdhi_core.c | 13 -------------
> > >  drivers/mmc/host/tmio_mmc_core.c     |  7 +++++--
> > >  2 files changed, 5 insertions(+), 15 deletions(-)
> > >
> >
> > Applied for next, thanks!
>
> Can we have this in 5.10, too?

Of course, thanks for the reminder! I have moved these to my fixes branch.

Kind regards
Uffe
