Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 849874187D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 00:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436972AbfFKW5T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 18:57:19 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:39203 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436793AbfFKW5T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 18:57:19 -0400
Received: by mail-it1-f195.google.com with SMTP id j204so7546100ite.4;
        Tue, 11 Jun 2019 15:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=grKmCXxGy1i4B/yLN1jR++efXaP6K2Z8kYYVl2A1dxI=;
        b=P95OKKqu8OrZkExBDNopuBFQNSCcrDMYhXbDy6aatYkCMThNwHtfoSFfPmVMztUicz
         NlQ/5dO4P18LjjYLoxRFNDXrRQ4Rw4PZDwLI7IinQkF7rTKfPhaxXLyAfIARVbtldowc
         nYOoKjwAl04dAvIqTKzQ3byqO7346MQCc36wyNs4336TlF4r5lBvc0Lv+cxOj0rEp0U5
         pSK8aBduM+J2dEEuWOTfTUlKjbr2GqZrxDjI4K1kAwUVrrrjXjiv2NhV+a31og9zjyt4
         Hwj3Mgq/k+Br08P1ekw0TyKScnrp/tvPginu2c5s4G+A/ZA8WrPMVSn32TZcZfvHwZjP
         6LQw==
X-Gm-Message-State: APjAAAXaC6+1xrcR5puwEV/d26KNPGVAeReF2bm1tR9J/J5vodY0QYK4
        zGLecGXB36f7suWlCGzk2Q==
X-Google-Smtp-Source: APXvYqwT8uYEMg+kMVmtj5ABSGKwbpnRHmB8C+/X7mKXTCV3Kub3hF8yvzhLe7Pmhr2rwqzF2IOTuw==
X-Received: by 2002:a24:a303:: with SMTP id p3mr19505197ite.128.1560293838305;
        Tue, 11 Jun 2019 15:57:18 -0700 (PDT)
Received: from localhost (ip-174-149-252-64.englco.spcsdns.net. [174.149.252.64])
        by smtp.gmail.com with ESMTPSA id u187sm5500574iod.37.2019.06.11.15.57.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 15:57:17 -0700 (PDT)
Date:   Tue, 11 Jun 2019 16:57:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 2/7] dt-bindings: usb: renesas_usb3: Document usb role
 switch support
Message-ID: <20190611225710.GA28189@bogus>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559296800-5610-3-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 31 May 2019 10:59:55 +0100, Biju Das wrote:
> Update the DT bindings documentation to support usb role switch
> for USB Type-C connector using USB role switch class framework.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V6-->V7
>   * Incorporated shimoda-san's review comments.
>     (https://patchwork.kernel.org/patch/10944631/)
>  V5-->V6
>   * Updated description
>   * Added usb-role-switch-property
>  V4-->V5
>   * No Change
>  V3-->V4
>   * No Change
>  V2-->V3
>   * Added optional renesas,usb-role-switch property.
>  V1-->V2
>   * Added usb-role-switch-property
>   * Updated the example with usb-role-switch property.
> ---
>  .../devicetree/bindings/usb/renesas_usb3.txt       | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
