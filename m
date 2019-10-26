Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61C51E5779
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2019 02:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfJZAR6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 20:17:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39278 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfJZAR6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 20:17:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id s22so3238396otr.6;
        Fri, 25 Oct 2019 17:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iSzDrVoqrHUXpxhq0CUJD5PvUFCtwOZDkPzXxXOj7UY=;
        b=S6xGC6WjkIGTpcCkVl1YUWq3A1P0/uVbZxEJ6rD8QU49xy9vKSJvlSrt6FT4yc7U/N
         jYFTPv9AqwOR5Wx0YAlwYtvULZd4DUYcOJvj3jwiJ63P/fABERNet8EEYNvIcQkoW5sN
         MSTaU8K+6Ore6leEJRMiT9KF6rerfEtxGWVsNT2Ffj6APl1hfXez7mUAyt/bmHC9h4fn
         4EdelEG7S1YQH6pfTAvbbORRJ2WxhYFCOmBoIR11s35xBSULgOmxP6Dh5ujp4K9Cd1sY
         IuFnGFq+Ly+4y5XrPq66n1xzg1nY2HR3si+BDNGrOseTp1fUFpDFlNoVVEd1z83pGJ26
         Zhww==
X-Gm-Message-State: APjAAAU9MnLSeaLyV5QMJLH5XPla/YBTJqHie4On9KzvuoTM3+dfSpa5
        yYHxWdDEv9c9SR/SG8dIyQ==
X-Google-Smtp-Source: APXvYqwr331z8ys+D6w3OJ2WrCPo+IcU7ON1CRtPKaOaqLH/cCD4TjV10X9neV6Ah8fSUzOkO/PO+A==
X-Received: by 2002:a9d:3df7:: with SMTP id l110mr4679151otc.245.1572049075529;
        Fri, 25 Oct 2019 17:17:55 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s194sm1021099oie.19.2019.10.25.17.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:17:55 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:17:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/5] dt-bindings: reset: rcar-rst: Document r8a77961
 support
Message-ID: <20191026001754.GA7560@bogus>
References: <20191023122911.12166-1-geert+renesas@glider.be>
 <20191023122911.12166-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023122911.12166-4-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Oct 2019 14:29:09 +0200, Geert Uytterhoeven wrote:
> Add DT binding documentation for the Reset block in the Renesas R-Car
> M3-W+ (R8A77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
