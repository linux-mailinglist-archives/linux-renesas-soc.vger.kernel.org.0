Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168AA26B2B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 00:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbgIOWvt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 18:51:49 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44264 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727439AbgIOPmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 11:42:36 -0400
Received: by mail-io1-f68.google.com with SMTP id g128so4528719iof.11;
        Tue, 15 Sep 2020 08:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b2gN/1Vxx6QXOeyAQrqTUo00mXGC5F6z/gWZvfn3KiI=;
        b=H0/R9iO4OJZTuF3dvnt3SmVIRBqwigI6g/eYdJkOaQCQ7RDAIGJN2N10sh0OBjMpnf
         7TUEWFzOgmj/uICt5NPlLRddykO3eAXJhN8pc+DOMxEvY47Diqc4mcP4Z/ZU3I/5vj8R
         nOrVCoaOZNZiM2delyD8vjr0QOigHUiooheg4oNScvmidym60jbRmV4KlKNRcdByKGjY
         ARLWqrVokogAR0IZo5DH7JwjZ27Ic0DdFkSneJEO6k0c4g9NgJhfO3nvKuqmkvoYzd0O
         lqa67B6z/j2yWF0P409hMkL7vC9/37l+CAfyorL2W8zLksl3z8YGw2Uy/C4MobvvBwsv
         CCPw==
X-Gm-Message-State: AOAM530VIz+RKyA8PdHDq6CqVyEk95a4nHZgvKc8ZEfg9c7KnmjIqayL
        RrgXsgtq9YonLoOQ5i/m0//hG37PSpU+
X-Google-Smtp-Source: ABdhPJxpK6uJvf7Hkfowl+VTeoG/xrtLJqMZAFGEChdqCkFoRctMW7L1895iNr01xpQPfgKJLoDHsw==
X-Received: by 2002:a02:cdcd:: with SMTP id m13mr18669584jap.69.1600184550866;
        Tue, 15 Sep 2020 08:42:30 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id d23sm7819480ioh.22.2020.09.15.08.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 08:42:30 -0700 (PDT)
Received: (nullmailer pid 2000976 invoked by uid 1000);
        Tue, 15 Sep 2020 15:42:28 -0000
Date:   Tue, 15 Sep 2020 09:42:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH 06/14] dt-bindings: clock: renesas,cpg-mssr: Document
 r8a779a0
Message-ID: <20200915154228.GA2000922@bogus>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599470390-29719-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 07 Sep 2020 18:19:42 +0900, Yoshihiro Shimoda wrote:
> Add binding documentation for the R-Car V3U (R8A779A0) Clock Pulse
> Generator.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
