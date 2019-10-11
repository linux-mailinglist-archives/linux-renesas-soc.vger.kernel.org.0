Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E621D3F44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 14:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfJKMLI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 08:11:08 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46321 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbfJKMLI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 08:11:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id 89so7714694oth.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2019 05:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KD7hNkPmgU5eUkr6kzafk4QUrOtUh97tOslZtesF6xM=;
        b=Prxt3T5HRumHxFw81FTkGLaeRaCRVGOL4EZQ+DBIdMLdXdB7s4BMOmhir7d1ep5u9I
         VIZaNBI36IQeXzx9pHvNBH+EE81PEyOh97NPXzXVTfdoTSJU4PuSiq2ANQ3UZmr8yGBi
         MKRKk5GiNHrcWChu4QX30MvEcoTu4O10GuMel+C9oYEblkAnlvVpbPD9L8uc7XZhHkDf
         ad/HaLc2hWOBCwN1PM7HeAvNuLcmnUUINVLqL31n9ZPMMsFeNhBXRDDQcFtI0znYFCUC
         0jLyyowfY2N3VrQwf9Nc5z6EnHAUQES/uM/vaO/+VZ/aHu1itosVAUFICn31bKvAcCjC
         qbMA==
X-Gm-Message-State: APjAAAX1aQDCVSODjr7DGWCs4FjU1DV1sWf6vUQO8lciOaFv5g7qUE6Y
        3HTPOAV10yOropoMNH8pWrTFN+odtQdeOaTjfJVMs6ip
X-Google-Smtp-Source: APXvYqwqkXmQ/JOh7OmTQ74bEvuK6xdpGsfpFjkRVQGiKI1Xo9EifsVApogi+Cz1sCGR5grPdjnz267Voy6EZ6+290g=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr12047997otr.250.1570795867699;
 Fri, 11 Oct 2019 05:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1570609609-1332-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 14:10:56 +0200
Message-ID: <CAMuHMdWfHYDOKSJBUCVLG6yNKxbv=jUd9E1B_fiBOQajwi_wEg@mail.gmail.com>
Subject: Re: [PATCH 1/3] iommu/ipmmu-vmsa: Remove some unused register declarations
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch!

On Wed, Oct 9, 2019 at 10:27 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> To support different registers memory mapping hardware easily
> in the future, this patch removes some unused register
> declarations.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

While I can confirm the removed definitions are unused, they were
still valid (but see comments below).
Perhaps it would be better to add comments, to state clearly to which
SoCs or SoC families they apply?  Or do you think this would be futile,
and would add too much clutter to the source file in the near future?

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -104,8 +104,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  #define IMCTR                          0x0000
>  #define IMCTR_TRE                      (1 << 17)
>  #define IMCTR_AFE                      (1 << 16)
> -#define IMCTR_RTSEL_MASK               (3 << 4)

FWIW, this is valid for R-Car Gen2 only.  On R-Car Gen3, the field
contains 3 bits.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
