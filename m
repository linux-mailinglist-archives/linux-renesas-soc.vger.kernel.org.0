Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57296681AA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 20:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238164AbjA3ThQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 14:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236704AbjA3ThP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 14:37:15 -0500
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D3338EAD;
        Mon, 30 Jan 2023 11:37:14 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id d188so10995357oia.3;
        Mon, 30 Jan 2023 11:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY8t9rjZvKksjjObUfSr/JlHFAVlEcQD+wuQnMYT6og=;
        b=BHd4yFoHcrkAipOPK3o52jdeVeo2rZEOFLSmdRdjj+g/54hX1z2YJr77A8ESJhZ3nq
         mUU9fxVVKcKOorlQ82yV4HbFvEdY4hFVe8OUEWg97I58YswSbwL753v2832hLnIIVL2K
         cgWIKyqZcc7wL/yoeJ98MUfZsvkLkpuwAGSJ3iN8q+EjHqWx4dj812wOcEqons8ju2h9
         itaksx8LXqSjKXuKFZd/YgcpURvZ06vlMAoZGsUHOgEq5tYFnN72sT3T7BJJ+MIPdsXo
         0Kryh749lYDOhyNslI8AIM3k1XUSycnbZB51k4lX+4YwM+RJnyyYw4w3rsCMGy83gEYp
         nIyA==
X-Gm-Message-State: AO0yUKU/UtMT9X5oi3FlLz1PvidVC88cgpkFnI/4j17lGmgOI3Ba+OlU
        QVugpSMUsz0PIlo/RoY99A==
X-Google-Smtp-Source: AK7set+LExoVClMVHa7Z2AUHvHd9asnN4InRgfJ7HTs+KkGhNtYD+t+SMJiiR4ca0LFwjquj/JKapg==
X-Received: by 2002:a54:4497:0:b0:378:330d:84ef with SMTP id v23-20020a544497000000b00378330d84efmr2906173oiv.0.1675107433889;
        Mon, 30 Jan 2023 11:37:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c82-20020acab355000000b003645b64d7b3sm5139410oif.4.2023.01.30.11.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 11:37:13 -0800 (PST)
Received: (nullmailer pid 3234988 invoked by uid 1000);
        Mon, 30 Jan 2023 19:37:13 -0000
Date:   Mon, 30 Jan 2023 13:37:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: iommu: renesas,ipmmu-vmsa: Update for
 R-Car Gen4
Message-ID: <20230130193713.GA3213851-robh@kernel.org>
References: <20230127140446.1728102-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127140446.1728102-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 27, 2023 at 11:04:46PM +0900, Yoshihiro Shimoda wrote:
> Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, update
> the renesas,ipmmu-main property which allows to only set the first
> argument for R-Car Gen4.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes from v1:
> https://lore.kernel.org/all/20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com/
>  - Change number of argument for R-Car Gen4 instead of "module id".
>    On the discussion, using 'minItems' is a solution. But, it causes
>    "too short" errors on dtbs_check. So, using "oneOf" instead.

What was the schema you had?


I've commented on v1.

Rob
