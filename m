Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0D8BBE80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 00:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391685AbfIWWdj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 18:33:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:39224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391674AbfIWWdj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 18:33:39 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2056021D56;
        Mon, 23 Sep 2019 22:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569278018;
        bh=nLYxcAxWlZbaz10ZK84e1S0+6gSNTUbO+wZcEvFOiHE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DM+SwMU80DFZRj54tAjxcmDcgRVVI677yrCFZBaO5k5Z84UCJKwSQSruqMhvd+pGy
         EoNkvASTDS2Ww2rCPnBcu+JDnBRWgxEIY5Y/yqyHsS8LgnEl2h24/w0uRNmkGAzoEk
         KKrPHlWkb082kxvyQlLLz1prA771437zq3sDLp5o=
Received: by mail-qk1-f180.google.com with SMTP id q203so17279170qke.1;
        Mon, 23 Sep 2019 15:33:38 -0700 (PDT)
X-Gm-Message-State: APjAAAULB8s6lieygkSroaimYkJCe8Lx6GSHBYu+IPor9Jboki/aW1Tb
        GXzoxwHLWOgXqgmjFPnSzSLfMil3WRdKDcQvEA==
X-Google-Smtp-Source: APXvYqyqgET76zqd8nKDekYYyCpEmP/K+0iX6q/VH3yToWhjhPyUrNbHf2kddLHh66dG4mvIY5FaQisEhizOF4kLWlM=
X-Received: by 2002:a37:2fc2:: with SMTP id v185mr267999qkh.362.1569278017316;
 Mon, 23 Sep 2019 15:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161634.27378-1-marek.vasut@gmail.com> <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
In-Reply-To: <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 23 Sep 2019 17:33:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com>
Message-ID: <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 13, 2019 at 10:14 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Sep 7, 2019 at 5:16 PM <marek.vasut@gmail.com> wrote:
> >
> > From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >
> > Add dma-ranges property into /soc node to describe the DMA capabilities
> > of the bus. This is currently needed to translate PCI DMA ranges, which
> > are limited to 32bit addresses.
>
> FYI, I've started working on this problem and issues around
> dma-ranges/dma_mask. Hopefully I'll get some patches out next week.

I've pushed out a branch here:

git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dma-masks

Can you test it on Renesas. I don't have a real platform having the issue.

Rob
