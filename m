Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1EE474BDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 20:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237346AbhLNT00 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 14:26:26 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:39833 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbhLNT0Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 14:26:25 -0500
Received: by mail-ot1-f54.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso22039876ots.6;
        Tue, 14 Dec 2021 11:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qTRoKLwpsPcurb4Q7IWi+UV/GfZcwevGrfMu6Co1pL4=;
        b=qD7idvaggy90nIe1tpL03KKmvCa8NSnn2ux2E16opaZKvkU0Jr2jiRZYxqtqNCNckv
         vwDygAppV8yn678n4DdmIFnoQe3H43UUEmUl8oJBn/ICvVEXZp8MVp8cKkuWRCg0Od05
         48sgbG2A3hKTfqaNdI/usUyAiTY0sxBtxs1PZubyp//qLqtwm0R5bKeJaaMNurEMB3sF
         U0aQjdZrFpV7WDfsOXZh2VLXIZq1uqLosFYRVlQGJxMhOQ6Bu3GRUeIYnfc5XfwPrBgn
         Y0kKhS9KBqY6uCdXm0HZyfs2iyUhQhh7DQrzew9AZsxE3fS5zJwAfDXfOyiLOC9+jmXj
         vmXw==
X-Gm-Message-State: AOAM531crjwGyCuvtMjphNY9jhX9zcs4UhG4vcGMx7+7ch2zLUdh5/S5
        Imne6tYn4OhCWr7Et8/I8A==
X-Google-Smtp-Source: ABdhPJwYzMB3WYjXdf7UFyS9xOz3fwtXmVXkWZl/YweXiVsY+ZZz7T0OCGruf+bIhOoh5miygt/yPA==
X-Received: by 2002:a05:6830:1514:: with SMTP id k20mr5729321otp.147.1639509984577;
        Tue, 14 Dec 2021 11:26:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m23sm141600otj.39.2021.12.14.11.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 11:26:23 -0800 (PST)
Received: (nullmailer pid 3765294 invoked by uid 1000);
        Tue, 14 Dec 2021 19:26:23 -0000
Date:   Tue, 14 Dec 2021 13:26:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        geert+renesas@glider.be, gregkh@linuxfoundation.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: serial: renesas,scif: Document
 r8a779f0 bindings
Message-ID: <Ybjv36sAIQS0oUzM@robh.at.kernel.org>
References: <20211209070817.1223888-1-yoshihiro.shimoda.uh@renesas.com>
 <20211209070817.1223888-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209070817.1223888-2-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 09 Dec 2021 16:08:16 +0900, Yoshihiro Shimoda wrote:
> R-Car S4-8 (R8A779F0) SoC has the R-Car Gen4 compatible SCIF ports,
> so document the SoC specific bindings.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
