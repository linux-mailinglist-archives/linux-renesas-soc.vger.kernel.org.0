Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5379E4561C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 18:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbhKRRxT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 12:53:19 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:37554 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233172AbhKRRxT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 12:53:19 -0500
Received: by mail-ua1-f51.google.com with SMTP id o1so15537257uap.4;
        Thu, 18 Nov 2021 09:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bFeM04vKOaS71VYDOH4xnU67t1j31v0rHakjN+vE8aU=;
        b=ZeXeXI+qEI5OhSH5NoCSs0kHgp+Ps8FZiR+hcbXsqtaVKN1sF0xFhTWhrAF/NlmdSW
         1uFzsk2Bek82uXrnQ2E0ZCIPXL+zSXSORKuY41MXIQCZ2g6gdsFeMr3Py9dt7cxQBCaV
         IiMmH8uy/F4PdAI9sTgWqteBlTKadWKNqjAcY0yPiM9c8pc0RaAVI4PDoexX0lyW80SR
         SPPvvjRT6M+fGb8f7mzgALGRJgt0C3yLB4xi7N0zn3ujNYDzSyZfaZ52OPG88iWfTuYL
         6YeN0/agsH8YmTzk/LBGbMTLtodGme2L0ykJ7eVWcreqAAxvDJQ8YANtVku4rNDeugNl
         l3vA==
X-Gm-Message-State: AOAM5320ErYXbqaMhXKnCEm56J0kMoWmYtiSg0GLf/Grc0oUaQOLB95K
        YxBeMkDfKsXGjgsrLEdAW7iB2ui/XkBOVg==
X-Google-Smtp-Source: ABdhPJx2gfXrCjBGBZJpRAkszgu5dmmehAyXjiUVK3l3E8OaItmlADsJ39RA+3upqYSOKcldcX8aXQ==
X-Received: by 2002:a9f:3142:: with SMTP id n2mr13035488uab.102.1637257818240;
        Thu, 18 Nov 2021 09:50:18 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id c23sm271437vko.8.2021.11.18.09.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 09:50:17 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id i6so15496022uae.6;
        Thu, 18 Nov 2021 09:50:17 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr84084028vsl.35.1637257817105;
 Thu, 18 Nov 2021 09:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 18:50:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVf2ZQtPpTkh82smeptOUhW2zfOmGzoE=zfWiH9Ccy4ww@mail.gmail.com>
Message-ID: <CAMuHMdVf2ZQtPpTkh82smeptOUhW2zfOmGzoE=zfWiH9Ccy4ww@mail.gmail.com>
Subject: Re: [PATCH 01/16] dt-bindings: arm: renesas: Document R-Car S4-8 SoC
 DT bindings
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
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

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add device tree bindings documentation for Renesas R-Car S4-8
> (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
