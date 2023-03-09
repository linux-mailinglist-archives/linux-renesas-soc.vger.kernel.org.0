Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC106B2158
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 11:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjCIKZ6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 05:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjCIKZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 05:25:51 -0500
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148D762312;
        Thu,  9 Mar 2023 02:25:48 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id l13so1416560qtv.3;
        Thu, 09 Mar 2023 02:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678357547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGSY0m+9vIK1jz7k2/An+H65SXKQsXRjorbQl1dCiu8=;
        b=bAe5c9q9BMulyisDyTit5Wvmup7RZfYVsCcM/b+aMDP1Xc0czO1lqCYCUF1Om619Ie
         MXtvXUyIUhGEgDG1aiLZp06eijfTOPUVa6c8btC83F4W+4cObSyCQ6YMirShRmIMFwMk
         99+ltCphyYksr5xanySjQYShbR9XyxpfdFnabaN68glg8mED840Vhtra///Y/hsFrlAo
         LHyQoIX5KYa0YDfVlrhndcMKIYGliN/krEBnMSWESWYixQpkg7lp3eVjQ3roYJXSLyFg
         rQBZJ88UWs+Fe9b4VzwsOXOl3DWemPUFTbcpRMnFwSAeXQ55Xy8OC069SiB2+3Dtk5IC
         wlVw==
X-Gm-Message-State: AO0yUKXublHf9Vf5wc3S7ZynWobAaP7i2QviZF0Z0rxYOJD54OMxLXJD
        88GjC6JuVXYCQ+tHEqd1WGmffOAeAxtyFg==
X-Google-Smtp-Source: AK7set9JO1SLQIi0+hxUZjOa09J/mdmrqaCEV2n++y9mV4nu9mFKRO99BoQ1UyMKlkUERDMEv9Yg+w==
X-Received: by 2002:ac8:7d42:0:b0:3bf:d688:2a77 with SMTP id h2-20020ac87d42000000b003bfd6882a77mr32040633qtb.64.1678357546916;
        Thu, 09 Mar 2023 02:25:46 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id d79-20020ae9ef52000000b007296805f607sm13209139qkg.17.2023.03.09.02.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 02:25:46 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id q8so1359191ybu.5;
        Thu, 09 Mar 2023 02:25:46 -0800 (PST)
X-Received: by 2002:a25:f908:0:b0:a09:314f:a3ef with SMTP id
 q8-20020a25f908000000b00a09314fa3efmr12839650ybe.12.1678357545812; Thu, 09
 Mar 2023 02:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com> <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org> <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org> <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org> <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org> <CAMuHMdVNCvu6La_=f=6i4Kj3UXeFU6McnNSkXb0PVjVyzdNR4Q@mail.gmail.com>
 <2bb458ba-ef70-86f3-de89-0102e27aa0fc@linaro.org>
In-Reply-To: <2bb458ba-ef70-86f3-de89-0102e27aa0fc@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Mar 2023 11:25:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjDaNxBn7+sr40CTJpCQ8u6LsrXNXxF81LaQC7Db+5xA@mail.gmail.com>
Message-ID: <CAMuHMdWjDaNxBn7+sr40CTJpCQ8u6LsrXNXxF81LaQC7Db+5xA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
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

Hi Krzysztof,

On Thu, Mar 9, 2023 at 11:17 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 09/03/2023 10:58, Geert Uytterhoeven wrote:
> >>>>> Here it is, Please let me know is it ok?
> >>>>>
> >>>>> renesas,output-clock-fixed-rate-mode:
> >>>>>     type: boolean
> >>>>>     description:
> >>>>>       In output clock fixed rate mode, the output clock frequency is
> >>>> always
> >>>>>       fixed and the hardware will use the values from the OTP or full
> >>>> register
> >>>>>     map initialized during boot.
> >>>>>       If not given, the output clock rate is not fixed.
> >>>>>     maxItems: 6
> >>>>
> >>>> boolean is scalar, not array, so no maxItems. If the frequency is taken from
> >>>> OTP or register map, why they cannot also provide information the clock is
> >>>> fixed?
> >>>
> >>> OK, I will make an array property instead. From HW perspective each clock output from the
> >>> Clock generator is controllable ie, fixed rate or dynamic rate.
> >>>
> >>> If all the output clocks are fixed rate one, then frequency is taken from OTP or
> >>> register map. But if any one clock output generates dynamic rate, then it uses
> >>> dynamic settings.
> >>
> >> Second try, same question, let me know if it is not clear:
> >>
> >> "why they cannot also provide information the clock is fixed?"
> >
> > What is the actual use case?
> > My understanding is:
> >   1. If the OTP is programmed, the clock generator will be configured
> >      from the OTP on power-on,
> >   2. The clock generator can be (re)configured from software.
> >      a. If the OTP is programmed, this is not needed,
> >      b. For critical clocks, you may want to prevent this.
> >
> > Also, AFAIUI, "fixed frequency" or "dynamic frequency" is a policy,
> > and purely software? Or are there OTP bits to enforce this?
> >
> > Perhaps you need a per-output "do-not-change-frequency" flag,
> > probably with a generic name, in the spirit of "regulator-always-on"
> > for regulators?

Actually we already have "assigned-clock{,-rate}s" properties for that.

> > Now, if all the output clocks are fixed rate, you might want to describe
> > this in DTS using a set of fixed{,-factor-}-clocks?
>
> I would also argue that fixed frequency is actually also dynamic
> frequency, just with a limit to one frequency...

Indeed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
