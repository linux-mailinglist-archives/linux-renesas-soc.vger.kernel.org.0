Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7258D6626AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jan 2023 14:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236558AbjAINQg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Jan 2023 08:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbjAINQW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 08:16:22 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7095BAE7C
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 05:16:21 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-4bf16baa865so111484657b3.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Jan 2023 05:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ROf9S1h3NFS/YmIXVlWE2KOOQY9QfKkN9+Awp4lc2d4=;
        b=HKxZcSQnePQPZ0EC0HThqgeLqPpP/8dg93vSGpoH6udbgCIzHGt8Zpa0LUdBwVylnB
         GhQEr0FGZqTewxgrRqV6jmtxY8vttc8sCg9MH2cucSoTTsZDaS0j+/B90uMPiW8QW9Nm
         N0L0e/Ti+Y6BhJ7xjQ0kA1y5jwWgHFI/u2zJguS91/UAmLMyZPx4BvF330ya0Cc09vnH
         4skAT0/IZH1JkGJYY3YcNYyllfOffu8PM+nSejrXZpB/+nV0hfjtvQWN4FBhHJbccHR0
         B6uTVEh+USDg7NE/rTiQW1W/z/YeBqd6ilpCVJqZlHtgjSwFQGIirMTf46cTVWoWQZ+i
         8wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROf9S1h3NFS/YmIXVlWE2KOOQY9QfKkN9+Awp4lc2d4=;
        b=iI84jTdmQjop5TQI1y0VUMrS6K+5nn32ztW4gOBZyJFfCCanzSrdysghl8mTqk5pJp
         j5L8EeyVs1vPvADatVoSMgxqUmi6oqw3QzZImlFUAep+GDj4cU034gJzdfKIujd1oTKu
         Fqrj/xPmLfBmuyjmFx9UG7/NCpnH9dX1ENFYniVAbwxoCwvk7TzNBEOEPGs5Wp6uwH07
         41cgaJboRjt8gKBkF/XpH6Z5ZpfEfEEyoGJBKYNKpdEeQMY83xDsrhli5iHqCgHw+4XO
         UISNYCIDjQrjTFOxhPAjLAzH7e6PXFK+E8fCJiPvpj/gtShkpSwDAhaK7qTNEYQHmOLP
         zuUw==
X-Gm-Message-State: AFqh2kojSytbxpi6syp/MaooWDUbGgrxYKXWoWNf7+p6YXE4hED8m63Q
        77G/EtUw00ZErAD0MUHHXxI8u/052Uj70PNnVcqcxQ==
X-Google-Smtp-Source: AMrXdXubK/8hSjiePBuHDFSlg9IynRQbcBhbk/sdKP9vQA3x/dPwOarYSKw7tLJfJSdMGf3h37XMZe3RwM5W9gV+2T8=
X-Received: by 2002:a81:9c52:0:b0:368:e8a:3b1d with SMTP id
 n18-20020a819c52000000b003680e8a3b1dmr864270ywa.469.1673270180682; Mon, 09
 Jan 2023 05:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com> <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 14:16:09 +0100
Message-ID: <CACRpkdaL2J7F2sVjVcTtFTfK1exZ3Rmjhc_dYxuo2DfhYq_8gw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add RZ/G2L POEG support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Drew Fustini <dfustini@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 3, 2023 at 10:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > If this should go into sysfs we should probably create something
> > generic, such as a list of stuff to be exported as sysfs switches.
> >
> > It generally also looks really dangerous, which is another reason
> > for keeping it in debugfs. It's the big hammer to hurt yourself with,
> > more or less.
>
> Yes, generic would be nice.  Anyone familiar with other hardware
> that could make use of this?

Drew was using this for Beagle Bone IIRC, Drew?

Yours,
Linus Walleij
