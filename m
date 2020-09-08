Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D396B2622B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 00:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIHWiX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 18:38:23 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34693 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgIHWiW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 18:38:22 -0400
Received: by mail-io1-f65.google.com with SMTP id m17so1154549ioo.1;
        Tue, 08 Sep 2020 15:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VuDg9I4oy0oggxN0rSn0rYIaXbul01RagiU85RWFJ9I=;
        b=iWZ8z+jLSAUP/Ue4bqExnYWdSa+x1jo3fqX6L/+0ks/Hie/tzuopb+zKg9o6txxpe0
         /W4dy7BNBaqQPHoBwHX+zoRVShr4fhRHzEBGyBUKZtVDAbBR0KC+BPjltuE7T4TGQ+qn
         Kby41FAr0fzsLsvpDOBmra9bI3OrB9R+J2yiC0DH1PEtY1PYK8Bledaq/iSdM5NPZe28
         N7OfpygiurM8LFXnBLewQnYCIuZstrHknfW2T1v2T1MmZA+5mUYH0EHUQJ2S6o1uCtge
         c8jN8pHAyX5yMbIlxePUE3kQJSkqwFbOKlLuf0XZB3Z5f5xagUB89vZqn3k0MQna8Tz+
         BxdQ==
X-Gm-Message-State: AOAM531pOx9AElRiygj8Fie68aIK2rG2UDziHzTaXupeEomeAC2T3htj
        Pq5XRK0qrBTPi2LZTkzFFA==
X-Google-Smtp-Source: ABdhPJx+KVQpaGUryei9wpF1A1KBkbFEV+WY201EqNZeaDPOm2/Rrv5/bSfmZsNedsuWIg2G3yBU0Q==
X-Received: by 2002:a5d:8604:: with SMTP id f4mr1052898iol.196.1599604701569;
        Tue, 08 Sep 2020 15:38:21 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id 64sm344025iob.36.2020.09.08.15.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:38:21 -0700 (PDT)
Received: (nullmailer pid 1065099 invoked by uid 1000);
        Tue, 08 Sep 2020 22:38:11 -0000
Date:   Tue, 8 Sep 2020 16:38:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS
 and SS data bus
Message-ID: <20200908223811.GA1065045@bogus>
References: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
 <20200824141053.5062-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824141053.5062-3-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 24 Aug 2020 15:10:50 +0100, Biju Das wrote:
> Document HS and SS data bus for the "usb-role-switch" enabled case.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3: Replaced Tabs with spaces
>         Ref:https://patchwork.kernel.org/patch/11708831/
> v1->v2: No change
>         Ref:https://patchwork.kernel.org/patch/11669423/
> ---
>  .../bindings/usb/renesas,usb3-peri.yaml       | 34 ++++++++++++++++---
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
