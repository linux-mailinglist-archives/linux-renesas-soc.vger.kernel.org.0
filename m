Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1594126A9F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 18:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbgIOQiF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 12:38:05 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:34165 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgIOQgA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 12:36:00 -0400
Received: by mail-il1-f193.google.com with SMTP id a8so3643008ilk.1;
        Tue, 15 Sep 2020 09:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OeYVlC0q8YHDsCZ+AV00n0PZxL9YUd4roOHRH74bsdM=;
        b=rl1+N7X37DAu4446a934xnsAe4orig5pdAX3vngVm/uoZW6rbsp3vZ83Kz3t1mCOAj
         N7eS1scYER3fXW8GxRKI7nNEQ6lqu1yJwCz+4UoSf7pKehZu8ZArYqLl//hqh4AovZTe
         SYjp44wRTJpnTCas6W0lo+x4U8xQebrBvZdKDmDMG4KJYXYhcCrx0NtLkpdh/mKc081a
         +eeP232bsRwMWB7fTGjt9rFMI2F+3NmgzUJCvsxQoEL8aMhg3/h13QNkdqJtkjOwqeVk
         Q4WgD/vFLqd+iI4G27xtPllSGeCkl/5LGaKe8kprj1orOi4gPf7mtNwjvEbqbWI/zHne
         BLSQ==
X-Gm-Message-State: AOAM532EiTakkO3ntwMRqqZUsCdgjZqYwerHjzGy0Qivw4uKIySRob8j
        9+PfhaVA0hElMDq6cwd3GA==
X-Google-Smtp-Source: ABdhPJw391l1UvBEqoCZekDL6ccaND9ZxKJJty44VSqfQt0C91sMXSS6MFT0dofYVvT8JZ17PiVofA==
X-Received: by 2002:a92:cbcd:: with SMTP id s13mr11341896ilq.306.1600187759093;
        Tue, 15 Sep 2020 09:35:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o8sm6836134ill.88.2020.09.15.09.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:35:58 -0700 (PDT)
Received: (nullmailer pid 2084415 invoked by uid 1000);
        Tue, 15 Sep 2020 16:35:56 -0000
Date:   Tue, 15 Sep 2020 10:35:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "shimoda (Renesas)" <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus <magnus.damm@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Linux-DT <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2 03/10] dt-bindings: display: renesas: dw-hdmi: Add
 R8A77961 support
Message-ID: <20200915163556.GA2084385@bogus>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87k0x5rtwi.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0x5rtwi.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 08 Sep 2020 09:34:17 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds R-Car M3-W+ (R8A77961) SoC bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
