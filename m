Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 854961702B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 16:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgBZPhN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 10:37:13 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33054 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgBZPhM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 10:37:12 -0500
Received: by mail-ot1-f65.google.com with SMTP id w6so3363006otk.0;
        Wed, 26 Feb 2020 07:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hcKIlqG1W7ZtjQY5cPEhLrynFiA6MCXILdK27XGgexo=;
        b=huMkTQdYKQqMrvzWe8x79/t6GsTzR5VTHAOVtl6yiaROw5KbAWvN5wl7JWYUZugdy6
         DP5vpC2VaL9U9wSQhJikw7sT3+Sue85uabXcg+PT7Q7qwweK+YfirGaxcp9GFArMegHK
         sDiyKMihOrvRWUGOuc0QBt1tWDL9JGzPewaJS551DbleMhmM2VsbtjM8ID2hkSIoh3da
         Dktj5owGpFDWOno4ay7HLZZyHjFUZbT6ceYBTiRGHxukTAmMp/gLj+OaFpqdHmgIwUN3
         +sNhtdUh5DjmWdvr0SPKjdLfLTRfjxUZqLGCpRw8bLvQJf+8V8EN3ul79varXgc/1Hz0
         O0IA==
X-Gm-Message-State: APjAAAUPTpma7v2DwSDD+X63+baRFMpdOVomZas0XztjIn1gSYpy2OWd
        VohxiAYxu+zi4ld1BcqZMw==
X-Google-Smtp-Source: APXvYqxp0SJ3SlDcqPsMyMYHwLhfGDRtCAb5+Y3EhiDh2PSejqz1Wa1ZH5aChoreYGJmX0t0CiahJw==
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr3493743otk.145.1582731431908;
        Wed, 26 Feb 2020 07:37:11 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t20sm899316oij.19.2020.02.26.07.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 07:37:10 -0800 (PST)
Received: (nullmailer pid 16730 invoked by uid 1000);
        Wed, 26 Feb 2020 15:37:10 -0000
Date:   Wed, 26 Feb 2020 09:37:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jens Axboe <axboe@kernel.dk>, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: ata: rcar-sata: Convert to json-schema
Message-ID: <20200226153710.GA16620@bogus>
References: <20200219154146.11230-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219154146.11230-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 19 Feb 2020 16:41:46 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Serial-ATA Device Tree binding documentation
> to json-schema.
> 
> While at it:
>   - Remove the deprecated "renesas,rcar-sata" compatible value,
>   - Add "iommus", "power-domains", and "resets" properties,
>   - Update the example.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not having to care about the deprecated value simplifies the
> jscon-schema.
> ---
>  .../bindings/ata/renesas,rcar-sata.yaml       | 71 +++++++++++++++++++
>  .../devicetree/bindings/ata/sata_rcar.txt     | 36 ----------
>  2 files changed, 71 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ata/sata_rcar.txt
> 

Applied, thanks.

Rob
