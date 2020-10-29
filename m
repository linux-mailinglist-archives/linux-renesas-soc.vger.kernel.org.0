Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD9B29EDE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 15:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgJ2OJf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 10:09:35 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35720 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgJ2OJf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 10:09:35 -0400
Received: by mail-oi1-f196.google.com with SMTP id w191so3336663oif.2;
        Thu, 29 Oct 2020 07:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DZyTqOLkuv016b6/wnvWWSRD5uGx/0z27Vxn0bsFyrg=;
        b=cM8zaikUlusNCCxK/7WVohPMMeot79G4eb4Pyh4S7u9sjDq8pPEjAfe2JOyAbck5m5
         Dfj4Vo2Ej2zVAroJsSL86IBJ61Y/mQ3S4vGyzfFmnIEujrpsdcJCY41ryWt4BI2pa6VB
         SFBGq0G13WxIerO0ayrOUhmuBxqTdRLHU/ztTakbUK3D+oXN6y6MO2r0KSM0chNsOR2e
         X/wjPhIeRbMr6tGb5pxvFulGwYuzBZOJr2vxsnx+ydlBOdW6dC8bv4OTs/9YXtJ4uf8Q
         STqexRs/LuXl2n+SyFkaQZR4AQ95CXTwSXQwOBrXU+YQsynuPFYrugrBU41MPz4hHNjS
         Fa/Q==
X-Gm-Message-State: AOAM533eNT+3P4EENsyQdVfCY3FDQxj+c4ujWW7d4hYLR1aAKI4Souzm
        3+v4tXm6uYdNe0pATEJj1wwQ9mSUO593e3CFWZ4=
X-Google-Smtp-Source: ABdhPJyUwM9B5BvvTexXKOQ0qM4AizNmnZbPn65+boB5AfGm2yrnJpMNAdZHd7puWWJU9+hBaa/BD5lxzbHkWOGyPgs=
X-Received: by 2002:aca:c490:: with SMTP id u138mr32047oif.54.1603980574161;
 Thu, 29 Oct 2020 07:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201029133741.25721-1-erosca@de.adit-jv.com>
In-Reply-To: <20201029133741.25721-1-erosca@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Oct 2020 15:09:22 +0100
Message-ID: <CAMuHMdX9ZO=9RZYCo98OJ0joWPbUBHCsdzK1jFcCGq8VLpRzJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77961: Add CAN{0,1}
 placeholder nodes
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 29, 2020 at 2:38 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> With the same background and purpose as described in v4.20-rc1
> commit 92bc66bfce99cd ("arm64: dts: renesas: r8a77965: Add CAN{0,1}
> placeholder nodes"), add can0 and can1 placeholder nodes.
>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
