Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD4F363953
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 18:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfGIQ0u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 12:26:50 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45810 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfGIQ0u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:26:50 -0400
Received: by mail-io1-f67.google.com with SMTP id g20so23345615ioc.12;
        Tue, 09 Jul 2019 09:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mgrHQ5F5D+useMhuT+YQYVe7EkCQvZjFfP2sgxKfUBQ=;
        b=gRxWqWQluM/1xd53siklwrAMvZorVzKCBILTmLqbr0ug5rBvafeBMSV87v5D3Jj9lc
         YSsPPDOJ4B3XKCqxh7/y185VQITx6Bjm1GNy1ryCNAUuv2H0JK8asqY2uaxKMiEingbW
         ym1n+Lth8uuoA2b3v0IGfQVEvaLEZIdPyOrrChmIiOwFUfSnfFvUOXJtQ/+0CAhLX0f6
         3v8c7/m7J1TNIkHRegu7uOw0ZZyqmPrgfdqUq2QtOG4OchcKgphaKMAajSxpmsEUzWHT
         PJMlF08SnDajHy5WB4Et9ihdu1OctmQAom9WBnRLzygY3QS+ub3lpJfT0TrlG9Stse5J
         5dXg==
X-Gm-Message-State: APjAAAU6+pYMqZDuaiabSoocx/O9R9JQzMPmkZIveMdzSRcG5Lwg2RVq
        YDIHAHHNhyBCcMSvkvRMJQ==
X-Google-Smtp-Source: APXvYqxwMjYNDz3dayxHkPQU/F2UKnHkbNlYr2rcg85Q1svDBQHtBE7kEVrySvNJgzcswHq7ChlRcg==
X-Received: by 2002:a6b:6d07:: with SMTP id a7mr355187iod.254.1562689608970;
        Tue, 09 Jul 2019 09:26:48 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id j1sm17901519iop.14.2019.07.09.09.26.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:26:48 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:26:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Subject: Re: [PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3
 CMT1 usage
Message-ID: <20190709162647.GA15846@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076224112.4736.5038116002723317642.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076224112.4736.5038116002723317642.sendpatchset@octo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Jun 2019 18:04:01 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> The R-Car Gen3 SoCs so far come with a total for 4 on-chip CMT devices:
>  - CMT0
>  - CMT1
>  - CMT2
>  - CMT3
> 
> CMT0 includes two rather basic 32-bit timer channels. The rest of the on-chip
> CMT devices support 48-bit counters and have 8 channels each.
> 
> Based on the data sheet information "CMT2/3 are exactly same as CMT1"
> it seems that CMT2 and CMT3 now use the CMT1 compat string in the DTSI.
> 
> Clarify this in the DT binding documentation by describing R-Car Gen3 and
> RZ/G2 CMT1 as "48-bit CMT devices".
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |   26 +++++++--------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> --- 0014/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 14:07:46.502422801 +0900
> @@ -28,9 +28,9 @@ Required Properties:
>      - "renesas,r8a77470-cmt0" for the 32-bit CMT0 device included in r8a77470.
>      - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
>      - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
> -    - "renesas,r8a774a1-cmt1" for the 48-bit CMT1 device included in r8a774a1.
> +    - "renesas,r8a774a1-cmt1" for the 48-bit CMT devices included in r8a774a1.
>      - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
> -    - "renesas,r8a774c0-cmt1" for the 48-bit CMT1 device included in r8a774c0.
> +    - "renesas,r8a774c0-cmt1" for the 48-bit CMT devices included in r8a774c0.
>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
> @@ -42,34 +42,34 @@ Required Properties:
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
>      - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
> -    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
> +    - "renesas,r8a7795-cmt1" for the 48-bit CMT devices included in r8a7795.
>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
> -    - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
> +    - "renesas,r8a7796-cmt1" for the 48-bit CMT devices included in r8a7796.
>      - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
> -    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
> +    - "renesas,r8a77965-cmt1" for the 48-bit CMT devices included in r8a77965.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
> -    - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
> +    - "renesas,r8a77970-cmt1" for the 48-bit CMT devices included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
> -    - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,r8a77980-cmt1" for the 48-bit CMT devices included in r8a77980.
>      - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
> -    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
> +    - "renesas,r8a77990-cmt1" for the 48-bit CMT devices included in r8a77990.
>      - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
> -    - "renesas,r8a77995-cmt1" for the 48-bit CMT1 device included in r8a77995.
> +    - "renesas,r8a77995-cmt1" for the 48-bit CMT devices included in r8a77995.
>      - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
>      - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
>      - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
>      - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
>      - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
>  
> -    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
> +    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 device included in R-Car Gen2
>  		and RZ/G1.
> -    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2
> +    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 device included in R-Car Gen2
>  		and RZ/G1.
>  		These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
>  		listed above.
> -    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3
> +    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 device included in R-Car Gen3
>  		and RZ/G2.
> -    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3
> +    - "renesas,rcar-gen3-cmt1" for 48-bit CMT devices included in R-Car Gen3
>  		and RZ/G2.
>  		These are fallbacks for R-Car Gen3 and RZ/G2 entries listed
>  		above.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
