Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F752D75D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392378AbgLKMmN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:42:13 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35348 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404581AbgLKMmL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:42:11 -0500
Received: by mail-oi1-f196.google.com with SMTP id s2so9656209oij.2;
        Fri, 11 Dec 2020 04:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C0FV6racX+QqNFJ6zTw7MzDkZ4I97PkgxDx1hPgI8sI=;
        b=DKvuFaw5Ah56fCRAfod/E6XmNkQGvDBftqUVi+2DY+dcqhd7YYRZVIxYgDbfLmJxQX
         j4qO3jKX41EaYmxplVN/UjyQ6G9fpz10Njr/AxolasuQoZE18O1c/B6+0KF6i2X4oKBu
         utXrgo7RURiyYz1oBCJGOk4vbOG6/MdeT9n3Jgmufka2UHdE8g0ApkGSSqLI2kId8aid
         Ea3Wo5GNJKFBKf8aTqeQMM2IOko1+YRLx97QiZOS1MUGKLLCx7H/ADvJVu5vpLTO1bmd
         KhdCgnugIpFphZyIWoB9c06jQOPQxpZR5cuHGhtz1LTnoCxRtQ99r7D12GAcJ6fAOMFC
         sSbw==
X-Gm-Message-State: AOAM532j7B1/dfj4v96s7sPWoo1nGyBakKmpWmBPm0LqY3DX4YcsIg8q
        Yis3DV7FDLqJ17gAb3JCdnfjaHXmdu4/dLStzwQ=
X-Google-Smtp-Source: ABdhPJwPD1Q0T0Ld7jmiovh3V4I0v0TrtpAh6Y/FY4b2H9ELa/ro6Iz9HvNEbg9JIsk/7ZzV9rdMsX+3hkLZChGekPg=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr8982206oia.148.1607690489950;
 Fri, 11 Dec 2020 04:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se> <20201210152705.1535156-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201210152705.1535156-5-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:41:18 +0100
Message-ID: <CAMuHMdU0GmMW=Uh21_0hdgA8xG14cMCf1rYG9w2sz-B59crJzw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: renesas: r8a77965: Add TMU nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 4:27 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the Timer Unit (TMU) on the Renesas R-Car M3-N
> (r8a77965) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
