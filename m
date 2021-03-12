Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64039338703
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 09:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhCLIDk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 03:03:40 -0500
Received: from mail-vs1-f41.google.com ([209.85.217.41]:46751 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbhCLIDZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 03:03:25 -0500
Received: by mail-vs1-f41.google.com with SMTP id p24so12055088vsj.13;
        Fri, 12 Mar 2021 00:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3JdMHmmTBvATHsFXKO/cGg+SfkEVzK4ElHSRtkISp+w=;
        b=rcUgY/BfVh0+z0/LdjReCMQeoepvkMiqf39Pg5oXgupPLmT8o7/9/Zf8Vr8ZMWMxMS
         mXkTOqm1et2rNDM5IFOPGlyCF1xPcWmHW37p2qP8PRM1R9zzX5ATUSRfCUIzUOO1v44v
         BOUOeP3aeMh4C9VBEQQ5kPRYLQYfkKm8XrPaPs8gSPl/Fqi3inStRqTtLEDKHUKT836z
         buJp08DLrq/UbhwRuh0oNVOWDXhcZbGP3jilpZBkx5WFFT26sZnx96pW1ORa4tD9py91
         Cz3CZDGOFffK+siAYbk4odeBXgrGEQChORnnzyMPkT3lKYGMMEgI1pDXHjiGgHcOAXkm
         SlPg==
X-Gm-Message-State: AOAM532H9EYmHJxN3q8MbjRw7Yl4n7aoz9r0UNQnzgGGuyYuJEd5cJlJ
        CW7YVLqUENI/QUJHda5TY7H6RL6OGX+Yp+GRTmM=
X-Google-Smtp-Source: ABdhPJy+utvC3BIeFNSsBN27dRWblUEEqe90kHxRo1Acxvslc2MdW/KMU813nKAaMMY9vNqFids+uxI51HnpgxpfX1k=
X-Received: by 2002:a67:efd0:: with SMTP id s16mr8147295vsp.3.1615536204791;
 Fri, 12 Mar 2021 00:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20210312025420.529339-1-yoshihiro.shimoda.uh@renesas.com> <20210312025420.529339-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210312025420.529339-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Mar 2021 09:03:13 +0100
Message-ID: <CAMuHMdXje7OrzbbGtxA+wB3=p-eY4s5LANEN5=MmzUTEU1yLpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: Add CAN nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 12, 2021 at 3:54 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add the device nodes for all CAN nodes on R-Car M3-W+.
>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
