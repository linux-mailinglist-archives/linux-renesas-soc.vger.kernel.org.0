Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499C4E577B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2019 02:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfJZASG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 20:18:06 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37567 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfJZASF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 20:18:05 -0400
Received: by mail-oi1-f195.google.com with SMTP id i16so2760802oie.4;
        Fri, 25 Oct 2019 17:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kAHHIN8vS8UUv509RkFpLb/+oWPUc2iyGFZFwFaLR/k=;
        b=nT+Lmnm6APs09fqbw/jn7OWEGW9b6pAZXbbiNRaj5fGlzulGdniH3y1lsDhpS+kUwp
         4hPr/4rDlolNCftV2S2gR8VindMMaRc9fHTduScX4S/FXGLNGPXbZXRU/RDfi38hZGRp
         Yjb3yGaf4KQSnW+bkdB2uwMMEE0M0FL5Fbuguh+1xofhjHDhNMPvxDawW0FKHC0XhdZs
         k6i38IgsOg4hEgRirbVoGOL9GvyERmkOlcjiwek0lodcZ+0v+Q7ExZWMO0npSrozCsyA
         Sqki565EcBDVyFuZtxUmB51Qb8S75kVBKzCdzbJ/X7ZEHwCv0jehwzk3n/KU0K22EtyU
         bqKg==
X-Gm-Message-State: APjAAAUTKGZXa1uX3TptZwa0TlPxiWQU+Yo1SKUYe55T37Ye7OZjpYri
        +PHHVkfEj9agXvGnl4VqZA==
X-Google-Smtp-Source: APXvYqyosPquK5laKybO3xjMJrCw8EQ1wcIgeL6RpXq9onJ3VTHPKxb7wRexpEUQvbAv7r3ZzGaiCw==
X-Received: by 2002:a05:6808:6d5:: with SMTP id m21mr4552300oih.166.1572049085268;
        Fri, 25 Oct 2019 17:18:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o2sm1255195ota.3.2019.10.25.17.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:18:04 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:18:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 4/5] dt-bindings: power: rcar-sysc: Document r8a77961
 support
Message-ID: <20191026001804.GA7927@bogus>
References: <20191023122911.12166-1-geert+renesas@glider.be>
 <20191023122911.12166-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023122911.12166-5-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Oct 2019 14:29:10 +0200, Geert Uytterhoeven wrote:
> Add DT binding documentation for the System Controller in the Renesas
> R-Car M3-W+ (R8A77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
