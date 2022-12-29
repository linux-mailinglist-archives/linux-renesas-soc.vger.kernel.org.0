Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60117658822
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Dec 2022 01:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiL2Akw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Dec 2022 19:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbiL2Aku (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Dec 2022 19:40:50 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F04EE0F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Dec 2022 16:40:48 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id k44-20020a9d19af000000b00683e176ab01so5806884otk.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Dec 2022 16:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f2p2shVUpdpBRcPbig+xzUB8/WfGytn/tvXqnk/G7/Y=;
        b=Gzjw0D8iyAbTjlB/MOb4J4YmMSW1zdzpRQCifiwhKhsZ7e8lkDYZvuuDw9+alRwI9j
         3becoCce9AZU4D3fLWu5VgjqdWZmwVbd16kzYohhpmZHS64shJslyqIbB4nhVjZ0BvJd
         Z4W7VaKotC5HqA/8wU3fn8lx7vi9Ox2i0PP+M1J7GM9ZuO3VCpP7hQrRndAfHkWkOpX+
         GqnNNrnymEPDCRoO6MXXEEoMbfXd5hdAdox8Pdi/2sMyzkBeHL9F5HM5PoULI+bK7L4z
         xMvOqu25W0oUvfDLAg7fCGEqRnesaAEkZgN7/t8t2Vlu6z6gNhM4BhIjvS3lWghb//4p
         Mj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2p2shVUpdpBRcPbig+xzUB8/WfGytn/tvXqnk/G7/Y=;
        b=2G5PvPSx3KEp25jHwK1cFipxq/JdLWB6Zx3n2r7OC/uU8MY38IJPRpbVXagoW7At7c
         amfNETVGd0T1PFdeG3i33W7uPIuMztI8y5Itl5nslRtcns4Ci4Wfcb4ur3dYUbN83MDy
         kbNu5WncmxP29caOsCC2GjnWh6GBQECS7r8ouJCbIuqdogjNR6PBEbt/0vMtWO+1MDAD
         8srt7jynVum7EzeAH6f3/PrYzWNxUbo/emn5CTDsmvSPHkck4L4L1Fqww4/h0ySBL7bF
         QOMs9e4yc3tPHZL/+gtUXndAo2YJ4xBzWVuMQhvyqaQm7BxfKeI9Az2H4Rk+ACgYGp3U
         IXQQ==
X-Gm-Message-State: AFqh2kpK+KT+PArbc8FJnEy4nRDBR0EnlFXPSfAJ3x32QEwD14cwbkzo
        Gql35TuDiLUMJrzsYO90/F9UsaiV3p3Us+/IKoK+0JH7q4cyBWQf
X-Google-Smtp-Source: AMrXdXss1Jmt661r3O2VlGaPW9mKv9FIuBxyzoUhU0tjN3DiJULKXqqoxPvNSGzhCM/K9neAcF+2BHIkcgzsyvCr2mg=
X-Received: by 2002:a05:6830:3499:b0:66c:61c8:ceeb with SMTP id
 c25-20020a056830349900b0066c61c8ceebmr1793244otu.12.1672274448080; Wed, 28
 Dec 2022 16:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20221221210917.458537-1-fabrizio.castro.jz@renesas.com> <20221221210917.458537-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20221221210917.458537-4-fabrizio.castro.jz@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 01:40:36 +0100
Message-ID: <CACRpkdZBz_+MeJjP5-vjNGbqyrCBTj+f=gm87o4sgiMqRwndVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: Add support for the Renesas RZ/V2M PWC GPIOs
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 21, 2022 at 10:09 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:

> The RZ/V2M SoC contains an External Power Sequence Controller
> (PWC) module. The PWC module provides an external power supply
> on/off sequence, on/off signal for the LPDDR4 core power supply,
> General-Purpose Outputs, and key input signals.
>
> Add a driver for controlling the General-Purpose Outputs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

This is a nice driver.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
