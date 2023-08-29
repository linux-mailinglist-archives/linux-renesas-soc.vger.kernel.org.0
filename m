Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66DB78CDD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 22:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239881AbjH2Utu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Aug 2023 16:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240387AbjH2Ut0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 16:49:26 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31081BB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2023 13:49:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-500c6ff99acso220596e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2023 13:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693342161; x=1693946961; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmkFChDv+8wEuMHUlBFf+bYcihrh5O9J7mo8VcvR34o=;
        b=FmhS6P9ySkPh6Sp8QVJxTtJVYsMPtWzSyeTQdoATOWJshBm9ROI80i0ZRxjUDNXiZ9
         pr/44Tmf0B29P/dsSrq4JLjY49ZCfCu/2xU72byJ6/XrwFNmHvg/tc/nYxvDPsm47+y7
         Alxqb9zAhsJEqbueu4Cy5T5cICACb+j0OX9jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693342161; x=1693946961;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmkFChDv+8wEuMHUlBFf+bYcihrh5O9J7mo8VcvR34o=;
        b=QyJbmDiCzxrP0ZhajT1Lh1ZcpjQjJdt7zvlLrWIt0TXCu9rLblEHiCkxx6SD/v5rxR
         QHxRr92AO+MmrU47OT3L8KBhqaJ2sWhVO4NAhok4Zj5SltFraP5O8NyYi04RlFs4G9KJ
         LDIgqucCdFN6NEmFkECaR+tvWQbZSRv1lramH4JXEeu1X7VB+auxxeGuBTFL6e8TXZR3
         9cPejBRHNqaonQ1Za0vwAI9ueV7Qc/p3zVz56vKKcX1/kuKS7ZmMi1R+TZOtnlYnPlMN
         8SmHABTU32g61VqoBj0YbV+KdZt406IKqhzOcpmzSUGKoZs+yWQ2/I4/sONAhurWw5va
         EeKg==
X-Gm-Message-State: AOJu0YwJKC7JoyhdbOE/gxmkHmZUOLaZK9gVKA71a40wruNR/TAVquvS
        Vgg0R3pC1GiQfCqBna+AmqUjXIu5v8ypV/hQ1VzJ/Q==
X-Google-Smtp-Source: AGHT+IFXSgclTeRrHpYSYN/loka8vQax+6EBcpFkMLZs1lhOMNMRjt1rtXJLvpy0hz76lI9fJN44UHzMYt1HXgrg/K4=
X-Received: by 2002:a05:6512:3b29:b0:500:8676:aa7f with SMTP id
 f41-20020a0565123b2900b005008676aa7fmr1423753lfv.23.1693342161132; Tue, 29
 Aug 2023 13:49:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Aug 2023 15:49:20 -0500
MIME-Version: 1.0
In-Reply-To: <20230828133933.1ef5145a@jic23-huawei>
References: <20230818175819.325663-1-biju.das.jz@bp.renesas.com> <20230828133933.1ef5145a@jic23-huawei>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 29 Aug 2023 15:49:20 -0500
Message-ID: <CAE-0n532Q_sj8AB0d-HhPun7id-cGgDwcNfqH3T4ATcjw01vsg@mail.gmail.com>
Subject: Re: [PATCH v2] iio: proximity: sx9310: Convert enum->pointer for
 match data table
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Gwendal Grignou <gwendal@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Jonathan Cameron (2023-08-28 05:39:33)
> On Fri, 18 Aug 2023 18:58:19 +0100
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> > Convert enum->pointer for data in match data table, so that
> > device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> > bus type match support added to it.
> >
> > Add struct sx931x_info and replace enum->sx931x_info in the match table
> > and simplify sx9310_check_whoami().
>
> +CC Gwendal,
>
> I've applied this but note there is a comment inline + there is still plenty
> of time for others to comment before I push this out as non rebasing.
>
> Thanks,
>
> Jonathan
>
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
