Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF56D6B8476
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Mar 2023 23:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCMWFd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Mar 2023 18:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjCMWF3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 18:05:29 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B04611EBE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2023 15:05:18 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-54184571389so119455777b3.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2023 15:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678745117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaJ1rw0GxmFn6lOYjuFsf5MXeyEAW/i1SnT3isjwGsM=;
        b=va/x+Pjp+N+yuTJEB7oTVFTjsv/wzkGZhs4nUcwWnut3z7MxRQak6OiMura8n5M83s
         rcuSBFtuEZT/gq7YAd7YTZJE8uOeKnUF2jLqW/S0kwD2VltncJTGUdLJ6Iz4ntfU6lXx
         QTaCfov+s5nsujdxE3tKAvX/zI2qrHQtqKFKKOQnRiL9QtVooTNP/fge9gLb+vSkTaBR
         2yjUx8oy63GjeG2msRqXy0mclRQ9ehjiOLpCdB5jjGGU2AW2pbVXqK/wQq/SPAtpw5+4
         zC2wy4m88zRGEGqWcvQh3/vqLkf970JTvSv8ytu8HDYQobJ0+1eCKURs5KeuZ9gYeS6p
         Pjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678745117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaJ1rw0GxmFn6lOYjuFsf5MXeyEAW/i1SnT3isjwGsM=;
        b=jEx5ywNbODv/9EBNzJE58nBoe3TrmXGwOzDKaVEkdBbGrvqF2urUkjp4UWWLAzRnhz
         jsbqqsAJVZM1jafUOnkBKrtvERm05nTgmso9R63OJ02Eapo1Yiuaey5W6hv+7zJrAc3D
         TN3nSmN0blZP6Xl71OaSEQFjZGl36JKoVHsz0HaFx/IJmQnvqEpekGsP/UKUISsmbtKI
         UKEuwQeATT1p9pO6tKuRDhusA0uBVskjGesgQF9IzfnrYrr6DiUresLm2dd6V5SUH8yD
         QpsR6Lod5JDWgCzMlnccK6vIsfwk+zPdbUEvXyB4awoEbOWfmsfpL23GkmLBQ+vV6ubn
         PcBQ==
X-Gm-Message-State: AO0yUKV9iIJmGQmlJBGxPBM89QKYzMOAXqutmM1r76fRBbvJdLGQVa7U
        VJfSOjMmJpfG5cLXGrvnbZGiy0JGyYo/OkCWXphAEN646CltoSAt
X-Google-Smtp-Source: AK7set/LKjmjlcTb5A9usQFhgqxSVuHPK3Ba0mAY61rQ09E96ghDnLEKzN9WJ/2Q1yWTf7CZw7UvRyzM/4mTVatGgac=
X-Received: by 2002:a81:ac67:0:b0:541:753d:32f9 with SMTP id
 z39-20020a81ac67000000b00541753d32f9mr5548024ywj.9.1678745117468; Mon, 13 Mar
 2023 15:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com> <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com> <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 23:05:06 +0100
Message-ID: <CACRpkdZS5UKc7bDPs-zx_QyJU9GwJAhB7372oSC9tB-txgghtw@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 9, 2023 at 3:19=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:

> I have an IP which detects short circuit between the output terminals and
> disable the output from pwm pins ,when it detects short circuit to protec=
t from
> system failure.
>
> pwm-pins are involved in this operation.
>
> From user space we need to configure the type of protection for this pins=
 (eg: disable PWM output,
> when both pwm outputs are high at same time).

Why do you want to do this from user space?

It sounds like something the kernel should be doing.

The kernel has a PWM subsystem, and a pin control subsystem,
and we don't even have a userspace ABI for pin control.
Pin control is designed to avoid electrical disasters
and a driver can add further policy for sure.

If you want to add policy of different types to avoid electrical
disaster into the pin control driver, go ahead, just run it by
Geert so he's on board with the ideas.

> For that, we need to find a provider device (which provides gpt-pins).
>
> pinctrl_get_device() returns "current provider device" associated with fn=
ame/gname.
> If " current provider device" =3D=3D "pwm device" do the configuration.

I don't understand this, sorry.

Yours,
Linus Walleij
