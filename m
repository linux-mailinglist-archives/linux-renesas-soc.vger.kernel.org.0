Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E802F64CC5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 15:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238517AbiLNOej (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Dec 2022 09:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238623AbiLNOeh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 09:34:37 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB8929B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Dec 2022 06:34:35 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id u19so26459720ejm.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Dec 2022 06:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NpdIC9yfEfML+JTsasPerHswhdeXgtUUncwQhuMnyqE=;
        b=XLKf1zw+Pg5X/5RU+NqTJXZbD6289aN9/me5ZGVd8EVaQRYyJ2A1JlBdG/Z3vsSDhk
         Qmz9aiiZNObRESdS/CH7NwQdJvzHJFIDjkC0casil4G4a0N9QFE5mfSjYWXd8ZJ15YF4
         rGJgGKsHjpVfDDZj6p5BrCfquqIHmoSjSxlcAftAz1JUO8wSbof7/g91hgr1+XKPPePu
         kfMlDQb3+qMJ6DUrRCH6VLm3UIt74/cQiWtTtE3ylBHYgQVQ6Aor3fbMntGxp9AmnQtV
         ejTOcc664SpZgkLUI0eTSEsPKw0r8GbVeA1KvrhoplnpFLRnnWk+D6rtNKmjsnXEgo5H
         Iehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpdIC9yfEfML+JTsasPerHswhdeXgtUUncwQhuMnyqE=;
        b=eP75PTi/pbFnKOYMaq90ZqA+C3e2FzsnTu2h2AzAtGdmWbjJDNQc8/bp8xR5U5QL7N
         z3h54vaJBm1fyRqaMtEw/VKQ243CdsdfDF6UNFr+xGypwkBlDyCHy2D+qKMX2Ut9HoMY
         M7Sgp/EBqXCcKYo0bguuy1rt7Y41AkJBhe0rd6y1J0ByCbu825N8yRnCXkhsx6xMTY70
         wfCKF9KUJs9Y0b/wqgkR+qrrHHHs1F7TUXpL6fCSjyYMFxZxNSlrwfneGCLQHl4clS0i
         Uqs1Z9oTMqjp0X5QcfC259xvypwGhEgzK6aZRHNmvNNwc/Mznbk2PH3NFOtrxku9Fj+O
         eIAw==
X-Gm-Message-State: ANoB5pldrby6Bk+uCfXeoRcuKa8iz7efDmGzKTpoZya57MUGQrQYxyRj
        U9nv1Ljce3OV++22yfSaEbOriw==
X-Google-Smtp-Source: AA0mqf6CmxqK+9dd28/XPm5VnoWGfEXLHPyKVsjaVNohL2FH1YAqanoPm55ZEQuTbm9gGFjhahizfg==
X-Received: by 2002:a17:906:1d01:b0:7c1:36:9002 with SMTP id n1-20020a1709061d0100b007c100369002mr20212671ejh.67.1671028474394;
        Wed, 14 Dec 2022 06:34:34 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm5896464ejc.48.2022.12.14.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 06:34:33 -0800 (PST)
Date:   Wed, 14 Dec 2022 15:34:32 +0100
From:   Andrew Jones <ajones@ventanamicro.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Magnus Damm <magnus.damm@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Conor Dooley <conor.dooley@microchip.com>,
        Samuel Holland <samuel@sholland.org>,
        Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jisheng Zhang <jszhang@kernel.org>,
        Atish Patra <atishp@rivosinc.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Philipp Tomsich <philipp.tomsich@vrull.eu>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 1/6] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
Message-ID: <20221214143432.4micw2gipvhfqwoa@kamzik>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXXXN9g8o1j7k-TC=F-kuyf-KngFSKi7z9z0SY9BLxmHA@mail.gmail.com>
 <CA+V-a8s9iAtFVzdA4R_tSMuBTkoY3JmZ12MJw__Pgfyetsz34g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8s9iAtFVzdA4R_tSMuBTkoY3JmZ12MJw__Pgfyetsz34g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 13, 2022 at 05:49:32PM +0000, Lad, Prabhakar wrote:
