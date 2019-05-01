Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8B010DAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 May 2019 22:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfEAUCL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 May 2019 16:02:11 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42299 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfEAUCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 May 2019 16:02:11 -0400
Received: by mail-ot1-f67.google.com with SMTP id f23so48346otl.9;
        Wed, 01 May 2019 13:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sf6T5zaarCPnRg01Bb8+3bdzz7Kp6vp/hH5XwDud8lM=;
        b=fTU7uRp5Iww3PxY71T0aoUOJ5UPGkTXev1NH9K+uaU9JbDpsRiwF3Com1Ras1Ia2Qi
         CS6mkmHuos8ez/8qPIK3fFR8Y/HoNrSuRZIhGkGF4DiVyevauFRNsxY7/bDNUe/4ZMKP
         pSgBy6WCcjYFgDkOfspGRjkAgA3o/cqq53ZCxqUJ0E3IqwwyqSpXkAZT4YuWjWdlyHit
         fsevFh7bGz9uncUcx0l9rhQo1bI6yZHq20QreeeOkv5mTaFCuhgXRbkoH0JFCWt/PLAq
         hvBw3qnlcn13KjU9dNSuscZ7TvuzRYpNU8iPZbYECjYc85iBj9Aeuhf9IaFlVn6WK8VT
         t4gA==
X-Gm-Message-State: APjAAAXFTD1hoPsb1+WGCJUwpEz1o1TPUjrhTqfvkcQDKuhBO7JO9kWx
        NAIoaCN9hL+WriLsZk9eLA==
X-Google-Smtp-Source: APXvYqxeB1IerOkBJXeqIDNStJcKxuCBqmTOrcYySbWcplm8iOJLCQdgOy8j49v0dutk2TJlVM1C6Q==
X-Received: by 2002:a9d:6a54:: with SMTP id h20mr14661876otn.334.1556740930119;
        Wed, 01 May 2019 13:02:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u127sm3417936oif.14.2019.05.01.13.02.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 13:02:09 -0700 (PDT)
Date:   Wed, 1 May 2019 15:02:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        geert+renesas@glider.be, broonie@kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH v2 5/5] dt-bindings: pwm: renesas: tpu: Document
 R8A779{5|6|65} bindings
Message-ID: <20190501200209.GA31101@bogus>
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
 <1556155517-5054-6-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556155517-5054-6-git-send-email-cv-dong@jinso.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 25 Apr 2019 10:25:17 +0900, Cao Van Dong wrote:
> Document the R-Car H3/M3-W/M3-N (R8A779{5|6|65}) SoC in the Renesas TPU bindings.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
