Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23CB778A03
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Aug 2023 11:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbjHKJee (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Aug 2023 05:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjHKJed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Aug 2023 05:34:33 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2BFFD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Aug 2023 02:34:32 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d3d729a08e4so1646377276.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Aug 2023 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691746472; x=1692351272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smN+SCWW2lKTSARYfwTP+xuBJ9NW+4x7+X95r/DL53w=;
        b=K282RvNdEnW7n5QERUHuFNXOJydN1zwNIvZe/Cpivm5a5uRi4o+lZ/cAvgJQ/926R9
         wL+afDgiAQZxh/vPgwU6rwTMvAFg6DBHzj5qpuzWbjGIXBKkV4qI0AdhCNCWLul8GnwV
         Aedm0zoyHDYdb9S96BgdM3G1PV2xoATPSa2EERgQfXN8Dlq5azOYi6nfkj5gMxx484KD
         FCZ4Kh1QlyKbtQWq9EUvsbYhi1D+eYDx4cFNr29YZTlwMDdodUOp0G7qU3Dg+/M/YacN
         DE8t9ZWDGvf2xfctOURuH8+LO+WgLw0+QTaks2WuhljncCsDme/szqTPDdaIQCsi8yjo
         mEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691746472; x=1692351272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smN+SCWW2lKTSARYfwTP+xuBJ9NW+4x7+X95r/DL53w=;
        b=iX5DppQRYfq4/xEj6pCP/ksP0Zmmfg7Py8ztyP6c1CTub3xwOL229AfYt6Eeu/f4XP
         LYYzwGHN5JIymqejuuMe8R70t80mu7qcPHwDg+eirA+5/alk64um80J0OSjAmlYYF5n2
         OI9W2Nu8YZVwJB99hOo7ZXTX5lroVbhIyMv53KNZHNAzVNujaAgwy5aRYhl84/R3YyEp
         Y5p+MuIQoCCNgRBOo/N1gij3dfHibcIh5s3A0UtGdfDqPOkM0J/hMYCd/tAB61ZcTibb
         mapeqXh9TVB6PXAL8jCgpSTcwhvxpGmUVHgLsldXjEnyJTfuH53SBNyOFdKLX72o0oVr
         YiHQ==
X-Gm-Message-State: AOJu0Yz/UrxzvP1u/ij1fcCZtXFqlLL9FOO293ODUCmgrHPpMqsJQ5Ca
        MjC6ROlj+t3JacA5MzY58m0d9UXt9XHlEjcUN8MQDA==
X-Google-Smtp-Source: AGHT+IGjowQEzSv7PVwIHlKiu413nF9rlr3/ZMr5eI0rYZsr7D7PvUEmpj08JdXt4Jpa2UlmUQgdfaJzQGcTaYVim0Q=
X-Received: by 2002:a05:6902:565:b0:ce7:919f:38f8 with SMTP id
 a5-20020a056902056500b00ce7919f38f8mr1190723ybt.52.1691746471825; Fri, 11 Aug
 2023 02:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230810081656.2981965-1-ruanjinjie@huawei.com> <20230810081656.2981965-2-ruanjinjie@huawei.com>
In-Reply-To: <20230810081656.2981965-2-ruanjinjie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Aug 2023 11:34:20 +0200
Message-ID: <CACRpkdb+LMN=WRzLXGwWb_U5KhKpUVmcjNsvHk-3eb-PzbLYbQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/5] net: dsa: realtek: Remove redundant of_match_ptr()
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 10, 2023 at 10:17=E2=80=AFAM Ruan Jinjie <ruanjinjie@huawei.com=
> wrote:

> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
