Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDC5AD880
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 14:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390994AbfIIMHg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 08:07:36 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42622 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390938AbfIIMHg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 08:07:36 -0400
Received: by mail-ot1-f67.google.com with SMTP id c10so12141925otd.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Sep 2019 05:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mk9ADFExmgWFdfyfavGrcG9nRZTCwgrAA9VLPJYyj1o=;
        b=SZC9G/zV3uhevPBnOz/N6idhfVLRbyfIpwokZyNigtwsEZ41g6v3BeLvOuVdJcjKtt
         5dyaq5EWjGSCApFHEzMNjDcArwn8pvNCAgPiL275XJo7saFT9npEwFBU4JzOMYROZUZ/
         jVpoE1ifPMvB+yaI1p7yufsyqzn+APPwV6qVHLU/peEUjn8DaJ71xV+PULr7MjA5trtR
         szo0/L1lP2eJwLWnAeak6ZwhJl/7twu9UH1bUE55MKBM8QcyUA/fX+ruuuDNOr+Nrubq
         EQ/vxv+xQ0AQZDzAhqfekgWIexH7c7zsDM1Hwz7u5xf5SsPsV38G5Z3JQypBiqmjATOz
         n7tQ==
X-Gm-Message-State: APjAAAWAyhKLRb/ZJYRhbIBeeBfPx7OB003/nPP0g72odoakm8uIEtAy
        NUtE79qj88Hv+ICvMCDiIwxxcZnQ3+Ybt5cyMes=
X-Google-Smtp-Source: APXvYqyQe3qbhSVc0xarELFnci2vPyOFRzmLv0kWYELFFQLsiwyYbTsjCqS1HdoapMklgf/ueX9lrWbh9+IlQwBViX0=
X-Received: by 2002:a9d:6c12:: with SMTP id f18mr19698512otq.297.1568030853893;
 Mon, 09 Sep 2019 05:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190904120114.1894-1-geert+renesas@glider.be>
 <20190904120114.1894-3-geert+renesas@glider.be> <20190905084259.ovzs4s4zgdil2gcw@verge.net.au>
In-Reply-To: <20190905084259.ovzs4s4zgdil2gcw@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 14:07:22 +0200
Message-ID: <CAMuHMdW4jSO03Om+OX1y9uN3D-FH7j7kASj74gna9LbZDp3TmQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: lager: Replace spaces by TABs
To:     Simon Horman <horms@verge.net.au>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 5, 2019 at 10:43 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Sep 04, 2019 at 02:01:14PM +0200, Geert Uytterhoeven wrote:
> > Make it easier to compare the file with other similar files.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queued in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
