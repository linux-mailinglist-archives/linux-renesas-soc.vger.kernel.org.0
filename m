Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E5A1B1FAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 09:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgDUHTm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 03:19:42 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39518 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgDUHTm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 03:19:42 -0400
Received: by mail-ot1-f68.google.com with SMTP id m13so10421216otf.6;
        Tue, 21 Apr 2020 00:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=veb+c1epeetzdg6zofKI0cevmUaJQHxspqLhCZkderQ=;
        b=ndyBYrO+DXHPnKvIrfhxlhWUR8FO5Dj6/UNaX9Nvte4EYPHQI45qTYgo+TpO6KGhzf
         DCLUnw3WmqG2vdCil2+aNK5MeMOX3lyUNGq8lPSAue3rSmOzvqXbBTDgpnq+Urel+an7
         yXlwCFGCpNQVINBPqrEuPbYGgKR8zGYc40ehY9y5VHGCgmNkXVLyh6KLXs8MPicND/te
         SFIALxh8W2AoD6aC8Snm6+vQhO4rFz9O2LRof6/Iw8yGHg75qUUmihHV2OCEN1dZ08Cm
         aqHVSersNHu9WOSv40Wfc663xGHhK4kd+ERq/ariBA58P5AvSv/Jdqlpkmii/Jz3/M2K
         qM8w==
X-Gm-Message-State: AGi0PuavN2cnrrYaISY4r6keuNPe+kB3Q+RaQ3b55JnBuD7M+/YmXxgq
        h06V8sOplDQCpd1jN/Ya5FdiXcOMvoHg6NO2clI=
X-Google-Smtp-Source: APiQypLzOp3GKz0WqE0yA707ywSnKhIAt8Y1SJIGp1YtyySWFoWR+keaq+xo+4clNPhU5Y70hNXNgaXr4Cv7dzv7JVU=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr12300178otl.145.1587453581546;
 Tue, 21 Apr 2020 00:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <1587446152-23886-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1587446152-23886-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Apr 2020 09:19:30 +0200
Message-ID: <CAMuHMdWcMqsP-77qSFoVmKDi6Sfjk-p3UXbdhjSODkkG+kn09Q@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 21, 2020 at 7:16 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Convert Renesas VMSA-Compatible IOMMU bindings documentation
> to json-schema.
>
> Note that original documentation doesn't mention renesas,ipmmu-vmsa
> for R-Mobile APE6. But, R-Mobile APE6 is similar to the R-Car
> Gen2. So, renesas,ipmmu-r8a73a4 belongs the renesas,ipmmu-vmsa
> section.
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
