Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456F9D0E61
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbfJIMIg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:08:36 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41379 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729566AbfJIMIg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:08:36 -0400
Received: by mail-ot1-f68.google.com with SMTP id g13so1482864otp.8;
        Wed, 09 Oct 2019 05:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fai8xPqlLirpu8N+Kz8C/osOxgUH43vmyLjb5JW7bFM=;
        b=i056mRQRwwmcfmjWhrJOSsZdZzKbNRfVGY6PTvAJHUoOXqosDaVJASldApnQ/JubiB
         qLNDe7X/3vAxIo4TgK5EmaKf19f5FTNP2kEcNrwHFzTTjN/441PNS1Yh47RYiPCOlCtg
         f49JjWiccLbHOYv0wSl+rG0coJiZBwmrEF5L4OlV7OFAotU6oKz7Se19et4hXbAdPYqB
         FWSvP3/VNF5SRlTvQ5KAoYzNVY7AA3KpYV4cY61E3smkHzTDo9b51IAzLbJRP2D/og5S
         qrYzp2VXkFTMVsX9n26zyXjMVv3lk3XdSYbsSVMxU/4saXydscf1aSR4CCWKqd3qBPz2
         glUw==
X-Gm-Message-State: APjAAAUnUEfBq3Y6qAk1TqkzDfyX+Smkiq9wYahfIkpCg2nA3VmGsvnh
        Mgf3x2XKlsmUlhoWKee/KrOjqdxl+ynbRNU5UZ8=
X-Google-Smtp-Source: APXvYqx+vqjoISRHGeuzeApVBtpmkgR/z6XaH3L9jI3PX3DUI6nP0KQHtjt2VzimxRQg3dOk/zkJUint4uHOduOsVZc=
X-Received: by 2002:a9d:7a82:: with SMTP id l2mr2514324otn.297.1570622915271;
 Wed, 09 Oct 2019 05:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <1569250648-33857-1-git-send-email-biju.das@bp.renesas.com> <1569250648-33857-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569250648-33857-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:08:24 +0200
Message-ID: <CAMuHMdVSoS7aDgxwQDKWjowgXMtJ+N6dMk8wVxUKYqaCAPVmrQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a774b1: Add CMT device nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 4:57 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds the CMT[0123] device tree nodes to the
> r8a774b1 SoC specific DT.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
