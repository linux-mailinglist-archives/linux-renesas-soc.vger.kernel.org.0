Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18612474BD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 20:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbhLNTZH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 14:25:07 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:35538 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbhLNTZG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 14:25:06 -0500
Received: by mail-ot1-f47.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso22076330otr.2;
        Tue, 14 Dec 2021 11:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ehX+3DJbXBjGHccd4UxxHLFi5H4zFHeokElr31tDsV4=;
        b=l+//42hn03lwwpD2eNeSaqPltZffOXu4zgtr1hLveVdRZ4Dk6f62fk/j6q7nPHIgpy
         unl0ni3TifHSvQBv7bwon+bFwitwt5qwrKQyuH77KMGl7f+nZMRjxzAa79ALDDExNrRd
         alxWTJLmFFC4N2Roz7cpbkp011yqRYIvZ3IpOIy6mjOJxNsJ74Ao7Wr2V0ZxO271K1V3
         IGnEkERA3s+YnPY51X3jvo4n+RGsfZIUSbhDjUcCs6tuQ3IKZ6i51QCvBQWoF4/+Rk7G
         px1Rl9dZ0xDW1YblW9l5TMSav5UG0EqjOEfDqm6/ZgXykVYIYP1YLASuaRH4Bq0EyjI2
         InjA==
X-Gm-Message-State: AOAM533WKi7/45DB873qQsxevjEbsi8L+eVsZuLUt3hLtQoJwZlNIs0r
        rALIKoQOSgnxAEkT/Bt5hQ==
X-Google-Smtp-Source: ABdhPJwu1jtseHaGInt4Zd2I+MrBQntRx58iFI0349+rwEjHZmbf1ZznDQ8wYliHroSvnVQAj6PUHQ==
X-Received: by 2002:a9d:a16:: with SMTP id 22mr5901834otg.57.1639509906121;
        Tue, 14 Dec 2021 11:25:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y17sm141839ote.48.2021.12.14.11.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 11:25:05 -0800 (PST)
Received: (nullmailer pid 3763381 invoked by uid 1000);
        Tue, 14 Dec 2021 19:25:04 -0000
Date:   Tue, 14 Dec 2021 13:25:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        tomeu.vizoso@collabora.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Message-ID: <YbjvkCChcK29D7WD@robh.at.kernel.org>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
 <20211208104026.421-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208104026.421-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 08 Dec 2021 10:40:24 +0000, Biju Das wrote:
> The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Moved optional clock-names and reset-names to SoC-specific conditional schemas.
>  * minimum number of reset for the generic GPU is set to 1.
>  * Documented number of clocks, resets, interrupts and interrupt-names in RZ/G2L
>    SoC-specific conditional schemas.
> v1->v2:
>  * Updated minItems for resets as 2
>  * Documented optional property reset-names
>  * Documented reset-names as required property for RZ/G2L SoC.
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 

Applied, thanks!
