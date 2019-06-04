Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE471342E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 11:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfFDJOG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 05:14:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35607 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfFDJOF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 05:14:05 -0400
Received: by mail-lj1-f194.google.com with SMTP id h11so18975165ljb.2;
        Tue, 04 Jun 2019 02:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c6YWx7c2KFkFnqdn20PxgRAA7aQNfcdM/X+FMuxKK/o=;
        b=hGUhr8rqRJVjO5t1cZcwTFQNbIxnpLwstRvr3wcXJXrf0QiM/Fom2u/dRgu2JUy+PV
         SnPWSKeg1PZzxa6kmBg8q8zXFjLpiPrd/3FayVmr/NNthJ8Az+dqkqmee/FcaHXPwQxG
         oZJDDdWaHbMLN2P+dL3bDY5P9CeBe/5twYDNV/VK6rPB8qhy/JWry+ZU1Ui8lUgMwmV6
         lXqEg292S8E7fBsjyarQYfIEAzTSEEWt5SPs0AUWvqjjMlcoXUsUt1PAQeWxA9jlICPS
         UBNxJGLAwt26NCIfYcCfy5+DkFSJL1Cw0mds3oJSQ8C9qpOQtmL/nn46Crjoa644Ki0X
         V+Nw==
X-Gm-Message-State: APjAAAVtoi5z6SPYo7Nf800BYgJRrUumm8LDvGmswPAVVKscPASdwDeE
        s2CObOnh/oVeu4aglNtVRlQI1c9vcHxhPzNAx85z2shM
X-Google-Smtp-Source: APXvYqwVWGFsI7Jlyz6rDNBveu7Mo860uc+ajf2GmNkr2kryUlWFAKtU/GfrxAKv5PAPCpDrUrrcAM91c/r3BdKaPKk=
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr15988864ljc.135.1559639643627;
 Tue, 04 Jun 2019 02:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559621375-5436-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1559621375-5436-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jun 2019 11:13:51 +0200
Message-ID: <CAMuHMdXqYkaAh5ZaNF7GtrCCjd2=GD4PPmrrL5x1pK2H5BkUcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: renesas_usbhs: remove controlling PWEN/EXTLP support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Jun 4, 2019 at 6:14 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Controlling PWMEN/EXTLP (named as "has_otg") was supported in v3.2,
> but was never used by any platform. So, this patch remove it.

Actually it was used, by legacy (pre-DT) board support for kzm9g and
mackerel.
The last user was removed by commit 30f8925a57d8ad49 ("ARM: shmobile:
Remove legacy board code for KZM-A9-GT").

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
