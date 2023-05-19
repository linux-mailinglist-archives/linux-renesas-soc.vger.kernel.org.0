Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77301709A67
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 16:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjESOuD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 10:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbjESOuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 10:50:01 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D879F1AC;
        Fri, 19 May 2023 07:49:59 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ba86ec8047bso4595213276.3;
        Fri, 19 May 2023 07:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684507799; x=1687099799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooljlr3HddZPSJ8u5OLPCd0T0mtG8XZ55GCpXhfZ7nE=;
        b=L/G0J02vbE5vaXsMsaJEbte1FmYziL7Jq1kGYE02CS5Tpe97xUP+CRSdIWZM8CsgpO
         6KecYAVAEkcUwJEZbz8u7d4INu3XFa9z/P/7yOQ1EzDra5KKSR03llfAsoM0wUuBI0pU
         uzEw5svh6qr6Hon48lGgbhgq6zlxi/FRxQrywao7hmZuSCc8h57U3ccSyL/8WeX9JObJ
         GJn7HZ5/gEU47g9e/1mbSrMYOTuHBcrJcjfjrh7jm03HDsOihlGiy6VZ7x0qaXQ1ugNK
         Z+6eNafPKBi8lczrQVjzcDd2/tus38+3s+gTYcKkpEf4wFycyDSxE56KpekIRxF+Hb7R
         a1CQ==
X-Gm-Message-State: AC+VfDzAqiEJm16fGWQhap4E5umTeJFkuc8QqtLnQsb/sDJg+V2iEQks
        T0M2khgKoD/M5alS0gjbKk7vrG1WohzjOg==
X-Google-Smtp-Source: ACHHUZ51PDhwyxUarZ0zqtuHJkE5Jq0JMrDGPG9Iuca7FZdB4jwQJySSKxZI86LyTjmxoYzHUt4dgw==
X-Received: by 2002:a0d:d6cc:0:b0:54f:b6b3:b5e5 with SMTP id y195-20020a0dd6cc000000b0054fb6b3b5e5mr2129044ywd.18.1684507798685;
        Fri, 19 May 2023 07:49:58 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id x204-20020a8163d5000000b0055aad7d3f34sm1173581ywb.142.2023.05.19.07.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 07:49:57 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ba71cd7ce7fso4931717276.1;
        Fri, 19 May 2023 07:49:57 -0700 (PDT)
X-Received: by 2002:a81:9383:0:b0:55a:7c7:c756 with SMTP id
 k125-20020a819383000000b0055a07c7c756mr2218011ywg.31.1684507796592; Fri, 19
 May 2023 07:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com> <20230518-prompter-helium-91d0139a61e2@spud>
 <OS0PR01MB59226BDCD4D67430EC7377C6867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230519-civic-idiocy-5ac6d95675f0@wendy> <OS0PR01MB5922F379C4DF20124CBDEED3867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F379C4DF20124CBDEED3867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 16:49:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQFQB7e7Pd1-CCerkwb4RDq7jJ_rv_kwf_Od+oGjMfUA@mail.gmail.com>
Message-ID: <CAMuHMdXQFQB7e7Pd1-CCerkwb4RDq7jJ_rv_kwf_Od+oGjMfUA@mail.gmail.com>
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

Hi Biju,

On Fri, May 19, 2023 at 4:39 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Conor Dooley <conor.dooley@microchip.com>
> > Sent: Friday, May 19, 2023 3:10 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Conor Dooley <conor@kernel.org>; Rob Herring <robh+dt@kernel.org>;
> > Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> > <conor+dt@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>; Mark Brown
> > <broonie@kernel.org>; Geert Uytterhoeven <geert+renesas@glider.be>;
> > Magnus Damm <magnus.damm@gmail.com>; devicetree@vger.kernel.org; linux-
> > renesas-soc@vger.kernel.org; Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com>
> > Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas
> > RAA215300 PMIC bindings
> >
> > On Fri, May 19, 2023 at 06:53:03AM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas
> > > > RAA215300 PMIC bindings
> > > >
> > > > On Thu, May 18, 2023 at 12:36:41PM +0100, Biju Das wrote:
> > > > > Document Renesas RAA215300 PMIC bindings.
> > > > >
> > > > > The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> > > > > Memory, with Built-In Charger and RTC.
> > > > >
> > > > > It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power
> > requirements.
> > > > > The internally compensated regulators, built-in Real-Time Clock
> > > > > (RTC), 32kHz crystal oscillator, and coin cell battery charger
> > > > > provide a highly integrated, small footprint power solution ideal
> > > > > for System-On-Module (SOM) applications. A spread spectrum feature
> > > > > provides an ease-of-use solution for noise-sensitive audio or RF
> > > > > applications.
> > > > > +  reg:
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: main
> > > > > +      - const: rtc
> > > >
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - reg-names
> > > >
> > > > Out of curiosity as much as anything else, why do you need reg-names
> > > > if the two registers are always required?
> > >
> > > The device has always 2 address spaces and "reg-names" provides a
> > > means of clear differentiation compared to indices.
> > >
> > > By enforcing "reg-names" as required property, dt can do some
> > > schema-validation forcing users to specify "reg-names" in device tree.
> >
> > Is that not what we have the following for:
> >   reg:
> >    items:
> >      - description: main register space...
> >      - description: special sauce rtc stuff...
> > ?
>
> OK, will add description.
>
> >
> > The schema validation doesn't stop them putting in the wrong address
> > either way!
>
> OK, will drop reg-names from required property.

Please don't, as i2c_new_ancillary_device() does rely on the name
to set the address when overriding from the default.

> > > Implementation wise, we use "rtc" for getting resource details while
> > > creating the second i2c device which overrides the default address.
> > >
> > > Strictly speaking reg-names is not required, but from a validation
> > > perspective and since driver is using the same "resource-name" it is
> > > better to have it??
> >
> > If the order is set by the descriptions, reg-names seem superfluous
> > /shrug

We have plenty of these, as it turned out to be much easier for validation
to fix the order in the bindings than to support random order ;-)
Lots of Linux drivers that do use the names don't care about the order.
If all actual DTS used the same order, usually the order was fixed during
the text to json-schema conversion...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
