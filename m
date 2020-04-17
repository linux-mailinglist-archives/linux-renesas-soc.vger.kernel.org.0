Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094331AD796
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 09:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgDQHmK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 03:42:10 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:42047 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgDQHmJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 03:42:09 -0400
Received: by mail-oo1-f66.google.com with SMTP id e18so267618oot.9;
        Fri, 17 Apr 2020 00:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fWeUFKxDD1hklpuXtyjSbQe5r1FNrLFqKnrYsB3o+7o=;
        b=dVru0M9bg+BgZEMElclUaw8wF79djyRuTOGZLpxk2tMw1BDDLHvI/lzsLalIcd6fpr
         UuZUbDBRDQdMN64oQdU1c+CrtEPxEzKCwIGt9ozvReQcFJ+wjaeDLxC8mVUaQCpIArAS
         Q7nZCYCoTUiqJZPHeKRmKy/7rH6fZytNpxt0chrt0qKFolnC8jUgdJRmOE5v1vWni0eH
         Y3lKEyvdhoeowMkaIsbN3rAhmqhY25ycZMHKF4Xmkc6uCGnOtFXzs5NWEj+QdSO5DalU
         P1jEK+6PJ7zK5wynktyT91UK+DOMqV3d0+AkLX0FlS4tkh0F5toCTcHJYnniE8X3FphV
         rJGQ==
X-Gm-Message-State: AGi0PuaF8XiZPdj/ZYpltmAthDI96GwGySrJoDOIfjG3gVGC/oH9Dqlz
        xRV/aI7JPpkG9R5YzJ+NRCWnQoygQF0aA3eMCDk=
X-Google-Smtp-Source: APiQypL6pte3YrpH31dxcJOLGJ4OzC7E+jLbjM9wD8LHbLYj4M4+F8lMJVezlZjUGLPOpeozMSGWEZYlLuLGneBOdN0=
X-Received: by 2002:a4a:e1af:: with SMTP id 15mr1519223ooy.40.1587109328784;
 Fri, 17 Apr 2020 00:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <1587106953-1415-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1587106953-1415-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Apr 2020 09:41:57 +0200
Message-ID: <CAMuHMdUZxWCF2tr1jQLzNn8MzoDOJ4BNDwm=MD3+3+60g4Bbaw@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema
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

On Fri, Apr 17, 2020 at 9:03 AM Yoshihiro Shimoda
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
