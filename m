Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFE6FD3F8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfJKMcl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 08:32:41 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40805 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfJKMcl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 08:32:41 -0400
Received: by mail-oi1-f195.google.com with SMTP id k9so7833923oib.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2019 05:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHx6lowuusoqF0mM8TadgO/DWxUYO4dTHGf6Y3SGlqM=;
        b=OiLLrxPb8ixT9ZfYz4LsJD1TcOGbN03j1mfJZGXbigbPIMNwZfOf9vEZUkm9tvUvlf
         qRNo+t/aLT3tOx4rEdxufxRwOyFI+ybgqJ7Ztzb4KGU9yVbeOquHVR+cLJkx6rNe63n7
         jdyaYx7zQ+D01P+GX+11nnW525jiydCx7Y0k0hUottG7peZcIbEtYCqiuzLOA20BRbY4
         52KT/6zZFDY7wPT9dDcxhlTYqe79+lJh6AjRxiLPS+Xie06b6R/RF7TCkp0ZEfHY5YDk
         fi+zDQGG2wpoXvy08XNogqV/WApaTxb20v6JQ/PFQiPq+vMj4EgTj6+0cVLBBMxR+cDx
         wRIA==
X-Gm-Message-State: APjAAAXKNZtk4lrniIaoOBVhO8gWYKwmPRU/56jCPPQTAOo9GbGsDZ93
        L/M5q/VC252CsSS3jo0xWDIyTBoo8jxhsqraVgCK2TB5
X-Google-Smtp-Source: APXvYqw6H4qmpFYo9nZCloI4OSuEEUHL7c1Nggx+ZO9Ae4mJ6XWX2YvnZYXWeofnJuilO9W920F11WaiLiQGFB1ws3M=
X-Received: by 2002:aca:cf58:: with SMTP id f85mr11435247oig.153.1570797159776;
 Fri, 11 Oct 2019 05:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1570609609-1332-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 14:32:28 +0200
Message-ID: <CAMuHMdW-Z9xkE5Eh7rbgufHSDvqoPyRJgsFhp_Ne9uk2XfUnEg@mail.gmail.com>
Subject: Re: [PATCH 3/3] iommu/ipmmu-vmsa: Add utlb_offset_base
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

On Wed, Oct 9, 2019 at 10:27 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> this patch adds a utlb_offset_base into struct ipmmu_features
> for IMUCTR and IMUASID registers.
> No behavior change.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -52,6 +52,7 @@ struct ipmmu_features {
>         bool cache_snoop;
>         u32 ctx_offset_base;
>         u32 ctx_offset_stride;
> +       u32 utlb_offset_base;
>  };
>
>  struct ipmmu_vmsa_device {
> @@ -285,6 +286,11 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
>         ipmmu_ctx_write_root(domain, reg, data);
>  }
>
> +static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
> +{
> +       return mmu->features->utlb_offset_base + reg;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * TLB and microTLB Management
>   */
> @@ -330,9 +336,9 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
>          */
>
>         /* TODO: What should we set the ASID to ? */
> -       ipmmu_write(mmu, IMUASID(utlb), 0);
> +       ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)), 0);
>         /* TODO: Do we need to flush the microTLB ? */
> -       ipmmu_write(mmu, IMUCTR(utlb),
> +       ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)),
>                     IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_FLUSH |
>                     IMUCTR_MMUEN);

Like in [PATCH 2/3], I think providing two helpers would make this more
readable:

    ipmmu_imuasid_write(mmu, utlb, 0);
    ipmmu_imuctr_write(mmu, utlb, data);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
