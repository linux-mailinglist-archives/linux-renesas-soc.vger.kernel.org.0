Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF354460B71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 01:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359835AbhK2ALr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Nov 2021 19:11:47 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:41573 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236020AbhK2AJr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Nov 2021 19:09:47 -0500
Received: by mail-ot1-f44.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so23050549otl.8;
        Sun, 28 Nov 2021 16:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n7jiWdngG0UcwBrnuu/tvlBhQlnLVDui7OmnoHPGsmM=;
        b=Ck+9gQM5duJmTPPoGmgNcx5XhuwM3c/4HiNn+DlBi/pg2fKitxkOKHHJ0ZhGUvS6X7
         1lteBb5UfGdgGd4tmnDW0GB+34hrjasaC/S9RDbL35m/bhHIM+UdARgLyjjEW2fxHufv
         pPagQigOHsPJ+/dLu/9aCCVwyaWImHhv20JT8wmX6zfnkw4Fzg5ZWj5Gglq3CnxFJzKW
         QGo03suOhpFon6hSRvPwwWSXv8kNLUCAlHcot3QU5CTfP9CY4XMLW8rtkJ2yIm9guhF/
         GXYDrJfZSw3Duct7OmDlGwyaz9F2V0x/yMZm2XVyRW2R9WGdDazHQzLPteQ4zL8xapFs
         w7Yw==
X-Gm-Message-State: AOAM532AyLaZAGYt4iidGwTo6GlizVP3GW5JEhv4eGIXaB6pQR4GS3pg
        R1Fz0GhPCpPlptjPYFbvTdNkO8y/Ug==
X-Google-Smtp-Source: ABdhPJzkvENMcQWWQlz4Usn1CYNWFlCiuSOWS7qGLvWcjed7f6wR9VUEBkletP2d1rMLxyYCijt5xQ==
X-Received: by 2002:a05:6830:90f:: with SMTP id v15mr40580429ott.62.1638144389975;
        Sun, 28 Nov 2021 16:06:29 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.242])
        by smtp.gmail.com with ESMTPSA id d11sm2380439otu.36.2021.11.28.16.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:06:29 -0800 (PST)
Received: (nullmailer pid 2856615 invoked by uid 1000);
        Mon, 29 Nov 2021 00:06:26 -0000
Date:   Sun, 28 Nov 2021 18:06:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-stm32@st-md-mailman.stormreply.com,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: timer: renesas: ostm: Document
 Renesas RZ/G2L OSTM
Message-ID: <YaQZgvq0fGFXXwOv@robh.at.kernel.org>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112184413.4391-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 12 Nov 2021 18:44:11 +0000, Biju Das wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2L SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V2->v3:
>  * Added Geert's Rb tag.
> v1->v2:
>  * Use renesas,ostm instead od rzg2l-ostm
> ---
>  .../bindings/timer/renesas,ostm.yaml          | 20 ++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
