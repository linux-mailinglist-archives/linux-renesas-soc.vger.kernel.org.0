Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB23269621
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 22:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINUPH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 16:15:07 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:37633 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgINUPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 16:15:06 -0400
Received: by mail-il1-f193.google.com with SMTP id q4so835038ils.4;
        Mon, 14 Sep 2020 13:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n0MSpQUUz3/AeMyW1sKXcTCeGErt+hRzppRfjEwGRP4=;
        b=hh5pAJxkh9u3EekrJNCs8j83bafCP71/evlLh8ndlWbft43TWnxwNyxKK+KY29Yi6d
         DT2+9l6/+xf+DYN36KuJ7mI1VOkMuwhIg1dY22qjciXdnNWa+Rh1cO0U4CgHOSPczLiS
         vq+6e6hwzoT9QQBZATuNc5/nTmaSiyTnBjNMjZI/HjRwJcyudmye5VKeMG8l7l9rRdjI
         QCCeUzuI3dvFzqYOOFIFYU8mu2sQh79y3MWJO5SkmFsiMsrX/cGQ3doYAYcHRjBSLqRM
         bJOSutbebcO3tHolMCwvHzLVbJPx6tjyiPA9OgQHVjbfJJ9ozLfAgTBKncuA+mrs1iD8
         J89w==
X-Gm-Message-State: AOAM531QT4H5YglTzV2vIcR9Ck0XSBRH1TUyZapA0Uo7XklKsmXPBLFc
        CcdkzZkYfPCmNjXLFvVzyg==
X-Google-Smtp-Source: ABdhPJzwYkYIciGDUUmcf97fSVYjBK/rofVqSufC/hvYJ1di0l08bkmMVv+r2CHb5xTuqV9d8SlfhA==
X-Received: by 2002:a92:1f1a:: with SMTP id i26mr7541134ile.201.1600114505427;
        Mon, 14 Sep 2020 13:15:05 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id d1sm7395332ila.67.2020.09.14.13.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:15:04 -0700 (PDT)
Received: (nullmailer pid 164938 invoked by uid 1000);
        Mon, 14 Sep 2020 20:15:03 -0000
Date:   Mon, 14 Sep 2020 14:15:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,cmt: Document r8a7742 CMT
 support
Message-ID: <20200914201503.GA164883@bogus>
References: <20200902091927.32211-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902091927.32211-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 02 Sep 2020 10:19:27 +0100, Lad Prabhakar wrote:
> Document SoC specific compatible strings for r8a7742. No driver change
> is needed as the fallback strings will activate the right code.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2
> * Reabsed the patch on top YAML conversion
> * Restored the Acks
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
