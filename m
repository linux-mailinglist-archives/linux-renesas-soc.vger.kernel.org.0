Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A3D1E8A06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 23:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgE2V3E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 May 2020 17:29:04 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39430 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727947AbgE2V3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 May 2020 17:29:04 -0400
Received: by mail-io1-f65.google.com with SMTP id c8so893145iob.6;
        Fri, 29 May 2020 14:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EkE+6//HPeALlSFIVg26ucZzI23gJBcyX6L2mQ0CHFs=;
        b=cZaSzUQZGN1emh1zU0wqcDOGdmS4sjd1QtKidYEsml1bZDRhj1ImCJMi3vflY87Nny
         ApuVW12+UAcJQG4NnCHpMrxmE06Vk3Htuq3mqnh9hX5Rj+aLRLhIc1ZJijSQiimrlx+M
         RrQomsilsUNWQdrWjMknE0RNhU9B2lBeEkmDYh6o+ixDxcU04u3XniWxQKzoO9gOc2RK
         FjFdkGSioEeD/VkFDeTKB7szlCLrdeNKWAynylJBUiMH1aj4UFlHul4qPPyhxpU6VyKp
         TluP8Sz5Qwa84UxXJkF8I6b+dr/prpse0oQUZT8WYFg/+OoYHBWdC0klbnvRnBqWNaKN
         A4kw==
X-Gm-Message-State: AOAM530wA8O3/N8ymURSKm+iaycgMKXrYAy2neOGC7MUb/kn4JsTf/9R
        oqeWbdRXPgEia9hiJ+TutJ+ZNvnK4g==
X-Google-Smtp-Source: ABdhPJy6pahK2/QoZLOirJ/eOuHSg4yWPD0tIkE0E0gvSPYs2cAWTAlQy6a6rNMU7W6RfA/dmm7/pQ==
X-Received: by 2002:a02:b88e:: with SMTP id p14mr8865236jam.36.1590787743197;
        Fri, 29 May 2020 14:29:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v14sm5258547ilm.66.2020.05.29.14.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 14:29:02 -0700 (PDT)
Received: (nullmailer pid 3002091 invoked by uid 1000);
        Fri, 29 May 2020 21:29:01 -0000
Date:   Fri, 29 May 2020 15:29:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: timer: renesas: cmt: Convert to
 json-schema
Message-ID: <20200529212901.GA3000996@bogus>
References: <20200505155127.4836-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505155127.4836-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 05, 2020 at 05:51:27PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Compare Match Timer (CMT) Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>   - Add missing "additionalProperties: false",
>   - Add Reviewed-by.
> ---
>  .../devicetree/bindings/timer/renesas,cmt.txt | 110 -----------
>  .../bindings/timer/renesas,cmt.yaml           | 182 ++++++++++++++++++
>  2 files changed, 182 insertions(+), 110 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/renesas,cmt.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,cmt.yaml

Looks like this didn't get applied yet, so I've applied it.

Rob
