Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130667A5A75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 09:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjISHGM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 03:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjISHGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 03:06:11 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55211119;
        Tue, 19 Sep 2023 00:06:06 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d7b79a4899bso4861711276.2;
        Tue, 19 Sep 2023 00:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695107165; x=1695711965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+JsXgPrRmZipxrSTjC/0RMNw3C2YqMInkATFZo5ysE=;
        b=WC+fomU3VxoX8xfQusJk4k5jG/jamk2sMOGYGBEhTV5JEbxT8SfuGiJXvs2sPoyoTj
         RIyZlXnSWbGeb/EM0uM9Xw/WVkUNCxofRbpBNHAbzjnztyxvYt5fbjbyqxGAR0CqXoxJ
         Rjcd3oSxdJqY/PSXFJ+h4jC4xOq7bV5cPPfT2Xvb9qWaFTIzvGYl+BdIo3nuJjp90NSD
         Bg3uF5V6Yxojd9szIp1iumvzHyKKpnET/hSXanjEehTYeNWRi6mcx/DW5aUeC/+B+ywZ
         zLBQ8pzdUZTdqWZA3q0R+hQKEWhTJN+oHjQrIrleziZVVqVCE75PfToaLdYD1gab2KXZ
         UDGA==
X-Gm-Message-State: AOJu0YxZ8oyZiGzcOXCBXea6tZyo3X/9A2HWrwEMt3HaTYGnZmo5BoqV
        v7q8XP3Fgp5is9cfx90DOXejV+w4uGf/HQ==
X-Google-Smtp-Source: AGHT+IFbKSx2IkygULM0lUAAl7L761VXPUD30GbstwnRJbZUCyL4+hse65KKS9WvqdCA4uIPkgGK7g==
X-Received: by 2002:a25:ca14:0:b0:d11:2a52:3f35 with SMTP id a20-20020a25ca14000000b00d112a523f35mr10852312ybg.20.1695107165249;
        Tue, 19 Sep 2023 00:06:05 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id v142-20020a25c594000000b00d13b72fae3esm2715981ybe.2.2023.09.19.00.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 00:06:04 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59ec6d7bb89so10436717b3.2;
        Tue, 19 Sep 2023 00:06:04 -0700 (PDT)
X-Received: by 2002:a81:7189:0:b0:592:4f93:e831 with SMTP id
 m131-20020a817189000000b005924f93e831mr11737610ywc.48.1695107164442; Tue, 19
 Sep 2023 00:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de> <20230918191916.1299418-9-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230918191916.1299418-9-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 09:05:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2xEBGXrEMJP8Z-fyMGEppXEx2VDd2W1BqKu1DsXaeBQ@mail.gmail.com>
Message-ID: <CAMuHMdX2xEBGXrEMJP8Z-fyMGEppXEx2VDd2W1BqKu1DsXaeBQ@mail.gmail.com>
Subject: Re: [PATCH net-next 8/9] net: dsa: rzn1_a5psw: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 18, 2023 at 9:22 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
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
