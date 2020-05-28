Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E987C1E6D3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2020 23:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407470AbgE1VJ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 May 2020 17:09:29 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43615 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407447AbgE1VJ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 17:09:27 -0400
Received: by mail-io1-f66.google.com with SMTP id h10so31770695iob.10;
        Thu, 28 May 2020 14:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KmIOS5+GLvB/B5GJpxQI/Z/o0HmmZcFrKSOs+Nw0Guc=;
        b=OzeXvcVa9aNFjs4H25nx+bfRAXBTD7COEjffdNjpdUzMbTwpBQb+RbU7TWMt8TE2nx
         HcdFA2v+tPce/YhcRa2+SE4JiSYqUuG9wFRWaM2hqIAX+VY4B8MJP9qzCmNByfMXfoqt
         rq3ZjwqIhmtXJCSU7IWw0k97AYUx4njCBaNeAhEBpbEC5wIamnuEUm3gmm1b0lPCzjSN
         K1+L++A25SmwELojHqWII9WtIhNLRYmVMaD7yvXcpKM/iN/9xS8hrHeUIm3ioERUXmzC
         4bwUQDaR4t8rXZ5vn5Y6ijnGwZdjNp2peRto2mGhfdl3yz8hcRP+/4xSQ0UXpZg0wl1q
         k/Uw==
X-Gm-Message-State: AOAM532WCKZJ4jWTRVhlhewIokGR0IIj8tXwv9UgDTukIVa0tuWFZWlH
        J7i3oqrjfcMW4dhekQZFbw==
X-Google-Smtp-Source: ABdhPJwgg174nsCuH+GseZ1yw5yXHdsR4u58wuHIZZnGe+eA2BMeqn5nERsGpQqZuBRBeAM1t6iL9w==
X-Received: by 2002:a5d:8045:: with SMTP id b5mr3914065ior.16.1590700166890;
        Thu, 28 May 2020 14:09:26 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s2sm3650740ilj.29.2020.05.28.14.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:09:26 -0700 (PDT)
Received: (nullmailer pid 688065 invoked by uid 1000);
        Thu, 28 May 2020 21:09:25 -0000
Date:   Thu, 28 May 2020 15:09:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsi: Add missing properties to DT bindings
Message-ID: <20200528210925.GA687765@bogus>
References: <20200519075858.27869-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519075858.27869-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 May 2020 09:58:58 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm/boot/dts/r8a7740-armadillo800eva.dt.yaml: sound@fe1f0000: '#sound-dai-cells', 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fix this by documenting the missing properties.
> Update the example to match reality.
> While at it, improve the document title, and comment the various
> compatible values with the corresponding SoC names.
> 
> Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
> Fixes: 2f52475bac7e1572 ("ASoC: fsi: switch to yaml base Documentation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> For a clean "make dtbs_check", this depends on "ARM: dts: sh73a0: Add
> missing clocks to sound node"
> (http://lore.kernel.org/r/20200519075525.24742-1-geert+renesas@glider.be).
> ---
>  .../bindings/sound/renesas,fsi.yaml           | 29 +++++++++++++++----
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 

Applied, thanks!
