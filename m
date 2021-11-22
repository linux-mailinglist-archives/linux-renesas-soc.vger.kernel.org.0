Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33578458BA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 10:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238829AbhKVJhy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 04:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhKVJhy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:37:54 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CFFC061574;
        Mon, 22 Nov 2021 01:34:47 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id v7so48482984ybq.0;
        Mon, 22 Nov 2021 01:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/58NT7ct7q9qVhpboABnYcJs7B141CdNrRjRMouedh8=;
        b=NVDgnbp40OQu0oKb0zrSUhi4eKq6wPdR2Uvkgf2NPDUxT1zp8WmVpRPk7bYTS4FDVZ
         ULAJm+4ec9tru4GYGVsoDrHd58H0HH3DO+0yU3eshduzG+S3s5jaf6JROl7ZDHQuuJcX
         K0pIi4dbBq6D/D9aYuvrY9PYCByTmcbf4csDP7cgu0ccyzhlpeQzUFvzlXcU5js0IEYG
         K8bKJcsjuilYkArcQvg0gO5m/V0lfUyIJI9TyBkpL+8bxpVTBMF9vjIJn9FIVKB4gbOa
         qiWOuOwH6HBu9OQ26c/XjVqQjVHLnSvL70xti/iEgZwnm68vrk6qnzBnZmiACENi9Ma4
         xZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/58NT7ct7q9qVhpboABnYcJs7B141CdNrRjRMouedh8=;
        b=RpsYP1siznf8P1hRrxrVBlMbP/QQNsyv6RFpDWX+F8dIJVKkqY5j8VrsVAuZ6SQiQT
         ZRePhbMvptPSnagbonCE8fuxr+zrW/m3Ypyx5afvz1g85QZ3V3KyLdn5b5ELw/tuLE49
         AbMv9nAH1V2f5erZGsTPtA/3M7XMM76aj3jWEgPBOOon0BmHv6kMVe+Tx9y3CzbVivdM
         jphETVLnPDtDnZ7I2Sd4zFfqHQ+ywIt7YL6u11BMpURJVQwwVq27psls9/GJvSJtg9Kd
         CLS+TbTzKwEj3w5FmFEc+8zwGpqAYkJm6PA/4xjDgWLXyEGGOTabQ92Wu2b5rJoNZkCi
         po8Q==
X-Gm-Message-State: AOAM531+8skCKJz2DXADSEW3nqu9IlsPzWxf1RXTb+TTlorD9aJ//hlF
        xcuSmTf2ySeM0DiDs+b8UL0ZOzoIaYtqAp4yws0=
X-Google-Smtp-Source: ABdhPJzs+HD6VsEionQJCb9vESyL1udUm4nXwCA+R2YJGh5cJ+2GBO13x2XPSJYLfSVu+mUfKPp7tme+n8LDN/xgS98=
X-Received: by 2002:a25:f502:: with SMTP id a2mr62547759ybe.254.1637573687117;
 Mon, 22 Nov 2021 01:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
 <CA+V-a8sGA4=oxwp87VonC6zdPYT5-BHmsVoV8L1ggTUV8m4ooA@mail.gmail.com> <7eeeb5d0-3ef1-35cd-e7e2-cdeeb979b83b@canonical.com>
In-Reply-To: <7eeeb5d0-3ef1-35cd-e7e2-cdeeb979b83b@canonical.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 22 Nov 2021 09:34:21 +0000
Message-ID: <CA+V-a8umH8bh8vL8tYdTa=1Y65JvvuVpvzt-NRvi+XL80rOF=w@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Silence clang warning
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 22, 2021 at 9:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 22/11/2021 09:46, Lad, Prabhakar wrote:
> > Hi Geert,
> >
> > Thank you for the review.
> >
> > On Mon, Nov 22, 2021 at 7:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>
> >> Hi Prabhakar,
> >>
> >> On Sun, Nov 21, 2021 at 7:05 PM Lad Prabhakar
> >> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >>> This patch silences the following clang warning:
> >>>
> >>> | drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
> >>> | type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> >>> |           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> >>> |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>
> >>> Fixes: b04cc0d912eb8 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >>> --- a/drivers/memory/renesas-rpc-if.c
> >>> +++ b/drivers/memory/renesas-rpc-if.c
> >>> @@ -250,7 +250,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
> >>>                 return PTR_ERR(rpc->dirmap);
> >>>         rpc->size = resource_size(res);
> >>>
> >>> -       rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> >>> +       rpc->type = (enum rpcif_type)(uintptr_t)of_device_get_match_data(dev);
> >>
> >> While correct, the cast to "enum rpcif_type" is not stricly needed anymore.
> >>
> > Agreed.
> >
> > @Krzysztof, let me know if you want me to resend the patch with the
> > cast to "enum rpcif_type" dropped.
>
> I can fix it when applying, thanks!
>
Thank you.

Cheers,
Prabhakar

>
> Best regards,
> Krzysztof
