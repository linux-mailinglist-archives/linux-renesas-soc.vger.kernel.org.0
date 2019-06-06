Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3EB37E9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 22:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfFFUTL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 16:19:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42649 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfFFUTL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 16:19:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so3254565lje.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jun 2019 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/03xw2tp9NftYo6y3lqGwgx/5/L6jpHZDgrcUrW11Ls=;
        b=C6mOGcHiaVmH85p7U7iwG8/iC0iR06aNXeaSXUH7HDVESCO6hX0YzCVBmJA28M9jLH
         N1Y4rCIH84mshtTrWvh6iej7PDWJ4yGcF1AsMZZTx7xJduPJlljsmkHLmSjP9zG/Xp5R
         GqL9GlKj295vqo4NA6kAIDYMZBpcfXuV4amDihjRcFPLDzzgLItUJ6XybX2mxHRXSg6z
         vzPERSHRCGtH35IpNxF6Q6cZt9KaVrLrKBB1mN6GmVNOxnlujaJ7NdUo89Zw1nw3EOW7
         awkyxiiCs6BI4goeDyxJoQOQQAI5NXiwkDyfeNV5iJo35vWKPfXFyZxgXT+1RVTOoNvp
         fUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/03xw2tp9NftYo6y3lqGwgx/5/L6jpHZDgrcUrW11Ls=;
        b=jcrDEKkHpV0HdhzTy+D88JsaXLLQhhm5YrEbA1PG8CdBu4kJ6VUYrXUljW9iO7Wu0r
         s3S8LbLOyP9X5Q5ctUjQSU9qzvYhB4rj2O1v+sAgNcnGidgrNCbd0e1UseyzPA3bgP4e
         YfQQ74ZxNUqDrBe+khbWTRj/3nW7TdsyAF4lfTwK+RoXkwGRpZzim421/lipG3BS0gMH
         Eyl7A43Ja2ZOOCuocy1mISzyeWr/tulOp8QLkCi7wqdzO5iFv+pFMd03EsQgWVLSvpB6
         rTtakSuqbsHwVIfjhiUVwqGP+tRnjbsedaLEuVA8mvcq9Eva4y2BiU2XelCWhDkqodRZ
         JYzQ==
X-Gm-Message-State: APjAAAWQEi6RFDawzD0xlB7Lo/Cd67fQFsCp06ZlCBm9mUgVlk6pRle1
        ILrlSDPPMWU8vM3gHQKxFALaJg==
X-Google-Smtp-Source: APXvYqzgZWw8o0bIGbPew+V04P4R1bupPBNRB+zTHJIX2UUIcycbT6+JsRt9BBlOQc6u4j5RWpUJqg==
X-Received: by 2002:a2e:880d:: with SMTP id x13mr25825603ljh.72.1559852348590;
        Thu, 06 Jun 2019 13:19:08 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.83.115])
        by smtp.gmail.com with ESMTPSA id 20sm14917ljf.21.2019.06.06.13.19.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 13:19:07 -0700 (PDT)
Subject: Re: [PATCH 01/20] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-2-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0c04c0b6-1fbf-fba3-ca40-c4a999ed6a17@cogentembedded.com>
Date:   Thu, 6 Jun 2019 23:19:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190606142220.1392-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/06/2019 05:22 PM, Jacopo Mondi wrote:

> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
> 
> CMM is the image enhancement module available on each R-Car DU video
> channel on Gen2 and Gen3 SoCs (V3H and V3M excluded).
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/display/renesas,cmm.txt          | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.txt b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> new file mode 100644
> index 000000000000..d8d3cf9ce2ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> @@ -0,0 +1,25 @@
> +* Renesas R-Car Color Management Module (CMM)
> +
> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> +
> +Required properties:
> + - compatible: shall be one of:
> +   - "renesas,cmm-gen3"
> +   - "renesas,cmm-gen2"
> +
> + - reg: the address base and length of the memory area where CMM control
> +   registers are mapped to.
> +
> + - clocks: phandle and clock-specifier pair to the CMM functional clock
> +   supplier.
> +
> +Example:
> +--------
> +
> +	cmm0: cmm@fea40000 {
> +		compatible = "renesas,cmm";

   Dosent' match the description above.

> +		reg = <0 0xfea40000 0 0x1000>;
> +		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +		clocks = <&cpg CPG_MOD 711>;
> +		resets = <&cpg 711>;
> +	};
> 

MBR, Sergei
