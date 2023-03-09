Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8C06B20C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 10:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjCIJ6q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 04:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjCIJ6p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 04:58:45 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA9A62DB1;
        Thu,  9 Mar 2023 01:58:43 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id s12so1306617qtq.11;
        Thu, 09 Mar 2023 01:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKyxJSQ87EhDfakuNsT60G1Elf7FPlsptekWrc8OiBc=;
        b=5DwFbqB5Q8jIiMI77DWkW6VKXhtIO/g8owIXKlyxYCz99wSPBs8KVvKU2zsN7MbOUi
         pPYPaFVSkfOD6PSqqRKToUyT8o9BBjKnl3aA+ADWp8iLn2VsfGWhzTjVQcBN6h5P6Wu+
         ZYaHzkM17NQnJjZPMiQkoO+ikdXsCjRqEHMIapo0NTajTECU2m3YbFUjy2RD2it+PjsJ
         2NsL+RGrOycsBxlv9zmFZQ9ENxegVMEgHAhjrPa5WG+ekjHL7XAhacyCg8Oief47jV+j
         2sLVeBl0ERuNorFpY1Z1S2I0mJOYNggjNPaqowY4gZgIp2ZhQe/7kdQFuPldT77K+pKe
         Ybiw==
X-Gm-Message-State: AO0yUKVY7+eTLxSvjekF7870vMJTWVQ0zoe0i0uqYcDR2vkzRpoZueuB
        u+lp6IrG3vI7boFHC4qxSQrMLmrTVDDWPA==
X-Google-Smtp-Source: AK7set8NBOGQ/ih0FdKD58vOf8TIfjP5m8S5sjZZkaxfHvpkCS4CDah4fC7AGlgjUIm2mvWm58rBsA==
X-Received: by 2002:ac8:4e4a:0:b0:3b9:ec33:eabb with SMTP id e10-20020ac84e4a000000b003b9ec33eabbmr36618378qtw.19.1678355922557;
        Thu, 09 Mar 2023 01:58:42 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 17-20020ac85651000000b003b62bc6cd1csm13201000qtt.82.2023.03.09.01.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:58:41 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-536bbef1c5eso24927797b3.9;
        Thu, 09 Mar 2023 01:58:40 -0800 (PST)
X-Received: by 2002:a81:f105:0:b0:538:49a4:b1e0 with SMTP id
 h5-20020a81f105000000b0053849a4b1e0mr15703469ywm.2.1678355920494; Thu, 09 Mar
 2023 01:58:40 -0800 (PST)
MIME-Version: 1.0
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com> <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org> <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org> <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org> <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
In-Reply-To: <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Mar 2023 10:58:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVNCvu6La_=f=6i4Kj3UXeFU6McnNSkXb0PVjVyzdNR4Q@mail.gmail.com>
Message-ID: <CAMuHMdVNCvu6La_=f=6i4Kj3UXeFU6McnNSkXb0PVjVyzdNR4Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Mar 9, 2023 at 10:44 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 09/03/2023 10:18, Biju Das wrote:
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> On 09/03/2023 08:57, Biju Das wrote:
> >>>>> It is clk generator HW specific. Clk generator is vital component
> >>>>> which provides clocks to the system.
> >>>>
> >>>> Every clock controller is vital...
> >>>>
> >>>>> We are providing some hardware feature which is exposed as dt
> >>>>> properties.
> >>>>>
> >>>>> Like clock output is fixed rate clock or dynamic rate clock/
> >>>>
> >>>> OK, I wait then for proper description which will explain and justify
> >> this.
> >>>
> >>> Here it is, Please let me know is it ok?
> >>>
> >>> renesas,output-clock-fixed-rate-mode:
> >>>     type: boolean
> >>>     description:
> >>>       In output clock fixed rate mode, the output clock frequency is
> >> always
> >>>       fixed and the hardware will use the values from the OTP or full
> >> register
> >>>     map initialized during boot.
> >>>       If not given, the output clock rate is not fixed.
> >>>     maxItems: 6
> >>
> >> boolean is scalar, not array, so no maxItems. If the frequency is taken from
> >> OTP or register map, why they cannot also provide information the clock is
> >> fixed?
> >
> > OK, I will make an array property instead. From HW perspective each clock output from the
> > Clock generator is controllable ie, fixed rate or dynamic rate.
> >
> > If all the output clocks are fixed rate one, then frequency is taken from OTP or
> > register map. But if any one clock output generates dynamic rate, then it uses
> > dynamic settings.
>
> Second try, same question, let me know if it is not clear:
>
> "why they cannot also provide information the clock is fixed?"

What is the actual use case?
My understanding is:
  1. If the OTP is programmed, the clock generator will be configured
     from the OTP on power-on,
  2. The clock generator can be (re)configured from software.
     a. If the OTP is programmed, this is not needed,
     b. For critical clocks, you may want to prevent this.

Also, AFAIUI, "fixed frequency" or "dynamic frequency" is a policy,
and purely software? Or are there OTP bits to enforce this?

Perhaps you need a per-output "do-not-change-frequency" flag,
probably with a generic name, in the spirit of "regulator-always-on"
for regulators?

Now, if all the output clocks are fixed rate, you might want to describe
this in DTS using a set of fixed{,-factor-}-clocks?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
