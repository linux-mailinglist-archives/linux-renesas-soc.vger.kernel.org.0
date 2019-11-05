Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 797CEF09A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 23:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730288AbfKEWhj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 17:37:39 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40225 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbfKEWhj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 17:37:39 -0500
Received: by mail-oi1-f195.google.com with SMTP id 22so1028465oip.7;
        Tue, 05 Nov 2019 14:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nbKHG86LzZlxwoKnR97qbypsL1NkCZGHjQPZhUanUA4=;
        b=uSQEAKj2aqIgG0HJbna1e4YmKLyGevOCDJM4mqVvGzdL+tCeZCZU/xkIj2+X+8jboX
         BDf42FWbyBB4+sc1UAJb5V5lxBT1B9yt2wmQC4sHSX7lnX2dOcQjOU6JEGxEoPt4CD49
         KOIyZdb9yRP2rFODfI/ebec4agPPuaa8noKblNXd/afKMKRwQ0rVUwiYXtuYsnIwJGlW
         3tJcx6ZCLRYkGq0S1qD+f2jHB2dh8gd11kqSUg5R1WYpM0kbYZ4PT+Yzq1q1paM40q5I
         gWKdZhB7Wck0Gb2Jba2/Q/f69SySQVhFoiCarjAoPJgk4jaqMqPbpMvoct5+7cQMB8hH
         IhkA==
X-Gm-Message-State: APjAAAXoQCSL9JOk8+Nu8l+qI7ZQSrTzIhMfC/TOl2JkZyn2ucsY5K1p
        R1rbaPxe0Qozwsx6pzwpwQ==
X-Google-Smtp-Source: APXvYqz/0u5EkETPDQJCSuiCrk2ylp+eiSvWOJ21L3fbwB2gfnoPnR4+1XbwIlYB4aFF60Tshnhbhw==
X-Received: by 2002:a05:6808:4cf:: with SMTP id a15mr1179064oie.132.1572993458395;
        Tue, 05 Nov 2019 14:37:38 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 38sm7022139otr.7.2019.11.05.14.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 14:37:37 -0800 (PST)
Date:   Tue, 5 Nov 2019 16:37:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2] dt-bindings: phy: renesas: usb3-phy: convert bindings
 to json-schema
Message-ID: <20191105223736.GA20526@bogus>
References: <1572592771-12444-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572592771-12444-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri,  1 Nov 2019 16:19:31 +0900, Yoshihiro Shimoda wrote:
> Convert Renesas R-Car generation 3 USB 3.0 PHY bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Remove oneOf from compatible.
>  - Make renesas,ssc-range values a schema.
>  https://patchwork.kernel.org/patch/11197807/
> 
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 52 ---------------
>  .../devicetree/bindings/phy/renesas,usb3-phy.yaml  | 78 ++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
