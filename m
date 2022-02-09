Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D4B4AE836
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Feb 2022 05:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbiBIEHv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 23:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346375AbiBID2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 22:28:16 -0500
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A66C061576;
        Tue,  8 Feb 2022 19:28:15 -0800 (PST)
Received: by mail-oo1-f42.google.com with SMTP id f11-20020a4abb0b000000b002e9abf6bcbcso1111821oop.0;
        Tue, 08 Feb 2022 19:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HSxopZsSnPsRcG33HAAgco1k+vDXFb3VtI2j2ntI5qQ=;
        b=QHIurq95XzKNbAe04dNSvDvnyaHGt7oTmJ397zp+B5fGykdgVVbGSuOSRM1d4rx0Xd
         RXEif6vxdT8PmDGlTSGi4dnmam48Xx/GwR6mB5gaQQBeakMxPp1yziV+uKK8EXuDMTot
         9K46GLD8a+XEHy50qQA3TafD7HXZHhfA38cXrRuHi2tXXEIMlPr8KgfciAXzrwsm1Trz
         waurvj/LwlpGP4dEzDMddeiJW01H9SiqMZjrhTcLP7mBYql8sD8IV7QDsi08AvInCUTq
         8MxzvCDx5EI3HdbntV87AcQnSaAHngGTbqjxD0GonAlVG6OOVx5fOhg+2MdbCt3NB9qW
         pGwA==
X-Gm-Message-State: AOAM531NVTKYa4ivmY3VR0g7YVqbbYV7hYvAuOs1CtEys4GLYoahLuni
        MofO99hNE2vGVy9Ld8c/p3lYnRonsw==
X-Google-Smtp-Source: ABdhPJzmourstxCxRDZaZsvmrYvqzfZpgNTTlzuYJ8p7hxNsFseigsd8IWKAou7GDbUe5LrZxMXBnQ==
X-Received: by 2002:a4a:e742:: with SMTP id n2mr172803oov.1.1644377294315;
        Tue, 08 Feb 2022 19:28:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 21sm6031798otj.71.2022.02.08.19.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 19:28:13 -0800 (PST)
Received: (nullmailer pid 3579348 invoked by uid 1000);
        Wed, 09 Feb 2022 03:28:12 -0000
Date:   Tue, 8 Feb 2022 21:28:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Reformat
 renesas,ipmmu-main description
Message-ID: <YgM0zKJz+R5Nfm2/@robh.at.kernel.org>
References: <ea2205791573e6d99f3cb65cae99bdbfa4f65c97.1643199809.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea2205791573e6d99f3cb65cae99bdbfa4f65c97.1643199809.git.geert+renesas@glider.be>
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

On Wed, Jan 26, 2022 at 01:24:32PM +0100, Geert Uytterhoeven wrote:
> Remove trailing whitespace and break overly long lines.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I fixed this and other whitespace in my tree from commit 'dt-bindings: 
Improve phandle-array schemas'.

Rob
