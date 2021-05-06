Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D935375C61
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 May 2021 22:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhEFUsI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 May 2021 16:48:08 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:41793 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhEFUsH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 May 2021 16:48:07 -0400
Received: by mail-oi1-f169.google.com with SMTP id c3so6669477oic.8;
        Thu, 06 May 2021 13:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CLFolu7QirLVprzHYNiwy2gCVRiJseKE7T5kor/MGs0=;
        b=NbbHZorvgu1cLWlYbd05vLNY4ts1A0IOSPXBGZydiW2DDWgNmqPOmhPskDUj+TALbt
         8owfOUp0ZOUM/lX7ApiiPaIi8gKk8c5Ds1U/gjpmklPTHv3EWmCtEMxAFGrWgNo5oPYR
         jUS2z902Fxxkv1mo1suIbTG0WNLu+MtyXeAOpTyNYJR0++GxvLPZ+k1fy7G+iEoI75N6
         Tdau8NeGNiQXrmTSpRhLLY0L9o4yXr3OLyvCd8cyBBBxe2W5WSJD6x/8a+9ikB+eo3gV
         XQhsZc/EoCYKsDR3fuoKfych7GSWTi2AibIV3UVjXLu8Hmu/GhnQDbR3ko0IKEO8Aj/4
         FyVA==
X-Gm-Message-State: AOAM533nUJ/1P5maWLtkJaznfYTm/FIN1T6H57wz7j63R1Uiut2mfZpi
        3g5NEroLo9tTjOUET6GKzP3WBxPHCg==
X-Google-Smtp-Source: ABdhPJw60LfsZQF6996NHXGYPkwTbLHbVoQj1Nme5bRtcrA6Vi2+cJfzjIVsCQz/kkRVuIWrTol+Rg==
X-Received: by 2002:aca:4887:: with SMTP id v129mr4463229oia.137.1620334028936;
        Thu, 06 May 2021 13:47:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v1sm769289ott.32.2021.05.06.13.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:47:06 -0700 (PDT)
Received: (nullmailer pid 774883 invoked by uid 1000);
        Thu, 06 May 2021 20:47:05 -0000
Date:   Thu, 6 May 2021 15:47:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: renesas,r9a06g032-sysctrl: Convert
 to json-schema
Message-ID: <20210506204705.GA774834@robh.at.kernel.org>
References: <24d1bd7c4c46747f4e2828974c2e2e48e778bff8.1620119439.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24d1bd7c4c46747f4e2828974c2e2e48e778bff8.1620119439.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 04 May 2021 11:12:31 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas RZ/N1D (R9A06G032) System Controller (SYSCTRL)
> Device Tree binding documentation to json-schema.
> 
> Drop the consumer example, as it doesn't belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../clock/renesas,r9a06g032-sysctrl.txt       | 46 --------------
>  .../clock/renesas,r9a06g032-sysctrl.yaml      | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
> 

Applied, thanks!
