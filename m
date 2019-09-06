Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB477ABADE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 16:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387739AbfIFO3V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 10:29:21 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43338 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730995AbfIFO3V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 10:29:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id q17so2087691wrx.10;
        Fri, 06 Sep 2019 07:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YGke96prYO1UAwvZLN5rIrv972jsPXK5JuVL22JgdRc=;
        b=ZQtIPCkcSvhYYyznZRxGu6OhyxuoB2jD9g6Zyort96lAGuTDvG8bfp7q/De39kVa5M
         hVqyBYOMokzp8ruY6+/KEzo0/10OPG7xCpEDUd+1WjsV96KrJbb9SUGjLkmI5MMJm5la
         NUQPV9ZnOJLD0L/y1zBhqHIwrcfjY2Hc0TUwlWxhDl6aH7Ytmmd9LZYOmodz8TAfcuU+
         4czSNFJIPGE9nXp3qqNCK69P8zM8HfjoJpZmUCs8JPerDlz3dewgC3WDzLy0b0sZyPZM
         ZLoZPOEwzsOlcfrdJz+ZeubpjoUie2ensW7sboJ6zCMH43UcLcGGeJ0mWhEvHyfroNbs
         TLhA==
X-Gm-Message-State: APjAAAUlRBnsn4kPf2e7Hlcs0/hJ4jkDalM/d+4Hi3JwxfOxtAf30KC0
        7+W1J35DDwwS6cAuQwMqSA==
X-Google-Smtp-Source: APXvYqx6T47JfkMsPZsf971+jPn+q7/PDjfd3TmDy3+Ay7wsQ0UXYfoGxWLInaAiMmR7gFRbqZ92QQ==
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr6847002wrs.189.1567780159497;
        Fri, 06 Sep 2019 07:29:19 -0700 (PDT)
Received: from localhost ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id s19sm10547299wrb.14.2019.09.06.07.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 07:29:18 -0700 (PDT)
Date:   Fri, 6 Sep 2019 15:29:18 +0100
From:   Rob Herring <robh@kernel.org>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH] dt-bindings: Correct spelling in example schema
Message-ID: <20190906142918.GA10639@bogus>
References: <20190906111624.6820-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906111624.6820-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri,  6 Sep 2019 13:16:24 +0200, Simon Horman wrote:
> Correct spelling of "identifier".
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> ---
>  Documentation/devicetree/bindings/example-schema.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
