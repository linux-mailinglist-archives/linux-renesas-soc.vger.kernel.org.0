Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC0F1FD8FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 00:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgFQWiD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Jun 2020 18:38:03 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34660 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQWiD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jun 2020 18:38:03 -0400
Received: by mail-io1-f65.google.com with SMTP id m81so4894565ioa.1;
        Wed, 17 Jun 2020 15:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ksvsgsjdaZcMUEmgk684MCGB6ZGZGrqLwnOCtcep1MA=;
        b=ka9gpXtBIf7I30x0iAP7vrJPkPacAok7Yyu5mPijxrPfzyV+vmsdUeVSMFDxfjcpAk
         GMhYdYg/fo3ceO3oeS/o8YDH5aNNbZQn0WtieSQKb4A8xpvOI3T1eY168Tz9a40npm4w
         VRxxveRcmut3Vyb20OFwEmChhTPuG+Yzx1mtDWDDbQsVtim61Jp4KCJP7J8m2misEm+5
         owARabUdRQJL17+VFloMV99UaGDcgiqkqYai8r+O4yXOL0quYyA9jNCZDIoL0mC5H2pZ
         smOnOUSZ0dz1g0a3DvSXa6opPGBWFltt4J2Lag1uekkdenFLpx2WU+hZMwvq9wRXV2Ol
         6y5g==
X-Gm-Message-State: AOAM530XOoIEeh3JnPaKYsuIhUQwss+xC+XitVG5/aXqX2B3CAYN9ctM
        Hdy+SpKuEQm6cdPMXWPiH09+IHb4Ag==
X-Google-Smtp-Source: ABdhPJyFzeWwL7OayI26A4GqFjHOYTLMKOxLa56FuTpcSoIToqXI02vzGs7qF3hOCwGOKyHLOvEOzw==
X-Received: by 2002:a5e:a705:: with SMTP id b5mr1873841iod.12.1592433481280;
        Wed, 17 Jun 2020 15:38:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b13sm521573ilq.20.2020.06.17.15.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:38:00 -0700 (PDT)
Received: (nullmailer pid 2965977 invoked by uid 1000);
        Wed, 17 Jun 2020 22:38:00 -0000
Date:   Wed, 17 Jun 2020 16:38:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, joro@8bytes.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a77961
 support
Message-ID: <20200617223800.GA2965923@bogus>
References: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1591873830-10128-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591873830-10128-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Jun 2020 20:10:29 +0900, Yoshihiro Shimoda wrote:
> Add support for r8a77961 (R-Car M3-W+).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
