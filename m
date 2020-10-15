Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFBCF28F22B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Oct 2020 14:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgJOMfV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 08:35:21 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43296 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgJOMfV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 08:35:21 -0400
Received: by mail-oi1-f194.google.com with SMTP id l85so2888341oih.10;
        Thu, 15 Oct 2020 05:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JYxE7+1GIr9Y7Alby7j1jIy6dZhSk+zAk9I33SomSlo=;
        b=qnEDOhsLzfhuob0cJqmoiW0pf/ogyCzatxP/wi7ZRbL0Bn/YgQ+AgaXOm03TC7BcD9
         6BMqEFl9VpsAJdplI/XMDucleWxfAjuadxDf++Qx+N8WslYmwvbuMB170/8JQUXLj7r+
         rpIfLdaL/x+RgUDHrsiZ29guTgoww5FIzRZ0RrTmR3iREtARg7tkiH2KlakumRD/rb1T
         w0PyAaAnqbJoSIkbprdyodA9EBdopjzUweK1N4wThNBjDOyW3mN4ULOpfU7kY9UPskG+
         Kr8IHfS+2zepZgHujUCIEzNVCWB3OBxK8ZA7ft8bop5CLq9LeA6XQZe6/avjD+WUx6qc
         z2MQ==
X-Gm-Message-State: AOAM5337R1meV/zvVpwXI4M0CBlkI5sOXQkAohvuHlEXuPgPofGqblWp
        JESq0daSyBId3jEti+oRvDy7h3XnxWG3I9BgdNOiQZgK
X-Google-Smtp-Source: ABdhPJyeHzVNtD4u+iYZTBH+/7EAr+AaR2E6W0QVHO0jXNt72LqnZBjvtzoG7HuSxobPBloquV4FEhQrkHaFyc0gQZw=
X-Received: by 2002:aca:4441:: with SMTP id r62mr1848993oia.153.1602765318932;
 Thu, 15 Oct 2020 05:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org> <20201014094443.11070-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20201014094443.11070-2-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Oct 2020 14:35:07 +0200
Message-ID: <CAMuHMdUkj+nVPYtc7WsofTcLwpAKXJwM0V7qmgg1sTBN0UzyFg@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: r8a779a0: Add CSI4[0-3] clocks
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 14, 2020 at 11:40 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add clock definitions of the CSI-2 receivers for R-Car V3U.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
