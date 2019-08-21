Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00D9978BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 14:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfHUMBX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 08:01:23 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37401 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfHUMBW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 08:01:22 -0400
Received: by mail-ot1-f68.google.com with SMTP id f17so1787415otq.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 05:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yzzlI5Kw1a3lX3kRvq9PwGslyN4KVSaMtCInFjU7ovM=;
        b=KjuTwRwe2NOXXCeZP15K2jq9hUpCOj8HAn9rxCysKff4HDypJ7N4gUwfCcSS6beGMw
         eE/y8xIFq/ywhqQsoj31aVcz14rjPPzk6oPTpWbkLycKSAw5cE1hovnAQRxUIX0GiXuC
         DLZP15T/L7o3KtbGpcXMrnnaGxatA7OyMEfLdcE0RBAEiuXVu+vrlmtKB6+gVuIphG0Y
         msN4XI9C8+BhiVpjDcKWxbUaiJ4CZfOa0kQVYnN8mPJflQw4MXVODAW1oPVR4zriKoOU
         74MGP3HqcCDMskL22UrdJsPgsPzvVFfcb9xZUFEhuD3dc+7qlMI209f5HKATrRrtyW2m
         yM2Q==
X-Gm-Message-State: APjAAAWWomy6Cs4104v9l5UJNQ4sV/uOKO+T/j/iFXT06cK46HfHyB3i
        YK+AKvVTKOPzIMK2MtjY3RBZS5E/ZTZImdqQQo8=
X-Google-Smtp-Source: APXvYqzU7e+AUTVwRFB/6fNwBtXI3gyW3MXBq1Yh/JFQ+IiFqd9WCmim5DtzkLYezGt+J8mH1LQplDGU0ZOYoVgAS7M=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr26353709otk.145.1566388881794;
 Wed, 21 Aug 2019 05:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <87pnrdsum0.wl-kuninori.morimoto.gx@renesas.com>
 <20190227113020.byiwz4dpmn2s35hn@verge.net.au> <87y35zbfp6.wl-kuninori.morimoto.gx@renesas.com>
 <20190821102743.tlsa57lxilpwaydj@uno.localdomain>
In-Reply-To: <20190821102743.tlsa57lxilpwaydj@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 14:01:10 +0200
Message-ID: <CAMuHMdV3xUtpdEGK4uBp4bN4j2JucP=KXfkfgrgA5pJgnYjhDw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: r8a77965-salvator-x: enable HDMI sound
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 12:44 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Fri, Mar 01, 2019 at 09:41:01AM +0900, Kuninori Morimoto wrote:
> > > > These are HDMI sound support for r8a77965.
> > > > I didn't/can't test these.
> > >
> > > Thanks Morimoto-san,
> > >
> > > Is this because of lack of hardware or some deeper reason?
> >
> > Beause, I don't have such hardware
>
> Tested on Salvator-XS M3-N.
>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks, queuing in renesas-devel for v5.4, after preserving sort order.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
