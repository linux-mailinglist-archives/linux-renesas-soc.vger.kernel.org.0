Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC2D63940
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 18:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfGIQXR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 12:23:17 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37001 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfGIQXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:23:17 -0400
Received: by mail-io1-f68.google.com with SMTP id q22so22619262iog.4;
        Tue, 09 Jul 2019 09:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NVtaE/bFEyF1Aln18UZo4R9G4iaI8CGpvVMF3heNbaY=;
        b=W0I7JhwUH+tiQNclY6auEIyTRwvKTzZpFVEOBGAc78TBpvqVDrvJsexbDFQ1xRSGsX
         Fx6QQA//lgtSboaA22SVKcxAMUxH+00h7CCUb7eTaswEg/KT/OKAp5A1wdapRy1tno01
         m1M/shXBO5anBpV4PIq1u1nX219+T9eKL5QJjvxAeLHB2LwMcqO4kBqGl98jaP89V/Nn
         JitoXQV3jYjZGZSglAHwTFoX/rtLsduRxSqdPoo7gXD59ldiXrADtC1u+FpZXAMDs/9G
         rUFqokDKWitpiP5FcnEL26ZJIRU8ys90MeR0Y0OU+jD2ScHc5ex/6TIQKTRt2oBZwprL
         MiAg==
X-Gm-Message-State: APjAAAVcNW6odGlh8rIfZjyJlkTfuQ9JiIuM+SwGbOdaCh9woHs1teCz
        CNO24bIRworpYYnVUTpADAkWPbSbqQ==
X-Google-Smtp-Source: APXvYqzZi/uC213eq0Psx7YwxWawQ6fET3AJm1wS6YS3KKLVLhcNDQI5KgfFfsIvFebKJfJmDxiUXA==
X-Received: by 2002:a02:662f:: with SMTP id k47mr28913308jac.4.1562689396582;
        Tue, 09 Jul 2019 09:23:16 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y17sm24703321ioa.40.2019.07.09.09.23.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:23:15 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:23:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a7792
Message-ID: <20190709162315.GA9309@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076219472.4736.14727682068388338615.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076219472.4736.14727682068388338615.sendpatchset@octo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Jun 2019 18:03:14 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen2 V2H (r8a7792) SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0004/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:35:10.526874153 +0900
> @@ -35,6 +35,8 @@ Required Properties:
>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
>      - "renesas,r8a7791-cmt1" for the 48-bit CMT1 device included in r8a7791.
> +    - "renesas,r8a7792-cmt0" for the 32-bit CMT0 device included in r8a7792.
> +    - "renesas,r8a7792-cmt1" for the 48-bit CMT1 device included in r8a7792.
>      - "renesas,r8a7793-cmt0" for the 32-bit CMT0 device included in r8a7793.
>      - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
