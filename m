Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBDF3B386A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 23:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhFXVQO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 17:16:14 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:34497 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbhFXVQN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 17:16:13 -0400
Received: by mail-il1-f182.google.com with SMTP id s19so7775390ilj.1;
        Thu, 24 Jun 2021 14:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=47hUBuaqzfJJncm6RtEipODGGyZplZhj4icIYj/zpRs=;
        b=gjOdURXYCoOytvAT38Bv/PhoQ7AQNnRoJx436mOPFhfvzNTMwIqovZlL+6opfR4zT5
         afGTx6PwbTIxj8NtRArzoFne3/TkVp0le6iXGUEGNndq2Wqpj1QD5t863m/hgo49As6i
         ljnjJfikmMY6VHZNtMj/ttBSfPA9WB0AInX5DFKDVSDJMp9nHzAJy4nMnpbmqzDWm38J
         Jc7KvHfXNW9rwYGRK+AebYaYK0WbbMnZQ5jvPTW1gOaNphRCc0Y09eFWwsJAizOce9Xb
         KvdBZfEV/VtEnRyVh94moSsVRbOS3GqWo+dJ8/VDSl9eg6xxpIAsMsorJ9fYf6aiCNIC
         Ldaw==
X-Gm-Message-State: AOAM53229kVi4pzqFQF40mva1LJPp7p6Ivqs9Sry55GdM1jJmbG+hbGF
        DOifqZT0u/dC/GJ7NuesVg==
X-Google-Smtp-Source: ABdhPJzXf/oo5u3B5EKv4LYB8gPOkFme6FZjtb+ncnezHDcwNH7+HV0lE+tkL+Dii4TAQiGhxLJC7A==
X-Received: by 2002:a92:6509:: with SMTP id z9mr5007087ilb.184.1624569232997;
        Thu, 24 Jun 2021 14:13:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r8sm2398602iln.35.2021.06.24.14.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:13:52 -0700 (PDT)
Received: (nullmailer pid 1996913 invoked by uid 1000);
        Thu, 24 Jun 2021 21:13:48 -0000
Date:   Thu, 24 Jun 2021 15:13:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org,
        Gilad Ben-Yossef <gilad@benyossef.com>
Subject: Re: [PATCH] dt-bindings: crypto: ccree: Convert to json-schema
Message-ID: <20210624211348.GA1991366@robh.at.kernel.org>
References: <ab361a862755e281f5fef67b3f678d66ae201781.1623413974.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab361a862755e281f5fef67b3f678d66ae201781.1623413974.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 11 Jun 2021 14:20:17 +0200, Geert Uytterhoeven wrote:
> Convert the Arm TrustZone CryptoCell cryptographic engine Device Tree
> binding documentation to json-schema.
> 
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/crypto/arm,cryptocell.yaml       | 53 +++++++++++++++++++
>  .../bindings/crypto/arm-cryptocell.txt        | 25 ---------
>  2 files changed, 53 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/crypto/arm,cryptocell.yaml
>  delete mode 100644 Documentation/devicetree/bindings/crypto/arm-cryptocell.txt
> 

I'm applying this version which is dual licensed as that is the 
preference of my employeer, Arm, who is the copyright holder here. I'll 
sort this out internally with Gilad.

Besides, for the bulk of the new file Geert is the copyright holder.

Rob
