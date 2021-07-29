Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3DB3DABA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jul 2021 21:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhG2TL7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Jul 2021 15:11:59 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:37739 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhG2TL7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jul 2021 15:11:59 -0400
Received: by mail-io1-f51.google.com with SMTP id r18so8535790iot.4;
        Thu, 29 Jul 2021 12:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NaSqg5Dy6NR+5wzG2UYaFke/OgRx15sowMjM1gKRcW0=;
        b=n5ys6S0Eq4P5Uh0MXePR/y6RDZHAQxxdXc7NFVf2RueSmtweliv/kkxUDbWsVhAFV0
         aRcdmn7HSoIGYATelvv3AaBrB5mmB6dDfLJ/cz5kQl2RRXFJBcvaZShCo602JA7ozZdo
         gGCRHvYILIf9wfecXoY2Cr9kXd6Dy3czfbvh7aWS4bvuF10r2LFdcCgIjrMCNmyKs5le
         w9PFrjq8ijR1pABpovjJDkihOZ8kkpg8qhOFgqkeQ8RUJTwn8N1YzwiQIkkuBt4aBPmB
         CroMxYjRrn9cQTNoK6pKgYGYrRI5GwZ4dyH6U15FygaxbgTHasklDIWfhzdPoL5K+2G6
         uuJg==
X-Gm-Message-State: AOAM532Z2zbzbmspne//w2ukj8JFW7jj8HZaIiLIo/0qnDrLHUhm8Yb0
        xAeEQwtFkZqWYoqHtAVPoQ==
X-Google-Smtp-Source: ABdhPJyS1smTfMN39+3tatPcWeX5erHamYok3e4tmVqMDZMGCmohcJ5juqEvp15cA9k9S70+JXdRcg==
X-Received: by 2002:a6b:b795:: with SMTP id h143mr5320080iof.74.1627585915681;
        Thu, 29 Jul 2021 12:11:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 204sm2909507ioc.50.2021.07.29.12.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 12:11:54 -0700 (PDT)
Received: (nullmailer pid 709564 invoked by uid 1000);
        Thu, 29 Jul 2021 19:11:53 -0000
Date:   Thu, 29 Jul 2021 13:11:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/8] ASoC: dt-bindings: Document RZ/G2L bindings
Message-ID: <YQL9eSVUzVxVUi7o@robh.at.kernel.org>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 19, 2021 at 02:40:33PM +0100, Biju Das wrote:
> Document RZ/G2L ASoC serial sound interface bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Rebased to latest mainline rc branch.
> ---
>  .../bindings/sound/renesas,rz-ssi.yaml        | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
