Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79617EF0E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 11:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345802AbjKQKqX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 05:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345793AbjKQKqW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 05:46:22 -0500
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D355BC;
        Fri, 17 Nov 2023 02:46:19 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7eef0b931so20253567b3.0;
        Fri, 17 Nov 2023 02:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217978; x=1700822778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1rSD1WUzjMOB3zIQCdXu9P2m4qgtIOBF99SoD+96p0=;
        b=kGPPedj6/4ja35ycxroOUQBVcfmMdIAd/nNSfDomKcc/V+AoLitYLEmrmn+EJ0IG2N
         3+PzrhZ48ZMlsWyj6fiOVYpzzDGkVfdu26CXjZpwYKUQoUpyKGZCgmgL86kZyGrUbEHB
         dPL8VfDGvHQTgf3erG+DfWRzR/h6slS7o8xwTURw3IUi+KwgM6z7A3ABX6Qj1/ihOrWx
         3kio4fU/kyjqNZcwSYRjS22Rp6oataq6BL3YJyUXiZ3V0nqcLetTM8SBicYNj58Oc3sI
         OcPQFjb0A2kqvhxRLPFA1OtTGJ8ONpvz06rA7w7AN4s+P0sSbSfxo45DfeCxXZMDgMOq
         +N9w==
X-Gm-Message-State: AOJu0YwheO8+qIobf2QZdERBFil5YJsA6ZShT5y5W+sKDAgPs8Sso8Vl
        c5lZB8Ogyn7+pvQ284KYHM2kHVTLuSFuVg==
X-Google-Smtp-Source: AGHT+IHYxaTvRxDOWnGePpjVhGhAr66InLuy+uNvHlSARBT8/i/UobfoS4bYK9Q8713DVSCH+hUmXA==
X-Received: by 2002:a0d:cb0f:0:b0:5a7:dbd1:4889 with SMTP id n15-20020a0dcb0f000000b005a7dbd14889mr22492504ywd.2.1700217978265;
        Fri, 17 Nov 2023 02:46:18 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id k68-20020a0dc847000000b005a7dd6b7eefsm419644ywd.66.2023.11.17.02.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 02:46:16 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-da0cfcb9f40so1827791276.2;
        Fri, 17 Nov 2023 02:46:15 -0800 (PST)
X-Received: by 2002:a05:6902:1149:b0:da0:5346:f32b with SMTP id
 p9-20020a056902114900b00da05346f32bmr21676255ybu.53.1700217975652; Fri, 17
 Nov 2023 02:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20231117095922.876489-1-u.kleine-koenig@pengutronix.de> <20231117095922.876489-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231117095922.876489-5-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Nov 2023 11:46:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpYMgTo4myqusSb=qhcMw-AWsMZ-M++E_Y25rMmN62JA@mail.gmail.com>
Message-ID: <CAMuHMdVpYMgTo4myqusSb=qhcMw-AWsMZ-M++E_Y25rMmN62JA@mail.gmail.com>
Subject: Re: [PATCH net-next 04/10] net: pcs: rzn1-miic: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 17, 2023 at 11:00 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
