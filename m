Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F0F26A9E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 18:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727735AbgIOQek (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 12:34:40 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:36820 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbgIOQed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 12:34:33 -0400
Received: by mail-il1-f193.google.com with SMTP id t12so3617855ilh.3;
        Tue, 15 Sep 2020 09:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9fIL/FgQhm9day34dQ8PFJlUZXL9ZXva0VX7sFbpBEU=;
        b=pAtheDOQqsjbbU3ScJjI2rktOqEivJ7VGheIDr15JS2qWKvOymUNgi6QxnvsmnTZh4
         NDGU/qVQctH6f2zojwMfCl3CgOJ9a+/gDYZ0+PLAkBsvRimo7PRYApj2yvnAL2DwvYOs
         xoicmyj4E/fTrZlyKCM8eKYYgmYPiwbh+mch1rdQVvj9qnvyV96GpEZCCkKxhzC0WWQY
         wan282D7WFMbIZ6r2sP+WPF+Pt8g5v7jXwgVPUvT0g1Rg1SLeadPRvJGsK5jnl4t9vDK
         K3NRhOEDsUjH+B0Z/Qva+G5ISeYluS/NlsQSi1r7hCDwaGs3ioHUgpDV0QpWpYGdtkse
         QG2A==
X-Gm-Message-State: AOAM530thi0O8Tlheos6KQFWirNp0IcJlZDPnne/O84dCMY9bK8oehp1
        pzAk3SqgpYXZIxUDAr6XHQ==
X-Google-Smtp-Source: ABdhPJysXqkcSID5sHY9Z2TFS1pKKNGsMObUCnI9Q/goE2H51xiVmt8RRYMXpiYda+hu5nEEtw51jw==
X-Received: by 2002:a05:6e02:bea:: with SMTP id d10mr16621861ilu.143.1600187650181;
        Tue, 15 Sep 2020 09:34:10 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w22sm7815516iob.32.2020.09.15.09.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:34:09 -0700 (PDT)
Received: (nullmailer pid 2081410 invoked by uid 1000);
        Tue, 15 Sep 2020 16:34:06 -0000
Date:   Tue, 15 Sep 2020 10:34:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Linux-DT <devicetree@vger.kernel.org>,
        Magnus <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        "shimoda (Renesas)" <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: display: renesas: du: Document the
 r8a77961 bindings
Message-ID: <20200915163406.GA2081354@bogus>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 08 Sep 2020 09:34:04 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Document the R-Car M3-W+ (R8A77961) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
