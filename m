Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A1E785A6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 16:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbjHWO0f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 10:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbjHWO0e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 10:26:34 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B418BE6C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 07:26:31 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52557cc5e7bso7221366a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692800787; x=1693405587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lGSkTW5lsuSL6E7U5gxr9FfAhYaXdi6ezZxEKj4mao=;
        b=iVfxFPbhEo5ce08R4H3Fsnv+xe8Y7b+sSzZyyzUojWe593xsfxdqfJCj5D8XqHDTfs
         6SdfJIUvJPnZBx9huK4rlBcMO5NY1XtnRkQd//+lQsggVS7JzaGdHph5l8BeMsGakaLR
         QUMUOgwIXt1prCRinye7uoltBDdkMx6597jAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692800787; x=1693405587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lGSkTW5lsuSL6E7U5gxr9FfAhYaXdi6ezZxEKj4mao=;
        b=FtQ41ksmug5J+od7S9FZqEe09LNv1ly2xBHXJxYKgT1j9VuPWIBP6055ibmRJJ00Jp
         sIEUdtqbDg8UVZsxE0eYnbm/S7gayI8ZVkRx4dbeKp3FMSi/K6jm4SJNlTaeN+kAQ6s1
         jkoeXVvOb3lynf1C/8PNpSRUP7gWZAd0fov7k3BA6juApPCkU2TGTjZIWejfnCbQL33x
         ZZl6kG2qIFMv6a1CBxjTQo7ghVwQtGLupPXpfIkxRtQ4FT8tfgBJYQz8OjltoaqLTJxQ
         AlNwCiIhBBXQTm6Tmva6etsKVXQw4xJRQdzVH64zlnylLxXAD35AAp4hZbJoLln29BUM
         e8tA==
X-Gm-Message-State: AOJu0YyMcXj0pZzVX9+q6/3CJ3dVSzPCgXr5ZSWJUO/LXsG7g4HOyEx7
        7gmviET9+NDhrTfgQPEGGt9yQhFkv4b27aqJpgP7JQ==
X-Google-Smtp-Source: AGHT+IEAKxk8ymmTjoWxTK5ic5848eWrhOHOnsjAuUpOU2lno/E4ZvmW9aCUvYPGhC2NXrqoCRQm5w==
X-Received: by 2002:a50:ec8c:0:b0:525:4471:6b59 with SMTP id e12-20020a50ec8c000000b0052544716b59mr10480889edr.7.1692800787184;
        Wed, 23 Aug 2023 07:26:27 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id f18-20020a50ee92000000b0051e2670d599sm9286337edr.4.2023.08.23.07.26.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 07:26:26 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-529fa243739so15501a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2023 07:26:26 -0700 (PDT)
X-Received: by 2002:a50:9b1e:0:b0:523:193b:5587 with SMTP id
 o30-20020a509b1e000000b00523193b5587mr283073edi.6.1692800786058; Wed, 23 Aug
 2023 07:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Aug 2023 07:26:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
Message-ID: <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Sun, Aug 13, 2023 at 1:51=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The driver has ID  table, but still it uses device_get_match_data()
> for retrieving match data. Replace device_get_match_data->
> i2c_get_match_data() for retrieving OF/ACPI/I2C match data by adding
> match data for ID table similar to OF table.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is only compile tested
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

It seems like this is a sign that nobody is actually using the i2c
match table. It was probably added because the original author just
copy/pasted from something else, but obviously it hasn't been kept up
to date and isn't working. While your patch would make it work for
"anx7814", it wouldn't make it work for any of the other similar
parts. ...and yes, you could add support for those parts in your patch
too, but IMO it makes more sense to just delete the i2c table and when
someone has an actual need then they can re-add it.

Sound OK?

-Doug
