Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7661C709A7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 16:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbjESOw5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 10:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjESOw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 10:52:56 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E1FA1;
        Fri, 19 May 2023 07:52:55 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ba818eb96dcso2988590276.0;
        Fri, 19 May 2023 07:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684507974; x=1687099974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdmeKfI0JTA7xNM9hmyUP5y2KlqAMrOrQrt47FEP6SE=;
        b=ah7+V5sszCoiLXzxY8D/Y6jbPX4f2Z5wffFnTLllvHFosXlCSMF8eTadO80XJNb7Fl
         S7JjKpn6Jm/nqZtSkFbNR7Rkk/XjK4CsntAPftYDXOQZt9vW6+kAwRHIbFQ90CpYxP8V
         OXYlmHHH0KEMv6gsVZWOqUgH/LAXmz/hh71xqeibzK/ocuSHDjJ4MrNQsGedBMXY4diF
         7xt8MF/WHgNSrfrJ5KAY5LrXOAvjnnZGGdtJjWo2wPU1zfHXBpRtAF2z0nlPHq4iUhc4
         RCByFa/2Qz2yhplfCCQHefg/BqrDQ7sBtg6qGMtNvnkK0EDYp78nKl0I7dBWNLlYqRYH
         Q1Xg==
X-Gm-Message-State: AC+VfDwMwpl7l+AzqEytz8Z3vZ78qLtlgurb+5nX8dU3KrM+Kc8YB2x6
        WqkhwID2fJIfVmcmXuxoyJj4uvLg3KrXjA==
X-Google-Smtp-Source: ACHHUZ649ztlZp/p4VcmLs+tFl2BzbNpE1dwcnLzQvRMei0Fc9E5oOAJduZABKqXDR3XS07l9jPkEw==
X-Received: by 2002:a25:1589:0:b0:ba7:36de:754e with SMTP id 131-20020a251589000000b00ba736de754emr2050595ybv.9.1684507973984;
        Fri, 19 May 2023 07:52:53 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id v7-20020a259b87000000b00b9e73d0dba5sm1049547ybo.47.2023.05.19.07.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 07:52:53 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-561f10b6139so18121577b3.2;
        Fri, 19 May 2023 07:52:53 -0700 (PDT)
X-Received: by 2002:a81:7c42:0:b0:556:bfac:ad12 with SMTP id
 x63-20020a817c42000000b00556bfacad12mr2355854ywc.16.1684507972941; Fri, 19
 May 2023 07:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com> <20230518-prompter-helium-91d0139a61e2@spud>
 <OS0PR01MB59226BDCD4D67430EC7377C6867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230519-civic-idiocy-5ac6d95675f0@wendy> <OS0PR01MB5922F379C4DF20124CBDEED3867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXQFQB7e7Pd1-CCerkwb4RDq7jJ_rv_kwf_Od+oGjMfUA@mail.gmail.com>
In-Reply-To: <CAMuHMdXQFQB7e7Pd1-CCerkwb4RDq7jJ_rv_kwf_Od+oGjMfUA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 16:52:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXN_TSfepdUng3cjnEBm_y0ovEG9SVUi3=13ehEMYzfPw@mail.gmail.com>
Message-ID: <CAMuHMdXN_TSfepdUng3cjnEBm_y0ovEG9SVUi3=13ehEMYzfPw@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 19, 2023 at 4:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, May 19, 2023 at 4:39 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > If the order is set by the descriptions, reg-names seem superfluous
> > > /shrug
>
> We have plenty of these, as it turned out to be much easier for validation
> to fix the order in the bindings than to support random order ;-)
> Lots of Linux drivers that do use the names don't care about the order.
> If all actual DTS used the same order, usually the order was fixed during

I meant "When all actual DTS...".

> the text to json-schema conversion...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
