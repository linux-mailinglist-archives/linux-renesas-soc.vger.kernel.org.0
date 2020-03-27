Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D030195781
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 13:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgC0Muj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 08:50:39 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:32788 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgC0Muj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:50:39 -0400
Received: by mail-oi1-f196.google.com with SMTP id m14so8689082oic.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EuR4ExW0QEHAw9w3r+CrqRDs53paMiuVaVAIxRQP7MQ=;
        b=AC3Po985W8w9qLyzv0AYtjZND5Fxd8J2+bA0G/YZ3/MSglDiDw38cfz3ggZ/JbzFwt
         Ci1oKKNIA6W5mqH2C4DcyENDOspYHJKTE4vIQQVe/hopotLKzaDSThr0b2RJ3+oHsa88
         +O74HlJcxXxj43wuFloS20HARl8Z/08FuSsSBpj0kNieJ1uZHp+K5kJ5vQO1XGFL5zUh
         6Q79l1fvbZ1VK6KQB1brmzNxKxXukaaPDoH+S38bhR04O3Ei8Mpop0/5d3pRyJaSHBma
         lHtfeCcmuIuSkFQW6bgfmj4/uAF0JWfp4aO0tlgFCKjyjwmj+KRm+uZGfz4+dCitE/m4
         kf4Q==
X-Gm-Message-State: ANhLgQ0aI3c+GkaKcYFPvCmHS8LNUvwOk9b2bcZD8fWGYshvU+UFd+xa
        9dZhp3sqmoq1OCvlIrRyZq3tMUaySDlaece3mAo=
X-Google-Smtp-Source: ADFU+vtR7lDkLp3LbZVL1DeIek+c7PqLjgxLJEtWJav9ulvvu+cWE6RiXAeTw8UmWeUFhIjbOkM8qP2yS4p21txrHq0=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr3599364oig.153.1585313438789;
 Fri, 27 Mar 2020 05:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Mar 2020 13:50:27 +0100
Message-ID: <CAMuHMdWV04DbtY2bcsciqdbDT6pHV3UYNc+8iueKZCF_b8vCtg@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/2] arm64: dts: renesas: add USB2.0/3.0 device nodes
 for r8a77961
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Mar 25, 2020 at 7:24 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds USB2.0/3.0 device nodes for r8a77961(R-Car M3-W+).
> The dt-bindings of these devices are not merged yet. So, I marked
> RFC on this patch series.
>
> Yoshihiro Shimoda (2):
>   arm64: dts: renesas: add USB2.0 device nodes for r8a77961
>   arm64: dts: renesas: add USB3.0 device nodes for r8a77961

Thank you, will queue in renesas-devel for-v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
