Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 179FA127FFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2019 16:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfLTPve (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 10:51:34 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40432 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbfLTPvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 10:51:33 -0500
Received: by mail-oi1-f195.google.com with SMTP id c77so4312635oib.7;
        Fri, 20 Dec 2019 07:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tulvWuO+lfC11OaHpbro2bnBMTva8CQZsIKaKyF21W0=;
        b=UJwup9Bb3803MRbopQr7p+m07N32OBnvrYjf3nfv2bMTBfuZT4uGwPUXhSGYz7IDxy
         mrDVj83hk2vcf3nHWlMe8+AxPjBhqQwyoFat83iwDDd7eZIXhJ/gepyoTSnjQIMB4vP1
         ScpZE11mrJHHL7YyMP79KM3bqOpWkPoO8jaIt0fOYFbGiPr0H4s3zxuWQVJ5ixxLA1JT
         vuWW374yedPCiNfFgpa5k7f84q0199vK8WRJyZrmupiZzSywly+saJCCnV5YhRAOIdjn
         JLWeRqOTui3nAEhVPN5zc5Onl+pUJzRk27AVAsFSA0sU9DV3mv6XSmNGc0roe1zEaRo0
         MVZw==
X-Gm-Message-State: APjAAAVLBdsuh8zyW5nBUTKs0u+qo3uReb9CK6HtpX2c0xaMBuGNFLwx
        5oSg53cLathP9KJwAuazTq68Dr7/2pmzhsjkew8=
X-Google-Smtp-Source: APXvYqzchUhqLwQiMfXZKXZyP7v8fIN2PO8DqcEhtTUOkjyL7QPAh7bHF/N4b1oZe/fFPjGrc7KJChncR16AfjCVknA=
X-Received: by 2002:a05:6808:292:: with SMTP id z18mr648668oic.131.1576857092572;
 Fri, 20 Dec 2019 07:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20191213164115.3697-1-geert+renesas@glider.be> <506390662.44203.1576307324771@webmail.strato.com>
In-Reply-To: <506390662.44203.1576307324771@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Dec 2019 16:51:21 +0100
Message-ID: <CAMuHMdVfV1u_fWGSP7SyDDR4vCB2qVkibr0irtUMnSfoh=nGUg@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm: dts: renesas: Group tuples in
 reg/ranges/dma-ranges/states properties
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 14, 2019 at 8:08 AM Ulrich Hecht <uli@fpond.eu> wrote:
> > On December 13, 2019 at 5:41 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > To improve human readability and enable automatic validation, tuples
> > in various properties should be grouped.  While "make dtbs_check" does
> > not impose this yet for all properties, it does for some, hence
> > triggering me to fix (I hope) all of them.
> >
> > Unfortunately even after this, a few "... is too long" warnings are
> > still printed (e.g. for PCI "ranges"), which I believe are false
> > positives.
> >
> > This series is against renesas-devel-2019-12-13-v5.5-rc1[*] with
> > "[PATCH] ARM: dts: rcar-gen2: Fix PCI high address in
> > interrupt-map-mask" applied on top.
> >
> > Thanks for your comments!
>
> For the whole series:
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, queuing in renesas-devel for v5.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
