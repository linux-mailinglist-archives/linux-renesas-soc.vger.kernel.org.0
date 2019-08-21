Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B71489740B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 09:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfHUH4Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 03:56:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34909 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbfHUH4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 03:56:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id l14so1258612lje.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 00:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QOA27fQvmt0ItpWVuER8Cd/2ccQ264UvV5OBM8TClfA=;
        b=r4qTCJNK5SJ8ogQ4WghaMDrAuodPTaNyFs7N2SEfsWO/khHUCoesuERqXfXhBfYQre
         BZhSDXDue9g8DqYmEQmgzJrqG0toR/vo6n3qqMg+v0Nfmf1+LEusn9bfeAkSAi/JWlCh
         D7dlKbNfUNJHct1B5cq9EKFO5qPTk1j4vsDUQIz4LmdlBrZiyxkESssVjfdZmlSL10+U
         8RNqPqaHiRExoljUbJDthvobAspkeISAe1+PTSNJKl+SZZpwF49JQ5uB1Cj7st7tDVb7
         nCJWGi2eK25KX46F+acDZZkzHQEzEUmFLwNXV2+Lz2F1fKWjbsNTztybhtF0FLzI9Wf6
         4fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QOA27fQvmt0ItpWVuER8Cd/2ccQ264UvV5OBM8TClfA=;
        b=STMGRoQAoLwmH5h2B3p5gPOc2RebvAdmLmQNYHRZrmppjhoPrOsMv+8nist6PVat3E
         glUtkOGMLqlbu2BaESQLWd5VDx4skwTLYrOZkiEZjOXDFMKjN0WOaeHk+0aVVGvH8CB5
         vqwU9oGHW0Uu5b81UGTYpZZQe+tKmfWPdxpPhUPQ4+jXCaB7c/gVkKGsYmuJ7z8ag8gZ
         s+9xPu8lc0iVDs6z7DZUrFGUUVGPHpkaK4P5ahl0CoxW1dfuDccvnGTIlI5TLeFIOnGa
         vCuprzEcmbYFbRCZrp5Gt0pl8gWUmegE/mH0q7gFsRYs3D4ceIxx6AQ04o+UZiIVH1fV
         Zq6w==
X-Gm-Message-State: APjAAAVd4sOp+CCoT39dIL7T+yCpZLfz8/td2rHwAz4dsIUWokZDREDj
        rK1ZmJsw8Cul1qbzmOdQ9y0ctg==
X-Google-Smtp-Source: APXvYqxyRNa53b5Cigx2MTrXUcy4HqDnc2hTJX1bT9880ZE78ku7EN1Dk8F5EZafozo6IQNHWVXYsA==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr18453513lja.140.1566374182107;
        Wed, 21 Aug 2019 00:56:22 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id h3sm1829962ljb.8.2019.08.21.00.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 00:56:21 -0700 (PDT)
Date:   Wed, 21 Aug 2019 09:56:20 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: emev2: Rename bindings documentation
 file
Message-ID: <20190821075620.GB28351@bigcity.dyn.berto.se>
References: <20190819135630.18462-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190819135630.18462-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for your work.

On 2019-08-19 15:56:30 +0200, Simon Horman wrote:
> Rename the device tree clock bindings for Renesas EMMA Mobile EV2
> from emev2-clock.txt to emev2-renesas,emev2-smu.txt.

Should this not be renesas,emev2-smu.txt to align with the compatible 
string?

> 
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> ---
>  .../bindings/clock/{emev2-clock.txt => emev2-renesas,emev2-smu.txt}       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => emev2-renesas,emev2-smu.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/clock/emev2-clock.txt b/Documentation/devicetree/bindings/clock/emev2-renesas,emev2-smu.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/clock/emev2-clock.txt
> rename to Documentation/devicetree/bindings/clock/emev2-renesas,emev2-smu.txt
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
