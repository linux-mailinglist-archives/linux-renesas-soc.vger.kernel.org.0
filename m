Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F123F05F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Aug 2021 16:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239152AbhHRONH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Aug 2021 10:13:07 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:41555 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239193AbhHRONA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Aug 2021 10:13:00 -0400
Received: by mail-ot1-f47.google.com with SMTP id w22-20020a056830411600b0048bcf4c6bd9so3800070ott.8;
        Wed, 18 Aug 2021 07:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O47TDvA2S+cn2NJMuVUQ8kaAwVqVE7L68+hyPUIghfE=;
        b=FoBAaUiSodBeg4PeLEO6DeEcAeFFBQsEW59KPsqJpj3biUJVyCqmNEzcboxSlEQeYa
         219yeupFUwlBT1PW/QtEKVEa6MwNUpXHASrOy70cyh0IsV7pCpqRGKWBcnYWHpSLhS1F
         7l8N2P0GTJN2ebT5swWT9JB5dvw3a+q9Dm3BQAMzYijmdOj3Pm+Dz1Dw/7t2JaA8vKj+
         sUuqTWUi5y2dhPCcBoERST59gWt7RJ5Owss7HtSg+YVIZ1UtCzN90fqhYolmcnzs0kdj
         SwVmrBRSCYwgUEY1TWo+T9qKAC4p4x7GW14JGZvRoyCVxJeQIbApo6iwhfmb3PC+pHwo
         Gv4w==
X-Gm-Message-State: AOAM531MX0UIMkahsBbQ7XmCmU/qOCYXCpPlsHM/NO68m1wqZiZr69h5
        TAq08xCaiQ+k6mF0AaEgBg==
X-Google-Smtp-Source: ABdhPJz/jW2ks+HhNdtABYE7WjGFF1jl+3l2P/COxy95GLtyqxTVjgFNgZO3a4qxWmZdA0wyYZnNUQ==
X-Received: by 2002:a9d:5603:: with SMTP id e3mr7134039oti.178.1629295945549;
        Wed, 18 Aug 2021 07:12:25 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x60sm22702ota.72.2021.08.18.07.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:24 -0700 (PDT)
Received: (nullmailer pid 2534955 invoked by uid 1000);
        Wed, 18 Aug 2021 14:12:23 -0000
Date:   Wed, 18 Aug 2021 09:12:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: renesas,sdhi: Fix dtbs-check
 warning
Message-ID: <YR0VR28YL/ErI4pC@robh.at.kernel.org>
References: <20210817090313.31858-1-biju.das.jz@bp.renesas.com>
 <20210817090313.31858-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817090313.31858-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 17 Aug 2021 10:03:12 +0100, Biju Das wrote:
> Fix dtbs-check warning pinctrl-names:0:'default' was expected
> for r8a77470-iwg23s-sbc.dts file.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
>  * Removed duplicate clock-names for sdhi-r7sxxxx SoC's
>  Ref:- https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210804161325.26996-2-biju.das.jz@bp.renesas.com/
> v3:
>  * New patch to fix the dtbs-check warnings
>  Ref:- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210804091940.23983-1-biju.das.jz@bp.renesas.com/
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 60 ++++++++++++-------
>  1 file changed, 37 insertions(+), 23 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
