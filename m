Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7872AC499
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 20:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbgKITGU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 14:06:20 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34212 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgKITGU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 14:06:20 -0500
Received: by mail-oi1-f193.google.com with SMTP id w188so5827292oib.1;
        Mon, 09 Nov 2020 11:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NyKEQzfxMyUyNU2uzmh/F3T8nMthTwYvAIfKbyiOUJ8=;
        b=uG9Z1xIpLEOKmHWqPP/kzSenD33dx8cQHWLSi6ZGj9WOegK0zTXzP4+r+6fuQ9Xcmt
         G9uEDDhL8ZkSCzvncfIvUaKKrHAYLNCoUyVITGP82SlaGxd9A+bbk/uCfMjygmL7LS3h
         ICpiAtgcj6tjGSPn15b/iYJmdEVxz7KhrjzSO4VEMw2X4Rdx3jy1MxQ+JLWzMe8w0sfC
         TMAeXIbgo3uNdT7kJwSH+xisVHnki2SxAe6xXAWXpUii5Ua42AAefFkHabNmkgnsVKgM
         tFchD2fiGE1GBcxj1KJD9cPv7qaEsvmOJCqPiErdtdmJlg3KfMMd4CNzIA+3sMN0Vq/X
         Sqtw==
X-Gm-Message-State: AOAM530eNj3KM4YL9pF33I0qeOg3X5iOtsxlp8DbFFzU0E6YEkyveyfM
        egz15G9Tcv0kzENj7Snd3ULjwVZX6A==
X-Google-Smtp-Source: ABdhPJyHnd+mWV6LVlAEfuMHvKUEm/jvECdRIk0QPPXGApehF0sQ4A/M1aZhrd+3tbmqItPryMFWbg==
X-Received: by 2002:a05:6808:6d1:: with SMTP id m17mr438420oih.134.1604948779301;
        Mon, 09 Nov 2020 11:06:19 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x190sm2560129oia.35.2020.11.09.11.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 11:06:18 -0800 (PST)
Received: (nullmailer pid 1598978 invoked by uid 1000);
        Mon, 09 Nov 2020 19:06:17 -0000
Date:   Mon, 9 Nov 2020 13:06:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     robh+dt@kernel.org, geert+renesas@glider.be,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Convert bindings to json-schema
Message-ID: <20201109190617.GA1598944@bogus>
References: <1604543524-31482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604543524-31482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 05 Nov 2020 11:32:04 +0900, Yoshihiro Shimoda wrote:
> Convert Renesas R-Car USB 2.0 clock selector bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Fix dt-schema error.
>  https://patchwork.kernel.org/project/linux-renesas-soc/patch/1604475005-29495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
> 
>  .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  68 --------------
>  .../clock/renesas,rcar-usb2-clock-sel.yaml         | 100 +++++++++++++++++++++
>  2 files changed, 100 insertions(+), 68 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
