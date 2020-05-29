Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35971E72F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 04:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405447AbgE2C54 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 May 2020 22:57:56 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38958 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405441AbgE2C54 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 22:57:56 -0400
Received: by mail-io1-f67.google.com with SMTP id c8so795436iob.6;
        Thu, 28 May 2020 19:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N8uzOIIIpGWPdsbJ0u56sDBNVwHqBhAgIf0P1oCYCNE=;
        b=O9AJAfR/8rhofn6F/AzTotLksq6smiSpRqnZCRJOGTsobHdccPg/ygPzcMcO8XNcf0
         8n20bOwWV3euT8g2zwKlxWE2J/3mcnHXa6grjpJdgHy3pZ015VNyO45UYTZ65+cu/H5F
         mayLVcRsw3Xtiu5GhGteij1JSlIpzstjgU9gD75vOsqbT2CYKbG18lYrYlAssv0mOf53
         1bEG995YYBdSPNlm0rvtlN6AzWCdrucXMk1CLRBA5Yt4ZAcvHyboH8neCalm7Zjr6KQ3
         xcF0iZ9NZy6nB8FYXvDozCV0x2G5pqjXO9Raj3gh6SVB/Fg3QZ6MC9nyugrFgV4htRKL
         YaeA==
X-Gm-Message-State: AOAM5337vujBOmc+sD2nQGzr2EBIwZ37WRwY3PrA66qyDE6lXW8XizrS
        Ex2yKBF9CsnMbz+dBrwpVTBE4g4dCg==
X-Google-Smtp-Source: ABdhPJwRskpCuBE+lThP/koIQUNPkZDL+l+1TJDpkepXryb0z7iuhU6IrhSELPJjS7dWvkLtOOKvag==
X-Received: by 2002:a6b:c706:: with SMTP id x6mr4878118iof.112.1590721074936;
        Thu, 28 May 2020 19:57:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y19sm3285195iod.41.2020.05.28.19.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:57:54 -0700 (PDT)
Received: (nullmailer pid 1185493 invoked by uid 1000);
        Fri, 29 May 2020 02:57:53 -0000
Date:   Thu, 28 May 2020 20:57:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: mtu2: Convert to json-schema
Message-ID: <20200529025753.GA1185443@bogus>
References: <20200528133033.4191-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528133033.4191-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 28 May 2020 15:30:33 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Multi-Function Timer Pulse Unit 2 (MTU2) Device Tree
> binding documentation to json-schema.
> 
> Add missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/timer/renesas,mtu2.txt           | 42 ----------
>  .../bindings/timer/renesas,mtu2.yaml          | 76 +++++++++++++++++++
>  2 files changed, 76 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/renesas,mtu2.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
> 

Applied, thanks!
