Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB1C347D3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 17:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbhCXQCm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 12:02:42 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:42949 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236874AbhCXQCe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 12:02:34 -0400
Received: by mail-il1-f175.google.com with SMTP id l5so21833564ilv.9;
        Wed, 24 Mar 2021 09:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D6yvyivfJcXYypZn3ro/Az36lap/wQW4K39YLMR8tZ0=;
        b=PIVxXS7+bXrIe9xc/02qlkfOoLQIIHaCI86vMazQlZ6EeLNHaUj00tJWdq6OZ5l2gg
         fjv5U4q7y3zLAiAaAIXQG+E4pHLKJ7I4/SlK8JtLo0v6JH47EnHwtBPxnO9NZ7VfEAus
         K8jFOkoqy7wJDCLo3B/Lxn1yDp9IVxL+BgYPkn80YIfMhBRFJlSNOKOjrCG/t4QM/a0r
         3Fl25UH23pe13p1fad65qUBRBlZMTzx72B0Oo3JKhE6cumLRuGD0KqdvHH3tUN4N08eq
         Iqb5HUBmypM/1CYktvJ6bJbvr1atGXtiNVhheWjWTo7eJ6uYVrKpwqjMJRNDPboHhf/L
         CP7w==
X-Gm-Message-State: AOAM530IGN1RFNyZyygalsE5SH7gBzrueACpAC9bADVP4s69tz1gmQD7
        749EbKBr1Gmnggbqk3mljA==
X-Google-Smtp-Source: ABdhPJzlUq3dKD+xOunkl7LD4NdQQZpP8aezWSqFSUWvaiBKYZfPuP+nhch6KU2Rh1oZ8jGBBmse8w==
X-Received: by 2002:a05:6e02:1bc2:: with SMTP id x2mr3048045ilv.205.1616601751968;
        Wed, 24 Mar 2021 09:02:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s9sm1219614iob.33.2021.03.24.09.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:02:31 -0700 (PDT)
Received: (nullmailer pid 3153668 invoked by uid 1000);
        Wed, 24 Mar 2021 16:02:28 -0000
Date:   Wed, 24 Mar 2021 10:02:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        magnus.damm@gmail.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, yusuke.goda.sx@renesas.com
Subject: Re: [PATCH v2 1/2] dt-bindings: net: can: rcar_can: Document
 r8a77961 support
Message-ID: <20210324160228.GA3153626@robh.at.kernel.org>
References: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
 <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 12 Mar 2021 18:50:29 +0900, Yoshihiro Shimoda wrote:
> Document SoC specific bindings for R-Car M3-W+ (r8a77961) SoC.
> 
> Also as R8A7796 is now called R8A77960 so that update those
> references.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
