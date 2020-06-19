Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E292016AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2020 18:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390209AbgFSQde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 12:33:34 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:42374 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389460AbgFSOvb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 10:51:31 -0400
Received: by mail-oo1-f67.google.com with SMTP id 127so1934876ooc.9;
        Fri, 19 Jun 2020 07:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bJFYbFCrsPdWe/xZfbajjRe6GBurn8Q+z5Rl0GsivUE=;
        b=g3NhBsWh4zoVQBO5xwmi2X/35gY9D6LekWf/YecliIycznBUWWOeTJsQ4xXIithriP
         YTxo6PaksL+5VWas48eJ1XJj1BIOFRG1wlFBqqx7FwmJh3KbUVR8pSEb+BGJRw6rLOLr
         JLZTM4kuhtWLo4vE5dwi0ihcAqIEMk84EMpX8TO9QsrMA82H44DqSBdhHg44DYrMpBfz
         98MniPCUUUnLziGVaixuBb8/WODJzzVdxXRGTc6jaReVJs8P0luh9NBgl/SxDxtQkc52
         OoG4GB6+fOykyZ3E0wL7cNttSlIJEOhhszXIAjtabtizouDm0kvH12JiMD1Eu0ldmyrJ
         Af2A==
X-Gm-Message-State: AOAM5331BS30TsRRMV8P1vBypXs6xxjewp7kUY5bn9u88M575ypTdZ0T
        918uOPt395hbdIjprXFvecFRfDOR5CN2RwOVECuOQWXr
X-Google-Smtp-Source: ABdhPJy0Coxpt/4fMimNdZDRdevNU75GhwFunAubdWuwkhWCZUVekNYh1JkaUavS8wVGdcv22mB77tagVxninzhIG6E=
X-Received: by 2002:a4a:5744:: with SMTP id u65mr3565759ooa.1.1592578291406;
 Fri, 19 Jun 2020 07:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <1592566143-4546-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1592566143-4546-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Jun 2020 16:51:20 +0200
Message-ID: <CAMuHMdUEahv3bPNfOmzA5fdkJdkmx4nEqPqWKMYt2O=ZRJOiTA@mail.gmail.com>
Subject: Re: [PATCH/RFC v2 0/2] treewide: fix _mmc_suspend() on PSCI
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Jun 19, 2020 at 2:42 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> We can detect whether the system is going to suspend by using
> pm_suspend_via_firmware() API. So, this patch series update
> both PSCI and MMC driver for my environment (r8a77951-salvator-xs).

Cool, didn't know about pm_set_.*_via_firmware().

Looks like this can be used in the clock and pin control drivers, too.
Currently they're checking for !psci_ops.cpu_suspend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
