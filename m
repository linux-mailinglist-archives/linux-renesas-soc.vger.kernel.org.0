Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451F022721D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jul 2020 00:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgGTWUf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jul 2020 18:20:35 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40316 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgGTWUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 18:20:34 -0400
Received: by mail-io1-f66.google.com with SMTP id l17so19255647iok.7;
        Mon, 20 Jul 2020 15:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HdTcN2QOtuK4/ple9u7bww4BbmoGROQu1AN0m9hHaQk=;
        b=DfTcGeIGUU4s3XURSQhOZe33gapK8II6x7KRNh98SAcVHTBhMD0MezB76A0O3TD+7x
         D/sUfDHSCoP0tzAMgPmtL0grGQAkLmBFKXa1YcFxmzgVI3VzMiWd3dfbLgfDIM0APi4t
         UBp8vzXF16bvbmKOkm1Ccsdrn7HIXqTVMqAAmgptuTOlVzIlos3vXo37siHTnZLqmKQ6
         CxHk8je2/wAMXskF0Ugc+Wjt9t1qlJ66S8k96cJDH9+EDy9mrUcNKzP38wyELaa35pEf
         WBbQL2kVvO2UtvRxM0CtqdXX0G171p+nigxEn6ajhMfIsjRQDHKte4jjHI3vo5pF81Rh
         jZSw==
X-Gm-Message-State: AOAM530ePFy7L4yY2OQu0ZLWvRAfVnOHfma3hpelmnnuqcVkIWV7g9Q2
        uSLcop+UOmufBCcg4P0tVQ==
X-Google-Smtp-Source: ABdhPJz/tXsuLsaWFMPiIrxvDvKJbTsiFgo2FYfezivTjBh9nWBYDBpgDVa8aJOQ19/UAFKhgbwUgg==
X-Received: by 2002:a02:7f89:: with SMTP id r131mr27491532jac.98.1595283633485;
        Mon, 20 Jul 2020 15:20:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b2sm9578924ilf.0.2020.07.20.15.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 15:20:32 -0700 (PDT)
Received: (nullmailer pid 3054009 invoked by uid 1000);
        Mon, 20 Jul 2020 22:20:31 -0000
Date:   Mon, 20 Jul 2020 16:20:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jason Cooper <jason@lakedaemon.net>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: serial: renesas, hscif: Document
 r8a774e1 bindings
Message-ID: <20200720222031.GA3053957@bogus>
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594230511-24790-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 08 Jul 2020 18:48:25 +0100, Lad Prabhakar wrote:
> RZ/G2H (R8A774E1) SoC also has the R-Car gen3 compatible HSCIF ports,
> so document the SoC specific bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,hscif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
