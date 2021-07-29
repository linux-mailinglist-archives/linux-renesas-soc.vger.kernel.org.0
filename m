Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4103DABB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jul 2021 21:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhG2TNh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Jul 2021 15:13:37 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:37427 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhG2TNg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jul 2021 15:13:36 -0400
Received: by mail-il1-f174.google.com with SMTP id f8so3715274ilr.4;
        Thu, 29 Jul 2021 12:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i3h26Kx16Zcu1mt0X0GwZ4P1P6W2hA/sItKkHmSYByU=;
        b=M5qo969n1gjasENa/rVbmb0shH0c80avg6NtL+3UoFG64PxavPZKZSTp0OYI5o4oWP
         u2ACV0gBSAq3C30Ry3wC3njJO3zTuHy9VS2LSy3xN0u4AQdLahdtvWCgraBRgK+mE8y/
         1iQIkCiGl2+Z/HJmK2I5qA2xc7UEEvqC/QdO+kzmPjE+wyA757I1SgUMwcHWyushF95K
         61+s4RNZ6NFqkq35eCC/gycBy2Tjjatj0NJ9nexcChirDRmNIeJsVF8dMFfFUuD71cqQ
         zUTfkPJzsoWa9cXXn7ZwAiAXtQ8J+8CGgpA87bbtpP1VHpQgCSWexPJi+f1dcZpHDsMk
         fe+A==
X-Gm-Message-State: AOAM533BaN08n9LldcA7sARissWj9e//SemGRhQZO3LY7jSobVE6F2RR
        jgIXZZjYU6TDlCXw/VAZOw==
X-Google-Smtp-Source: ABdhPJw/Y9xcUvYhpWN6T0Oq/RDzrHAisxvaEweS96xsGt8b+XEL6sLujl08FiBtcHBUJn5pYif7JA==
X-Received: by 2002:a92:c005:: with SMTP id q5mr4764525ild.117.1627586013001;
        Thu, 29 Jul 2021 12:13:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 20sm2074552ily.40.2021.07.29.12.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 12:13:32 -0700 (PDT)
Received: (nullmailer pid 712138 invoked by uid 1000);
        Thu, 29 Jul 2021 19:13:30 -0000
Date:   Thu, 29 Jul 2021 13:13:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 6/8] ASoC: dt-bindings: sound: renesas,rz-ssi:
 Document DMA support
Message-ID: <YQL92t6h9vQh46TF@robh.at.kernel.org>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <20210719134040.7964-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719134040.7964-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 19 Jul 2021 14:40:38 +0100, Biju Das wrote:
> Document DMA support in binding document.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  .../devicetree/bindings/sound/renesas,rz-ssi.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
