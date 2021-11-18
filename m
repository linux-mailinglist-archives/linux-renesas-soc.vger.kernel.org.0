Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9AA45623C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 19:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhKRSWT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 13:22:19 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:34689 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhKRSWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 13:22:19 -0500
Received: by mail-ua1-f47.google.com with SMTP id n6so15743473uak.1;
        Thu, 18 Nov 2021 10:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=58RDSsFLe6tCKAouFrWVNhILxTyHn3wPqyR+5WBFW5o=;
        b=lN1E0eM9uidFSKy+5e0eIaZ5RhIRdAnhPXISWtKUjskCfunyGuMhJG+gTyGVkdikEW
         /zPTi9Gt0QeUjgqkUvx0q8uWITDh10xCFL+Rl7b/aCgKbVy6vRUqyOjcC3FiD8ibw4dT
         IwZ/NXmcSlHPZkyS+ROn1sU+HngFGA21GUnK4wS8h8GdC9wN1rEuFrDnQ9TnfShyhUSj
         tlTbaig0GrP6DeXWz4DnMIozx+iG/Jx2so2t9ngA/I7VK+vXilzkCVih6/Di3U37ro5d
         dGryijUESbED5DL3VYVhL+8sQSDRWW1sje9SBd0d6cs+XRdFDAhCsn6tv3OHudhPsB0J
         YqzA==
X-Gm-Message-State: AOAM533dJN88xDPUSD+nkH+AyGgDFowifiIcpdUNk2tSn45AEzCwYdIX
        5k8A3gkbiQbGbPuWfhbpeKPGclHinS5dTg==
X-Google-Smtp-Source: ABdhPJxD/9SsY2/5Yd1MFhWCi62dT9eigS1Fe8pOxVbJESg7lN8PNxMEQMjWS5lzC8mpsoyjq0pGSw==
X-Received: by 2002:a05:6102:a4a:: with SMTP id i10mr82773528vss.47.1637259558447;
        Thu, 18 Nov 2021 10:19:18 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a4sm275673vkm.46.2021.11.18.10.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:19:18 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id t127so4308759vke.13;
        Thu, 18 Nov 2021 10:19:17 -0800 (PST)
X-Received: by 2002:a05:6122:20a7:: with SMTP id i39mr106157039vkd.15.1637259557842;
 Thu, 18 Nov 2021 10:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-4-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-4-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 19:19:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_ubnOs2P2kxhLRqQcPFMmO5VL8idEqGuFqLomDf9zcQ@mail.gmail.com>
Message-ID: <CAMuHMdV_ubnOs2P2kxhLRqQcPFMmO5VL8idEqGuFqLomDf9zcQ@mail.gmail.com>
Subject: Re: [PATCH 03/16] dt-bindings: reset: renesas,rst: Document r8a779f0
 reset module
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

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document bindings for the R-Car S4-8 (R8A779F0) reset module.
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
