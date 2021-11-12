Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AFF44E709
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbhKLNJc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:09:32 -0500
Received: from mail-vk1-f177.google.com ([209.85.221.177]:45784 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbhKLNJb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:09:31 -0500
Received: by mail-vk1-f177.google.com with SMTP id m19so287061vko.12;
        Fri, 12 Nov 2021 05:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nq5oEJjJ9olOZrDprxv3x92YdgPfLIcqK5R5QEqV1ng=;
        b=GWh5RNYExKJIawBwpfDuZrx0efdWzqbcN1tn1PM26WEQM03WmoElP0JBQSKLz4ilQ0
         7QpG7IatxULSTL1py1fcq6iBl3tUNrlswIhk9a4fFbmjAIvIApmCxlg/TCMydHx6R7TN
         V5buJK7pkGAUutyZ8k/M1tbIwcwxzRWbSdPDItt3QWRNk4uDMAWa4Fqio0ubIw2fIdJx
         VeIXet6Wj6PjAee8SamugQZvlxPJrrjQPh6xY+B3W0EjCAVDIfx1fASY8a92vTf+zcg7
         UARNzdHUdelQ2QOaShovfpm03KpBgL6yw9ouBmpG9TxunmxZ/6FmfG51PB1zS+XuziTr
         H0XQ==
X-Gm-Message-State: AOAM531g9a3PzVLg2qrwANydopg54GLLWFpsZVPMnXK9iIehx1LbSeTC
        RdrQ2nMXRzhCjOG4eeSxyOPdKsY2r11+8A==
X-Google-Smtp-Source: ABdhPJwlWv4cH3RQAuYtqYHYZtvAc75i0SxXLmw+H0QfMG+64wC0cg52dvGjoWC53sr+e/7GrQ43mA==
X-Received: by 2002:a05:6122:790:: with SMTP id k16mr23554254vkr.26.1636722400434;
        Fri, 12 Nov 2021 05:06:40 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id c2sm4359991uab.11.2021.11.12.05.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:06:40 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id p2so18597872uad.11;
        Fri, 12 Nov 2021 05:06:40 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr9886013vsj.50.1636722400181;
 Fri, 12 Nov 2021 05:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:06:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa50fZup9j9v5ArmYXNH3Gi6Zv0L9z+nH317SA1GZK9g@mail.gmail.com>
Message-ID: <CAMuHMdWa50fZup9j9v5ArmYXNH3Gi6Zv0L9z+nH317SA1GZK9g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/21] mmc: sdhi: internal_dmac: flag non-standard
 SDnH handling for V3M
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> V3M handles SDnH differently than other Gen3 SoCs, so let's add a
> separate entry for that. This will allow better SDnH handling in the
> future.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
