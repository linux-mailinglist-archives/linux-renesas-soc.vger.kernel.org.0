Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC57375C5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 May 2021 22:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhEFUrR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 May 2021 16:47:17 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:43840 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhEFUrR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 May 2021 16:47:17 -0400
Received: by mail-oi1-f172.google.com with SMTP id j75so6710777oih.10;
        Thu, 06 May 2021 13:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wGt8tyTp4M+r4tWPL3VYzKD1J3oiI5zixX3YnayK2xs=;
        b=hIUuJMb+G44xMdV6WBl3ec24LDWUQu/t+Yr/ohM6AMGNcnLy6T5vVtyKw7wYJ6IWgk
         nRN9qKaeWpxDBrXZxUa4/7lnssrwVCzxQuadpXVzEeeo5dGH5pxlM7CJjkmBxvp4icKT
         D6bzMyZAOJX6PETMxu2tMquzN5laaEJ2W9LoTD3+UUxuFHBvdltk5fNfFa0vLxP8w8W7
         wKyIg/z3klrIAKoslBsaVwVRgxSYaDkGPvKdjvkCr+idbpxQ5nhkM5KjlfSu57kSO6uX
         8T8iwxbRkQc0ldZft4StQsxDHccyOO4tEa5O5oWlA9xH/4oF/3bzneL1LQvYIGELP7lH
         4LCQ==
X-Gm-Message-State: AOAM533x7Oeoz+B0ZBswp3AvyePp6HDtD3Gni2IxGS975Rj8ppbqhBN7
        ypt2cEBNQ4qfqDAN4v7qJQ==
X-Google-Smtp-Source: ABdhPJwdQEF8FEpa5ME6ebYRobaAaVqLPN6R/ZmYQHEhUAGQfMuknpCs3U0jrnI7kDQRh0HK1t29aA==
X-Received: by 2002:a54:4701:: with SMTP id k1mr12187234oik.154.1620333977145;
        Thu, 06 May 2021 13:46:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t74sm609690oie.51.2021.05.06.13.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:46:16 -0700 (PDT)
Received: (nullmailer pid 773618 invoked by uid 1000);
        Thu, 06 May 2021 20:46:15 -0000
Date:   Thu, 6 May 2021 15:46:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] dt-bindings: clk: emev2: Convert to json-schema
Message-ID: <20210506204615.GA773568@robh.at.kernel.org>
References: <526e1a412145a0fcc5a43dcf6de5c580301017cb.1620119350.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <526e1a412145a0fcc5a43dcf6de5c580301017cb.1620119350.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 04 May 2021 11:10:20 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas EMMA Mobile EV2 System Management Unit (SMU) Device
> Tree binding documentation to json-schema.
> 
> Drop the separate provider examples, as they mostly duplicate the global
> example.  Drop the consumer example, as it doesn't belong here.
> Update the global example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a very old common clock binding, describing all clocks in detail
> in DT, grouped under a "clocks" node.
> ---
>  .../bindings/clock/renesas,emev2-smu.txt      |  98 ------------
>  .../bindings/clock/renesas,emev2-smu.yaml     | 140 ++++++++++++++++++
>  2 files changed, 140 insertions(+), 98 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,emev2-smu.yaml
> 

Applied, thanks!
