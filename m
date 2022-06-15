Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3181C54CFAE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 19:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354371AbiFORYT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 13:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237461AbiFORYQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 13:24:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B03D340ED;
        Wed, 15 Jun 2022 10:24:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4AD7EB820C6;
        Wed, 15 Jun 2022 17:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE1BC341C4;
        Wed, 15 Jun 2022 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655313852;
        bh=aAPFBvoAVs1ptpGv+lER+Tuq6aaIXaGbhE/e88fLKT4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BAEQ6c7S7nRsleTFzWzzFRhlBr6lqUh2YqrfNMjIoBfL53h3m91cowLWuDLzTswUE
         m5lP871MTa2leLhtPElGvrYpii4+Z924tXvvuYS6tNA/rgEVbrn5Ij9jozsx+SOcex
         l90gZG8eaJ24LM6iIej3NzFCD9CzFazeP62TNZlJdw//WTQ7kZeyfNFIBLYQqScHWH
         OsoxsiQwJR+GaxxCS4Ot7z6T7iK80/yN5UV+be9P7IbiwkrQ+PFamtR4PiXXENwVS1
         D2ZJ/GEhkEVW+aLT4jtkclGc4uyalA4sW003/1634E/226MqRxIw/7J1TJaP2MvA6u
         42yN6+9Yn9TdA==
Received: by mail-ua1-f44.google.com with SMTP id q1so4612771uao.1;
        Wed, 15 Jun 2022 10:24:12 -0700 (PDT)
X-Gm-Message-State: AJIora8Lq/xRogszM/PgS5yOpGqenD124GkPswV227f65SUFmLDuDkJo
        97+465ftPJrWXjOHQDtvnpAWsuKYZ6hxr1LlAw==
X-Google-Smtp-Source: AGRyM1vfc/l1EG9VYea0UnQPrmd5ibZk6KVf5x1y3T1ksyE7i25v91WnBNfknlzC76lYPKd27nWTCa1xHZgirW3FjSI=
X-Received: by 2002:ab0:2705:0:b0:379:7378:3c75 with SMTP id
 s5-20020ab02705000000b0037973783c75mr538123uao.77.1655313851652; Wed, 15 Jun
 2022 10:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <c5d19e2f9714f43effd90208798fc1936098078f.1655301043.git.geert+renesas@glider.be>
In-Reply-To: <c5d19e2f9714f43effd90208798fc1936098078f.1655301043.git.geert+renesas@glider.be>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 15 Jun 2022 11:24:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJbmdJd6+D9zog6NwF_LPO5QC_HsODg4FHLJOnMmPP-mg@mail.gmail.com>
Message-ID: <CAL_JsqJbmdJd6+D9zog6NwF_LPO5QC_HsODg4FHLJOnMmPP-mg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: ehci: Increase the number of PHYs
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 15, 2022 at 7:53 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> "make dtbs_check":
>
>     arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb: usb@ee080100: phys: [[17, 0], [31]] is too long
>             From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
>     arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb: usb@ee0c0100: phys: [[17, 1], [33], [21, 0]] is too long
>             From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
>
> Some USB EHCI controllers (e.g. on the Renesas RZ/G1C SoC) have multiple
> PHYs.  Increase the maximum number of PHYs to 3, which is sufficient for
> now.

Maybe not so 'generic'. Why are there 3? I understand USB3 HCI having
2 for SS and HS. Is it for multiple ports? There's a thread about that
currently (Mediatek IIRC) and how to handle multiple phys.

Rob