> Hi Geert,
> 
> Thank you for the review.
> 
> On Tue, Dec 13, 2022 at 5:21 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Mon, Dec 12, 2022 at 12:58 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Introduce ALTERNATIVE_3() macro.
> > >
> > > A vendor wants to replace an old_content, but another vendor has used
> > > ALTERNATIVE_2() to patch its customized content at the same location.
> > > In this case, this vendor can use macro ALTERNATIVE_3() and then replace
> > > ALTERNATIVE_2() with ALTERNATIVE_3() to append its customized content.
> > >
> > > While at it update comment above ALTERNATIVE_2() macro and make it generic
> > > so that the comment holds good for any new addition of ALTERNATIVE_X()
> > > macros.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v4->v5
> > > * Rebased the patch on top of Andrew's series (now in Palmers for next-branch)
> > > * Updated comment for ALTERNATIVE_x() as suggested by Heiko
> >
> > Thanks for the update!
> >
> > > --- a/arch/riscv/include/asm/alternative-macros.h
> > > +++ b/arch/riscv/include/asm/alternative-macros.h
> > > @@ -50,8 +50,17 @@
> > >         ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> > >  .endm
> > >
> > > +.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,   \
> > > +                               new_c_2, vendor_id_2, errata_id_2, enable_2,    \
> > > +                               new_c_3, vendor_id_3, errata_id_3, enable_3
> > > +       ALTERNATIVE_CFG_2 \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1,      \
> > > +                                 \new_c_2, \vendor_id_2, \errata_id_2, \enable_2
> > > +       ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
> > > +.endm
> > > +
> > >  #define __ALTERNATIVE_CFG(...)         ALTERNATIVE_CFG __VA_ARGS__
> > >  #define __ALTERNATIVE_CFG_2(...)       ALTERNATIVE_CFG_2 __VA_ARGS__
> > > +#define __ALTERNATIVE_CFG_3(...)       ALTERNATIVE_CFG_3 __VA_ARGS__
> > >
> > >  #else /* !__ASSEMBLY__ */
> > >
> > > @@ -98,6 +107,13 @@
> > >         __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)   \
> > >         ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
> > >
> > > +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,        \
> > > +                                  new_c_2, vendor_id_2, errata_id_2, enable_2, \
> > > +                                  new_c_3, vendor_id_3, errata_id_3, enable_3) \
> > > +       __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> > > +                                   new_c_2, vendor_id_2, errata_id_2, enable_2)        \
> > > +       ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
> > > +
> > >  #endif /* __ASSEMBLY__ */
> > >
> > >  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> > > @@ -108,6 +124,13 @@
> > >         __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),   \
> > >                                    new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
> > >
> > > +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,               \
> > > +                                 new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,                \
> > > +                                 new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)                \
> > > +       __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),   \
> > > +                                  new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),   \
> > > +                                  new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
> > > +
> > >  #else /* CONFIG_RISCV_ALTERNATIVE */
> >
> > To avoid breaking the build for K210 (and VexRiscv), you need to provide
> > _ALTERNATIVE_CFG_3() for the !CONFIG_RISCV_ALTERNATIVE case, too:
> >
> Thanks for testing this.
> 
> > @@ -144,6 +144,9 @@
> >  #define _ALTERNATIVE_CFG_2(old_c, ...) \
> >         ALTERNATIVE_CFG old_c
> >
> > +#define _ALTERNATIVE_CFG_3(old_c, ...) \
> > +       ALTERNATIVE_CFG old_c
> > +
> >  #else /* !__ASSEMBLY__ */
> >
> >  #define __ALTERNATIVE_CFG(old_c)       \
> > @@ -155,6 +158,9 @@
> >  #define _ALTERNATIVE_CFG_2(old_c, ...) \
> >         __ALTERNATIVE_CFG(old_c)
> >
> > +#define _ALTERNATIVE_CFG_3(old_c, ...) \
> > +       __ALTERNATIVE_CFG(old_c)
> > +
> >  #endif /* __ASSEMBLY__ */
> >  #endif /* CONFIG_RISCV_ALTERNATIVE */
> >
> > Else it fails (on riscv/for-next) with:
> >
> I'll include the above hunk in next version.

Yes, those two hunks are in my example in [1] as well.

[1] https://lore.kernel.org/all/20221129150053.50464-1-ajones@ventanamicro.com/

Thanks,
drew

> 
> > arch/riscv/mm/pmem.c: In function ‘arch_wb_cache_pmem’:
> > arch/riscv/include/asm/alternative-macros.h:198:8: error: expected
> > string literal before ‘_ALTERNATIVE_CFG_3’
> >   198 |        _ALTERNATIVE_CFG_3(old_content, new_content_1,
> > vendor_id_1, errata_id_1, CONFIG_k_1, \
> >       |        ^~~~~~~~~~~~~~~~~~
> > arch/riscv/include/asm/errata_list.h:128:14: note: in expansion of
> > macro ‘ALTERNATIVE_3’
> >   128 | asm volatile(ALTERNATIVE_3(      \
> >       |              ^~~~~~~~~~~~~
> > arch/riscv/mm/pmem.c:13:2: note: in expansion of macro ‘ALT_CMO_OP’
> >    13 |  ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size, 0, 0);
> >       |  ^~~~~~~~~~
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
