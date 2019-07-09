Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8491863946
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 18:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGIQXt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 12:23:49 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43927 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfGIQXt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:23:49 -0400
Received: by mail-io1-f66.google.com with SMTP id k20so44391589ios.10;
        Tue, 09 Jul 2019 09:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z6vNT3TsLW2nyt2WlBlfZVPPOR6sbWbHyCUm3nmvs70=;
        b=Lj3s4NQDy7wCQmTx2YhlKtKhjiHn2JIMd/U940yLsRHlr01QKilBg3PbMeOnC5xw5G
         7EngxtGjGR8UCz6fdLm/EYmOrKEMDaXLpQhXrjwLhg3woV7AFTgeL1Bb9lkE4qZYQe/I
         sxd88rTgohlzsiIG//+9uaOD6pjEZJmxPr+DR/mUpFqKdO4t+d7GCE0QgSAm3f454m+T
         VRIr84fque8J2Fj24mH7SFCtP/t2O8k7RUV4N3BTmImERBN/G4K6iSWyBtJ8fOMdCy9S
         jMtKVsKCQIBvly8N1HvKjckwEjil/O5EogWkALv8WddxllLTsVrBEh5K+V98CaknOcRN
         8Shg==
X-Gm-Message-State: APjAAAUfEdh7nXziSa6sfcoeVk9krt6M/tT4rws31x9hMqC07VJgTyzx
        orkn3KrIiKMPI1zc7mBNRQ==
X-Google-Smtp-Source: APXvYqy5qzFS8LLw2UE4DTOD9qg/vQMKEmwaUzAWA0Ogay2lXjQl5B3ziC9rDvKoVnptJD9u90XZAg==
X-Received: by 2002:a02:4e05:: with SMTP id r5mr28992734jaa.27.1562689428115;
        Tue, 09 Jul 2019 09:23:48 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id s2sm15183820ioj.8.2019.07.09.09.23.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:23:46 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:23:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a77965
Message-ID: <20190709162345.GA10375@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076221311.4736.11788780573341776795.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076221311.4736.11788780573341776795.sendpatchset@octo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Jun 2019 18:03:33 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen3 M3-N (r8a77965) SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0009/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:57:59.708658149 +0900
> @@ -45,6 +45,8 @@ Required Properties:
>      - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
>      - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
> +    - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
> +    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
