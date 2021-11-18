Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C20945628E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 19:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbhKRSlX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 13:41:23 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:34534 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbhKRSlW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 13:41:22 -0500
Received: by mail-ua1-f45.google.com with SMTP id n6so15869684uak.1;
        Thu, 18 Nov 2021 10:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N1fqvRxz3QIXhQpQoNbqQ+VxN3wFDYdevpV5DX3OYR0=;
        b=2DVS5Exf2vU97EAGyCztwvx5H6g++kOyVTH0dPPbeueQTUfGt/1Hq7uBFtX2TGw+73
         fz4QvAIqG+iuH1CzR1Nan5LcC6+SsTI8nqPr2v5dFS+jZf+WjS/yWJslj4ecfi5y+/Nu
         02xQghUwo4RIudcn+xtGFXiKW13dyUVAEGC24jHXVL0jKCHXLgWThrBqckZ6MCA1VV3k
         +j0cVOztl7Swlx7rpblD/+h3/eptvhqFrxefeGh5jTWE+FZ3qwqynqrn8/lywg6vt9wx
         nH5eGJPODYrHbz9GwN8kY/uU13A/NXL1KpQ8xQOcy3SOVp/lXs771PWPa4x0u3VlGP9e
         +DnA==
X-Gm-Message-State: AOAM5311vLPIv0BLiol3CCt2iJcnCYog0okh+r8yVH/AuHxWa9C1nfjD
        nkDz1/G/9KJcVA6wi09uva8KV6wkiCJREw==
X-Google-Smtp-Source: ABdhPJxvWwAxbCqBEsaILUImabq6DPSUos3JvmDD7fLwmDnVypVxRCFGmSFN1FQeB+tnjzOjUHCO6w==
X-Received: by 2002:a05:6102:2389:: with SMTP id v9mr53694958vsr.34.1637260701561;
        Thu, 18 Nov 2021 10:38:21 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id g21sm429757vkd.26.2021.11.18.10.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:38:21 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id y5so15775584ual.7;
        Thu, 18 Nov 2021 10:38:21 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr84554167vsl.35.1637260700880;
 Thu, 18 Nov 2021 10:38:20 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-5-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-5-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 19:38:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUMo-3PTbDS_Lp5ZNuk8s-sfdS56WW0h2=Q_NzvK_ZTA@mail.gmail.com>
Message-ID: <CAMuHMdXUMo-3PTbDS_Lp5ZNuk8s-sfdS56WW0h2=Q_NzvK_ZTA@mail.gmail.com>
Subject: Re: [PATCH 04/16] dt-bindings: power: renesas,rcar-sysc: Document
 r8a779f0 SYSC bindings
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
> Document bindings for the R-Car S4-8 (aka R8A779F0) SYSC block.
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
