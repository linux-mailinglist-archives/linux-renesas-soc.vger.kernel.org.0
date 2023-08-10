Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B0677776F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Aug 2023 13:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbjHJLnq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Aug 2023 07:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbjHJLnp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Aug 2023 07:43:45 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046E2C6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Aug 2023 04:43:45 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-586b78aa26eso10060807b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Aug 2023 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691667824; x=1692272624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL36QLiViprzn+D+ZWCkWvBnqNCptB0lN73iKQuirFQ=;
        b=y7kCnI69HxExw+MxsiCIfcA49blmdcjUyl5SS0/8bRbzfkNopPZTw4lvFNhr7Jr9VT
         QIudvkr6xe24/0japmubXLvd4/OmMJuTl1bb9UsZAQHDmrKizjE34aYrbYPXdGGCGllY
         0J6lqmp58uUGSJM9uqiLjO2sr0MWS2M7bdc7VHcdzGTtUYllOvtLCWDUwO+NrXgllXxo
         RaIC8utmFE2Wzzkl0AYpSJjhBa2GveWIUstkLFW/4NWchwSU4bSAzWvCdkggyxEIVDpn
         WhcGue46u/fi1AoMhC1mUVMQ0saQoFncgBSqRSUG5kKsgJPyj15Oda5qM1RkkkaWBT+V
         v4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691667824; x=1692272624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL36QLiViprzn+D+ZWCkWvBnqNCptB0lN73iKQuirFQ=;
        b=eHHcgDHykOIzs+tToej3AOaXtTfGo0QOgNDblWPWL3OnMsJB9EcnEAiznKf6qlqnTp
         CSGJgcvS3a/ZkdizDdaXppzlXJzQTc0EblrfB8QlGgNApxMbbD3hR1TWHUy1kOJWkGvO
         gocsu55PaRWput/PHmu8Kax24KDHEVkXY98FEMTF6vpk5iQYQv9Wwh5ZbCF9JzfF1IPG
         ZZV3PZty99cWi8h3b1Ew8DRVrNuy05T9rP00F2oE022PaiNkECdzrAQ0Txs0v18SElYx
         SalV+I8GfZNFIrHZ7NDh1JE7ri72LlrCv77jR/tCq3ZqK/6OZ9JDEnsARtLuElz0Di4Y
         icUA==
X-Gm-Message-State: AOJu0YzjIcaeXjjFf+WlcBFi5vl4ldSTOt5F8gTswg1LHXlOiNuGFxh0
        DjRK8TXRaZSsC1pPgLerlgzNRVbTEpcmH2j2wFmcpg==
X-Google-Smtp-Source: AGHT+IGWqccxb4eaBa7viDsBH2qiuOr+FG9TqsbGIftGtcqIE8Z07l9Awkx2SSQ1v2jf3lFLrsuig7uobLg7jc9ceaU=
X-Received: by 2002:a25:3786:0:b0:d1c:77de:cf7a with SMTP id
 e128-20020a253786000000b00d1c77decf7amr2082342yba.64.1691667824245; Thu, 10
 Aug 2023 04:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230810081102.2981505-1-ruanjinjie@huawei.com> <20230810081102.2981505-4-ruanjinjie@huawei.com>
In-Reply-To: <20230810081102.2981505-4-ruanjinjie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 13:43:33 +0200
Message-ID: <CACRpkda_9jKvew2EzqHJa9Bs7cbV4TAZx9s5AoxTdbbV=0g1CQ@mail.gmail.com>
Subject: Re: [patch net-next 3/5] net: gemini: Remove redundant of_match_ptr()
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
