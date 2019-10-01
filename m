Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5690EC437F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 00:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbfJAWJR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 18:09:17 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43856 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728710AbfJAWJR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 18:09:17 -0400
Received: by mail-io1-f65.google.com with SMTP id v2so52067072iob.10;
        Tue, 01 Oct 2019 15:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=U4OWAFEQLW6b9N1YY0prJ3SjNTSoPmn4OGrHPW2UzHA=;
        b=RN2VK1ukVv7ABSvyLEgMs+8E4uKfSRMoh7LTOU6HcdVIEdT4Sv6dg4smy0KiL0oxv3
         2Qx5NCdoBMOmBpEzEsYgYKcKC6Q7ZC+OLdAcwiOBwFJ+0/IlWpBopvsdjOgais9xqYts
         eUvsySbaW/nAfCsbOJuwT33h46vo2L/uASmSZ/PpO2bqHmK8jdWyuO9xOk8NTXQya72h
         Bskn00/OMkdzbfh3yPRdX7vyOBJ2eyzPgAnPYd2SdDxobb0cNgYqzxhAZnMcIShrBKq0
         XZARwMCgjWUurBMv9Khtr1hmUturPE7Uwe6iq3Y/1Kyw7b2RlVyR7kTpmdeNNB2qM+t1
         T1Sg==
X-Gm-Message-State: APjAAAXbUQREiiGiA62gwP1reIO4pVxQoDoKObvM+9d9SEE9eaADjSdX
        /QChJe0yUtT8IihQ9mCcZkjXpYg=
X-Google-Smtp-Source: APXvYqzj96lhqfK/RT4uKTa2a91eNYEo6Hdeqnb3Hpo5Ktod56yYovBMT5FYf3ooq7j2vSy+TzZpdw==
X-Received: by 2002:a6b:f312:: with SMTP id m18mr444920ioh.210.1569967756377;
        Tue, 01 Oct 2019 15:09:16 -0700 (PDT)
Received: from localhost ([2607:fb90:1780:6fbf:9c38:e932:436b:4079])
        by smtp.gmail.com with ESMTPSA id x2sm7405295iob.74.2019.10.01.15.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 15:09:15 -0700 (PDT)
Message-ID: <5d93ce8b.1c69fb81.bcda6.8b57@mx.google.com>
Date:   Tue, 01 Oct 2019 17:09:13 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pwm: renesas: pwm-rcar: convert bindings to json-schema
References: <1569008127-10555-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1569008127-10555-1-git-send-email-ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 21 Sep 2019 04:35:27 +0900, Yoshihiro Kaneko wrote:
> Convert Renesas R-Car PWM Timer Controller bindings documentation to
> json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>  .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   | 40 -----------
>  .../devicetree/bindings/pwm/renesas,pwm-rcar.yaml  | 77 ++++++++++++++++++++++
>  2 files changed, 77 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
> 

Applied, thanks.

Rob

