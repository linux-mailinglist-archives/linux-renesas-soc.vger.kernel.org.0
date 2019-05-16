Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8333210E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 01:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfEPXDD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 19:03:03 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44066 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbfEPXDD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 19:03:03 -0400
Received: by mail-lj1-f193.google.com with SMTP id e13so4551861ljl.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 May 2019 16:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XFSIa+E7OYrNPKaA6up2MDnwHZn+V1T0FYHp1giQMVQ=;
        b=LzMq7KtbgCYXh+SYH+KPCbuzKcdThlqrvO5aFkcMnfZMQMFujKw23mcDzzjME/glzQ
         KIl8VuAJbKO6ISqTIkcCinXglCzU0zVuaBkAY5XNnNAjz553ws9QEcHfxLeKlor4F8/+
         qc8fAidDY67wkydTp75LveW23KnHpn9OX28Rmd2oKAM2GikrZ7XypFPp7Z3D8tfjtZdV
         xIru/AP+ZrGlzNJ1PvqIbX9tSbHgs7N7vMet1zUAsA9A0w6fcOZ8tSWz3yUkVki7SY5v
         7DDSj7o9EbLu4ZO2zFaZAwNOllLhQVR7FmCQlR7cv6kiYK1lagHKsMwShEkhD30JlS5S
         0FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XFSIa+E7OYrNPKaA6up2MDnwHZn+V1T0FYHp1giQMVQ=;
        b=eqD73IbJyvgbXEODDXUSVIyJ+vpu+eUW4VEqlqbVRZnggqzBB2RglWTaw6ufWNjj9J
         7gZHbwtOBN0gFNZsvvzSP8kuUFT5EOh32da4xnlj+4FzeAw/KmnfGsizm2VCOKHMX1It
         IUVoC+gjmeYfQo7CAmMBjvxhumhE9MepXn8Kimr2waQFgMDgqRgNcuu0ZXLtZeVqd4LF
         +vAr5JQgkPGWlD1kcxc+w+arbk+qC9qNOfCTaFRN5+twkOaSp656nsfk1osnuQdmk+wA
         L45RrR27HfqSKnXm5Ymje3NyCmhijw4cruqeJXVuzWCpaGh60BkxecbeBD2FhuzhY//0
         HWwQ==
X-Gm-Message-State: APjAAAWQF2Np5anwHSUXn7I23644Nc6YaVIjpjasno7I4okbUhtO8PL7
        aTlj2l1vR02hlAdYEmC0NjTtcQ==
X-Google-Smtp-Source: APXvYqx8u+1aCInvIxqXE2hbGjq6gH88g2NfCC8iRYHl8tGEwu7T1lhJKU5oHxCrsC6b1N7QBSPEyQ==
X-Received: by 2002:a2e:86c5:: with SMTP id n5mr26090232ljj.184.1558047780689;
        Thu, 16 May 2019 16:03:00 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id y19sm1204622lfl.40.2019.05.16.16.02.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 16:02:59 -0700 (PDT)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Fri, 17 May 2019 01:02:58 +0200
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] mmc: tmio: move runtime PM enablement to the driver
 implementations
Message-ID: <20190516230258.GG31788@bigcity.dyn.berto.se>
References: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se>
 <20190415111003.6rryld6rfounopho@ninjato>
 <CAMuHMdVx_b8M2Gc_vn2_FS8xwf0ux=qYkH1ZfbWnTO0kBoLuPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVx_b8M2Gc_vn2_FS8xwf0ux=qYkH1ZfbWnTO0kBoLuPA@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2019-05-08 11:03:05 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, Apr 15, 2019 at 1:10 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > On Thu, Apr 11, 2019 at 12:22:40AM +0200, Niklas Söderlund wrote:
> > > Both the Renesas and Uniphier implementations perform actions which
> > > affect runtime PM before calling into the core tmio_mmc_host_probe()
> 
> Do you know which pm_runtime_*() calls were done too early?
> I guess they returned an error, which is not checked?

The ones in tmio_mmc_host_probe() which is removed in this patch where 
called before PM was enabled.

> 
> I checked the various pm_runtime_get*() calls, but none of them failed,
> while they typically return -EACCES when called too early.
> 
> > > which enabled runtime PM. Move pm_runtime_enable() from the core and
> > > tmio_mmc_host_probe() into each drivers probe() so it can be called
> > > before any clocks or other resources are switched on.
> > >
> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> >
> > Thanks for keeping at this. Setting up the APE6 board for further tests
> > was painful, I understood that.
> >
> > Since you lost the cover-letter from the last series, I think it should
> > be mentioned that this fixes a clock imbalance problem (at least on
> > Gen3).
> >
> > For the APE6 tests, we need to wait until Geert comes back. I surely
> > would like his input. And Yamada-san's, too, to make sure his platform
> > also benefits.
> 
> Thanks, but I still see a clock imbalances in /sys/kernel/debug/clk/clk_summary
> when comparing before/after s2ram.
> 
> On ape6evm:
> 
> -   mmcif0   2   2   0   100000000   0     0  50000
> +   mmcif0   1   1   0   100000000   0     0  50000

This is unrelated to this patch, this clock is handled by the sh_mmcif 
driver. I get the same diff of the mmcif0 clock with a suspend cycle 
even if i do not include the renesas_sdhi_* drivers in the system.

I had a quick look at the issue and it's related to that the MCC core do 
not call MMC_POWER_UP after suspend while it do call it during boot. Why 
it does so I'm not sure. Also if I mock convert sh_mmcif to require PM 
the imbalance is gone which perplexes me a bit and wonder if I converted 
it wrong somehow.

> 
> On r8a77965/salvator-xs:
> 
> -   s0d3   1   2   0   266240000   0     0  50000
> +   s0d3   2   2   0   266240000   0     0  50000
> 
> -   sys-dmac0   0   1   0   266240000   0     0  50000
> +   sys-dmac0   1   1   0   266240000   0     0  50000

Even these are unrelated to this patch. If I test without renesas_sdhi_* 
driver in the system I get the same clock differences, in fact I get one 
more for sys-dmac1 (both with and without the shdi drivers).

-    s0d3                  2        6        0   266240000          0     0  50000
+    s0d3                  4        6        0   266240000          0     0  50000

-       sys-dmac0          0        1        0   266240000          0     0  50000
+       sys-dmac0          1        1        0   266240000          0     0  50000

-       sys-dmac1          0        1        0   266240000          0     0  50000
+       sys-dmac1          1        1        0   266240000          0     0  50000

I have not investigate this further as I wish to make sens of this patch 
first ;-) Would you agree that with this information we should move 
forward with this patch as it solves the issue for the sdhi clocks on 
all effected SoCs ?

-- 
Regards,
Niklas Söderlund
