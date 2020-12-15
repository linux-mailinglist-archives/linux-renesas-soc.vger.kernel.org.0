Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9FA2DB228
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 18:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbgLOREX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 12:04:23 -0500
Received: from mail-oo1-f66.google.com ([209.85.161.66]:44977 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730417AbgLOREO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 12:04:14 -0500
Received: by mail-oo1-f66.google.com with SMTP id j21so2409471oou.11;
        Tue, 15 Dec 2020 09:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LHHnJbfWRsxCkMindlQnA60rHC0CM7R7+/IevT1e9Fs=;
        b=OmPWLtEKO8+1orZS/eJAUdpUQurXY5eYp2JU32SbUxIql7sPeXWsRke9n7ETDtlkHH
         lVctsFokcqq0N+0Ke8oFQN/ghXb17EbFNqsIGtFDeXRAdun+DjapP/nOzcRhtIUneRnv
         hU/yQ8vJhR16fRhc0Y21jR7JqGjFKJgwXIrfNgnE3OvaQxaLzezgRFbnewbfCGcGHcag
         CjEEfk+sfGSVIDnMIlB13VHSBWt2UM2sWXMpNcBORqpzsjwzL5Qt3hHSEfhFWdgs01tL
         r+X5iQSTAzYGSRaqlLK2yrx9miCZhIBgaR7GvaFydTby1eJeaPtyUk+gBzrdfOvh51yn
         +eow==
X-Gm-Message-State: AOAM5311x3QhKJhuPFFXjUDECH043Qm8JQHOTgWFg4J/kWF4ikJn6AqW
        hi8iYnP9Yh4an4XHdLvVxQ==
X-Google-Smtp-Source: ABdhPJy/K+C5cX3obHlSCBO8CB8CecuwnUzz3mHP9fiLzSTcWoOOJCpuk3OVy9Bg1Ejhqkd8t/8mEA==
X-Received: by 2002:a4a:d503:: with SMTP id m3mr7477401oos.62.1608051812956;
        Tue, 15 Dec 2020 09:03:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v3sm532478oth.80.2020.12.15.09.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 09:03:32 -0800 (PST)
Received: (nullmailer pid 4029304 invoked by uid 1000);
        Tue, 15 Dec 2020 17:03:30 -0000
Date:   Tue, 15 Dec 2020 11:03:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        aford@beaconembedded.com
Subject: Re: [PATCH 16/18] dt-bindings: arm: renesas: Add Beacon RZ/G2N and
 RZ/G2H boards
Message-ID: <20201215170330.GA4029274@robh.at.kernel.org>
References: <20201213183759.223246-1-aford173@gmail.com>
 <20201213183759.223246-17-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201213183759.223246-17-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 13 Dec 2020 12:37:56 -0600, Adam Ford wrote:
> Add beacon,beacon-rzg2n and beacon,beacon-rzg2h to the bindings
> list.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
