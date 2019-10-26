Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3270E577E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2019 02:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfJZASe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 20:18:34 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37962 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfJZASe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 20:18:34 -0400
Received: by mail-oi1-f195.google.com with SMTP id v186so2754554oie.5;
        Fri, 25 Oct 2019 17:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZcBWB/9OXByjWgg+0ici5N1vc45mNqFyMoj1HNZBt9w=;
        b=dOUUqk6rxr7B1fVFtw180256WYb7C5+93oxOhpmgtSFkrae4NP1lZvGBj9pndURQkg
         2zN8YTavOzVIG7NEfpDPptGp4ErpkJ31UueOdJKdNaclI8krSVYKctD0H1NgRRJeT77I
         pDcd+tfoKepPwH6xefs5qLPjs3bul1tBnCW8FO5HRZUKUh2JyYW4kigfL3YWzBNxd3a6
         cDIYGZ+fNsHH8qeQ1/5wt2T8vbc9Z/nWP6FFbiVOV/JTVvslNCDfj5sjpP7g1yhazVxE
         X3/tEEV6bV83aatGRv9LQs+S481hrCLpweiJLS0gCL8h7QFRSF0j2WK4UTfSz/Ygok6P
         l7Yw==
X-Gm-Message-State: APjAAAUITepYvV4aGaLJOm4cJbMrdiXFIB1xLoHv7rRp9J8pV+j3mBYR
        2sw2gTONBIe9+Gcnn3V7Gw==
X-Google-Smtp-Source: APXvYqx3oUO4oNfBdzB9u9Ae7iZAZSs95iUj5G8vBiNU+psEQYcPQU2Ypz4p/Kcij37YUEfpJrgwxQ==
X-Received: by 2002:aca:1a18:: with SMTP id a24mr5250274oia.145.1572049113228;
        Fri, 25 Oct 2019 17:18:33 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l12sm1003847oii.48.2019.10.25.17.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:18:32 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:18:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 5/5] dt-bindings: power: Add r8a77961 SYSC power
 domain definitions
Message-ID: <20191026001832.GA8675@bogus>
References: <20191023122911.12166-1-geert+renesas@glider.be>
 <20191023122911.12166-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191023122911.12166-6-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Oct 2019 14:29:11 +0200, Geert Uytterhoeven wrote:
> Add power domain indices for the R-Car M3-W+ (R8A77961) SoC.
> 
> Based on Rev. 2.00 of the R-Car Series, 3rd Generation, Hardware User’s
> Manual (Jul. 31, 2019).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  include/dt-bindings/power/r8a77961-sysc.h | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 include/dt-bindings/power/r8a77961-sysc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
