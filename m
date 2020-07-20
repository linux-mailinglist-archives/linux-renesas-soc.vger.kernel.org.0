Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE1C227279
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jul 2020 00:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgGTWqd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jul 2020 18:46:33 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:36352 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgGTWqc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 18:46:32 -0400
Received: by mail-il1-f195.google.com with SMTP id x9so14767037ila.3;
        Mon, 20 Jul 2020 15:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n9jtHQhmJ9vnaRzIOJakaFNOOyCU7YAeTdIn4HLZ5bQ=;
        b=aAFjIbB1chzMmOZI2ppL8DthrgYKl/7FYfm6vT+3V4WzRYWUekQlDxnDLLx+q0CkCS
         8CUTXPZtHU1tqhybnoVOnc1SszHmMeIirfdHMqkRyXKRYaVCo5w2qL3s+hhKbU2gWO1J
         U5xCAwAQ71GisLCpu658MFLcq91AOAFA0q1+4Ulow6Bn981EZDEWhs8lkV05sRU38lO7
         lhiccK8vOyZ1bWsjWDO2r6F+NnSa04dn96ZKTO4g4F8sXUQHU/ljtgccz1W4k7cxSRXI
         Gi3rLN01bfS/oysqA+4Zj2FXR8fBLblBP4JbTo0VfAmL7Kc/RSd1XBs929B6ZjmXL93v
         QsLQ==
X-Gm-Message-State: AOAM530I06RbJ9Hxe7D3TWd9iRNB1UBtWY8uwGoVxbLjtmSzQWdSxF9M
        Ysi4qnev7VitPIXCy8RmLg==
X-Google-Smtp-Source: ABdhPJzVh3S3uWf0UwezYlOIfVX+Le1gi9aULgqWdJhxQanjUjHDx92tg4vW2P3lTQAVN318Syhr9A==
X-Received: by 2002:a92:da46:: with SMTP id p6mr25686471ilq.48.1595285191700;
        Mon, 20 Jul 2020 15:46:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n1sm9492447ilo.68.2020.07.20.15.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 15:46:30 -0700 (PDT)
Received: (nullmailer pid 3088914 invoked by uid 1000);
        Mon, 20 Jul 2020 22:46:29 -0000
Date:   Mon, 20 Jul 2020 16:46:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: convert to YAML
Message-ID: <20200720224629.GA3088865@bogus>
References: <1594363883-22154-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594363883-22154-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 10 Jul 2020 15:51:23 +0900, Yoshihiro Shimoda wrote:
> Convert Renesas SDHI SD/MMC controller document to YAML.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Almost all node names in Renesas dtsi files have "sd@" name, but these should
>  be "mmc@". So converting the node names by using the following commands
>  is easy to check this patch :)
>   sed -i "s/sd@/mmc@/" arch/arm/boot/dts/*
>   sed -i "s/sd@/mmc@/" arch/arm64/boot/dts/renesas/*
> 
>  r8a77470-iwg23s-sbc.dts doesn't seem to follow the document though...
> 
>  .../devicetree/bindings/mmc/renesas,sdhi.txt       | 114 ------------
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml      | 191 +++++++++++++++++++++
>  2 files changed, 191 insertions(+), 114 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
