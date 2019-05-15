Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3645A1E937
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfEOHip (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:38:45 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36131 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfEOHip (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:38:45 -0400
Received: by mail-vs1-f65.google.com with SMTP id l20so1061576vsp.3;
        Wed, 15 May 2019 00:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QYbg2Tq9O4Ji7etgs8H/En4w9wpF6PxEYrre8VwlZKg=;
        b=Nb3BPGOwahI7XFbX+dNOv77SoUBP5WhS/qhAU4nlWSdJi8Sy+MhniFyUihAkFOo0r3
         gvJEbvbR4IzILwRkQRS5v6bm8BEvk2F4OnKUhgL4JDOQRh3MFPlRRwReSJSXAoPPR+53
         +uzGoSCzRv5g9vF6tGhb5drR+14qAYN2wor4HV5QXh9qinHqqgxvvZnmLiNJvgQoBdEV
         Z34G6+3kB0/AxuKtXkVcstMF1TnoP7tswkqSfPfODbW3FRvHwNFzb+s8QhF0FP82qbHB
         JUt3VlbnNpth8UlvtdAzg4PifCEBPqxx7hJEN6XtIx4NxWG7y8YNTJ/cU7rUtwGZcdnw
         bIVA==
X-Gm-Message-State: APjAAAUt89qunRO8SzN5v3kq73zWiv1z93VIg+Au66dLm7w4cJEsTq1h
        wlY7SXgGesXryEE42GVlk9DfvO6nIQIaKiXMuWU=
X-Google-Smtp-Source: APXvYqzwlQfWER3kBlRPZ3juNEROyWnYcnGmKXUjLmkGxZHMyoQZkiMglghOBrTL/xi85Oox72Hv3cNw6wReB83U3p4=
X-Received: by 2002:a67:f303:: with SMTP id p3mr8037938vsf.166.1557905924181;
 Wed, 15 May 2019 00:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-2-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-2-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 09:38:32 +0200
Message-ID: <CAMuHMdWW=4nS__ykVBVe7Dz_3aaJQ4s5GK5Rdazg0nj4X==_Wg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] ARM: dts: r7s9210: Add USB clock
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 14, 2019 at 4:56 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add USB clock node. If present, this clock input must be 48MHz.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
