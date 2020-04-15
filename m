Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163461AACD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 18:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410137AbgDOQDb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 12:03:31 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43804 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410124AbgDOQDa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 12:03:30 -0400
Received: by mail-ot1-f66.google.com with SMTP id g14so376515otg.10;
        Wed, 15 Apr 2020 09:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c6iYkSq4Slgi0NcaSVF5Eyh9NovqIO1r52po8b+3Xik=;
        b=gHqtjVkQ5RdmSYJ348TWfPA9em4wlFMFBIc7ZcVWwYEfPHUQmVcXlvBrkHuLQ/D9P7
         yADXGCi+BSfU/PeM0xVhgKZHmXQ+FTnQbt79ZqxqCzdMuYotKnzVY3dpSfZgfG89OXR8
         PD8f7HEAj3+Ku5L1xNFGfyOct9JbZL0BhiEKrAHxiIZSS14xkwl5SFwiCO/tMMZAvgoO
         7MlyApOpkPDsmFjo5R8aubnf/oJ8EEqYqPi6MMcRBCshv4VKph20U4MQtp4doETORGv5
         Mu4MvvWgvCZN9WBcMhYaLjXkqv3x9fJQPsr3edS/nyWdezpYKzIo0t3VhMnh6sLCXONP
         QCqw==
X-Gm-Message-State: AGi0PuY4U43Owi9aWA3YsWYe5RhTlGxS3v0JHvKwY5MC+Ai1fs9gyC5a
        YnUVpirxXC097RGKHzrx6yLlaK+Hyw==
X-Google-Smtp-Source: APiQypKaYFYJHZs0enq6gbxnLGIGugO6HL5erdsv69j55UR9Ev3B+NMON3be276KBJklwJCQQETZKQ==
X-Received: by 2002:a9d:7f0f:: with SMTP id j15mr10087920otq.109.1586966608799;
        Wed, 15 Apr 2020 09:03:28 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c81sm6208036oib.35.2020.04.15.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:03:27 -0700 (PDT)
Received: (nullmailer pid 4297 invoked by uid 1000);
        Wed, 15 Apr 2020 16:03:27 -0000
Date:   Wed, 15 Apr 2020 11:03:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: Convert to json-schema
Message-ID: <20200415160327.GA4237@bogus>
References: <20200408091451.25845-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408091451.25845-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed,  8 Apr 2020 11:14:51 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Mobile/R-Car Timer Unit (TMU) Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/timer/renesas,tmu.txt | 49 ----------
>  .../bindings/timer/renesas,tmu.yaml           | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/renesas,tmu.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
