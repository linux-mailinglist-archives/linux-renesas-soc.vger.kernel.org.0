Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E413B467B4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 17:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352885AbhLCQ1j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 11:27:39 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:41898 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352811AbhLCQ1i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 11:27:38 -0500
Received: by mail-ua1-f42.google.com with SMTP id p37so6456875uae.8;
        Fri, 03 Dec 2021 08:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5VAfX84ij/HdA62GWjwqXOlA2DHUK0jO7Ib3am7Oo1A=;
        b=eZaFruGLA89xDfzB561y48SlHNiZNl7HV1Y7hWLtCwYJEbdEsKc6Kbv922oILgiodg
         PAPmhm/kKHWhHVXP6jyj90Ll6klbFAt4gNg/Mvh/m7bggSxE8Yd4QlwYZraq0a3ltwrs
         VNNdwGZYbK08TnKuqy3TGCIAxC3+kLuaC+X2Qbyg4TJweUT0RMneD25MpaMIPmR7i1gt
         f2Wcxh0D2rkAcsiLhr/9gk5v2eDoLXHDia562T3PlNcMJME+8ZqhDjFkkhvsXIubL3bM
         v4n6T9DFoC9amM1jOc2mA65NnjipY6r/flXPf0th4nTjslzCcc7+nrNdaWKxz1kmSA1o
         upXw==
X-Gm-Message-State: AOAM531dP8uST0rAoYFsRUAIxMHYpFtBlA1WDWwLU5G9kkHsm6czzu0l
        YmHUmYWCnjkLpxcGAlbn0pmwnpbaFZaq9zkO
X-Google-Smtp-Source: ABdhPJzsDt3nVPRvhpY3mPwKSIuEGRWmNOAUydF2UmyRh6YLj/mVveb06aG6nAHWtZBMhWcPDyJZQg==
X-Received: by 2002:ab0:164d:: with SMTP id l13mr22915073uae.34.1638548654079;
        Fri, 03 Dec 2021 08:24:14 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id c24sm526919vkn.30.2021.12.03.08.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 08:24:13 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id n6so6554981uak.1;
        Fri, 03 Dec 2021 08:24:13 -0800 (PST)
X-Received: by 2002:ab0:7354:: with SMTP id k20mr22766819uap.78.1638548653631;
 Fri, 03 Dec 2021 08:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-5-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-5-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Dec 2021 17:24:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHD05pLkdyBKfz-OCLqtPU+GKk6U68fscT8OMnXRzRPQ@mail.gmail.com>
Message-ID: <CAMuHMdVHD05pLkdyBKfz-OCLqtPU+GKk6U68fscT8OMnXRzRPQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] dt-bindings: serial: renesas,scif: Document
 r8a779f0 bindings
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Dec 1, 2021 at 8:33 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car S4-8 (R8A779F0) SoC has the R-Car Gen4 compatible SCIF ports,
> so document the SoC specific bindings.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this no longer applies cleanly to tty/tty-next, due to
commit 0836150c26c4028b ("dt-bindings: serial: renesas,scif: Make
resets as a required property").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
