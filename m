Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE9577CA24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 11:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235866AbjHOJPK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 05:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232728AbjHOJOh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 05:14:37 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3DF113
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2023 02:14:36 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-589a6c2c020so73779967b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2023 02:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692090875; x=1692695675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GyKzeoNrkKCtptNnkMb1Win6meoNikolvNJpv26RGA=;
        b=YQyehcNWH/HXpaISmk4MT8R99KOXRRZW4YRoiwH+pvau1FpjGujmlec535XaaInKnX
         T8wnh4N9CUWhF2ApegkyjAcd0jqcFqIu1YlAe8af1ypYIJqaxvNS8spRHjVMAJo0H6d0
         KAteL7WYKI61vV9hAP46D/BL6YvDmaer49NgGJvzs8i/Rj3MirqNNNco5h8JXuUx0RMs
         L7WBESo9xtis0oFeIqB1lU+fNQBIOtun6lKyWYmm8RtgV/tHPQ5sKeAv8GHui9QOvEZH
         RpCfV3LQ8Im32sX7LyC5Rkq1TKY74l0ehZods3gZdIhr5liRDrO+7mSrGZ0Amk1LuFHv
         EvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692090875; x=1692695675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GyKzeoNrkKCtptNnkMb1Win6meoNikolvNJpv26RGA=;
        b=KZF1ACzlmdteXktkfxEXYZsR1GPgsSNkFlM0b8ndlasSwHGbNpt9D0JOHmBbvE7C0V
         9qKwKfguPh8hiE6nDvgJkUU1BUNG1O+mKCxPZd05sJPcU9Z5D+5o1PTfj6jrpkn67TBl
         jrjmwtWWy2tQf8U2UN+S2K82b87/E3qTtF7Gwz/k4BZ6WSI7trMoG9Ve0EzeBNziTQTT
         FjuL8/KWw4yLYFCMc9qtTJq4ds/+fXhBJIk+pviugFMOU+wYDJE7i3x39u3H/TxaUIK2
         r1mPkf+j2jTWhFqaUoVb15/xI0z0DdNa/OYAeoU+JViOQB0lSyvp/ixCRlKklS6mYty0
         c1UQ==
X-Gm-Message-State: AOJu0YxCOZU5pHuXJ+3gAaZNOYBhplWfbrQoK0LPylVo3pZ2SStMyPTr
        KsK9TDHqucwmnzdmU4H2FjEGhDRbVAbtsL0auW3uSQ==
X-Google-Smtp-Source: AGHT+IGIkUXHnDswHZIYR4qRhuzq75a8JNyAXGmCuPxIzxsVXoAnNQzpwCSP8OT+hs+7BQPT8z4xFTpzecW8/v9iAEE=
X-Received: by 2002:a25:25d8:0:b0:d47:7448:81a with SMTP id
 l207-20020a2525d8000000b00d477448081amr1452994ybl.23.1692090875676; Tue, 15
 Aug 2023 02:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230814072436.3757-1-biju.das.jz@bp.renesas.com> <20230814072436.3757-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230814072436.3757-2-biju.das.jz@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 11:14:24 +0200
Message-ID: <CACRpkdaZGrnV6bp0Sz5_yxG6y0oAqBeZh2UAz+pM4ULtpWq30Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer dereference
 in rzg2l_dt_subnode_to_map()
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 14, 2023 at 9:24=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:

> Fix the below random NULL pointer crash during boot by serializing
> pinctrl group and function creation/remove calls in
> rzg2l_dt_subnode_to_map() with mutex lock.

What about using, hehe, scoped guards? Bartosz premiered the use
of this and I already like it a lot... see:
https://lore.kernel.org/linux-gpio/20230812183635.5478-1-brgl@bgdev.pl/

Yours,
Linus Walleij
