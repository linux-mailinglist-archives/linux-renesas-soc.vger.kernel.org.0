Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A402646D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 15:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728971AbgIJNWj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 09:22:39 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38292 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730261AbgIJNWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:22:00 -0400
Received: by mail-oi1-f193.google.com with SMTP id y6so5874744oie.5;
        Thu, 10 Sep 2020 06:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pVhjVtQYTYr0B+NNqsDQfFytpRXxt36t+O38QwqCLn4=;
        b=KkMtBDXtdvkrFvY6xC7riMV0Zh3A42ZSG3delDNOMwIgkI69WHTpRYBITLcBJuXJ8N
         1bvVQwYo79am8wYZN3qR7JoROpTaykaTFEXJy+ORO26Hi07oHvRcBR+T6HU7f3Rjy05/
         EM18aQQ5PZhDMzKdUybmzW2tRwW4gNhtWmTRLKj4tUk9qqSuMiXhXNMEq/NrtaNg7mG6
         QCdlyNfTQZP16wtF7IHmsb0roU/2zq5ZhzfGWjyrXGvsto7+smV0JRizS8IESTOIKq76
         EE2A8hT17xk5l1Ufdi6Ni1t24TdAW7yIiLYG/XiuRcCJerXdP00NdOCJwRhrnZKWX+nd
         eOlw==
X-Gm-Message-State: AOAM531oUSLv3CnDc3fslKo0P2gpeVtwllYzxsGtrZTIeSlYvkclZh6n
        KXIp+U43SB5y2Xa8K2kJ1F4ybRZH98IbXVnbbBo=
X-Google-Smtp-Source: ABdhPJwvKOzU+4BvfVjKptc58RR537wQDV3+GPXUR4NoCxBRUVM5MCR0PAEkmfzgQjBCsVto3iesk8bSlQ7y7qbj6wg=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr67610oib.54.1599744119902;
 Thu, 10 Sep 2020 06:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599739372-30669-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599739372-30669-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:21:48 +0200
Message-ID: <CAMuHMdX0fhDG=qo5qZRHYd2Da-pzxMOF79PBau_w9n0gOqEXXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: renesas: Document Renesas Falcon boards
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Sep 10, 2020 at 2:03 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add device tree bindings documentation for Renesas R-Car V3U
> Falcon CPU and BreakOut boards.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
