Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 101D1DE0D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2019 00:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfJTWFw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Oct 2019 18:05:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46746 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfJTWFw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Oct 2019 18:05:52 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so11168839ljl.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Oct 2019 15:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=iUMa5QoMRlHLJqsynLbu/hpJbEC1VIDyLoIQW8s0r9s=;
        b=kbHe5OvbVNtkyq6JSWrrjlbEhmXrUq4zaQBlBOFRjwyxCKK6ARW14hoWM8SarEtNcs
         nRkkwzk/t7Q+wuaUSS9x0v8yg0EhCn6kBH6D4bZ09iXTpEYtHFB3SpGv/nkG71StkcJz
         2O9GbUsV6cZ66kN+Otifgq7EsguR/X2+dnAtV8C2zATib0+qicD4jjqr0BlRYbTrcgYw
         nF9R4Mq2J2KTr9h+/KTGTCG8IW+FoeAwI8eF4eU31xrRWMxlKcDpCvdSc2+R8s0+45Ez
         KWqIB82pkZjvvVsmgN+I24bHZkrqMq1fV206A5UK2Atc/wimC8opCYf9J0Sko3Zo+LmY
         vZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iUMa5QoMRlHLJqsynLbu/hpJbEC1VIDyLoIQW8s0r9s=;
        b=k621MQg7d0f+ZDih9Ib5+fQ0Y/s+ln+PeodkHruMFHvdkpOS6kKjGDKYBsHAyC5kAF
         lpOis72eDGvZaRMx/FHlZ/OtyIHtQho6/lUvvzJ2ymSwiqFhqRIHMm98FOD60ovp1XUB
         jzPxwU9v0e/bWwFRILH+XRAajZdAe/qANhmygdeDLTZBDH4Lm/nB0mGzCnU/vqbzHmUq
         MeIOA7F7y5tLmiMVDGVnX4KSEgiOKbembWbX4/u4jem+t/YMfJJTNZrH9fMm4x0tP+Vn
         hWSkaYrRrKG/3aOYqgRVZm+bXhhqlo764xHmQKZdFFrkYNWrFe240odkqlw3Loc4EqXh
         4ipw==
X-Gm-Message-State: APjAAAWEPXagFK4V75oSeul8az7KdLegqzWZnU5ZnAukTZhGHNRqynwI
        CD64Ns+w0L9ndLXcfVWl/0znIQ==
X-Google-Smtp-Source: APXvYqxPyuMIupeV/16Itd+J1ki2mprFeli1CjiyppU2YJniKudicVPAQI8wojvxnpK5GeVvGJnNmw==
X-Received: by 2002:a2e:8945:: with SMTP id b5mr8423266ljk.215.1571609149787;
        Sun, 20 Oct 2019 15:05:49 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id i11sm6465930ljb.74.2019.10.20.15.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 15:05:48 -0700 (PDT)
Date:   Mon, 21 Oct 2019 00:05:48 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 0/4] Add VIN/CSI-2 support
Message-ID: <20191020220548.GG13372@bigcity.dyn.berto.se>
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your work.

On 2019-10-15 11:57:54 +0100, Biju Das wrote:
> This patch series add VIN/CSI-2 driver support for RZ/G2N SoC.

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Biju Das (4):
>   media: dt-bindings: rcar-vin: Add R8A774B1 support
>   media: dt-bindings: rcar-csi2: Add R8A774B1 support
>   media: rcar-vin: Enable support for R8A774B1
>   media: rcar-csi2: Enable support for R8A774B1
> 
>  Documentation/devicetree/bindings/media/renesas,csi2.txt | 1 +
>  Documentation/devicetree/bindings/media/renesas,vin.txt  | 1 +
>  drivers/media/platform/rcar-vin/rcar-core.c              | 4 ++++
>  drivers/media/platform/rcar-vin/rcar-csi2.c              | 4 ++++
>  4 files changed, 10 insertions(+)
> 
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
