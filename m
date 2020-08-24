Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E801250B98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 00:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgHXWXi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 18:23:38 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:33207 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHXWXh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 18:23:37 -0400
Received: by mail-il1-f196.google.com with SMTP id r13so8745131iln.0;
        Mon, 24 Aug 2020 15:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sxWoSiXfyNxC7RpNkWsYKNGkllX1hPdgCddbI6UFMS8=;
        b=CeHJeEtTcxpGTTy2e54I4FLE5vSCWulpbEDVU8HPhuwhTKLGMyLk3tdpoTRcXkYTsB
         Zo8kF4s6xZmdSO1wXubrRn3QMqc+5PIl1K1rbbsUsqkeSSLw4IYAEq1+/dIZxULeaDlR
         5P6ML+ckDp1FAFNfUorqQlRfhzUrYK8xBeXiSir2MiKpDlXqFWgGy7fdvLBAFTqcYOIM
         Ja8oLUGrNQF/3VSHWxTVFxY+IImASiFo0dtCRKtGZ8TmM3xLQ5dTkPyE3cAAj7mzYjDi
         6jSH9IzTP6X54NMd7CbQCg7G+698zVXitGj48315ZClsctAgk+eY+L9CeDPNtVlAcg4Q
         ucYg==
X-Gm-Message-State: AOAM5319UYGTgeDvvvvOFGhn99nsYBj0UsN8JKS+kV/qOysBIZ53Qc8p
        e6NLDJYorQDuh/KXSKC5ogIdHkCPkw==
X-Google-Smtp-Source: ABdhPJznOKZdKvAaryVXsQIpvkIsmCU7LK5fBX41NJ1Qm07XPJOu1Tb2fW0OF5VP6XC4w7/K9fuXIw==
X-Received: by 2002:a92:89c8:: with SMTP id w69mr6996316ilk.139.1598307816294;
        Mon, 24 Aug 2020 15:23:36 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id f186sm3428221ioa.42.2020.08.24.15.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 15:23:35 -0700 (PDT)
Received: (nullmailer pid 3425801 invoked by uid 1000);
        Mon, 24 Aug 2020 22:23:30 -0000
Date:   Mon, 24 Aug 2020 16:23:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Sort compatible
 string in increasing number of the SoC
Message-ID: <20200824222330.GA3425741@bogus>
References: <20200809193527.19659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200809193527.19659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 09 Aug 2020 20:35:27 +0100, Lad Prabhakar wrote:
> Sort the items in the compatible string list in increasing number of SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
