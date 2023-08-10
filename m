Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCB777776A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Aug 2023 13:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbjHJLnJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Aug 2023 07:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbjHJLnI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Aug 2023 07:43:08 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A4783
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Aug 2023 04:43:08 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so692695276.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Aug 2023 04:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691667787; x=1692272587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL36QLiViprzn+D+ZWCkWvBnqNCptB0lN73iKQuirFQ=;
        b=qRFkbYuqL7ggurMP+JBfz/Q97CexZe6yk/1Z2oUlieMSuXYSgWT0X6/WxxflEBXQKw
         7GqGyxVLN2cBVH1mV1HJoectovdstuhGkLbiVv5vbRu1RxQXyf4GcsggOxCQM6gPOZeY
         5463j1hhtGiYyz3rZ/KqBtk7VDLuQ4Ep/NUeOw3ONRxZExPzorr0qX9PDVn4uu2KlRsU
         t9MnGbSiM5aRrHm5gDem/mmbEMMITnqC7SrhxyWzHgnQhRcF3aG9pHC/F3G0U/xvfnoO
         gcEktFIu5kf62bYF535rxJjSYia54CEIGfFwFX0J19CEaFcwZ/GYv4svdmGwi4XHmGR7
         NzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691667787; x=1692272587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL36QLiViprzn+D+ZWCkWvBnqNCptB0lN73iKQuirFQ=;
        b=kIOkaQqYwHtR3QZpRRlUThZo1wQR6FHL2g8hyQWNF2tfs/mTGX4qXYGLlrvh18U3LA
         7ir4DqGFkdNDcxFaqarXmBK9X0CZ0ANs+J6aYzi2KgozSjuGTXii34y+ukEt9I/RnXv2
         QlaRtSJf7d2BmsfDrUlOEk7BlaMGeEmJf6M0SFHwUp+RCwGbnThmVJlAmMoX+GnfTRxp
         y46JBDLPzGshFaA1RI/r+ErHxGucYIyf3mk6NqjLIAK/R0ylSNA6djb+saCMIVOEIko2
         OuoegUS7PcqVistgxGjOE/Ivh+x43JCFwT2BkdP3cwh4Ft3jgkrtNic30HE6qUCJNLLV
         428Q==
X-Gm-Message-State: AOJu0YyrAmo+OHP0uWIaG0TgzQ6jXfUH5LqqrgFZOMsenbHzO0TRAMkY
        lK6j3KsQxowP5pdP3sRVD8TmL9H+iEWGuJzLU+yS0A==
X-Google-Smtp-Source: AGHT+IF33zszTEy6qxiqNv7L7RWHO25feaifS32PLUxt1xLMJx8ywh8Ip+nh/ZGptVv7/qgWjOvPSRff7nYWXVcaYAI=
X-Received: by 2002:a25:2402:0:b0:d0a:fa7f:2fbf with SMTP id
 k2-20020a252402000000b00d0afa7f2fbfmr2136189ybk.48.1691667787296; Thu, 10 Aug
 2023 04:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230810081102.2981505-1-ruanjinjie@huawei.com> <20230810081102.2981505-2-ruanjinjie@huawei.com>
In-Reply-To: <20230810081102.2981505-2-ruanjinjie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 13:42:56 +0200
Message-ID: <CACRpkdafBPVQ80A-qwYjF_ZOBM6vj-cqgZ49FEGB-bL7Z2-gqQ@mail.gmail.com>
Subject: Re: [patch net-next 1/5] net: dsa: realtek: Remove redundant of_match_ptr()
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     alsi@bang-olufsen.dk, andrew@lunn.ch, f.fainelli@gmail.com,
        olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
        ulli.kroll@googlemail.com, kvalo@kernel.org,
        bhupesh.sharma@linaro.org, robh@kernel.org, elder@linaro.org,
        wei.fang@nxp.com, nicolas.ferre@microchip.com,
        simon.horman@corigine.com, romieu@fr.zoreil.com,
        dmitry.torokhov@gmail.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 10, 2023 at 10:12=E2=80=AFAM Ruan Jinjie <ruanjinjie@huawei.com=
> wrote:

> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
