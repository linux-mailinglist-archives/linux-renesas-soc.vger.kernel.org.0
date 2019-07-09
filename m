Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612A26394E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 18:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfGIQZW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 12:25:22 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33985 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfGIQZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:25:21 -0400
Received: by mail-io1-f66.google.com with SMTP id k8so44538651iot.1;
        Tue, 09 Jul 2019 09:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L0IuryTJ17YlZQQ0qkitZl2PflaOy11IXysKLOuj46Y=;
        b=XHwMu0NM5soQKTAihpHukdpMZ3DsVC7Dmf6F5ZxPAxztWIWlG+nj5ma8EZnlDJ3fnS
         QAEixzF7PF8xJRKaXd44GPrLgkjWNphvTslCHBXuDHpBR3yP4TFgg6ngvbT3Fj88MNes
         rDzogk0d85FnTyzFLW1syODp/kD6ZV/2ZS0bGZQRopo6QR14HteGew5SKCIPAsPD6uva
         5pqxVK6UehP7GKxsO8DcXLtW5pZaDT9gzmlx8q22rkff0RBkdUUdd3WNZ7GE4IR0J41Z
         SlPdwhbhtcZz8ngZMerCt3uLHCYqHCZY3ibb6/+k6WJTsz85EymglVWLWR2AScqALMEK
         XU/w==
X-Gm-Message-State: APjAAAVd9ZboZguV4X+r/amcU80fvZbrJ5haFDMJK1AJ77XZHUE7lP6J
        DmjPHDWH4Dw3vHdp2MRB4A==
X-Google-Smtp-Source: APXvYqyi0U1+Vil28Bz2Okr1GbLpTw0rGVmIKY8TKX0WDnzcmnMXaePyNwscbMEvFXhF3gYlt9wz6w==
X-Received: by 2002:a02:a595:: with SMTP id b21mr6910953jam.28.1562689520988;
        Tue, 09 Jul 2019 09:25:20 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b3sm16560185iot.23.2019.07.09.09.25.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:25:20 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:25:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Subject: Re: [PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a77990
Message-ID: <20190709162519.GA13108@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076222206.4736.3009593403446400658.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076222206.4736.3009593403446400658.sendpatchset@octo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Jun 2019 18:03:42 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen3 E3 (r8a77990) SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0010/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:58:48.559219302 +0900
> @@ -51,6 +51,8 @@ Required Properties:
>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
> +    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
>      - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
>      - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
>      - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
