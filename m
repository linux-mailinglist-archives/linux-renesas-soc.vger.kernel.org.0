Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8590E4ECD74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 21:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbiC3TrP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 15:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiC3TrM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 15:47:12 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FFF31344;
        Wed, 30 Mar 2022 12:45:25 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id 10so19094568qtz.11;
        Wed, 30 Mar 2022 12:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZCXCd2iIOo22xM2jfU+S+H+4IKRxX6EvhHPW4QxClBo=;
        b=qcDNFl9RXgzCngmHLpJQGX4nb9rLqegcXFV36wFXLg9fdtsTRhzqL1jKBNagq1s83K
         Jw7yDvTj9iw+0Vti3m8FGm5Ip3oCN0BL9C1gSZJJ/5ox5FNm06famYmDvZ9Ma+svd1OB
         GkCz0ej1kxG1ivUMr7LBWmOyjd8brAvu9G6umZgnjgav3kLTlefZgE1dYxCvKRN3sjJa
         tW69LuJhL+dc2NXsL0fcGRvAJf4rMNk7q5mvEK3/vb2CBSvdT2W7+V3XH6H8tV7YZWHw
         NOMbmlf8fYJqlwLXFb7fWYFNR5Uxvvkq8YQx2LS+zLRSjZEA4sjLGWInlf1gq3dJVhPB
         nTew==
X-Gm-Message-State: AOAM533BpYEGc8nDGmq/cizH6pfige48WZ5t/zQ6FkkD4ZEQQaR+D+CF
        /Rop5ncswfH4SsEl4gGOn0wpoqGfwprwwA==
X-Google-Smtp-Source: ABdhPJzfgAYsSxQiN+hm/VXtjf/8AdLF+BGnr2Txmb1crZl/OL7UJHSjhdCD4XB1F56apOZcFznDaw==
X-Received: by 2002:a05:622a:120b:b0:2e0:6878:cea with SMTP id y11-20020a05622a120b00b002e068780ceamr1086218qtx.547.1648669524436;
        Wed, 30 Mar 2022 12:45:24 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id h16-20020a05620a10b000b0067d82ac1de4sm10848704qkk.114.2022.03.30.12.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 12:45:24 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id v35so38564258ybi.10;
        Wed, 30 Mar 2022 12:45:23 -0700 (PDT)
X-Received: by 2002:a25:c049:0:b0:634:6751:e8d2 with SMTP id
 c70-20020a25c049000000b006346751e8d2mr1389254ybf.6.1648669523727; Wed, 30 Mar
 2022 12:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
 <20220315142644.17660-4-biju.das.jz@bp.renesas.com> <CAMuHMdVHWvkZyjPi4i5AG2iYgMp7euS=Nf-v_rYNVS10jiW6eQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVHWvkZyjPi4i5AG2iYgMp7euS=Nf-v_rYNVS10jiW6eQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Mar 2022 21:45:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmhfQJq53U6rKGkwGLFdnNoL-RF6qpUoE+7c0=J-ZUFg@mail.gmail.com>
Message-ID: <CAMuHMdWmhfQJq53U6rKGkwGLFdnNoL-RF6qpUoE+7c0=J-ZUFg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: Add R9A07G043 CPG Clock and
 Reset Definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 30, 2022 at 9:27 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Mar 15, 2022 at 3:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Define RZ/G2UL (R9A07G043U) Clock Pulse Generator Core Clock and module
> > clock outputs, as listed in Table 7.1.4.2 ("Clock List r0.51") and also
> > add Reset definitions referring to registers CPG_RST_* in Section 7.2.3
> > ("Register configuration") of the RZ/G2UL Hardware User's Manual (Rev.
> > 0.51, Nov. 2021).
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Removed leading u/U from r9a07g043
> >  * renamed the file r9a07g043u-cpg.h->r9a07g043-cpg.h
> >  * Prepared Common Module Clock/Reset indices for RZ/G2UL and RZ/Five
> >  * Prepared RZ/G2UL specific Module Clock/Reset indices.
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/r9a07g043-cpg.h

> > +/* R9A07G043 Common Module Clocks */
> > +#define R9A07G043_IA55_CLK             0
> > +#define R9A07G043_IA55_PCLK            1
>
> I think IA55 does not exist on RZ/Five?

Looks like I was wrong, and it does exist.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
