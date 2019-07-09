Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0600A6393E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 18:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfGIQXE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 12:23:04 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36145 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIQXE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:23:04 -0400
Received: by mail-io1-f65.google.com with SMTP id o9so28852361iom.3;
        Tue, 09 Jul 2019 09:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pQno1KJbKf78dGdOZjgFEaPOXHmHEAQYh7budV2mvhk=;
        b=gYY+6GuA3MZxmjbNA9782al9w7MSD1EELD8S2S9hF20kDPYhVQBkTczCNIhTerZDPZ
         lWhASXHXXtwE1vUQVoh7EWsuDu4n1s1nT9osHfJftjPjvpIiw/sRfw6TLG89c66n24EC
         MdLrcahKz3cb1BlUSYNqC7Tj4fhwOzL3KVm5/9Sk9lHOZREo/ta8rbM3C1HoxoEFu+B9
         7lq2GemP33R/pdTtPyWzyZQexU6QVAirSAINX3AxHaDhPLXIRFiCOR0ghI2f62+ECACn
         v6UWmCDhIs2P81ioWAZXCIpYl4j+CBwrZjWGmiSCQ1Y8OyJliUf40fam1KAEUd+3NYaz
         Vaxg==
X-Gm-Message-State: APjAAAU399kvIPKYDEQas15agr2nTNsNZUTCqtKtmv3GaZzs/JV7rr04
        FvDhoWBGWRyIdjLl/KqP7Q==
X-Google-Smtp-Source: APXvYqw72PD1UlV8XW3rvrw/IomaCRPi+zJD/vXHQVXsOBnstGBvVnzviv6A2tU2QDQAvFXXuI3d4w==
X-Received: by 2002:a5d:8447:: with SMTP id w7mr27674180ior.197.1562689383296;
        Tue, 09 Jul 2019 09:23:03 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id s3sm15076044iob.49.2019.07.09.09.23.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:23:02 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:23:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on
 sh73a0 and r8a7740
Message-ID: <20190709162301.GA8807@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076218574.4736.10317127566447729303.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076218574.4736.10317127566447729303.sendpatchset@octo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Jun 2019 18:03:05 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch reworks the DT binding documentation for the 6-channel
> 48-bit CMTs known as CMT1 on r8a7740 and sh73a0.
> 
> After the update the same style of DT binding as the rest of the upstream
> SoCs will now also be used by r8a7740 and sh73a0. The DT binding "cmt-48"
> is removed from the DT binding documentation, however software support for
> this deprecated binding will still remain in the CMT driver for some time.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |   10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> --- 0002/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:31:52.766505901 +0900
> @@ -12,17 +12,10 @@ datasheets.
>  Required Properties:
>  
>    - compatible: must contain one or more of the following:
> -    - "renesas,cmt-48-sh73a0" for the sh73A0 48-bit CMT
> -		(CMT1)
> -    - "renesas,cmt-48-r8a7740" for the r8a7740 48-bit CMT
> -		(CMT1)
> -    - "renesas,cmt-48" for all non-second generation 48-bit CMT
> -		(CMT1 on sh73a0 and r8a7740)
> -		This is a fallback for the above renesas,cmt-48-* entries.
> -
>      - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
>      - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
>      - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
> +    - "renesas,r8a7740-cmt1" for the 48-bit CMT1 device included in r8a7740.
>      - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
>      - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
>      - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
> @@ -53,6 +46,7 @@ Required Properties:
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
>      - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
> +    - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
>      - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
>      - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
>      - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
