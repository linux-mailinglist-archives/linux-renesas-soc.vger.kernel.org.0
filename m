Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FCA21E57A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 04:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGNCMV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 22:12:21 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46243 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgGNCMV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 22:12:21 -0400
Received: by mail-io1-f66.google.com with SMTP id a12so15659121ion.13;
        Mon, 13 Jul 2020 19:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rYKdpUqepou9jx1AglhXW1v3VmWcoBH3ywbADxlKubw=;
        b=ew04cEZEkgwAKcTJjuPbY62pINv6QQ8VcdmfXAGB2iq8LRndqybfHgcJZpIcToQY77
         5UE6h95VGo60eTnJYwgA/nt9Wp7h3ASOcAzgutPn3sETkYy2j0MSZ/kVGGTF86Gm2Jbg
         +cYkcM4HcdSyLTcHw9BZzHndx5tE9dbnoBmd78QoiXpeLiV+9n7uPCqD6BujeQeBliHY
         bY7fEjvMvu4m/06VtvsIr9+kG7C+oHOrj1sFc/ldTNEB8RrPm19mQXHsKVyKrR45T+Vi
         p+BMlcW/FIwmhmpRSAogH+duXBfiZ4g6UefwnxWzD14pjDFxZeGtuW7btL7MrJqubg+p
         goEg==
X-Gm-Message-State: AOAM531MSHEVd/tgJBxGEpvShaO+ILk9ARvFXjvnDGMPd8zt1w/nrygg
        1ghR6KarDBJ2xBV+zCN49Ov0JeV9qoRx
X-Google-Smtp-Source: ABdhPJwCEYfAYaJ74OVjMWY5/7ctAi6PGeZuG0YxAFqpXycKurAzjq7l1ACdie74Vlon5me8aKoAKg==
X-Received: by 2002:a05:6602:45:: with SMTP id z5mr2729761ioz.112.1594692740631;
        Mon, 13 Jul 2020 19:12:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id 5sm8374172ion.7.2020.07.13.19.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:12:19 -0700 (PDT)
Received: (nullmailer pid 1136711 invoked by uid 1000);
        Tue, 14 Jul 2020 02:12:18 -0000
Date:   Mon, 13 Jul 2020 20:12:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: renesas,usb-xhci: convert to YAML
Message-ID: <20200714021218.GA1136658@bogus>
References: <1592822252-12338-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592822252-12338-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 22 Jun 2020 19:37:32 +0900, Yoshihiro Shimoda wrote:
> Convert Renesas related parts of usb-xhci to YAML because
> they are not compatible with generic-xhci.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Update the commit description.
>  - Use SoC part names instead of part numbers in the comments.
>  - Add comments on renesas,rcar-gen[23]-xhci.
>  - Add power-domains and resets to required.
>  https://patchwork.kernel.org/patch/11604565/
> 
>  .../devicetree/bindings/usb/renesas,usb-xhci.yaml  | 86 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 18 -----
>  2 files changed, 86 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> 

Applied, thanks!
