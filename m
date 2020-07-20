Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04673227218
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jul 2020 00:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgGTWUV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jul 2020 18:20:21 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:38242 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgGTWUU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 18:20:20 -0400
Received: by mail-il1-f196.google.com with SMTP id s21so14686659ilk.5;
        Mon, 20 Jul 2020 15:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y5aNu8Bj2xSBjAjdaD2TAewp6TUSbKQpg/yqNYp/6xM=;
        b=XXC6dSdqldCTwAab/QlB59YdmAGRHznYA/iSuQFv+PT/8qZXdp4yh4WtPvH4pu4tFv
         xj7aXHbqIsEVawSXqdasOsg5Oh7y8nlg2IJwG6wCrxf9sbwJjVVTbJofM21PXTsnORn1
         klnpmhH2ssDgEaEvhFHlTPTfiPGBPS68Actd5xeiwgFjkYSulqQrgHrY8fcXg2u/FIcQ
         Hhn+yOvmjeHo3acguP0ifVvQdVnX/vUZgER2Xrqt9ZKvddXu2r3zFflN1U1AVejmKjBl
         KWOOaXxQfRh63+WFv5AFG13yBvnpZ5Uz8EOZTJM8I4WBREM/d5skjsYOwzDZCQM+uOF8
         F/cQ==
X-Gm-Message-State: AOAM530O4RyVbrvB3eE0rU+QwBhtMwka48T8QpZ5Zc1la32JqlqbURJx
        bTLnpu4SrZAveN4cEvpK+w==
X-Google-Smtp-Source: ABdhPJzPXOxXLly5DaYJYfcd1QZDwnC5GqJ1CI05J/8Ic47RoXu/ud8yClr8GlFmT9QOOc3s48CRXw==
X-Received: by 2002:a05:6e02:1313:: with SMTP id g19mr23470335ilr.123.1595283619725;
        Mon, 20 Jul 2020 15:20:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id z9sm9524946iob.39.2020.07.20.15.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 15:20:18 -0700 (PDT)
Received: (nullmailer pid 3053563 invoked by uid 1000);
        Mon, 20 Jul 2020 22:20:17 -0000
Date:   Mon, 20 Jul 2020 16:20:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jason Cooper <jason@lakedaemon.net>,
        Will Deacon <will@kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: serial: renesas, scif: Document
 r8a774e1 bindings
Message-ID: <20200720222017.GA3053528@bogus>
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594230511-24790-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 08 Jul 2020 18:48:24 +0100, Lad Prabhakar wrote:
> RZ/G2H (R8A774E1) SoC also has the R-Car gen3 compatible SCIF ports,
> so document the SoC specific bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
