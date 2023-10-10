Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCBD7BFE4C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 15:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbjJJNqZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 09:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbjJJNqG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 09:46:06 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F26330D1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:45:31 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d9a516b015cso936767276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945530; x=1697550330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQoVGRS7dETbgV3CTGGzd1lnUKsqhrqwon34noS0Bns=;
        b=pBLv91vx0ATqEqqb0fCFMbzaHvPJFPHFWg8YBec79DE9JUE3mj8FJ9XB4571Y1dSID
         gFcdu9gpSy+bq2P04SPr29YZRmn8nyNbP7NkKBXApugDfnxuGOBhXm30SYaxnaxIDM25
         4YsbKGv4gTpZIxcNKLE8SNA64lueWYoTllYmyk0xywJA/p2WzZ3ZunXb+oIx1ygXr8oW
         Ek2nijdGu5TgVc7ZjH0Tz9qkfy2Jo3Hl4d6dF6GIDBgWdNqma04RpwCUcJkSGgkT21+t
         a/WgCf8/8OTRH1OIOMIiXC+kpnJuL+XZh2oCBIqFiLfTyCdxdszmcSogk7kX6LTzmrUr
         Zw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945530; x=1697550330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQoVGRS7dETbgV3CTGGzd1lnUKsqhrqwon34noS0Bns=;
        b=egZho53jGtD+Fovf0rug1/uyUGC6Onm40k+6LE/Y1zzTIUeWq2PRKNIXu+ZP/DixOI
         ScW0XJED2HfGLWJozAefeNe9yWT2oie4bk8BCr6Kk7Ug5gIgUfkMjP0Nis49srJA8pX8
         PDgua2qPpDsYKdQ7VPeLBnpvnAfnzs1oYqGIyFIiG8jzktI6OB7v911YbanRoV+Ekms+
         adCo7la9gw7pte+iywN3qNYDsQeOvj1J+0GBq/FzdKs+xNE2lu6Xq+tMVvlLzAO96BQp
         GWJycM8IED0d8ynOvFZeYIOh+4UA9HaiQDm9NN+wCJvTKPKRHC38tT9oJ+9mjg3MFKd5
         7RsQ==
X-Gm-Message-State: AOJu0YwzXN+z/hPsuZyz5whKiSiOH7YvjxKhoOVwxoNDloRAniN/gVWM
        drdRTRkToTt1cJ8J37+jsD88gRMNG5yjIfDKchqvew==
X-Google-Smtp-Source: AGHT+IGrO7LkLD/MRm5QkzXeIcnLLYqdWFi9qGCJ2DBHCDw5MlrCdMPazBkBNCYOQCgCUP8762z6lGP8prXzvQVB8kQ=
X-Received: by 2002:a25:3308:0:b0:d9a:3801:aed8 with SMTP id
 z8-20020a253308000000b00d9a3801aed8mr3475649ybz.14.1696945529849; Tue, 10 Oct
 2023 06:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
 <20231009083856.222030-20-u.kleine-koenig@pengutronix.de> <CAMuHMdX=pESX1PefCXBSHgu8wRMsEiNO02q1-sjsxqysKb1znA@mail.gmail.com>
In-Reply-To: <CAMuHMdX=pESX1PefCXBSHgu8wRMsEiNO02q1-sjsxqysKb1znA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:45:18 +0200
Message-ID: <CACRpkdZ0xhgEA733XNOehBL0G5u1P=1FGVTf9tcToLhEj5vQCg@mail.gmail.com>
Subject: Re: [PATCH 19/20] pinctrl: renesas: rzn1: Convert to platform remove
 callback returning void
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 9, 2023 at 11:39=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> Linus: do you plan to take this whole series directly?
> If yes:
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Otherwise, I can queue it in renesas-pinctrl-for-v6.7 for my
> second PR for v6.7 this Friday.

You pick it! Andy is already picking the Intel changes, so it
is better to refer to submaintainers where we have them!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
