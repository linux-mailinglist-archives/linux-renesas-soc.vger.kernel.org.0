Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E375215825
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 15:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729182AbgGFNRh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 09:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729072AbgGFNRg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 09:17:36 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AD8C061794
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2020 06:17:36 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id u133so7011998vsc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/aHB6znSrR8BPwCLwuSQEuDjMcKr7HpM9fzYrfr9Lls=;
        b=Z1kRN5FGQUmhzvjJqlhPaYkAiQFP7M8cqiBCnuhEwP8WR4X4QlhYBoAHjzK7RMpLzq
         3UWVWqbj4vSr5aTZJHb0T6xWckIaoUwpKHZRPln6N8W+XIYAlA0V8Qig98IwRg9bwYm0
         N5rSdckRHH2ozqrwO/06ZrODxmyTbBjLKALjxH9nsKjLNAqSBwSchYyoDhUje+S4Skd+
         TPT5hmEQX+P1ub4AUSOF/klFXUjUz1FSpcQXBBmu9IVhJe4drQuxY6TJW4KOfCI1XZjV
         5EcHTp+TzCrmoefEJcSivZK/MRdtonVR+Ia9DBiLLmH0kNXSTHoKV+dgozyvjnR9+UPr
         ba0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/aHB6znSrR8BPwCLwuSQEuDjMcKr7HpM9fzYrfr9Lls=;
        b=cuEI9e8UqHfZjWG5950ZfTUy4/SzP/y7mXZUlqklPYwAmE6LTUGDEQClN0QbCfYOGc
         w0s8yHzkK68X4vHo5zjjJ9PtXE+D6Qp7K7YS4D1c5kOa9HruclZwaCtRcanGs0X1RfTU
         rjUvDvsQpGhOSmUG2v3J3qhBiYxMpaCAB6M79ZeGGTZ5SsW9SDcIjmuIuOspZDiL0Wkq
         Jr4pUtclb3kUM0fuFZKjP4o5LMXkBz8deimBEUKmcGT38boFldaMOih5UadipH+Gen7U
         6A2DXS3FNbA5+2qkEx38EP4qbHy7OrThElLvaWwCyMGyQ1hsHsNbvp/zbu5flksL2W6h
         8s7g==
X-Gm-Message-State: AOAM531IwXB9HNmkNsSDPNxgHef7KX0TZiuzQ1sKb74XeXLQ2Q1/IO75
        woUi+/aTmVA2jiYC+UV40IZOYs81snErvDb24QXPnDTsTtI=
X-Google-Smtp-Source: ABdhPJynWuA+T7eHRKr24+OF+y1WgQl4X8QhJJGe9b4BUfYDCxSTBL24IRJDgX2ULPXOMSZR+UZgsWHUgsDNTZ4/Bx4=
X-Received: by 2002:a67:ca03:: with SMTP id z3mr28797268vsk.34.1594041455639;
 Mon, 06 Jul 2020 06:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36921D805C79B829563698D6D8B70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200602125131.GA1318@ninjato> <TY2PR01MB36926A830866FEA2C49735E0D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36926A830866FEA2C49735E0D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 6 Jul 2020 15:16:59 +0200
Message-ID: <CAPDyKFpzZG-LFbCDZYZx7J9sH536dcyHvoatCD4F-AvzM1kaZw@mail.gmail.com>
Subject: Re: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma unmapping
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 4 Jun 2020 at 04:52, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi Wolfram-san,
>
> > From: wsa+renesas@sang-engineering.com, Sent: Tuesday, June 2, 2020 9:52 PM
> >
> > Hi Shimoda-san,
> >
> > thanks for the patches and for providing a test case. I was not able to
> > reproduce the issue, though. I'll explain...
>
> Thank you for trying to reproduce the issue!
>
> > > Note that this patch series is tested by using additional debug code [1],
> > > because there is difficult to reproduce this issue. Before apply patch,
> > > When I enabled CONFIG_DMA_API_DEBUG and CONFIG_DMA_API_DEBUG_SG,
> > > I observed lacking dma unmapping on /sys/kernel/debug/dma-api/dump.
> > > And then I confirmed the patch can fix the issue.
> >
> > So, I have this debug patch applied on top of mmc/next. I have the above
> > CONFIG_ symbols enabled. I have _not_ applied your three patches which
> > fix the issue. I mounted the eMMC and read a large file. I see the
> > injected timeouts happening:
> >
> > [   94.079560] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
> > [   94.088668] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
> > [   94.097727] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
> > [   94.106768] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
> > [   94.115848] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for SD bus idle
> > [   99.300589] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for hardware interrupt (CMD13)
> >
> > But I do not see any output from the DMA debug system about a missing
> > unmapping. I expected that, though, because your fixes are not applied.
> > The testfile could even be correctly checksummed after reading, just
> > awfully slow, of course.
>
> I'm sorry, I should have shared my log. My test case is:
> - Use dd command as background.
> - Read /sys/kernel/debug/dma-api/dump while the dd command is running.
> --> "ee140000.sd" lines are increased gradually.

[...]

Just wanted to check if this is ready to go or more tests are needed?

Kind regards
Uffe
