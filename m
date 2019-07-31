Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF9D7BBBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 10:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfGaIdw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 04:33:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45379 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfGaIdw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 04:33:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so68644727wre.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2019 01:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGsLzBygQeN4U1HbS+siGyivzSnwWDQU6/cEgl1u7bA=;
        b=MKgqCCq4FyStvoyqOMcJkYsiRoKYxK836et5Cy5YY4OJIrZakyhJKeJTusSsd4o2+s
         M3iEcQpihvt97ILYonVipvtqGWVL8p+iD5JXCCo29KLSF+vK+ctUyySgPFQDHldFLV4i
         je4pP0QakFuBFBqpF0VDzwEQuF7tw2mCc9oBTeCuzBgp/WJX8/EsZouuXnC4XANa6zt4
         IsICs7MK908KXqKY9UhXy7PZXL+HG0c85v6FuhV6UEIYMJLZTx0EawD1RL3FEJjv/gxD
         3HE2rUdWo5KKcri5npmV6k8/Esiq2ZEX4isZLW0w26+KxEZZtjlK7AlrAwRxBQp16GuN
         ZyVA==
X-Gm-Message-State: APjAAAW8J1uG/vltEF7ciDXYVNTo8JvnWU5WnF6r0A+rf51mnsOS1N7D
        OIKxPnJxFSxg2iN0ffQae9lGsIcl4VXJMmnhwbey46Dl
X-Google-Smtp-Source: APXvYqyHziTaChsaMWtanO1xCV68zcl6MTTzIToJk2Rucs4hRh1zedOwhC5f4r6CT7jA9LbHoCbi9u9lTdoflyuIYPs=
X-Received: by 2002:adf:cd81:: with SMTP id q1mr131610751wrj.16.1564562030235;
 Wed, 31 Jul 2019 01:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <1563461033-19708-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563461033-19708-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Jul 2019 10:33:38 +0200
Message-ID: <CAMuHMdV9Wwgc5Q_Nzk3qKUFduQ0WRTgpQM0Jqv-qmE0Va5oZog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795-es1: sort nodes node
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

On Thu, Jul 18, 2019 at 4:44 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
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
