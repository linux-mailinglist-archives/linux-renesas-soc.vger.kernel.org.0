Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CDB361051
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 18:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbhDOQlU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 12:41:20 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:38427 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhDOQlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 12:41:20 -0400
Received: by mail-oi1-f172.google.com with SMTP id b3so10110083oie.5;
        Thu, 15 Apr 2021 09:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dh6Hzw7XfX4iLLFMGRwMXFpZg5W5zi3GUatMnRfdmGo=;
        b=H8qeILvt4WEqK1cVbLaHeo62aX8raTuXIElg5nLJ9xMhE7odoJzkQ0HvfC8qO06cZx
         hzodZfjx+/fWvtV8qiWe71zrzUFuM1azUUGMOoEWj+vo5HaS6/mvBx6/Y0Rn3h6cQ43K
         TwN7Di4xp6otUjnfIk8VFSRQli/kCJa+vQDtf3e9vtoABQED+nZr0UQcF4nKwURqJ0yd
         V2mbsd1Ju2qMHQqjAqjQ7gJdHvFouT4u6Jmw6J/LgLnd7gNZpUT2SZOD9isNDAIkQer+
         MtDBo+DnSUZxrR383QDgr0bWeXnVVEGXFI8VEI97rJuIj1m9KMmWf+APvTKY6pmrkzAe
         1UDw==
X-Gm-Message-State: AOAM530R0VN4tSko2ntAi73PYyFkGLBO6cqWNC3DDGaPU7nXoR/9P3j4
        qmOfvMl+3ibBW1w3fwa5mA==
X-Google-Smtp-Source: ABdhPJwEEiOfqXSA5esTahIR3xyzY2Ca6n6fKJOW78QLHWNBkvIBfQBdgCCjx6ir3UpFh2z9yQTdiA==
X-Received: by 2002:aca:4188:: with SMTP id o130mr3171382oia.101.1618504856991;
        Thu, 15 Apr 2021 09:40:56 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b12sm730303oti.17.2021.04.15.09.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 09:40:56 -0700 (PDT)
Received: (nullmailer pid 1535706 invoked by uid 1000);
        Thu, 15 Apr 2021 16:40:55 -0000
Date:   Thu, 15 Apr 2021 11:40:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: media: max9286: Re-indent example
Message-ID: <20210415164055.GA1535655@robh.at.kernel.org>
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
 <20210415122602.87697-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415122602.87697-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 15 Apr 2021 14:25:56 +0200, Jacopo Mondi wrote:
> The dt-bindings examples are usually indented with 4 spaces.
> 
> The maxim,max9286 schema has the example indented with only
> 2 spaces, re-indent it.
> 
> Cosmetic change only.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 214 +++++++++---------
>  1 file changed, 107 insertions(+), 107 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
