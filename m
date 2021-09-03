Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D35400623
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Sep 2021 21:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234472AbhICTvz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Sep 2021 15:51:55 -0400
Received: from mail-oo1-f50.google.com ([209.85.161.50]:39470 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbhICTvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Sep 2021 15:51:54 -0400
Received: by mail-oo1-f50.google.com with SMTP id t2-20020a4ae9a2000000b0028c7144f106so21858ood.6;
        Fri, 03 Sep 2021 12:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EBFLmekutrmRxU3ByHJT7leszJzUX4EBGLPcs8sBao8=;
        b=qev9j/cG8TnkADmAHitnlXkIlNGY/vBI4wvwpTDDksJyu0JYckCZb1WIw6bMH0FjCn
         A48hVqfVGeZPO9+hqzauKux8dhaiMGTsQRk2ioeRYi05kexiiUybh21TuYHQuTv1kD2m
         7LhdrnC8/q8rWG1rkaY4B2dmd3OUDRCr8gKvsl5FP6hmvXgNpCPJBMU+VAnvfpQSSyRw
         Jpdblbd6QYBrNSiKgOfOPE9Q6i6Bo7TKgy+sO7Us+R1Q6Wyvd7NiFVpLEA5HJWdICROe
         NQVDWxn8m0wSnPS5YvxaNqgVj/fVZbIwy1o4fjIDOrUWPB3oXBVN+mS8Tw77mVm/HIDw
         dN4w==
X-Gm-Message-State: AOAM531Rc4/BlKAZnWVNJ4bv2Xn0dFD3VKTy5aEePxfsKiTKvgDhN6BT
        uF7CP4BAkRy3ByanRt3Uqw==
X-Google-Smtp-Source: ABdhPJzQwSlUjPmt9nmt4wfcz2TqN3ODYwvOntLljzI2RULMGR+QOqgoSya/tElc/6kDUno7UeFpAg==
X-Received: by 2002:a4a:a78a:: with SMTP id l10mr4374964oom.30.1630698654248;
        Fri, 03 Sep 2021 12:50:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i1sm71822oiy.25.2021.09.03.12.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:50:53 -0700 (PDT)
Received: (nullmailer pid 3347203 invoked by uid 1000);
        Fri, 03 Sep 2021 19:50:52 -0000
Date:   Fri, 3 Sep 2021 14:50:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     iommu@lists.linux-foundation.org, robh+dt@kernel.org,
        joro@8bytes.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779a0
 support
Message-ID: <YTJ8nCgrnZ6bcz01@robh.at.kernel.org>
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
 <20210901102705.556093-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901102705.556093-2-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 01 Sep 2021 19:27:04 +0900, Yoshihiro Shimoda wrote:
> Add support for r8a779a0 (R-Car V3U).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
