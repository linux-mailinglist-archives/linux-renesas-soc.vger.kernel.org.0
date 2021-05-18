Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DE1386F37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 03:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345814AbhERBc2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 21:32:28 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:39780 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345806AbhERBcZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 21:32:25 -0400
Received: by mail-ot1-f49.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so7263923otc.6;
        Mon, 17 May 2021 18:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/RSOoqhuiqo17cNHJeQnsn2BsYZzfIuhfVaZtk7HlAI=;
        b=Ly7t5tSgsWtYratthNhsSvj4DQjFnwHFSGOEpFe1r+YyuerVWSpLq0OG66p0YySHmp
         mIK11E/2Ypwfy7+80m7MQly2KXPIw7fDPD+zWwGsKk8MgaMDMOADQKKi8ZJ3WXzT2UfE
         7RJ3le+b0gb86IJsPfnuqcDvq8dK7Mp/G0uMmgjLODMjWEJaK1mYJLwLbtAQgEXWS2QJ
         MtIqWB5tNWOXCNWjPMEWEH/CEcyv7ptdWn318yO9G/akGN4jcNrabaBy//MNy1p7kCnP
         nSS5vBJ/wGJXq/xmLwrW/PWaju7ExxnaWnfA42Kk8/fhFzftgzDXI0kHOdn1Ok7MtVlJ
         30BA==
X-Gm-Message-State: AOAM532yIE7caM6IJul3ZEBQm8mYy0wmmgLrwxXoBlUXFyYbUFAA+AYv
        WgB+Gr7pWuMqBt1GDM/PvA==
X-Google-Smtp-Source: ABdhPJwacfhvQJoqC0TpKWr/JSpwLyySu3mZTYOCZ9M87EWupKbWKx9ECYY2CON9rXMQe0TUkOrFeQ==
X-Received: by 2002:a05:6830:903:: with SMTP id v3mr2046583ott.192.1621301467081;
        Mon, 17 May 2021 18:31:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o15sm3432988ota.61.2021.05.17.18.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:31:06 -0700 (PDT)
Received: (nullmailer pid 3606358 invoked by uid 1000);
        Tue, 18 May 2021 01:31:04 -0000
Date:   Mon, 17 May 2021 20:31:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-serial@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 01/16] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SoC
Message-ID: <20210518013104.GA3606329@robh.at.kernel.org>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514192218.13022-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 14 May 2021 20:22:03 +0100, Lad Prabhakar wrote:
> Add device tree bindings documentation for Renesas RZ/G2UL SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
