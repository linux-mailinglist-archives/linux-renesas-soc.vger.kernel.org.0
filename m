Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB523AA2B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 19:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbhFPR6Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 13:58:24 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:42666 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFPR6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 13:58:23 -0400
Received: by mail-io1-f45.google.com with SMTP id s26so107920ioe.9;
        Wed, 16 Jun 2021 10:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nYvLxL76EtrwdXI0zVWz5Tl99S/nj+sA3JtwYdSBysE=;
        b=X0G2edOPeea+o+BRroFp/wxpCaz3eU8U6H9+L4p8AysdUlyyDk7tDCWbcluuNY3fYZ
         UpWL+n31dOsyXu5LEG7adBZ5K3VzONz7vmK8GjHlqzrFl7VFxv8Hqd25xkOWb2o0W77A
         jWHa1qI/cq/dNH6z8BIaxvHoDzBzEHET17mN6yVNq5L48U++zJoa0rQnA2RL5oFMPvuV
         kbcqcAgGjBrrW7aat09HGdCXg0apYfsi+XA9aQfLIaL8tqapwFZjDyfUdwixlmEsKYuE
         XWUcufFRa1tbpy45tfVBuzPByU3L6nEyNb2E2lwFSeuSsCjESwPBe9mb+K+TnD+5EUq+
         4BJw==
X-Gm-Message-State: AOAM531J73EOYLoYyyhjRFOaZ4AG0Wz3a8F/M/hZhn63bGvibo6fSCB7
        WaApy08wMlwRSKAB3PgLow==
X-Google-Smtp-Source: ABdhPJyltgEIlYUFX71EJMiZprbIgqDL9NsEuMDUsQYV6zEgPdtystqBKtnWGtlUAp+PrKHYKAL/1Q==
X-Received: by 2002:a6b:3119:: with SMTP id j25mr477374ioa.64.1623866177129;
        Wed, 16 Jun 2021 10:56:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n20sm1522964ioo.23.2021.06.16.10.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:56:16 -0700 (PDT)
Received: (nullmailer pid 3615947 invoked by uid 1000);
        Wed, 16 Jun 2021 17:56:14 -0000
Date:   Wed, 16 Jun 2021 11:56:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 01/14] dt-bindings: arm: renesas: Document R-Car H3e-2G
 and M3e-2G SoCs and boards
Message-ID: <20210616175614.GA3615903@robh.at.kernel.org>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 10 Jun 2021 11:37:14 +0200, Geert Uytterhoeven wrote:
> Document the compatible values for the R-Car H3e-2G (R8A779M1) and
> M3e-2G (R8A779M3) SoCs.  These are different gradings of the R-Car H3
> ES3.0 (R8A77951) and M3-W+ (R8A77961) SoCs.
> 
> All R-Car Gen3e on-SoC devices are identical to the devices on the
> corresponding R-Car Gen3 SoCs, and thus just use the compatible values
> for the latter.  The root compatible properties do gain an additional
> value, to sort out integration issues if they ever arise.
> 
> Document the use of these SoCs on the Salvator-XS and ULCB (with and
> without Kingfisher) development boards.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/arm/renesas.yaml      | 50 +++++++++++++++----
>  1 file changed, 39 insertions(+), 11 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
