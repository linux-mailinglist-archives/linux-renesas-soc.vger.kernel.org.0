Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 526E75CC47
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 10:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfGBI6M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 04:58:12 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36375 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGBI6L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 04:58:11 -0400
Received: by mail-oi1-f194.google.com with SMTP id w7so12405277oic.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jul 2019 01:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pb4hIlPtBxu+eWlV5MavugzJlWlGVOugSZum+zG+KJU=;
        b=C0r/K8EPWR2p53KcDT5Q1I7yeJkZP3N9WyPsnpBct8atImcUr0xuWVbV6wiZxrMFal
         ycMwFiWJFb/VVrYty5J3d1rvHQkSBaqm7ycgJRy0zoxNK2Z4w+UFDHktDGNatvyGqpw9
         5bY9IDs25qaK5WXwbeEGjw3ogkXZ6UWWJHd6i3tuszyaXiX9bgNnJdlizfEgDT71L2RD
         NP+HNmNDZklyQeOjoweleXlkw6NROCOidZq+Guugv383K7Lva1vVFKsyDcspDEt5MqCT
         pkuSW9Ci+Wj1Ab10URVg37yqiiSD0y4vNb83mymG2ceOrSU+JTWBJfLyLgXuJY30ZOpL
         NPzQ==
X-Gm-Message-State: APjAAAW1JMF7dZLc1tCoTbevuAvS/HJqjoMQ4ejVwXZDmL+BtMeW/JJy
        1pa/cgmHUpPw63MTeJcHRTTctomb5N6k2FsyXcTegaIH
X-Google-Smtp-Source: APXvYqyfQUJ0oEfJxk7/b2/K3FRe9as/LnCeH7oYgYZYd/X1ze/KZsHM8di8yh3wqbFRL0AWB3C21OAFERAirvm7UsU=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr2173610oia.153.1562057891205;
 Tue, 02 Jul 2019 01:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190624105224.23927-1-horms+renesas@verge.net.au> <20190624105224.23927-3-horms+renesas@verge.net.au>
In-Reply-To: <20190624105224.23927-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Jul 2019 10:58:00 +0200
Message-ID: <CAMuHMdW8dUOuPmdvuWyRxWzSuLW7fmzJYr2fmCnpZLbrye31yw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: r8a77995: Add cpg reset for DU
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 24, 2019 at 12:52 PM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Add CPG reset properties to DU node of D3 (r8a77995) SoC.
>
> According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> level so specifying one reset entry per group is sufficient.
>
> This patch was inspired by a patch in the BSP by
> Takeshi Kihara <takeshi.kihara.df@renesas.com>.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
