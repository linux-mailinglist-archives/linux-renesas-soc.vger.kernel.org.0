Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 738D5100226
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 11:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfKRKMS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 05:12:18 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39686 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRKMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 05:12:18 -0500
Received: by mail-oi1-f196.google.com with SMTP id v138so14787269oif.6;
        Mon, 18 Nov 2019 02:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wd/8miQHfG0K/xHeaZKk7Io4Qth+uW7jMmeiQXDJFp4=;
        b=hKwmeRNB+AQToO+oxyAG09vRjjxGSO96go52bUd9rh+ag4EAU+oCixdYHuPj0BYb1Q
         EBN/JZIzrJaz/KQIYaYHDd41i54KJDGbkUWDhwUZ8XuZ/zuLanSdGzbt7Z+DBvMZZQSu
         HjE7fdTVd49PKoe4NfFyEiVZRZS0ZvRR7mFxqAjzz83ktxZcxFSFOX6oysAwdkjlCG4p
         2v6AZ9tWAz/mh+6MWVJgOvyb+nD8ydpD6r+Dac2wTvBsDq3vqHSZqnlbmSkz8px/QS6F
         VnyO4vss5R38+Hl7HdvNRemYVmdpIBSy+K8WLrLpNquMAYH4hajHERzuFxaxFhV7toq/
         7i5g==
X-Gm-Message-State: APjAAAW6BUsaSzWc+lTa2akNTysccBXDnIWqnPQqvgKnDvn4YmM9orwc
        3aH+cAAQVJU1F29be7Lyk0ZRw6sBZhMyavdAukXbXBxk
X-Google-Smtp-Source: APXvYqwQRMtTY9HMTsrPxWAgn9Ws8TAiqUHXp55KhDdFAB1MXZ/e4RD3Nn5oEVsbr+xSw2wom1TwxOiyh3Rt08BFclQ=
X-Received: by 2002:aca:3a86:: with SMTP id h128mr18882008oia.131.1574071937300;
 Mon, 18 Nov 2019 02:12:17 -0800 (PST)
MIME-Version: 1.0
References: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1572591791-11280-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1572591791-11280-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Nov 2019 11:12:06 +0100
Message-ID: <CAMuHMdWbcDUThotTriK3mCB90FYODPpqPA0Ns50gQ0y8D7JdKw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Add power-domains and resets properties
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Nov 1, 2019 at 8:03 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds missing required properties of power-domains and resets.
> Fortunately, no one has this device node for now, so that we don't
> need to think of backward compatibility.
>
> Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> @@ -43,6 +43,9 @@ Required properties:
>   - The USB_EXTAL clock pin must be "usb_extal"
>   - The USB_XTAL clock pin must be "usb_xtal"
>  - #clock-cells: Must be 0
> +- power-domains: A phandle and symbolic PM domain specifier.
> +                 See power/renesas,rcar-sysc.txt.
> +- resets: A list of phandles and specifier pairs.

Since there is more than one, I think it would be good to specify
reset-names, too ("ehci_ohci" and "hs-usb-if").

The rest looks good to me.

>  Example (R-Car H3):
>
> @@ -54,4 +57,6 @@ Example (R-Car H3):
>                          <&usb_extal>, <&usb_xtal>;
>                 clock-names = "ehci_ohci", "hs-usb-if", "usb_extal", "usb_xtal";
>                 #clock-cells = <0>;
> +               power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +               resets = <&cpg 703>, <&cpg 704>;
>         };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
