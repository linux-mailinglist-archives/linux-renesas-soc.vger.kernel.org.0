Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E076398C39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 09:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbfHVHKW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 03:10:22 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45741 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728782AbfHVHKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 03:10:22 -0400
Received: by mail-oi1-f194.google.com with SMTP id v12so3583964oic.12;
        Thu, 22 Aug 2019 00:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EwvBtHkWaGHD4K2nxZOlOBQy7VBO0bDrSzMbV9vgq3U=;
        b=dj19JTFfu9x1UhuhnsabPeUhe8iqWi8UuuSqV4hSosEB/11wxofMCGmXEtdZi5ppVU
         gMqCzsgZZwul/RnFIm97jsfr1w1b8K/FbRgThG6BkVbc4KBOu+FkM8J81/pEyWk5Mqvo
         QjZUS8OVd6Fl1+JNQ3iBh4I4PF/VK0oKhRWNIPSBSedlqPfo6ZMdlB/1WpoYr6ClAJii
         ry8KAR01zCmv1OBMmtmLAlQPmziwKRiO2TQTewe53MF2v6tOWs1qDLyyKtjfYz+/ndK/
         ODMuHdURxDGyLzSjN6kFsAY4BL9o5U4utc6FGyWDvEKV1TxUdUgdtT7MP7ookQpSUI2g
         +GVg==
X-Gm-Message-State: APjAAAX64XUxP3QKRSlRQEwUJE+seqOvEmjruyjpfqs8CsEPL3pACw75
        tu9KnxaVezI1Z6eHj1TRjSUkfWisd2XkhisExrY=
X-Google-Smtp-Source: APXvYqyyyHNLpCZ9XZ6EJ3oWDglLeyH/x9ddVeuYZoYef28ZE96RjT42LJBQe7ySW8wCUjTfSYjuqy6lfCIATfO1/Mw=
X-Received: by 2002:aca:3382:: with SMTP id z124mr2855346oiz.102.1566457820849;
 Thu, 22 Aug 2019 00:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <156630449239.17444.11157306180861080402.sendpatchset@octo> <156630455678.17444.15308898250025256159.sendpatchset@octo>
In-Reply-To: <156630455678.17444.15308898250025256159.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Aug 2019 09:10:09 +0200
Message-ID: <CAMuHMdWSKvZqdrpwzMTMHu2cYg=-8ZpRYJi25ZxZ=CKdPy7v5w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0
 SoC-specific match
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 20, 2019 at 2:34 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add SoC-specific matching for CMT1 on r8a7740 and sh73a0.
>
> This allows us to move away from the old DT bindings such as
>  - "renesas,cmt-48-sh73a0"
>  - "renesas,cmt-48-r8a7740"
>  - "renesas,cmt-48"
> in favour for the now commonly used format "renesas,<soc>-<device>"
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
