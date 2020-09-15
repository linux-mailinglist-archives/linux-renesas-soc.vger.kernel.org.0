Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89E126B29E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 00:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgIOWuw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 18:50:52 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37566 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727471AbgIOPns (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 11:43:48 -0400
Received: by mail-io1-f67.google.com with SMTP id y13so4602869iow.4;
        Tue, 15 Sep 2020 08:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sXPkOMFjvDowZOp+JaXLJvBvabu90im/rZLZEqB0yiA=;
        b=pW2+XVC7wADrTJROgV+ulnZ5RQHbFL3mxTX6kbZHddj+d75dUrWsd6xo1szfB8bLLi
         Gvmn4/KJbGieNxR+cU8kOQL88zWlOrztQ5ZkoO4DkWFt1sZFCY8f5E74OTm35sPS9llj
         t4JoyrWx0LWRJUer7KqzfqVNIAh5pVkvYzKqOREElzd0MgTRsEp5CLjXOMfO7KAKi2yb
         CRcjGDWPL6E8e5WBxFEqD5r2eJpXuGrNWLOVpNYjgbrsABx+JKezQbqsDys8Hpj9ObL9
         uOEB77ed+h8Y/6MvdwQ19WRozWAg58uEVUM+TvZb6b88hL5h0Ex/d4w0V5JUd2PkyFEx
         oanA==
X-Gm-Message-State: AOAM532RHQrx4HZDUoFZqIoLR0rSb3OiBJkVsTUgxd8bYuZHVn9FdZen
        sgm0lv/gIu0O5XVb/K79Jw==
X-Google-Smtp-Source: ABdhPJyU7CFwAPRIdQ0m2aBu1jhbH7n3KyKwoJV3oC7L4rWcRyqluCYIAE7iTJkFNbpiFDCc/2wf3A==
X-Received: by 2002:a5d:9693:: with SMTP id m19mr8877002ion.161.1600184627535;
        Tue, 15 Sep 2020 08:43:47 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r11sm9061787ilt.76.2020.09.15.08.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 08:43:46 -0700 (PDT)
Received: (nullmailer pid 2003017 invoked by uid 1000);
        Tue, 15 Sep 2020 15:43:46 -0000
Date:   Tue, 15 Sep 2020 09:43:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        geert+renesas@glider.be, robh+dt@kernel.org, magnus.damm@gmail.com
Subject: Re: [PATCH 08/14] dt-bindings: serial: renesas,scif: Document
 r8a779a0 bindings
Message-ID: <20200915154346.GA2002987@bogus>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599470390-29719-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 07 Sep 2020 18:19:44 +0900, Yoshihiro Shimoda wrote:
> R-Car V3U (R8A779A0) SoC also has the R-Car Gen3 compatible
> SCIF ports, so document the SoC specific bindings.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
