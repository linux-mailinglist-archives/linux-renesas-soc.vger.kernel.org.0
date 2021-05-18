Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C39386F53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 03:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240086AbhERBgq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 21:36:46 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:39506 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237906AbhERBgo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 21:36:44 -0400
Received: by mail-oi1-f174.google.com with SMTP id u144so8268835oie.6;
        Mon, 17 May 2021 18:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VGgaq8sxzV5Z0Cyf8cixNsXkZFldfJAgJaVO7anjs0I=;
        b=atTq35pd5lks8Ou4UZHcM9CEvR2XCLSQiefRlV9nYvBb6VxdeJiKAs7sWwlRNIzX6K
         yIYRwU2uYwrv89oNZ15cmtzpqgNNT35Iawgax1m4MsY1u7VezPFojWIRg28k/lXomzKE
         E4bn+g5DnfMzyEUv2R9KxHhRm32oF8p82Ve+6FC2hrQ84EPDN4zi3iWUiq9uZLZqdieT
         hZm5A4fvqR6cPtaI88jzqq8j0LmRKzwSTcRoCwUNkp9/TBlGZ/FBQarXNLSUthA3DJEG
         /4J/p427qyUFdrExOvGDKP3/M8KEHRQxS97MbOMC7DaMZOC4ZLYrskLP0jyhTh1cwW49
         sUmQ==
X-Gm-Message-State: AOAM530LQV2f3LXQjdDSZtA45G/IV1RojKFQyyn7TGXgMIqg8u0uNbt/
        Q07fZLTfYdXFPiZ+TkCoqw==
X-Google-Smtp-Source: ABdhPJya9Y4SRa1Fn77642V/enKXyaUyQQTrgvr7YnwofvldG3kbtewceiS3KXCuixLz1By+FneDIw==
X-Received: by 2002:aca:f40a:: with SMTP id s10mr1509591oih.122.1621301726383;
        Mon, 17 May 2021 18:35:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 7sm3501087oti.30.2021.05.17.18.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:35:25 -0700 (PDT)
Received: (nullmailer pid 3613528 invoked by uid 1000);
        Tue, 18 May 2021 01:35:24 -0000
Date:   Mon, 17 May 2021 20:35:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Will Deacon <will@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 11/16] dt-bindings: clock: renesas: Document RZ/G2L SoC
 CPG driver
Message-ID: <20210518013524.GA3613453@robh.at.kernel.org>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514192218.13022-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 14 May 2021 20:22:13 +0100, Lad Prabhakar wrote:
> Document the device tree bindings of the Renesas RZ/G2L SoC clock
> driver in Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,rzg2l-cpg.yaml     | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
