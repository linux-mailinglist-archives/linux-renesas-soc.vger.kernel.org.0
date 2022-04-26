Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46200510141
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 17:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351868AbiDZPEL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 11:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351874AbiDZPEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 11:04:04 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EA83AA6D;
        Tue, 26 Apr 2022 08:00:56 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id s4so13462057qkh.0;
        Tue, 26 Apr 2022 08:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8u2BCnP+IT5NHEoYZZRGH2WaaPF7J5QqhEMq961Y7b0=;
        b=G+t/DfgZ1HCj2cFLwFgJ+4Q/DNBqIzCz8nCAfZ0kpi00Lhid4kW9CpxmQEG1vOjiZQ
         kxSG8yt3XEfurKER1/fhDbBY/1/Z1QctkH+TImjA3qzEK/QPOFRfcbiOXwzTEL1Fdc0j
         ESwMbEWyrnRhWiUO5MM67GXDxOxILPdXjqcqndPYKKpF58xZoDTirZmzO0LhDolbqStZ
         L3tS5vIYRex0o6zKljiaoNZ7ocN8ommApEp0wrO9x4n+WOXVtWDMEDpLXHY+2aiWInW6
         VL93fU4u8oGtwTKaUGCNwnczZWc8phVSlOKbqJvQVWzMJAPEzY9ip8Y5DgS4sh+Cqyol
         IPlw==
X-Gm-Message-State: AOAM531cID0hZ8ITD5ODAM3p3RBHAZUR2mclACGqPMhUe4Bna1AX5Ro/
        PHGM83U+c21dgoR3d6PiNwBJxkMTPjbTLg==
X-Google-Smtp-Source: ABdhPJzPaVuXsmDcbzHzyAz5bcenDR++AiVpblgp23UuJH6IBGlF0FsYumLB8q5kWFhRBvxlzB9xHQ==
X-Received: by 2002:a05:620a:440e:b0:69e:a751:109b with SMTP id v14-20020a05620a440e00b0069ea751109bmr13376549qkp.469.1650985255493;
        Tue, 26 Apr 2022 08:00:55 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id o14-20020a05622a044e00b002f3656df6f6sm4410589qtx.78.2022.04.26.08.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 08:00:55 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f7d621d1caso73827097b3.11;
        Tue, 26 Apr 2022 08:00:55 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr22406962ywb.132.1650985254804; Tue, 26
 Apr 2022 08:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-5-phil.edworthy@renesas.com> <CAMuHMdWErGQuE+ESi3ZGVgyW5ouUthr5XsmnwLJD0VX6D3QVPA@mail.gmail.com>
 <TYYPR01MB7086454DB14FF78DD09EAB7DF5FB9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086454DB14FF78DD09EAB7DF5FB9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 17:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVE-DAWaSia_iBkjrB86v=kDG2bwrTP9kJmkzgkgvEQ+A@mail.gmail.com>
Message-ID: <CAMuHMdVE-DAWaSia_iBkjrB86v=kDG2bwrTP9kJmkzgkgvEQ+A@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] dt-bindings: clock: renesas,rzg2l: Document
 RZ/V2M SoC
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Tue, Apr 26, 2022 at 4:39 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 26 April 2022 15:21
> > On Wed, Mar 30, 2022 at 5:41 PM Phil Edworthy wrote:
> > > Document the device tree binding for the Renesas RZ/V2M (r9a09g011) SoC.
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > > --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > @@ -42,9 +44,10 @@ properties:
> > >      description: |
> > >        - For CPG core clocks, the two clock specifier cells must be
> > "CPG_CORE"
> > >          and a core clock reference, as defined in
> > > -        <dt-bindings/clock/r9a07g*-cpg.h>
> > > +        <dt-bindings/clock/r9a07g*-cpg.h> or <dt-
> > bindings/clock/r9a09g011-cpg.h>
> >
> > I guess we can simplify to dt-bindings/clock/r9a0*-cpg.h?
> We can, it was just to ensure we don't ever catch a file related
> to rz/n1 (r9a06g032). However, r9a06g032 has -sysctrl.h suffix.

Even if RZ/N1 had the -cpg.h suffix, it would fall under different
bindings. Not much we can do anyway, when people include the wrong
header file ;-)

> I'm easy either way...

I'm trying to avoid having to update (too) many places when
adding support for a new SoC.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
