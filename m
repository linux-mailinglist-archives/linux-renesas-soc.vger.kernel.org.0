Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B51375C58
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 May 2021 22:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhEFUpp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 May 2021 16:45:45 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:46904 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhEFUpp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 May 2021 16:45:45 -0400
Received: by mail-ot1-f41.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso6054853otb.13;
        Thu, 06 May 2021 13:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yEgXRVHgBfCSp3TydSUffdkAuZnYxGWkRYFmYYdX1Ac=;
        b=GaOCZnSo/Z1x7ccnx41C0uZCXypHE9Dh17Ao2liasT4V0ZfTvrO2n46xW6lspZiq31
         ixGWUHgA7omcLb5htNteZDy8L434vV0b80+YT/04Dvn43ESNH+ya+C1LbuS155RujZLU
         Qre0+PJDmtz5EtdaenBadV0yFkZLtMzEsflHyTcPn0SzLUhRgXTUbwgGjXE9ZWY0TrcJ
         ixzGQpHjGlmhbCKhKJvQbnKXPnZ8HHjFNbywcEGeCU1F0zUKx0hDo6ewawBAI1OzSIA3
         JU6QqzdXfkw2WsFvob6vB5A4/PN9wAE5/Ttd1SlUezXm7KbKm+E2nnnZouhUs4xER2p+
         Ra3Q==
X-Gm-Message-State: AOAM530jPq2u231NMITbxmBcLBc+Pe3ZNmSTsmePERJp+ptWG8vyBhod
        5S95Cbz1a8fxcting5VkKBDb/6HoRQ==
X-Google-Smtp-Source: ABdhPJyHZhKBO5buLzfc5n7iiB6PyyPcjQDWTM4bVCXASwmjMDsdzTHNOxIjcJgLrNQCXmyR12fesA==
X-Received: by 2002:a9d:7997:: with SMTP id h23mr5360295otm.366.1620333886104;
        Thu, 06 May 2021 13:44:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t5sm238759otm.33.2021.05.06.13.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:44:45 -0700 (PDT)
Received: (nullmailer pid 771472 invoked by uid 1000);
        Thu, 06 May 2021 20:44:44 -0000
Date:   Thu, 6 May 2021 15:44:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: power: sysc-rmobile: Convert to
 json-schema
Message-ID: <20210506204444.GA771402@robh.at.kernel.org>
References: <22150cfd2ef9d57e84eb53a5dfed8379627a9423.1620119210.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22150cfd2ef9d57e84eb53a5dfed8379627a9423.1620119210.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 04 May 2021 11:09:00 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Mobile System Controller (SYSC) Device Tree
> binding documentation to json-schema.
> 
> Document missing properties.
> Drop consumer example, as it does not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop double quotes in $id and $schema,
>   - Drop patternProperties and regex,
>   - Move pm-domains to properties,
>   - Add $defs with pd-node description to fix nested domains,
>   - Make pm-domains required.
> ---
>  .../bindings/power/renesas,sysc-rmobile.txt   | 100 ---------------
>  .../bindings/power/renesas,sysc-rmobile.yaml  | 121 ++++++++++++++++++
>  2 files changed, 121 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/renesas,sysc-rmobile.txt
>  create mode 100644 Documentation/devicetree/bindings/power/renesas,sysc-rmobile.yaml
> 

Applied, thanks!
