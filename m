Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44811D3F84
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 14:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbfJKM3j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 08:29:39 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45145 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfJKM3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 08:29:39 -0400
Received: by mail-oi1-f194.google.com with SMTP id o205so7801748oib.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2019 05:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mk/S55Za5w2S7LoyGIF9nU8j8q3VT+OJmghbM1EQWNA=;
        b=ku/N6hfg6TlBrETuJfBQ0kKxhkVbu70KL3KEj2EBe8UgO7PjN0bQw5FUmHdT2Sa9WR
         WV6/mpy1UsscLsM3EBxtBcc2+pw+cE6J2/gc9rw481140Lxw6KA5oSCe6JcxudS7W3qd
         /TsJZBCkMBQhuHgBSyX10BcnqJc5TxNQJqYTP9q4BrjwNGt1oHmbE/LOGKOwgCvxmTjw
         gRUAM2SSTAw3v6/1VDVfBNwynFxElOhSZYNesvhjeYWyblJILYvBTefZxyw5dqTFxO3g
         AkhdtGUHIaA59nnAMQEj1r+OEfYKI7Lxudb1SK/YtJZ+Z59IOF4AcyFrpWMP8FFCcHYM
         7mNg==
X-Gm-Message-State: APjAAAUY/SHWasIT9o2neqe74M0XMlXp3Quq0yQ6EafJYlAu/T6wHnX0
        1oq6ImTl2EUed1rW98H4BbpwFAJqQWaDJ95TPjmO9r3q
X-Google-Smtp-Source: APXvYqxJmNl+fmcMRc0/CWf4te3uXy2EMOFxzF+6nsYW0TqU97sEgQ/AWhrgDvvXNMI8dXF8hcwql+nR3WX5jjp8T8w=
X-Received: by 2002:aca:882:: with SMTP id 124mr11980630oii.54.1570796978363;
 Fri, 11 Oct 2019 05:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1570609609-1332-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 14:29:27 +0200
Message-ID: <CAMuHMdXv3ChOHO7RyOjQ0mL+9ugRFWnMUw7MfYD-9aU+ZZMSTQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] iommu/ipmmu-vmsa: Calculate context registers' offset
 instead of a macro
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
> this patch uses ipmmu_features values instead of a macro to
> calculate context registers offset. No behavior change.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -50,6 +50,8 @@ struct ipmmu_features {
>         bool twobit_imttbcr_sl0;
>         bool reserved_context;
>         bool cache_snoop;
> +       u32 ctx_offset_base;
> +       u32 ctx_offset_stride;
>  };
>
>  struct ipmmu_vmsa_device {
> @@ -99,8 +101,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>
>  #define IM_NS_ALIAS_OFFSET             0x800
>
> -#define IM_CTX_SIZE                    0x40
> -
>  #define IMCTR                          0x0000
>  #define IMCTR_TRE                      (1 << 17)
>  #define IMCTR_AFE                      (1 << 16)
> @@ -253,18 +253,25 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
>         iowrite32(data, mmu->base + offset);
>  }
>
> +static u32 ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu, unsigned int context_id,
> +                        unsigned int reg)
> +{
> +       return mmu->features->ctx_offset_base +
> +              context_id * mmu->features->ctx_offset_stride + reg;
> +}
> +
>  static u32 ipmmu_ctx_read_root(struct ipmmu_vmsa_domain *domain,
>                                unsigned int reg)
>  {
>         return ipmmu_read(domain->mmu->root,
> -                         domain->context_id * IM_CTX_SIZE + reg);
> +                         ipmmu_ctx_reg(domain->mmu, domain->context_id, reg));

For consistency:

    ipmmu_ctx_reg(domain->mmu->root, ...)

but in practice the features for domain->mmu and domain->mmu->root are
identical anyway.

>  }
>
>  static void ipmmu_ctx_write_root(struct ipmmu_vmsa_domain *domain,
>                                  unsigned int reg, u32 data)
>  {
>         ipmmu_write(domain->mmu->root,
> -                   domain->context_id * IM_CTX_SIZE + reg, data);
> +                   ipmmu_ctx_reg(domain->mmu, domain->context_id, reg), data);

Likewise:

    ipmmu_ctx_reg(domain->mmu->root, ...)?

I find these ipmmu_{read,write}() a bit hard too read, with passing the
mmu to both ipmmu_{read,write}() and ipmmu_ctx_reg().

What do you think about providing two helpers ipmmu_ctx_{read,write}(),
so all users can just use e.g.

    ipmmu_ctx_write(mmu, context_id, reg, data);

instead of

    ipmmu_write(mmu, ipmmu_ctx_reg(mmu, context_id, reg), data);

?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
