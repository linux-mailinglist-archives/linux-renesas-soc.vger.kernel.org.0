Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6AF997567
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfHUIxb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:53:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40906 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfHUIxb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:53:31 -0400
Received: by mail-ot1-f68.google.com with SMTP id c34so1340697otb.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 01:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcCL3wv+BmCUtlHUd1GtMt6GC6B3UYpLuYNiU+77akY=;
        b=a6bgGgQeAPD/+RLSKD6HjFJph6CrtZt1csRcielqT7chfhI/82PzDTIVMD4VpKnQgU
         PKtzmbueDmCTNXSXZKdjzCLnxZ1LjzBganKAkf6tAEBeoGFF7GhWs5BHNI1JK/ThQ1vX
         KkU1l+58W9htAQSgjsmcPMoPiF6bes8V+pBW4ZM5h8hELsIDhoXoS6L8BlI7mDoj4exi
         ivJ4sLTwuVt0VNYUG/auvOVqF2RxVfCptSLZe6VgrDtVQkPuUDTIHP92no4f+rVeXuVB
         jtoazu/XZN/TuDDSgfT5wh3gQXuVnLp1PQRyIOlTNv+kY24ac2G4tBaAeiEY4TUxr71a
         f7qQ==
X-Gm-Message-State: APjAAAW11a1RKz0hdIBgY7TRtKp/KCVgMpHZIzgURK5ImcJvBM8q5qa9
        pcXcFgjR0ygit3XC3l06rOuZm2Fzb1wXW1wAhbg=
X-Google-Smtp-Source: APXvYqwyG6VO1Fcw/mrdVfv3/kkEaoilufe0KHc6FN8W6uih7qIL4w9Qz21gA+Eai2v1Xbi9QH077Q1dR4TB34OmW08=
X-Received: by 2002:a9d:459d:: with SMTP id x29mr26783629ote.39.1566377610373;
 Wed, 21 Aug 2019 01:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <1566219295-23003-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1566219295-23003-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 10:53:19 +0200
Message-ID: <CAMuHMdVaKNOf4X_OGCwag9Oem1ytfDohxY2cTFVd9hNLw=qYpw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 2:55 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
