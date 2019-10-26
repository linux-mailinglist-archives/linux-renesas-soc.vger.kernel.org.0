Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32703E5782
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2019 02:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfJZAT0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 20:19:26 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43150 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfJZAT0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 20:19:26 -0400
Received: by mail-ot1-f67.google.com with SMTP id b19so892657otq.10;
        Fri, 25 Oct 2019 17:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rP2TVgM7TJak8rqWj56HIs9Gk8TmKpgszEpCk0Rsvd8=;
        b=d+7eh7cwKzAbSIJzYTZF1zgWnXPDeecHL7jyRvCW++yVkFCZuKkmtdPZXC2mX0COQZ
         sj+vMqmICdNsTrcCoHdkH3iy94LUga6a7SRbKXV3suE+okG6+FLmw1FJ/s/AOaTkIxWi
         8llyvYSAPzHATfR2sDyRZcUU+2fHc1ByY83595YmAVrGnMenHxqSIEh0xNOQEcw5QXnc
         0PoNSkbDk+RtS+0BIDODIQyccGMVUxMnzgX14T+wXS5NanwmNAtL7UrqeGGEHIDWNVS/
         kDbPhOUosqfAFSKVieuxnyujlr5drktwpmXg6RfscrL+CRVnFueThdoBuLyb6XvjX9Ae
         cUvw==
X-Gm-Message-State: APjAAAVjhcMMh2tYngsgM8718yD4FwRNCPsCgu/uQSyk9JFBJh2p0+PO
        6AiWM5zGoqAE8StOaF8l3Q==
X-Google-Smtp-Source: APXvYqwqfU7/GBmiPwwQ/BnOKaxy9p8TG5uzY6dUbAc7nUscEJgAgUBAvMUN35q8Al2UNWi3aqk0LA==
X-Received: by 2002:a05:6830:1b67:: with SMTP id d7mr4770218ote.181.1572049165901;
        Fri, 25 Oct 2019 17:19:25 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x16sm1032217oic.40.2019.10.25.17.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:19:25 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:19:24 -0500
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
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: renesas: cpg-mssr: Document
 r8a77961 support
Message-ID: <20191026001924.GA10102@bogus>
References: <20191023122941.12342-1-geert+renesas@glider.be>
 <20191023122941.12342-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023122941.12342-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Oct 2019 14:29:38 +0200, Geert Uytterhoeven wrote:
> Add DT binding documentation for the Clock Pulse Generator / Module
> Standby and Software Reset block in the Renesas R-Car M3-W+ (R8A77961)
> SoC.
> 
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by,
>   - Update R-Car M3-W references.
> ---
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt    | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
