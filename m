Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BE3544573
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 10:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbiFIIOF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 04:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237351AbiFIIOF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 04:14:05 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7C3880FD;
        Thu,  9 Jun 2022 01:14:02 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id b17so7589218qvz.0;
        Thu, 09 Jun 2022 01:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+n9hcPgHl38APpRiB3XZt2L6TGQH6SZ4fgFSc8uMlfo=;
        b=YBisoUVOkSJkF4KRP0HXoHxQYLGxOTrmYDNjdR22vRM4Ye3fRn8fsd63U1EiFg4sIU
         HQ4GCkzAc7afk6KZtvzF0IVOm4GJ94+yEU5ol76ELkZFOSDmEyweMjzi5fNpC8/bG9ss
         V14WPcAH54b8lFQl9KnR3TF9kWnpfC9+Ah228/lRDCs8O1aWGE5d+vmt321hjJSIWD0B
         hUGqUqZP+DiNrHidykJ64dyHfLSXZQ1vCdQ4JiP7hZsz+cLz5G7YtYvKwIjsVTSzuaGm
         TggaKl5jg0lP34evKxyxwzKahVyOgfLpxzb0+hTgjTSMI5Vb0uWpmLCeWsLTaxOeuYkf
         KFPA==
X-Gm-Message-State: AOAM530gxs4ltJJ9dJkarmsJSrvLrqnDlPbG6Q+cdbUGiM1avjOPz+Ip
        W0iG2xyUKtLrjvGzSzriDH6rwB41KcND8g==
X-Google-Smtp-Source: ABdhPJxPqLVXT4WsOhlF7STEyxJ+ps40mDqgiLfSZD3WDx3oDgs7enFuJnQMOflRm3DrQJPBKWmVpQ==
X-Received: by 2002:ad4:596d:0:b0:464:f983:f7bf with SMTP id eq13-20020ad4596d000000b00464f983f7bfmr30847234qvb.88.1654762441828;
        Thu, 09 Jun 2022 01:14:01 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id u20-20020a05620a0c5400b006a6a774d27bsm13600702qki.134.2022.06.09.01.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:14:01 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-31336535373so82202337b3.2;
        Thu, 09 Jun 2022 01:14:00 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr41602408ywg.316.1654762440675; Thu, 09
 Jun 2022 01:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 10:13:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV28kUAZjGUwv=hHOFdwCj+OhJDixN+eY_UvPdtPxRmoQ@mail.gmail.com>
Message-ID: <CAMuHMdV28kUAZjGUwv=hHOFdwCj+OhJDixN+eY_UvPdtPxRmoQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add missing space after remote-endpoint
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Jun 8, 2022 at 7:58 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the missing space after remote-endpoint in r8a774c0.dtsi and
> r8a77990.dtsi before the typo spreads to other files.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Do you plan to fix the other in-tree offenders, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
