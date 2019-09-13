Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B391B1CC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 14:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbfIMMCW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 08:02:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:58562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbfIMMCW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 08:02:22 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3842F208C0;
        Fri, 13 Sep 2019 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568376141;
        bh=f1icbhyLjDTw18ni73/UkubJFKFg7NU5Nz1H8j36deE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=khu/4l2AR5/wD9c4lxk37FnlVEsQufdiq4tIoPbX/mbmqLoivPTrDckQ5K0AM8B/A
         qGBbzduXGLgm99Tx8CRhEfz9BYzBOFuzbDV/fjA9fO+SOHZ7pEVXjpQTxRa6aCu7Lf
         0G0jf/JZDmg3q6N7Jg3Xf7CgxeGxsw1F/cOZVYJ0=
Received: by mail-qt1-f175.google.com with SMTP id n7so33551408qtb.6;
        Fri, 13 Sep 2019 05:02:21 -0700 (PDT)
X-Gm-Message-State: APjAAAWJsCZLeG1+zFwOen/Di4KSPc/kq0XPVlICrbrGgz3WxahJ3hP9
        3aLN6D3Q8O1WI+ohAXyitzADBxbtALjTr2Kc2g==
X-Google-Smtp-Source: APXvYqxhImx0WCWl6gHAKAv4CO2JaiSe49Yyuisx+y0vlZXmgIej0DwlltGO3tbu29OwjF0BKoB68pGatJWBjYAsUlY=
X-Received: by 2002:ac8:6941:: with SMTP id n1mr2485052qtr.143.1568376140388;
 Fri, 13 Sep 2019 05:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190908120528.9392-1-horms+renesas@verge.net.au>
In-Reply-To: <20190908120528.9392-1-horms+renesas@verge.net.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Sep 2019 13:02:08 +0100
X-Gmail-Original-Message-ID: <CAL_JsqLN66LK3=4K9dLtHWd=nOAJ7ofKH6TKp058gqOV32rj8g@mail.gmail.com>
Message-ID: <CAL_JsqLN66LK3=4K9dLtHWd=nOAJ7ofKH6TKp058gqOV32rj8g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: renesas: Convert 'renesas,prr' to json-schema
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Sep 8, 2019 at 11:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Convert Renesas Product Register bindings documentation to json-schema.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> Tested using:
>   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/renesas,prr.yaml
>
> v2
> * Use simple enum for compat values
> * Drop "" from compat values
> * Only supply 'maxItems' property to 'reg'
> ---
>  .../devicetree/bindings/arm/renesas,prr.txt        | 20 -------------
>  .../devicetree/bindings/arm/renesas,prr.yaml       | 35 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
