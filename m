Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4912D4E5093
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 11:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbiCWKpw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 06:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbiCWKpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 06:45:51 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF24D6E7A7;
        Wed, 23 Mar 2022 03:44:21 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id k10so1332523edj.2;
        Wed, 23 Mar 2022 03:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fM1V1vh1daKHJcoEvR82+rxfCWqiU9rXs5XUEsq9VUQ=;
        b=wqQR7VSzwbnRJu5NdKZJnYscoWs7c60+NAecSzjO5SfUuvVBB6M55Bq6IjjxZ+TI6y
         GolldNzYLKUfhhcZy6RFS+/Zo8FCxyb3Ru+wW7WFNdfiM6ZHPVHAXpWVroH4sM+iDL9S
         SCy24T4Hiw4cFYSvgBkSAVZmhQIri1BMEbZe6j6QHZYuYn7bzgaB2M0/g7E/Ux7bs9N4
         QdXHgAEbpAV8xU7HyIEQtSsZKm+7sZBBnTWfYPXVMsJ5lYSuPC5I4tqdHxvx8dIJOvyV
         GQekMUGKHo8pIJojYZqMydYjtrSeTCCCzGqp3cPH3s2anSM6FQqH+BiAbraduIf6ySxW
         TKuQ==
X-Gm-Message-State: AOAM531I0nfZrX64fIb1Z/tW3KrMCzSQajpNreAk8t2TPg4CMB4C76Fq
        dpGHsvObBIUmjnu7X7vREj/ZBN3GxLCDXA==
X-Google-Smtp-Source: ABdhPJxYwbHS95yN0MeTj1XJC7MDhlLxCT6NBvy/QBjMtjRjSNZofjg3UxwXD5hJGJnITCd1y4JCuw==
X-Received: by 2002:a05:6402:270b:b0:419:3383:7a9f with SMTP id y11-20020a056402270b00b0041933837a9fmr17920013edd.191.1648032260244;
        Wed, 23 Mar 2022 03:44:20 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id g2-20020aa7c842000000b0041314b98872sm11072681edt.22.2022.03.23.03.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 03:44:19 -0700 (PDT)
Message-ID: <b00a4cc8-c8b8-60ab-9891-e6cb44c8bf75@kernel.org>
Date:   Wed, 23 Mar 2022 11:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/14] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-5-phil.edworthy@renesas.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321154232.56315-5-phil.edworthy@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21/03/2022 16:42, Phil Edworthy wrote:
> Define RZ/V2M (R9A09G011) Clock Pulse Generator core clocks, module clock
> outputs (CPG_CLK_ON* registers), and reset definitions (CPG_RST_*
> registers) in Section 48.5 ("Register Description") of the RZ/V2M Hardware
> User's Manual (Rev. 1.10, Sep. 2021).
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  include/dt-bindings/clock/r9a09g011-cpg.h | 337 ++++++++++++++++++++++
>  1 file changed, 337 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r9a09g011-cpg.h
> 
> diff --git a/include/dt-bindings/clock/r9a09g011-cpg.h b/include/dt-bindings/clock/r9a09g011-cpg.h
> new file mode 100644
> index 000000000000..b88dbb0d8c49
> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a09g011-cpg.h
> @@ -0,0 +1,337 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>

Include only headers which you use here. Do you use it directly here?



Best regards,
Krzysztof
