Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6CA63944
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 18:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfGIQX1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 12:23:27 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42495 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfGIQX1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:23:27 -0400
Received: by mail-io1-f67.google.com with SMTP id u19so44405263ior.9;
        Tue, 09 Jul 2019 09:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IyefW15enFqkRf6sitcOVUoBR79n1OhP3rYYjVmpNA8=;
        b=AwwC+AE/ZrKHVB2XLybw6UWHSAUQFv82DfjzztwMnrxrPIZn+PI3CDmH1mlkbQWFn4
         w1f9XN0tmzfKP6L+ja/P2q5VAnjupaprIrVlyXC4fnsb2zXZzwXH3JH9lbZNHIFb91D6
         ba11KuuzTnJa6ylvNk832BJ3/wl3xXIylc+/TTRB9UeB8CaxMoHD3+TnYU768Z2YlgB+
         y9z7QzPSVLuG9iO1V3fiDC3qJE6skdyS+5HBp0hk3CI7pKi5yDDclBA7ShOP2KISHpRl
         jemzDoaUIRwiRX+4xwPWmmwXOODDBvj6xfYAS8tBM7eeolf/0XQWclG4B5/Pc6342ugz
         8hkw==
X-Gm-Message-State: APjAAAVykyRm4xnjWck83oSYXzNPuwrx29awDPvieCrmGsHB32hokiy6
        EE3ns5jyM7rZDr0PWXGelQ==
X-Google-Smtp-Source: APXvYqwdHsm/HgGioLD4LA6iQ7GpUmBdijU62lp3zVf9JsTsYcPuhyt7wsdsiUokD/CPg5Mgz8JRig==
X-Received: by 2002:a6b:90c1:: with SMTP id s184mr25316313iod.244.1562689406246;
        Tue, 09 Jul 2019 09:23:26 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u17sm17826126iob.57.2019.07.09.09.23.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:23:25 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:23:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a7795
Message-ID: <20190709162325.GA9674@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076220389.4736.5742093495634461883.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076220389.4736.5742093495634461883.sendpatchset@octo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Jun 2019 18:03:23 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen3 H3 (r8a7795) SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0006/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:53:43.252212551 +0900
> @@ -41,6 +41,8 @@ Required Properties:
>      - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
> +    - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
> +    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
>      - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
