Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94DEC612ABC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Oct 2022 14:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJ3Naq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 30 Oct 2022 09:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ3Nap (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Oct 2022 09:30:45 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76272A1AC;
        Sun, 30 Oct 2022 06:30:44 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so5498643otb.8;
        Sun, 30 Oct 2022 06:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD39gM3Y6SRPo4vcxIc+9YUMAKWkt9Hhn/IHBrOsFlQ=;
        b=Vr5R1QJ2NB7IT6vUZgRUv9NKLpsSDNItPaM62RsJVrzC6vOtNn44yBGq9YXVZNJIN4
         IH7UezjmfMqj1EkyqYmqeotlovdWvBWYjEmTfItAp23n7nBy7qWAOGD9kOYVWdhu0ArX
         jTuqMLatl7T/Grv5iLvwAatwvkVJ3+gK+234eS92ssF3hbYAUdbG39D/4Ur223eMCVhL
         +9m8cRtutnV0ESR3VazJUDja3VvWMLnx6V8HMMd2lyoh9DDR31r/G/2kTh6UHSvP+ENv
         uaDMwSAMn1ghMvDnBK/d3d/YLDXmeSWLTDiQBTWVkOXzhV99txIAWsd5I1E5n/+azO5K
         N6ZQ==
X-Gm-Message-State: ACrzQf2OTA+wlvtRzPVEi9mOPySIdmlVldpWYdcpd3KnQddomu1fyy3K
        lDnPnW5VDzU6NWQLQzoFHg15ttKE2w==
X-Google-Smtp-Source: AMsMyM7eb5wn/o7W0L3N1kxoCZoa3guN36yaLuEOuip6+FdK0zFbNExjnXEq0PuFn2cnF/atfZze+g==
X-Received: by 2002:a9d:2da3:0:b0:66a:38de:96b6 with SMTP id g32-20020a9d2da3000000b0066a38de96b6mr4210624otb.20.1667136643544;
        Sun, 30 Oct 2022 06:30:43 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w17-20020a9d77d1000000b0066193df8edasm1703173otl.34.2022.10.30.06.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:30:42 -0700 (PDT)
Received: (nullmailer pid 964892 invoked by uid 1000);
        Sun, 30 Oct 2022 13:30:44 -0000
Date:   Sun, 30 Oct 2022 08:30:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: timer: Document RZ/G2L MTU3a bindings
Message-ID: <20221030133044.GA964038-robh@kernel.org>
References: <20221027144844.85149-1-biju.das.jz@bp.renesas.com>
 <20221027144844.85149-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027144844.85149-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 27, 2022 at 03:48:40PM +0100, Biju Das wrote:
> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
> channels and one 32-bit timer channel. It supports the following
> functions
>  - Counter
>  - Timer
>  - PWM
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
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

Reviewed-by: Rob Herring <robh@kernel.org>
