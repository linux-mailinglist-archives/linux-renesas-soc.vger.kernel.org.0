Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DAC21DA43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 17:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729703AbgGMPjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 11:39:41 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:42001 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729649AbgGMPjl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 11:39:41 -0400
Received: by mail-il1-f195.google.com with SMTP id t27so11515038ill.9;
        Mon, 13 Jul 2020 08:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/JwjaTBwdy7p5gzq/S6A6j7F6S/p1+FIjVHrB/VC0Co=;
        b=noEmCClbjzm84w/UnpT4QVHqivctIwCQfJ+WWjaHmDAqIuQ+D/7qkFJ4K0n4Hx9074
         DKEX3gqk4R4HdEdodtgewgUVm7alHsay44qhkz57MJL8SROCAArcJMSm2S0rX7WoIWc3
         pAcprzGxkFBk4QyEAeD2EBWFkXV7AoiTqD2Yvlx6Q8L8uvsJh6I3mAsqNIPxwmgMDy5p
         JEgMQPcYVdDnoPFg2vPwcQvy3n1q2jjgwuuHC7QzvmhuiplxGdlvcwp/BkYF+p2HagHF
         4Z1fwGZQyr7WN5PilhYYjYD51XWQq0gl4g+th7eJk6zxOb3JIVriK06MXK4RvLGLD8lt
         s3Ww==
X-Gm-Message-State: AOAM533G3e1KSlqoSFc+0VC9Cy3s0KaMxQvS/4z5djd/AYdA5+70kLy9
        3hztU32KCvLAgJKZ/qkvhw==
X-Google-Smtp-Source: ABdhPJzWXA9tqzl0qSfuDHyTGqByvWKyA1xxZxjggwkRVJ0xA11a4BggwBLRyuoYIvlSqC4UuDejrw==
X-Received: by 2002:a92:9892:: with SMTP id a18mr286907ill.60.1594654780640;
        Mon, 13 Jul 2020 08:39:40 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s18sm8374531ilj.63.2020.07.13.08.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:39:40 -0700 (PDT)
Received: (nullmailer pid 255705 invoked by uid 1000);
        Mon, 13 Jul 2020 15:39:39 -0000
Date:   Mon, 13 Jul 2020 09:39:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
Message-ID: <20200713153939.GA255646@bogus>
References: <20200713111844.528313-1-niklas.soderlund+renesas@ragnatech.se>
 <20200713111844.528313-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713111844.528313-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 13 Jul 2020 13:18:42 +0200, Niklas Söderlund wrote:
> As of [1] the hpd-gpios property is optional, document it as such.
> 
> 1. commit 269bd1324fbfaa52 ("[media] media: adv7604: improve usage of gpiod API")
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/i2c/adv7604.txt | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
