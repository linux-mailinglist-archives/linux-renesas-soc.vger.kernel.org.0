Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26E3EE5786
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2019 02:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfJZAUQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 20:20:16 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33145 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfJZAUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 20:20:16 -0400
Received: by mail-oi1-f195.google.com with SMTP id a15so2773919oic.0;
        Fri, 25 Oct 2019 17:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h/J2B0yYUN6lQ3+j00TFPx6nzTJjHyfDdiEZjRSCAiU=;
        b=oN7z+OPysaAJRY3PQ+YhLMkIqgx9Xrl3kxNRSFOjrsYPQpn1ME7+1gKqRHRMKUG4vQ
         7t7uSWq8J8qIi0KRsnds/1GFgtZ9YQaI9lWgsrtxDHT8A0nmFgXdRiredNIWRsh7xuwE
         c/JVRUAf1AuSphYaAV0AMwS1YBp8LdkRKH7bpszn0WIvjUjqAlS7pNLkpqR5giQwi9rs
         gS11vKYHw1owf69DHUfeebH0n1c5qau7cAvbC79V/ZqMjze1Ys5xjhBAPhJBJNmM89tK
         5lTW8MfVrgCOK3I//JBKJkTSY7oWxxXDkvQE9rOOT9pfuoFnISMz8dibiQ8sbf8Et0gT
         l29A==
X-Gm-Message-State: APjAAAWOuIlmw8jSf8wTkuHrIjnFbiPDBR9p2lQVN1+WW2a6GOfmHG7r
        gf8iodoYZPdkqxu00rcO2w==
X-Google-Smtp-Source: APXvYqykZgHOYWE2/IgupIMeUG1s5/ApoBdLr8/q2JSP4zWGsxaK/+y42vogYbYJSsUjExGJWvAz+g==
X-Received: by 2002:aca:3846:: with SMTP id f67mr5267965oia.71.1572049215495;
        Fri, 25 Oct 2019 17:20:15 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t30sm1285564otj.40.2019.10.25.17.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:20:14 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:20:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Add r8a77961 CPG Core Clock
 Definitions
Message-ID: <20191026002014.GA11459@bogus>
References: <20191023122941.12342-1-geert+renesas@glider.be>
 <20191023122941.12342-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023122941.12342-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Oct 2019 14:29:39 +0200, Geert Uytterhoeven wrote:
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas R-Car
> M3-W+ (R8A77961) SoC, as listed in Table 8.2b ("List of Clocks [R-Car
> M3-W/R-Car M3-W+]") of the R-Car Series, 3rd Generation Hardware User's
> Manual (Rev. 2.00, Jul. 31, 2019).  A gap is added for CSIREF, to
> preserve compatibility with the definitions for R-Car M3-W (R8A77960).
> 
> Note that internal CPG clocks (S0, S1, S2, S3, SDSRC, SSPSRC, and POST2)
> are not included, as they are used as internal clock sources only, and
> never referenced from DT.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  include/dt-bindings/clock/r8a77961-cpg-mssr.h | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r8a77961-cpg-mssr.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
