Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8A24F1D41
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 23:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377617AbiDDVae (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 17:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380271AbiDDT0n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 15:26:43 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DDA26AD7;
        Mon,  4 Apr 2022 12:24:46 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-ddfa38f1c1so11875132fac.11;
        Mon, 04 Apr 2022 12:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W7BmPjDsiJqSdp1KQNF4ZYLKk49e0AnrVNuDfyEyNeA=;
        b=hV1Iym5ezIj3nt0TDYyCBPOf3kUwk83kxlpWIqxQmoDv/udzoZhDOagsdD3cBYOIU1
         fOWkYvddroGMEVRwbhVftHiEwoGICDE8fP2cKrFr1SBNKJs2GAINXQv6Psi9bv0a9ER/
         ox/f+CD0lDE+Aoi833oQ50aFFhGKqD4MvQAM7kHkqKZMDsstkgtiSBcVYHH4mWLX61z0
         0fFgh14z5TV/z+O/FavO0f7CpZmCjKhDp4XknyPue9Sk1L+Hw49r6NU1ayaOhFFmeTK/
         sXQSrWedt1CWDaXf+DXtoMPact4uhohmFd3+XsW5FkgJoxu6JDqExQvO2CdQ2udstTYr
         xQIg==
X-Gm-Message-State: AOAM531B/TkKPl3OE3G1ac7oJeE3z+GTHdpbVQRbci+RqfCZsijHbioq
        N/QiCmg7XCRxRS+g/XxIww==
X-Google-Smtp-Source: ABdhPJzl8vZURA8mEdnrAQgV3r1N/Hltsq8z2L/EsYmRGyJYHH8jjMFJnN9tDdxbDaqV7KSSj9srfw==
X-Received: by 2002:a05:6870:5884:b0:dd:af00:a8c7 with SMTP id be4-20020a056870588400b000ddaf00a8c7mr383169oab.209.1649100286185;
        Mon, 04 Apr 2022 12:24:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 1-20020a05687011c100b000de98359b43sm4672349oav.1.2022.04.04.12.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 12:24:45 -0700 (PDT)
Received: (nullmailer pid 1805933 invoked by uid 1000);
        Mon, 04 Apr 2022 19:24:45 -0000
Date:   Mon, 4 Apr 2022 14:24:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/13] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Message-ID: <YktF/YDoB4nIXXfm@robh.at.kernel.org>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-4-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330154024.112270-4-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 30 Mar 2022 16:40:14 +0100, Phil Edworthy wrote:
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

Acked-by: Rob Herring <robh@kernel.org>
