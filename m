Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426C06D5958
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 09:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbjDDHVY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 03:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbjDDHVX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 03:21:23 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F7710CA
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 00:21:22 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-536af432ee5so598310707b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 00:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzC4qqMn/ltAspZLgn+eeCi6qIDZzUUwhuqty6/uoFc=;
        b=2B2rfxFsOjEA6ZkOSQmdTLxlQ28jhYrVwK2skoQOp/KHF4xMLPPHaZQHAHDG08ftkl
         Ow2/U1yfWbu8RrC/xaNxzFH8S70PmIjeOnRXf3+UNkTF3HbJyLubflZicJdZAzTK0r95
         /MRvX/LdHGfFZKfQYyeRalTsE+WsP1DgtoSSY0XZbqeP3wRpS/Cj7M21z17opdtEYJfR
         egLyrdYoa0HxpOtWyCwxyUZjyMNvPNRiWBzutMJ3wNndI8q+b2aNPrC8FMf+XjurlUaP
         DyqcgITgdRH5QVdozFX1EobDOtrHGikdxeVz3qGP2x8hyH15pl4+qIT+oSebYDnZHbXB
         MWAw==
X-Gm-Message-State: AAQBX9dS/yNblosA8BXLlX7nAaX8m0eEzDb8OOrkeJMT3atBtmMhrRFn
        bZEbiPNFF0dZRwFW/Prhm0pLppxR1Akjw0pr
X-Google-Smtp-Source: AKy350airGZQxDgNJH+z4cHYGalTfJRozkf1MLxKkRDs4+DDMS9mzItZ6W+9bjPyoeAfG2TL2YXGxA==
X-Received: by 2002:a0d:ea92:0:b0:541:8f14:e848 with SMTP id t140-20020a0dea92000000b005418f14e848mr1420097ywe.40.1680592881469;
        Tue, 04 Apr 2023 00:21:21 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 125-20020a810883000000b0054629ed82f9sm3028029ywi.83.2023.04.04.00.21.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:21:21 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5445009c26bso597393127b3.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 00:21:21 -0700 (PDT)
X-Received: by 2002:a81:4054:0:b0:52f:184a:da09 with SMTP id
 m20-20020a814054000000b0052f184ada09mr1025106ywn.2.1680592880837; Tue, 04 Apr
 2023 00:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
 <20230123013448.1250991-4-yoshihiro.shimoda.uh@renesas.com> <TYBPR01MB5341A3746DE45EE185E546E2D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341A3746DE45EE185E546E2D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Apr 2023 09:21:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDjVr3udYAkV=FigSVd1JYN4JR=CmhUUPHPp-PbqFpqQ@mail.gmail.com>
Message-ID: <CAMuHMdWDjVr3udYAkV=FigSVd1JYN4JR=CmhUUPHPp-PbqFpqQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Jan 25, 2023 at 1:52 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Yoshihiro Shimoda, Sent: Monday, January 23, 2023 10:35 AM
> >
> > Add IPMMU nodes for r8a779g0.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi

> > +             ipmmu_ir: iommu@eed80000 {
> > +                     compatible = "renesas,ipmmu-r8a779g0",
> > +                                  "renesas,rcar-gen4-ipmmu-vmsa";
> > +                     reg = <0 0xeed80000 0 0x20000>;
> > +                     renesas,ipmmu-main = <&ipmmu_mm 3>;
> > +                     power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
>
> The power-domains should be R8A779G0_PD_A3IR.
> So, I'll send v2 patch after we discussed updating dt-bindings of "renesas,ipmmu-main".

The binding update is commit b67ab6fb63bbbe6d ("dt-bindings: iommu:
renesas, ipmmu-vmsa: Update for R-Car Gen4") in iommu/next.

Do you still plan to send a v2, or shall I fix this (+ removal of
renesas,ipmmu-main indices) while applying?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
