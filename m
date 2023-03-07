Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06CF46AE0A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 14:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCGNg3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 08:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjCGNg1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 08:36:27 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4258C5BC90
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 05:36:27 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id h19so14228873qtk.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2023 05:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urULbQUOPfOIWbeWwu/UVMWyxPeVZ3I2kroq681pdYA=;
        b=T5+/FABCY8CpAIWQZhIQBzqijdWfoIYQ8bwZvxxMjTdF6oD8ZlnfdtQxN8SNhhDH33
         aIXafWBAY7/s7gW4o0lfdwSKJfgZQD79VVleVgheDc/agAQ2Oj0kMl3bFjNuW5a7Duwn
         cMcimVnVoJWQwaXGmi/T2Jcsh6D/O7fdEVQkmOfF0rcau1AyDUcysZEDm57FKOkF5zy4
         oDmWoV1JcKgM7pKGlxULLrDya/Xugllf2X2va7wexY1+0A4eY+LM16shTxSWnxwFtijl
         4p5SlxtbaRXTUxGsS24l/ue5CSSDFX9t2w5zuKhG2HJ6Kunqb2AXLNErAf/CTlPW8VdS
         kCaw==
X-Gm-Message-State: AO0yUKWAcbt8JXOBcBd9cBIbqsNBtKXzTMd+iWzd8PDhY01NO+JvBnv8
        x2udnP6j44v3v4h7pqqB9o36An9LVfLehg==
X-Google-Smtp-Source: AK7set85Hve6eU2xo6pZsbfTTUY5PYYsAKHZRhPyNll9bdnX1aSBWPNyUb8Y5JgzD6fb8bsxT33Kbw==
X-Received: by 2002:ac8:7d11:0:b0:3bf:d9a0:a33a with SMTP id g17-20020ac87d11000000b003bfd9a0a33amr24835475qtb.27.1678196185273;
        Tue, 07 Mar 2023 05:36:25 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id a18-20020ac84352000000b003bfaff2a6b9sm9664192qtn.10.2023.03.07.05.36.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 05:36:24 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id e194so11400646ybf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2023 05:36:24 -0800 (PST)
X-Received: by 2002:a05:6902:208:b0:acd:7374:f154 with SMTP id
 j8-20020a056902020800b00acd7374f154mr8646856ybs.7.1678196183774; Tue, 07 Mar
 2023 05:36:23 -0800 (PST)
MIME-Version: 1.0
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de> <20230307115900.2293120-18-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230307115900.2293120-18-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Mar 2023 14:36:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5SjiMNyKqbF+WR_D+g44TpriA2YN6ZEWLA_Yker0erg@mail.gmail.com>
Message-ID: <CAMuHMdV5SjiMNyKqbF+WR_D+g44TpriA2YN6ZEWLA_Yker0erg@mail.gmail.com>
Subject: Re: [PATCH 17/31] phy: renesas: phy-rcar-gen3-usb3: Convert to
 platform remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel@pengutronix.de
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

On Tue, Mar 7, 2023 at 1:11 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
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
