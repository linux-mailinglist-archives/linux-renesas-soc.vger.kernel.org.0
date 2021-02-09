Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87CB1315A23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Feb 2021 00:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbhBIXg5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Feb 2021 18:36:57 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:46254 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbhBIW5a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Feb 2021 17:57:30 -0500
Received: by mail-oi1-f182.google.com with SMTP id k25so21244821oik.13;
        Tue, 09 Feb 2021 14:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P3VW+xofmUt3UYHIjrOEYiO784hQdNkcdFTu2Duih6g=;
        b=i/ZP2sKVfGFlPDPMnDmfCqMfRau14dwSVYNhy5Dsevecgzotgyce4cEn+U4RAH96P0
         NxDNL1p/syMk+QP4fKuw8u1vLJIw0tW4AZBuHDRm80haFD8E9phCmuW9I0EEeWPqLI/D
         bTmxoJLXgkAxhBbHinboHCtxJZaVw62l2AH/3lXwW8YiFdTy+yk1IDBbm/JZEijce53G
         R66u4i6Lpr8lR4bcbXi44z8WDOd1M/4WZBZjbaXx28SK7MqCumW/kBQiS3+JG2gyQ57a
         M173LOYeftLkj4pMbN8AT834uk8LbZaRduaLaClJGn6OftGMGCAc20MsGiWDGMQLXEKw
         FV1w==
X-Gm-Message-State: AOAM530zKYl6GAX0sAWf4XIk5ML93b2n3AIW/9ovx9xyhYsIqm+73LDv
        ALWf0fVtTKWIPN21YGT/jbJACVuJeg==
X-Google-Smtp-Source: ABdhPJzsQlrpStH+x3yWHq3lRmHMXRMThNI493M7PeM1jDykHoEDdQEdA2b5dwJ+TD0E2iupysKaCQ==
X-Received: by 2002:aca:db03:: with SMTP id s3mr44537oig.48.1612911051799;
        Tue, 09 Feb 2021 14:50:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l25sm3113684otd.40.2021.02.09.14.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 14:50:50 -0800 (PST)
Received: (nullmailer pid 368704 invoked by uid 1000);
        Tue, 09 Feb 2021 22:50:49 -0000
Date:   Tue, 9 Feb 2021 16:50:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: power: renesas,apmu: Group tuples in cpus
 properties
Message-ID: <20210209225049.GA368656@robh.at.kernel.org>
References: <20210204125542.1645925-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204125542.1645925-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 04 Feb 2021 13:55:42 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "cpus" properties in device nodes for Advanced Power Management Units
> for AP-System Core (APMU) should be grouped using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/power/renesas,apmu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
