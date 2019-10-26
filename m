Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3339E5790
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2019 02:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfJZAWZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 20:22:25 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35020 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfJZAWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 20:22:25 -0400
Received: by mail-oi1-f196.google.com with SMTP id n16so489401oig.2;
        Fri, 25 Oct 2019 17:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sD4+t4O6I6/yZhYnM4tEH5BwgfVk2lbaDmYQkcXTSss=;
        b=bIhRNJiq+XDcyzZbjNCkXtk6Z6gfnIG65URm3REhs+T5wPrI66YnDKgarBaVbMXgHo
         hPwtcGMul0jOaRigNCg9cSRUb2qNDklVXyy6G2HrhM6yjabhfh4/yi99ecQDuBELhVuG
         N4oIwReRmtranj2EL1VepAPoZiOTS2clv8B1F7IcfjrO/8gVlXm38iZZRnGNYKsp5Mf/
         yJmEK5JunsgluNwEkzWNivBfMRu47Xbb44ka1mL9v0fzA4NX3z8uIKp6GZDwrgOgolEb
         0r05koOV7Y7XFFWvHvAACD/KdCGWgp3OLyqxCuIVA+FiFBweRlmuUNpW0NYRQyZ13n/U
         lseQ==
X-Gm-Message-State: APjAAAWei0K/BfnygqqBnG4y1Ofgq6vqQNn/BKnyFC99OyGvYHuaT06d
        CurnlTYhVellzcTalCDQfg==
X-Google-Smtp-Source: APXvYqzsZncJeOkIGZCFFf85Cr89J0uYfd90yKvsRDYwFdeZQ5fBsMc84Nw4AHv7I6cSQQVxvqdMqQ==
X-Received: by 2002:aca:1703:: with SMTP id j3mr5091232oii.94.1572049344641;
        Fri, 25 Oct 2019 17:22:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p184sm1062879oia.11.2019.10.25.17.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:22:24 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:22:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: serial: sh-sci: Document r8a77961
 bindings
Message-ID: <20191026002223.GA14822@bogus>
References: <20191023123010.12501-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023123010.12501-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Oct 2019 14:30:10 +0200, Geert Uytterhoeven wrote:
> Document support for the SCIF and HSCIF serial ports in the Renesas
> R-Car M3-W+ (R8A77961) SoC.
> 
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Split v1[1] in per-subsystem series,
>   - Add Reviewed-by,
>   - Update R-Car M3-W references.
> 
> [1] "[PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+"
>     https://lore.kernel.org/linux-renesas-soc/20191007102332.12196-1-geert+renesas@glider.be/
> ---
>  .../devicetree/bindings/serial/renesas,sci-serial.txt       | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
