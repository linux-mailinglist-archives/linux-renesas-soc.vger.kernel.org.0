Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121D046A21B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 18:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236431AbhLFRIn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 12:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348921AbhLFRCs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 12:02:48 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949F8C0613F8
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Dec 2021 08:59:19 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso394584pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Dec 2021 08:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xl40T9Gw1Z/pReDWz9RKjeWLLFQBTII3bcCrYABtxh8=;
        b=BOBm+DqR/gK5tu3hlp6xscrSUvTv7z0t9CfYqT1xxLdcPbqWyrZeEpI2ClFy7WODq+
         SrZZt2DhlYHR6r2e9M/mZydPAYn+7PXPfkzknlz32w/Sl/6GnGpdR0cvsPF7FHyVhdgs
         8blpeSAZXkSYhRWmfuWoEFrWgxkSLbs5SgrPEnVD54ErwSXMZtn/FcBymq5g7/ACHd3f
         kanRiHkOSg2/4MBX/frRqWwC/yMCWMbIu3FnDlBAIAn1buwY/ixvue1/kBMLsdTT+1d2
         itzySHDjQrOTEr0E7RIM6a0QgLfQLJifFl4ZmLXFw27C8zK2Y9nAcHQa+b+tzB6NlEdO
         bgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xl40T9Gw1Z/pReDWz9RKjeWLLFQBTII3bcCrYABtxh8=;
        b=oERZdLBWCLjKZOwXxOzemtdK6N9Ow9FeLN/qYSkK176BobA+RuigY0VPiCiV/kB2AS
         1QDPEfY5vRw8tN282+hnVJIUcoRAU12d9kXB4eLasUntSIOcqLBaLfbBft1oFGJlQ1XX
         aunWhfjexag9EETOncbvzgWL0iEIvQC7IBuK2mzDBJYB1JVYJUzvtYy0X2P7hdebTKcC
         4UnqKedgjq4q3FLNIYWrbv49w1yEf4WTArNHL99byYPKIi4YlWCTbEvygTM3deWvRF0J
         6tLyx1o0rN2s1IS1DDk5IokzD9bJhzvUgtsS9i1LobCD3e6mkYkP/K7Rmcod58cYCam5
         rNBQ==
X-Gm-Message-State: AOAM5314hznSGUTrUWJZyN3qX78l5idZSOycaAcy3fw9ZTLuoe5ajXzU
        A7aBoCouzJ0yEuMCQ50RjMySqdbZsL0hew==
X-Google-Smtp-Source: ABdhPJzXGEUMxNzipLMgCY2YbhbYk3RIcW7rP+QhaOsD207qzmPA2JdrKhSFPbQbs/EfG5ngY9SEjQ==
X-Received: by 2002:a17:90b:1e0e:: with SMTP id pg14mr38050497pjb.143.1638809959057;
        Mon, 06 Dec 2021 08:59:19 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a18sm12237870pfn.185.2021.12.06.08.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 08:59:17 -0800 (PST)
Date:   Mon, 6 Dec 2021 09:59:15 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Julien Massot <julien.massot@iot.bzh>,
        =?iso-8859-1?Q?Bj=F6rn?= Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Initial Renesas R-Car remoteproc support
Message-ID: <20211206165915.GA1054683@p14s>
References: <20211130100049.129418-1-julien.massot@iot.bzh>
 <20211201164616.GA834591@p14s>
 <CAMuHMdUE4HpA_JKiTDiMhUcPi99RvtoPm3A1cFD8MjpAkwtYWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUE4HpA_JKiTDiMhUcPi99RvtoPm3A1cFD8MjpAkwtYWg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 02, 2021 at 02:41:57PM +0100, Geert Uytterhoeven wrote:
> Hi Mathieu,
> 
> On Wed, Dec 1, 2021 at 5:46 PM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> > On Tue, Nov 30, 2021 at 11:00:47AM +0100, Julien Massot wrote:
> > > Most of the SoCs in the R-Car gen3 SoC series such as
> > > H3,M3 and E3 have an 'Arm Realtime Core'.
> > > This Realtime core is an Arm Cortex-R7 clocked at 800MHz.
> > > This series adds initial support to load a firmware and start
> > > this remote processor through the remoteproc subsystem.
> > >
> > > This series depends on
> > > https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211022122101.66998-1-julien.massot@iot.bzh/
> > > to be able to set the Cortex-R7 boot address.
> >
> > The above depencency is needed for this patchset to compile properly.  Since
> > Geert has already applied it to his renesas-devel tree we can do two things:
> >
> > 1) Make this set go through Geert's tree.
> > 2) Geert publishes an immutable branch I can pull the dependency from.
> >
> > I'm good either way, just let me know what you want to do.
> 
> I prefer you to handle the remoteproc parts.
> Please find a pull request for the immutable branch below.
> Thanks!

Perfect - I'll pull from this branch when I receive Julien's final version.

Mathieu

> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
> tags/rcar_rst_rproc-tag1
> 
> for you to fetch changes up to 4c7924fb905b02323ff6d9d20f370892615dccfa:
> 
>   soc: renesas: rcar-rst: Add support to set rproc boot address
> (2021-11-15 10:01:10 +0100)
> 
> ----------------------------------------------------------------
> Renesas R-Car Reset Controller remoteproc API
> 
> Definition of rcar_rst_set_rproc_boot_addr(), to be consumed by the
> Renesas R-Car Gen3 remote processor driver.
> 
> ----------------------------------------------------------------
> Julien Massot (1):
>       soc: renesas: rcar-rst: Add support to set rproc boot address
> 
>  drivers/soc/renesas/rcar-rst.c       | 43 +++++++++++++++++++++++++++++++++---
>  include/linux/soc/renesas/rcar-rst.h |  2 ++
>  2 files changed, 42 insertions(+), 3 deletions(-)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
