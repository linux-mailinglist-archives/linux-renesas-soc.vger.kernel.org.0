Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A408D1E6D4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2020 23:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436482AbgE1VKa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 May 2020 17:10:30 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38116 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407542AbgE1VKV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 17:10:21 -0400
Received: by mail-io1-f67.google.com with SMTP id d7so38557ioq.5;
        Thu, 28 May 2020 14:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6AESZjKsRo2fnaeCFt3ie8q62yK2oF6atXYzGHTWfx4=;
        b=cgBo3GN89zOCqwbTHNmR4qxg0PbgeZBnuEqwpGb15Z6gewqa9Gzivxj+RC5ZB/KEe5
         BUPxyAD6gYvqODiC5zlkHrNRh3nNsTDEcyoWRxbLih61HeSfYZatnY8X48v7qVWLqIJ9
         JLlU7cJwWPFK6uFn3j77gxOPydpLmD3A+VKB8LxdfSUdfkXjYh1EYOsCJn21DcYSV6Uw
         U/7bo9SKot0tUaFA6mFaBlNeKCCbwtXsbyAiTJEiyV5QRxm+Ku03UVf2m63nlApgHvdT
         pyYoDpk3enxuI2PNBS/3nDeVF8ttFo09dImjezx/tr8iXFZmsIUulUA7IYKiUZpN/mHQ
         bQhw==
X-Gm-Message-State: AOAM532OiFPgmstjJwbzvVIijqjLbVgWhNfR6cIohtytkvdKGVB+B7sj
        OA0Itd4AVKMvN3TGPrDClw==
X-Google-Smtp-Source: ABdhPJwIExRXhFstYmHtSSBnlb7OJBayFPc2AtryCPNDffN7eq2c/9FR1XoR8JDaDfTcKokoMBt/1A==
X-Received: by 2002:a5e:a61a:: with SMTP id q26mr3896898ioi.207.1590700220245;
        Thu, 28 May 2020 14:10:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f15sm3775266ill.58.2020.05.28.14.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:10:19 -0700 (PDT)
Received: (nullmailer pid 689735 invoked by uid 1000);
        Thu, 28 May 2020 21:10:18 -0000
Date:   Thu, 28 May 2020 15:10:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org,
        Jason Cooper <jason@lakedaemon.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: arm, gic: Document
 resets property
Message-ID: <20200528211018.GA689668@bogus>
References: <20200519080519.28324-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519080519.28324-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 May 2020 10:05:19 +0200, Geert Uytterhoeven wrote:
> A generic GIC block embedded in an SoC may be connected to an on-SoC
> reset controller.  Hence allow the DTS writer to describe this relation,
> by documenting the optional presence of a "reset" property.
> 
> This gets rid of "make dtbs_check" warnings like:
> 
>     arch/arm/boot/dts/r8a7791-porter.dt.yaml: interrupt-controller@f1001000: 'resets' does not match any of the regexes: '^v2m@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!
