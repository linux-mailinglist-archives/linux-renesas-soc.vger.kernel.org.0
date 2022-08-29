Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB1A5A52EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 19:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiH2RPW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 13:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiH2RPU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 13:15:20 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4946357542
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:15:17 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id y187so7127520iof.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=b/SalKhfXUzPfFFWGoMQf6KV6Onv2cD5do6b8w0a8NQ=;
        b=LR5kh+0YxGaJkkn1CDlJWUdWIu5w5tYFcx0/Bb0wvCdNzG48kN9JU1e6oI5BVd4d+F
         Q76lcwOgrEqr/r63hDNpODe8Q5xSZa73UdrqfNnbsfyeW85eYunuPjzQ6oMWUy4IekhX
         /9Act2nsQxY9/vReDytXsbgMxkAQLf4gJBkzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=b/SalKhfXUzPfFFWGoMQf6KV6Onv2cD5do6b8w0a8NQ=;
        b=h2cq0ITfQ00DzgLIi/hirHA3iPrFtPikvyUN24F/tQtmVIM7LZQHpVVTkovjb/G2Y8
         Hz1dOD4h+PHkBd7p/GVWK54IP1B8WAQ9o+okv6uHUN/kjj9wiCm63HQySaynTonCq6Cm
         +fb/NbMNNjwdMJtP4Ecc5CnglB/OmmyqTlWiWnVJzkCB5nLjZu8MWp8RL4mrwV1Z376c
         dXu/Xrp9YoE4Y8ZHC3Th6LJQOxvhof6WyT3MDFoEaeD3qJN3JTaPQIIk2/9QNrL1z2gF
         G+Mpalvzy+6lqX3bdTpZNAwKz9KSBkFy9s/U1YpeuIqOQjmJIvSbDGkHaO3KWQxphaZN
         qUqA==
X-Gm-Message-State: ACgBeo0DxGOayh1dQ2IFRYAzp5fgTsnYTYXNuNmhd3Y662YJG19pLEQc
        cj9JWkqqXiOCtOpMiBhRpDQEZNcBjImLnZ+i
X-Google-Smtp-Source: AA6agR4uDMiKjvr6qHQ1Uj+QWheIKpU9OrxvhZ8/JKb4GoaTuOb6BStJKn9A3AJxRnLoOPzjn4xDcA==
X-Received: by 2002:a5d:9d92:0:b0:688:ecf0:ea10 with SMTP id ay18-20020a5d9d92000000b00688ecf0ea10mr9182447iob.53.1661793316367;
        Mon, 29 Aug 2022 10:15:16 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id x13-20020a02970d000000b003434b40289dsm4479979jai.165.2022.08.29.10.15.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 10:15:15 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id c4so7115154iof.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:15:15 -0700 (PDT)
X-Received: by 2002:a05:6602:2e05:b0:689:4f74:9264 with SMTP id
 o5-20020a0566022e0500b006894f749264mr8872722iow.2.1661793314994; Mon, 29 Aug
 2022 10:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com> <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Aug 2022 10:15:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VD5HugTsQFD-B2goondjR2vD-92mjb9syR2XOD9uBptQ@mail.gmail.com>
Message-ID: <CAD=FV=VD5HugTsQFD-B2goondjR2vD-92mjb9syR2XOD9uBptQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: ti-sn65dsi86: check AUX errors better
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Aug 24, 2022 at 6:01 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> The driver does not check AUX_IRQ_STATUS_NAT_I2C_FAIL bit at all when
> sending AUX transfers,

It doesn't? What about a few lines down from where your patch modifies
that reads:

  else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {

That seems like it's checking that bit?


> which leads to the driver not returning an error.

Right that it doesn't return an error. I guess the question is: should
it? Right now it sets the proper reply (DP_AUX_I2C_REPLY_NACK or
DP_AUX_NATIVE_REPLY_NACK) and returns 0. Is it supposed to be
returning an error code? What problem are you fixing?

In commit 982f589bde7a ("drm/bridge: ti-sn65dsi86: Update reply on aux
failures"), at least, we thought that returning "0" and setting the
"reply" was the correct thing to do (though we didn't have any good
setup to test all the error paths).

...and looking through the code at drm_dp_i2c_do_msg(), I see that it
only ever looks at DP_AUX_I2C_REPLY_NACK if "ret" was 0.

So I guess I would say:

1. Your patch doesn't seem right to me.

2. If your patch is actually fixing a problem, you should at least
modify it so that it doesn't create dead code (the old handling of
AUX_IRQ_STATUS_NAT_I2C_FAIL is no longer reachable after your patch.

Naked-by: Douglas Anderson <dianders@chromium.org>
