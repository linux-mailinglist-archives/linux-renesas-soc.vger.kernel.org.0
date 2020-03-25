Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB0319290A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 13:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgCYM7G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 08:59:06 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44644 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgCYM7G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 08:59:06 -0400
Received: by mail-ot1-f66.google.com with SMTP id a49so1748898otc.11;
        Wed, 25 Mar 2020 05:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r5g7FyrJO2TMfJgZazRdghxGNh9axm0w8GCfQXdkFrQ=;
        b=L91RvCWCeaAT23dE/P/Yh1rdL8IT8cANa0Sp238TJ/4050VOx6Y8Kyz1R+oXL+GGiN
         L2nBcfl26VdgHpUI50H7PwzxzxeI9tzSda7u2Wwp7kls4V5i+alu0yXDz1a2WS6gmCRC
         XlUQrTvlLMTGiWG+bnn2v9reka+zkSH4DmeQzccuo0NXSdgdsVor7HacuhbCNcrP+H9/
         9vLjyR8XDkEcZytycZ09Kk6L/pRRVmX668FipAjFK2bvZRCjKsgB10kMo2NUVNWhhP8E
         Ls1/AH83A1P4VQVSZ1xKMwRmUfIQVUsCL3q1kE9eE+fCZEGRBQ5ek3r7UJJJP6+unWln
         40uw==
X-Gm-Message-State: ANhLgQ1rCSvTEdQp5RbJhAC+/AersIiwwubEvFlwRW2ziTr8HsY4hFiu
        VBvOFjZV0MdAzfj5FJlloF1/1uXUrt9i9RMmuoo=
X-Google-Smtp-Source: ADFU+vsWK7JMXFGW3VJJmYSqALCXY+LjYa9xG7lOM+uZiuCt4O1D/3T6qkozwBXjms+LpEZD994usN3u6jIA8Rl7mF4=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr2319984otk.250.1585141145744;
 Wed, 25 Mar 2020 05:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117006-8266-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117006-8266-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 13:58:54 +0100
Message-ID: <CAMuHMdUzDMLd6ya06Dv-jLEzbu3KeTrgZ8O+iUguepe3AWzd4w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: renesas,usbhs: add r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 25, 2020 at 7:17 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).
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
