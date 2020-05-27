Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0246B1E3AAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 09:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387520AbgE0Hen (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 03:34:43 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36220 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387411AbgE0Hen (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 03:34:43 -0400
Received: by mail-oi1-f193.google.com with SMTP id x23so20976306oic.3;
        Wed, 27 May 2020 00:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g/2V+ILho993Sc4aTyN2HNrz1xXkT4t8lrGCCn7EhH4=;
        b=EUvfnigEBtaQgbOt0hiz4HhS0QOska1sbrvqGq1bYuYVOFJMJxVuYz0YH6aKvrszIq
         VMcBFI5L3/LXdQaxyyvi4eCQvzo7JUCO0pVHGO5p/nGtFIcnOUhaEdV4BPW+Em5LifoP
         9ye6YjPzBrxMRRzLmOs3tl4D+q3pUuRlNBjVLcgjSNSd0MgHFFyorCAlS43pszT2O81s
         MujSfc2uaeLanSmcmnxgb+NpBN/RdZOJKCG5N8aOUheskgqcoIR7WG/g8GyeaTt3BuSH
         KtOruHI4uIDU84FkEGXKePuxtjKS55dpVmWZhxj8BK1onDVlfGwphRTOfcKaJVfQFRO+
         TCAg==
X-Gm-Message-State: AOAM5338eNfbuGcMc6VGP9y7lRgcLXYhO9bD7YnGmSMbFB0jUSvb9Gq7
        xX6B0T63H8WpSlUpyMpEAj8n4jV6cGeG2GQkkUZmVQ==
X-Google-Smtp-Source: ABdhPJxCq6xJytQR9MRrSZtC7WsUAZa4yYCcCrs2RUn5qA+cObxdWtdrNC7QR/jq6N/RUcvtStBbHCYsejgBNLFq/wA=
X-Received: by 2002:aca:210a:: with SMTP id 10mr1716582oiz.153.1590564881908;
 Wed, 27 May 2020 00:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org> <20200527071555.GA23912@lxhi-065.adit-jv.com>
In-Reply-To: <20200527071555.GA23912@lxhi-065.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 May 2020 09:34:30 +0200
Message-ID: <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sean Paul <seanpaul@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        gotthard.voellmeke@renesas.com, efriedrich@de.adit-jv.com,
        Michael Rodin <mrodin@de.adit-jv.com>,
        ChaitanyaKumar.Borah@in.bosch.com,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Wed, May 27, 2020 at 9:16 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
> > CMM functionalities are retained between suspend/resume cycles (tested with
> > suspend-to-idle) without requiring a re-programming of the LUT tables.
>
> Hmm. Is this backed up by any statement in the HW User's manual?
> This comes in contrast with the original Renesas CMM implementation [**]
> which does make use of suspend (where the freeze actually happens).
>
> Can we infer, based on your statement, that we could also get rid of
> the suspend callback in [**]?

While the CMM state will be retained across suspend-to-idle, I'm quite
sure it will be lost by suspend-to-RAM, at least on the Salvator-X(S),
ULCB, and Ebisu development boards, as PSCI will ask the BD9571WMV
regulator to power down the R-Car SoC.

So IMHO we do need suspend/resume handling.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
