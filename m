Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D97319E857
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Apr 2020 03:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDEBqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Apr 2020 21:46:40 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34464 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgDEBqk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Apr 2020 21:46:40 -0400
Received: by mail-io1-f68.google.com with SMTP id f3so1899894ioj.1;
        Sat, 04 Apr 2020 18:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B3Lho6K97w9WRhTNkYjAbrrHD3p1YY43+L3EXIQ/pEE=;
        b=F81WVMCKBuijZFO/ScW2BKNTC+jK9wI79V/80xF9zUqEOgslVfMlw/xcGaFUaR2US+
         O4GoLpTy7QpdSYB58l8tHOXQaDR2V/tmrjlpsGjGZC/UujqxnITsrXq8GDP7zlsNXWoC
         Ta12/InJ/c2HqpR7oqxpwARZDEyZO1J1bKyNhITX/0068PG62vtyJPJi0BNTE+iodf6q
         WCmwAe/xuVTjl7zm+eo8OqJ0fkoawYE1O7fMD7kmQETo0p8xM1LVZBfyUClTFssXmDJO
         QBZ5cQWTqC/b0YIJZV/K7ypUxEQL+ebEBM1iBli8O2VlMp3wmloRBc1tiLWA4Iz15wIr
         a5xw==
X-Gm-Message-State: AGi0PuZTcbNpwtVkVOCOoD9nnQqVJcxKB7sSjyX22bOnR4u3p0V3GhSq
        37L5KQcd2QB9VbWNj1jOYw==
X-Google-Smtp-Source: APiQypLelG1J8HkSU6o07wdDIyBKJ1mnyMJZg5hNJDP5+FYrwJNR0cE329KQNjmyIDhH876b4/xqBA==
X-Received: by 2002:a02:69d4:: with SMTP id e203mr3336713jac.12.1586051198975;
        Sat, 04 Apr 2020 18:46:38 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id z17sm4470359iln.34.2020.04.04.18.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 18:46:38 -0700 (PDT)
Received: (nullmailer pid 11327 invoked by uid 1000);
        Sun, 05 Apr 2020 01:46:36 -0000
Date:   Sat, 4 Apr 2020 19:46:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: phy: renesas: usb3-phy: add r8a77961
 support
Message-ID: <20200405014636.GA11271@bogus>
References: <1585301636-24399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585301636-24399-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585301636-24399-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 27 Mar 2020 18:33:56 +0900, Yoshihiro Shimoda wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
