Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666845A235D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 10:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236623AbiHZInX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 04:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245410AbiHZInH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 04:43:07 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A3F25F7;
        Fri, 26 Aug 2022 01:42:43 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id l6so582495qvu.2;
        Fri, 26 Aug 2022 01:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1TOFQLgW5ai0WaGlNj8bh4dsO/IqLgpL/eMztjVKjiU=;
        b=Yl2yMM6NWReUF6jrVPMdikjxkp0mqhgaN+MFdlHJh9frQTZPOvzRVVQmcxSwy7PZMD
         oE1gWl9IQHqtp5LBax9z/BkmHCnHR3FrDQiNeXZqIfuWKj32lfa8eIOO+7EiaEjmwGwd
         lpk98lfi3hYDo7ZgtLhUPfpnGJMLH0hD8M8EfHCd357AVUybmXdX4CkYTLf3ZQRPmsf6
         3ny2b5XC7xAP9fy7I9gNuCkdLy10prexe5p8fBKOAf9bhJ7PzjXj6QkGuWfu+XUvW99Q
         LC4GKWRgn4I8bGtzHNXd1mC4KbO93Ge4x2AMasHkv2VklWw5WFLn3njdlngCg3pp0izH
         CpOA==
X-Gm-Message-State: ACgBeo30KPFy3SQhRN9XPuEB29HU6Sa7SVL6U69leh5dobViii4ZKPg/
        Ma0rUiuGiCkz8OJqpgzYKZL/sp7F4iHwYQ==
X-Google-Smtp-Source: AA6agR7h1av5995aN/nni0E40PmhYPNbnLiDTCDaKuM9CE8hNU7gS73/P+XQEN93zVV6okkBuNNN+A==
X-Received: by 2002:a0c:b2c2:0:b0:496:f2f5:9691 with SMTP id d2-20020a0cb2c2000000b00496f2f59691mr6966254qvf.110.1661503362299;
        Fri, 26 Aug 2022 01:42:42 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id bq44-20020a05620a46ac00b006b98315c6fbsm1377405qkb.1.2022.08.26.01.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 01:42:42 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3321c2a8d4cso19379167b3.5;
        Fri, 26 Aug 2022 01:42:42 -0700 (PDT)
X-Received: by 2002:a81:6d53:0:b0:33d:bbf4:7582 with SMTP id
 i80-20020a816d53000000b0033dbbf47582mr6018867ywc.384.1661503361818; Fri, 26
 Aug 2022 01:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220819193944.337599-1-phil.edworthy@renesas.com> <20220819193944.337599-4-phil.edworthy@renesas.com>
In-Reply-To: <20220819193944.337599-4-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 10:42:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmC10CoA1ZXj12tpWVz_pUCh7ozhkgHjEzJ4-7boLnVg@mail.gmail.com>
Message-ID: <CAMuHMdWmC10CoA1ZXj12tpWVz_pUCh7ozhkgHjEzJ4-7boLnVg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzv2m evk: Enable i2c
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

Thanks for your patch!

On Fri, Aug 19, 2022 at 9:40 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1...

> --- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts

> +
>  &uart0 {
>         status = "okay";
>  };
> +
> +&pinctrl {

... with this node moved up, to preserve sort order.
No need to resend.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
