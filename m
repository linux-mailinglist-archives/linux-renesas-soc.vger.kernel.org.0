Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E676D7EE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Apr 2023 16:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238339AbjDEOON (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Apr 2023 10:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238195AbjDEOOM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Apr 2023 10:14:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA15B7;
        Wed,  5 Apr 2023 07:13:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 40BBA62502;
        Wed,  5 Apr 2023 14:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BC7C433EF;
        Wed,  5 Apr 2023 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680703987;
        bh=zK32UG745OiVsFGIBK7c7Vr6KqlzuaubMx2AyCz81i4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VlsMb4WsQRyYUtamDlzFMzy/7496gAaK5p8A8UOEAcHGbYtSXUKFmdQPC2bLC8b8i
         nbr7MfJJahx2smB6/ZHlBLMNlMkmlGT1qGalzjx7IFEMOn6LlZcRDkAaDeskBPLYdM
         RYQbCl7LONmkd+BD5tdrVFrinf0oTcwJFdqmUM6c+0O58m65k7Kvxa+9mUI17tyAzO
         mKfDHwAv3r1Dg105niXyZbEhPnLIGWNRl1qTe48PGbkkLamO1/Xq/rqlBw8ZNVfnVG
         OuwttqjOO8Zdawu821D45kzLAC/a5qwdTrNuwq/U9fIFFHWcrr8PQNa3vPFoZhxSRa
         S7bKKg/zvTJMQ==
Date:   Wed, 5 Apr 2023 15:13:01 +0100
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v15 1/6] dt-bindings: timer: Document RZ/G2L MTU3a
 bindings
Message-ID: <20230405141301.GG8371@google.com>
References: <20230330111632.169434-1-biju.das.jz@bp.renesas.com>
 <20230330111632.169434-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230330111632.169434-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 30 Mar 2023, Biju Das wrote:

> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
> channels and one 32-bit timer channel. It supports the following
> functions
>  - Counter
>  - Timer
>  - PWM
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Ref:
>  https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221010145222.1047748-2-biju.das.jz@bp.renesas.com/
> v14->v15:
>  * No change.
> v13->v14:
>  * No change.
> v12->V13:
>  * No change.
> v11->V12:
>  * No change.
> v10->v11:
>  * No change
> v9->v10:
>  * No change
> v8->v9:
>  * No change
> v7->v8:
>  * No change
> v6->v7:
>  * No change
> v5->v6:
>  * Added Rb tag from Rob and Krzysztof.
> v4->v5:
>  * Modelled as timer bindings.
>  * Fixed the typo.
> v3->v4:
>  * Dropped counter and pwm compatibeles as they don't have any resources.
>  * Made rz-mtu3 as pwm provider.
>  * Updated the example and description.
> v2->v3:
>  * Dropped counter bindings and integrated with mfd as it has only one property.
>  * Removed "#address-cells" and "#size-cells" as it do not have children with
>    unit addresses.
>  * Removed quotes from counter and pwm.
>  * Provided full path for pwm bindings.
>  * Updated the example.
> v1->v2:
>  * Modelled counter and pwm as a single device that handles
>    multiple channels.
>  * Moved counter and pwm bindings to respective subsystems
>  * Dropped 'bindings' from MFD binding title.
>  * Updated the example
>  * Changed the compatible names.
> ---
>  .../bindings/timer/renesas,rz-mtu3.yaml       | 302 ++++++++++++++++++
>  1 file changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml

Applied, thanks

--
Lee Jones [李琼斯]
