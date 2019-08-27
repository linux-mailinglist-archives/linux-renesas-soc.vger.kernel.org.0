Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1AE9E812
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 14:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbfH0Mg1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 08:36:27 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41483 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728702AbfH0Mg0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 08:36:26 -0400
Received: by mail-oi1-f194.google.com with SMTP id p127so6175001oic.8;
        Tue, 27 Aug 2019 05:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p4AP441Ul+To2Moh1dudmIeSl6cX7gcOzZP+CCLUD18=;
        b=ubgQlsH+JBQp4N2GdMjntgcwc6ChZIPUbTEhVESMfTV6rRBHIjRdXLelEkZBNAbG4Y
         ekRFO/ao1YzbmfZTaZ6mIlKyOg4+W5hPVJNpejpjUZ4zLvUx0/8nSlx6kULZyC/mjWWA
         NR2D22tAEbSK4+Aa9ATScaq1eDfbl8jlUJlAt1RUzK0+nW9VD/7e2Xc2He9eQn5rI/XJ
         b1dYybjE4PaWuc1OC/jla4sdviewBpwweI1NNBaC1E0PyO0IrydIZHZxTJ91dByhqyS6
         cMlpK/LXVhsoI3VIAyQG8nqMkCvqPem9rRd4fpTvLn861QHH8jeBHyCBrWc4EwPZmxnq
         aXzg==
X-Gm-Message-State: APjAAAUjetKcp+bSJM1eh1DG0gkGuEBIAxGBStezKGYAwNemxijSkXf0
        +Qni+oiMEddfVbBzaYqx2z4sGlyX0gvE53IH/R8=
X-Google-Smtp-Source: APXvYqwHgBn8ycq9W5LDEVFGOPY+7S7ZnaOS9or/O5YAj9CwtmdYgdb/jxrlFwaLrm002tTaviteFu+vYooWUXTezZ4=
X-Received: by 2002:aca:3382:: with SMTP id z124mr16307716oiz.102.1566909385816;
 Tue, 27 Aug 2019 05:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566900127-11148-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1566900127-11148-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 14:36:14 +0200
Message-ID: <CAMuHMdUgE1XnW=o+o+0cizpvj+vDnc5JAiTG4TCw=-HtbiRo9w@mail.gmail.com>
Subject: Re: [PATCH 2/4] usb: host: xhci-rcar: Add a helper macro to set xhci_plat_priv
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 27, 2019 at 12:06 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> To avoid copy-and-paste setting of xhci_plat_priv for R-Car SoCs,
> this patch add a helper macro SET_XHCI_PLAT_PRIV_FOR_RCAR.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
