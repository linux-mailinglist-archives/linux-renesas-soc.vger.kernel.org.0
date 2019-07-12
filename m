Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E569966798
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 09:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfGLHRJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 03:17:09 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34176 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfGLHRI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 03:17:08 -0400
Received: by mail-pl1-f194.google.com with SMTP id i2so4347256plt.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2019 00:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cxBqPR88LFiqME/AqLaR3oh7wXhh5vtct9RycoXYWUI=;
        b=iQghWGOWf/AlnfX01xNyoRFLFvM47uNROXp+eEvyhr4RFS4Zj8V7zZcBLWt3Yhh3Ky
         74jzinO8RCM/H9aZR5BJN95/8HMlcdjVQJWEAq1GuPJAhDZoZ6hN1Fr+H3KPE1GbMFZt
         Jut5hcTop0pW9WrdS5KY+hvYpfWB7D91nBgW/ab4P5oK2D53vnYs0cb/rkfe0206BObM
         O+Mln2hJXkKIAtLxJ8gDYhzH1zt4OpsICimasIOyq2odUIc7cuolV0tJG6ZQU9SOwv06
         N3Kjmi9HGd/r27tEBo4ZoAoAPsZrNM1PisgLmNvrYwtmKlcZXK2d9ZCVOOpc8gkLPdp1
         TNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cxBqPR88LFiqME/AqLaR3oh7wXhh5vtct9RycoXYWUI=;
        b=rk3EcKDu8YKMkW9yV0cGEysFuIW7CBcCXko2Fn6jsfj0ZWXW4dOnTga+tbtnwqVFCq
         aWdnRRT+NAITsu4fFMoNK6eYd/4/PyMiXg0MYjyl3WCX4xGMauNvKKxHkGYqzmZkDHc3
         7O4f1XKPAh7P5u69ShF1Pw6I+L9DuDkvQ4ZBEnSmo8qdDt15VcYheYSIRmeBEL/7SNEY
         uhJ2AR8jyuZBUwtSF8DBXTeynxl3f2q7M55zEhmHCdKpm9hxaG27SXBghKouWJ2GZjyn
         815mTas9ET0vehQY/zfQH8o27HWWGxJGHRqbezY1sTROPo3A1ATfiNGbLzpzpfbruwR+
         6bKw==
X-Gm-Message-State: APjAAAUN6GxjBhbCmsRCX91gxsRKZaUBttT3kcttSB46wBGnrwAE7EpV
        m3/gYCt7rgHzzPOfslnrX0k=
X-Google-Smtp-Source: APXvYqyrY35iZT2Ei9n2xXBPdgfRT4g1NnFeW/HPzKJ6E1WuUVFdR7cHTuQ9sIWRmH4yQbiLYxONhw==
X-Received: by 2002:a17:902:8a94:: with SMTP id p20mr9568214plo.312.1562915827712;
        Fri, 12 Jul 2019 00:17:07 -0700 (PDT)
Received: from localhost (softbank126209254147.bbtec.net. [126.209.254.147])
        by smtp.gmail.com with ESMTPSA id l15sm7674193pgf.5.2019.07.12.00.17.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 00:17:06 -0700 (PDT)
Date:   Fri, 12 Jul 2019 16:17:03 +0900
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
Message-ID: <20190712071703.GE9317@wyvern>
References: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

A gentle ping on this patch. I assume if it could get a ack from Rob it 
could be taken in thru the media-tree?

On 2019-06-12 23:12:41 +0200, Niklas S�derlund wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> pattern.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
>  .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
>  MAINTAINERS                                                   | 4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
>  rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/rcar_vin.txt
> rename to Documentation/devicetree/bindings/media/renesas,vin.txt
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a3bac28ebb47830..a0d21ff13c8e8989 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9807,8 +9807,8 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Supported
> -F:	Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> -F:	Documentation/devicetree/bindings/media/rcar_vin.txt
> +F:	Documentation/devicetree/bindings/media/renesas,csi2.txt
> +F:	Documentation/devicetree/bindings/media/renesas,vin.txt
>  F:	drivers/media/platform/rcar-vin/
>  
>  MEDIA DRIVERS FOR RENESAS - VSP1
> -- 
> 2.21.0
> 

-- 
Regards,
Niklas S�derlund
