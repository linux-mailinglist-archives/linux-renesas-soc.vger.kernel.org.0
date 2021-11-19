Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02D445742F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 17:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236012AbhKSQ5e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 11:57:34 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:43941 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235718AbhKSQ5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 11:57:34 -0500
Received: by mail-oi1-f178.google.com with SMTP id o4so22877000oia.10;
        Fri, 19 Nov 2021 08:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dpil0WQAiM0KLIjHgqrrx0xNvdpK721S5oR0ahyldlA=;
        b=5MCe2uQkIincUK5rOiLG4XX/kqi8CLEadDb4x7ubDStZQz2Kxhf5vgtOVNEJ/CmR9K
         bajSAVbsikz9hBCXCSXmedpuaNH8H8MpDx8CQPRfQucCA0zYAL3tXDzkmh6iTWcTtrqe
         92hUk7+GTXhqHExTgAMCW5xEzP60R1l/DcZHwi2nAHoeEPfxFpoIKV0ausqkrg03u0W6
         QaVj0nbY3MBDtfvQIPAsjZHSJT8/g+geXVQZzZU3K/DN+ErLeKxp+V/yFT0WrZPI/M8b
         hXhRyYsOEtDX4wir2H3wqEFBWkxaLF05Yj30ivkL2b9Ru2YCQd8oSs/7+yEhbhtluy3G
         VptA==
X-Gm-Message-State: AOAM532odGy09r/U1bOl27TjLlwOdutUtqtAlkneByonm6oqMk9jxTG+
        9VvSjMjLnf8FsQME5ub4cg==
X-Google-Smtp-Source: ABdhPJwALY+8FTU2ujmpgV6UCZDd1p24i+QI2OOr62sxlSHxWVBu57DThhHCtNC+BbWHjwSsC6J5uQ==
X-Received: by 2002:aca:110e:: with SMTP id 14mr1080576oir.100.1637340872102;
        Fri, 19 Nov 2021 08:54:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b26sm64201oti.56.2021.11.19.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:54:31 -0800 (PST)
Received: (nullmailer pid 4025438 invoked by uid 1000);
        Fri, 19 Nov 2021 16:54:30 -0000
Date:   Fri, 19 Nov 2021 10:54:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: serial: renesas,scif: Make resets as
 a required property
Message-ID: <YZfWxvUNiFbggQjI@robh.at.kernel.org>
References: <20211110232920.19198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211110232920.19198-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110232920.19198-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 10 Nov 2021 23:29:18 +0000, Lad Prabhakar wrote:
> Make "resets" as required property for RZ/G2L. On RZ/G2L the devices
> should be explicitly pulled out of reset for this reason make "resets"
> as required property.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3
> * No Change
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
