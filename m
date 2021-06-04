Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63EFF39C2F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 23:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhFDVwB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 17:52:01 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:39841 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhFDVvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 17:51:54 -0400
Received: by mail-oi1-f179.google.com with SMTP id m137so7284739oig.6;
        Fri, 04 Jun 2021 14:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wgLQBeOzeMaIGS5IGHxNLHI28uqd7HnvHSfprTG7CkA=;
        b=X7Wr106Thk6TayPFVJEkBRoXue5HgsUf+xOJ5bj4BgMVotlv9mAD/JgDWhf0rMq7ma
         hLGMBvk+Mp57CbyjeBQOSEEPFh3rnbaw3wA+Mjm4fXsTluy5KXeYvsORFTqkcZQzk6EL
         qS3VuGg3Gupsm8riNDB18EnQ5YxbOMwBadOwsRKYTBFUWzzLozXei4OmP6J1Wt1umgO6
         KnoaxhBXX6UbDEoewG1U/fhb6HsCC7o8O2W+0GYUYshrMUm5iU5FCz7uq0CKrOKWc0zH
         BaYznWp5fEKldNckKPRjIUZYVvJpbkSXPCElqde5XxyqMasjDM4Rs8pTxpbvCsgSJ0Zh
         4YHw==
X-Gm-Message-State: AOAM530dPggzRNCRDkGc2Sxq0k6jac5hMcGuvLj77NXULR3Z5/H8VwKu
        ZSmAy9my0vipySrxwYWolbwWkg7sgQ==
X-Google-Smtp-Source: ABdhPJwm9b/NL2L7UBKTh8bWpeA9lqr/DXKqnjae9A67mOWQRiiZEDe8+zpNogxtQ9u1SoRxRBxiTQ==
X-Received: by 2002:a05:6808:8e5:: with SMTP id d5mr4311418oic.145.1622843391663;
        Fri, 04 Jun 2021 14:49:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n127sm713655oif.55.2021.06.04.14.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:49:51 -0700 (PDT)
Received: (nullmailer pid 3985369 invoked by uid 1000);
        Fri, 04 Jun 2021 21:49:50 -0000
Date:   Fri, 4 Jun 2021 16:49:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Add R-Car M3-W+
 support
Message-ID: <20210604214950.GA3985316@robh.at.kernel.org>
References: <55d2c30cb14b2e10193a7fd4aa7670c70f360037.1622546880.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55d2c30cb14b2e10193a7fd4aa7670c70f360037.1622546880.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 01 Jun 2021 13:31:55 +0200, Geert Uytterhoeven wrote:
> Document support for the Interrupt Controller for External Devices
> (INT-EC) in the Renesas R-Car M3-W+ (r8a77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> No Linux driver update needed.
> 
>  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
