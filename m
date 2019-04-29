Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D42E9AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 20:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbfD2SFH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 14:05:07 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43493 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2SFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 14:05:07 -0400
Received: by mail-oi1-f194.google.com with SMTP id t81so9047140oig.10;
        Mon, 29 Apr 2019 11:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MBmrgf4Nk6Wsq2ynL388VBYKoBqt1iWdLg4XBiTSBEQ=;
        b=pdYN1Foyu0UvhBOUEFK0KYZff/QmQ35BxnewTHi3oeZYechBjwzyl5d/bHetDHoDwn
         1eibkxLzGDBXgvJkm8HJCmulX9yb3etwPn3UazJ4Fsr33HkM7UwRwVdCngZzIO/9gjW3
         3tLvlY421dSjnPkqg9FbHiN1Jb7n9YT7goxALlro44O0yQS8CUy7lQB6DViSzffCO/6y
         yiooIovePRGloNYYFANLQeQHaEKdzmk1cYRcX9b2St9yxibH/QqoFX+8Ecf1nqkY1PiP
         0LZvHFX1i4lJZGtz3BTo9ufJLDroc5RTmBuUe2L3c+gKNG9k9I5DueU/gz8rBGNM2oxO
         GKgA==
X-Gm-Message-State: APjAAAV+pQMeOo0v+InkJ33W4yi20E8hoKkvIWwz21pZnFK1RyYjJlUR
        uKWzh1fpLnr3vW2o58HL/g==
X-Google-Smtp-Source: APXvYqzohR0qu1DJb14Iy9TNkz+zwg45aoTc/wwVvXuOJN0m0J0U5D7U4Q3urznoe9yfV680v78G0w==
X-Received: by 2002:a54:488a:: with SMTP id r10mr228662oic.95.1556561106421;
        Mon, 29 Apr 2019 11:05:06 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j7sm13626848otr.50.2019.04.29.11.05.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:05:05 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:05:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: Re: [PATCH v2 17/20] dt-bindings: pwm: Document r8a77470 bindings
Message-ID: <20190429180504.GA24170@bogus>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-18-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-18-git-send-email-cv-dong@jinso.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Apr 2019 16:54:19 +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
