Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E253E21AAF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2020 00:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgGIWw1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jul 2020 18:52:27 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36624 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgGIWw0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jul 2020 18:52:26 -0400
Received: by mail-io1-f66.google.com with SMTP id y2so4095051ioy.3;
        Thu, 09 Jul 2020 15:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6LfjAawJFtBDH4x+516uZv85LV5FkHlGr9GJK4wgdsc=;
        b=lGShhl7hMuhEmqY/MJs3ILm8BXiNuWzt18Oo6NjrxD60SSVzcqlDnmysnvxZaqTZey
         kzbuAsg1A52b2p8jRytjKHzb7RRQSkWsigKSBipJFyrNBhSDPf1llQRhBEB0KQO+PPzO
         OJ7LrtWCMMDd1lgUzP8senlE7rEgO1ngQalV3M+Z4at3qUTVeFaVLxeCYr4IPlj7aKfx
         i+Gwa7pxCJFlvMVLeZlipG4qstCMePtMUdB1qFuAb2AGUGTUmiXPAiRrPRsVRNarC2Z5
         qf1alVgd0oPn34VESv8zqqhMnlwWNPagywEn7m70AZKeoiealuaX1hfgPnHHB06i5Bqw
         3UlA==
X-Gm-Message-State: AOAM533pX8BMWP8Xs0QRqRdCLr1dTvCVGvpmiDTY4aAdQX6hdEvxG0Je
        7GavSSjj203U0u5Y+DdDSddE5aqSCA==
X-Google-Smtp-Source: ABdhPJzqId51TrJ5MSjMXnyhtyG45cZkMTMbHXKT/zLRTAVjRtl4TmYH228tsm2hY9hn3udwdQvwYQ==
X-Received: by 2002:a05:6602:2d89:: with SMTP id k9mr44309105iow.41.1594335145902;
        Thu, 09 Jul 2020 15:52:25 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id d77sm2633769ill.67.2020.07.09.15.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:52:25 -0700 (PDT)
Received: (nullmailer pid 1038901 invoked by uid 1000);
        Thu, 09 Jul 2020 22:52:24 -0000
Date:   Thu, 9 Jul 2020 16:52:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: mmc: Add full-pwr-cycle-in-suspend
 property
Message-ID: <20200709225224.GA1038850@bogus>
References: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1594123122-13156-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594123122-13156-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 07 Jul 2020 20:58:41 +0900, Yoshihiro Shimoda wrote:
> The commit 5a36d6bcdf23 ("mmc: core: Add DT-bindings for
> MMC_CAP2_FULL_PWR_CYCLE") added the "full-pwr-cycle" property which
> is possible to perform a full power cycle of the card at any time.
> 
> However, some environment (like r8a77951-salvator-xs) is possible
> to perform a full power cycle of the card in suspend via firmware
> (PSCI on arm-trusted-firmware). So, add a new property for such
> environment.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
