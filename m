Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 790C252AA17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 20:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348869AbiEQSIw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 14:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbiEQSIv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 14:08:51 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2455FB8;
        Tue, 17 May 2022 11:08:51 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id m6-20020a05683023a600b0060612720715so12706163ots.10;
        Tue, 17 May 2022 11:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fodvXTSZTUWVq+TDNHb6qIVtdhfHxMkfwJazg/ctOG4=;
        b=G9N86eV4RBPKje9Ltu6JHVZ1y9QxexMvFVtWktvgK/YSJeFbDaeWW+SgyKhVMCzQqy
         LWqhAorbWfgZ6MePriAk7LJT1Kw2bCm4gdCRzrMoZhOAt/9Hawg+Wr7jbnLwBpjtzw7u
         39BUvxPzXHuFa7ebyogPYP8bhv3DKRLx5ky3TLgU369RvIp8/sgyPeIaHZNxk2A9Wact
         dgS6CMZKHJrM1dXZVzrzN9YUnXfB8qb8hQ/kYGFbCkI2jJjGGzweMHavctQu2NT985/P
         29Dqu1NsMp1asE4e/GQ27r3QKUMxVk5gaUJvEZN7qzMf0BsbV7ECjsEJsFE0GqJZWRsK
         pNeg==
X-Gm-Message-State: AOAM5300QcgnwDu63qlCO1IQqRCnsH1hCJe5IT3htGtGTZ2RSrsS3kQN
        yiYPlEpn/xWOZZxVG0g7Pg==
X-Google-Smtp-Source: ABdhPJx6EE1RddH9v6mkHChsoZH0k972kbHVlufpvvx4FqlgbENBxgi7AndUbQW299GKFAuHSw9bjA==
X-Received: by 2002:a9d:152:0:b0:606:1e84:ad56 with SMTP id 76-20020a9d0152000000b006061e84ad56mr8452140otu.80.1652810930564;
        Tue, 17 May 2022 11:08:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p127-20020acaf185000000b00325cda1ffb5sm54405oih.52.2022.05.17.11.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:08:49 -0700 (PDT)
Received: (nullmailer pid 1343229 invoked by uid 1000);
        Tue, 17 May 2022 18:08:49 -0000
Date:   Tue, 17 May 2022 13:08:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5] dt-bindings: serial: renesas,em-uart: Add RZ/V2M
 clock to access the registers
Message-ID: <20220517180849.GA1343172-robh@kernel.org>
References: <20220512072649.7879-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512072649.7879-1-phil.edworthy@renesas.com>
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

On Thu, 12 May 2022 08:26:49 +0100, Phil Edworthy wrote:
> The RZ/V2M SoC has an additional clock to access the registers. The HW
> manual says this clock should not be touched as it is used by the
> "ISP Firmware".
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>  - Move clock properites to top level
> v4:
>  - Removed "optional" from description of clock to access the registers
> v3:
>  - New patch added
> ---
>  .../bindings/serial/renesas,em-uart.yaml      | 28 +++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
