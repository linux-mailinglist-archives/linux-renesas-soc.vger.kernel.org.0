Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACAD63B2E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Nov 2022 21:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbiK1UVk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Nov 2022 15:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiK1UVj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2022 15:21:39 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1991CFDC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Nov 2022 12:21:38 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id j196so14850384ybj.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Nov 2022 12:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TjoT5TDE+r7cM4/cxzaRtmx/EQ7hkpYtYFeVLk7DIiw=;
        b=Tegs0vU1lxQyFLgxYk9K/CgMgnC3Pug93SCFq53nyd8nzGJFVZJe23sizEt7pAyTem
         IErvnVRzqlmlKT8L7idEBMGUl0OsPoEeDls+BSiW2tEJcDGNgBTTTn35rBQU5C49182V
         M43e8H+uwGNAr2zT8a6aW435ngKhS5gW173hkUYK5w2MOAaemyokfXHeMyxktV6njc77
         Z6FXjai4FguNQtN0iDvjE21EOKLjNVzWrYNZ6nn3EbY8b+H87pOdScxPL0AA9acF048p
         s+AS5YxXJZyISbxkMe7AbtDLGelZwQrP/itQkKBUgnVQeLBlOYLqsSfRMbtVT0+nCtJx
         RF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjoT5TDE+r7cM4/cxzaRtmx/EQ7hkpYtYFeVLk7DIiw=;
        b=3ZCKn0EKB24J3RUSqVXEP3yGVZH6O0CbMtzpZd5euJp8OYiTKgQEWJnwUTpZ/IuG4k
         lY0m7klXADsOmDqWJ3LCNNLmWGmOzFdE7+DWpyRQKeIyUbYKOzK2yTX93i3ksdZo4SIH
         3LpOgKa0CqMtoXWWz4nILQd4trAk/R24YgkPQvDDMDXn5qEHsVK/0JYXnfQm1Pd0omf1
         CV0bHnMbgyp+fWLXYqlWstBoS2Wk9QIPTO+osvtsegXEfUDH7tAnH4Yhb82RN4N7nuWe
         oA0Kb6WE3tBUEEmwmdVL1MLLUMnVU6pnGouWvgMYYvnHbs5C2t0D0pkKCDYratuHUPj5
         Mm2Q==
X-Gm-Message-State: ANoB5pks47A5gxCb3bxe6BgxKJNQ1wL1uKNtxVegKYs0wCALB/kVbXyJ
        fkdNhNmPVgZtrnZxtnCkyU5G2DwJn1ZpPggaHYpFwg==
X-Google-Smtp-Source: AA0mqf6BPbabzFNaWtiGqHDoUARIK1B690FEkWvfP29g/kDoV64k/3lLmcND0FoPdk1PeTC8p8tl5cIhxajriwjMB8A=
X-Received: by 2002:a25:c7c8:0:b0:6bd:1ca1:afd6 with SMTP id
 w191-20020a25c7c8000000b006bd1ca1afd6mr48535520ybe.43.1669666897696; Mon, 28
 Nov 2022 12:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20221127224734.885526-1-colin.foster@in-advantage.com> <20221127224734.885526-4-colin.foster@in-advantage.com>
In-Reply-To: <20221127224734.885526-4-colin.foster@in-advantage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Nov 2022 21:21:26 +0100
Message-ID: <CACRpkdYkD-=y0mCnVkkQ9+4m9-nx6jQu=TfL-TPePbps6x+7Xw@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 03/10] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        John Crispin <john@phrozen.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Marek Vasut <marex@denx.de>,
        Sean Wang <sean.wang@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        UNGLinuxDriver@microchip.com,
        Woojung Huh <woojung.huh@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Oltean <olteanv@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        George McCollister <george.mccollister@gmail.com>,
        Rob Herring <robh@kernel.org>
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

On Sun, Nov 27, 2022 at 11:47 PM Colin Foster
<colin.foster@in-advantage.com> wrote:

> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
>
> The scenario where DSA ports are all standardized can be handled by
> swtiches with a reference to 'dsa.yaml#'.
>
> The scenario where DSA ports require additional properties can reference
> the new '$dsa.yaml#/$defs/base'. This will allow switches to reference
> these base defitions of the DSA switch, but add additional properties under
> the port nodes.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

This is neat.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
