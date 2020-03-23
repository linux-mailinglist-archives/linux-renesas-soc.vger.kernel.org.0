Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F3218FDB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 20:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgCWTcB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 15:32:01 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:33881 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbgCWTcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 15:32:01 -0400
Received: by mail-io1-f65.google.com with SMTP id h131so15653216iof.1;
        Mon, 23 Mar 2020 12:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0MDlKVmFDFeK7P3YRteRNCfE4CfAxiIiNiqTrc7njOI=;
        b=Tma+pRwdvq7jO51j3W5CzV4LznnZohbB/6BqnKLJg5tGnEQCtDfogSr817svHDD0YR
         H3fPc+B3DxKbkgsaQPmUPO/LQK5eldX5GoxC1aQLjMdCbozeh3uA5f62+Z9eZBXkLbrm
         7NRjb2c5/kN0v2aPi//isM0DbH7NSf2/9A7QozVyhuxSo80KS9ZFY1j3OD95DrBcAifX
         Kr/F20IbY9glNx1HeBC0lwKOILDnofPHNJDdgU+8TbyOhgy88BI5eNqf8AqfsyGLPwVg
         BiKE4nxdtnOKNJcazmNHV9rjXxlDQwDBZrMMMkcJ6xA+EIM8quI7hrpCEN19xfoT/Exs
         XyRQ==
X-Gm-Message-State: ANhLgQ0bAORrRhdx/cG/rofPbCaVszILu6psdREVF36dEAPDYC2JN99Z
        h4sPFH/9almQmnB6KAwiWw==
X-Google-Smtp-Source: ADFU+vtgPRFhzEGZTjn/QqeHhczyLZnUPLz+Yay7Mh21i8X53+Xpmbb90LREW9wCJCCgv8OeUfh85g==
X-Received: by 2002:a02:ca55:: with SMTP id i21mr20535122jal.118.1584991920879;
        Mon, 23 Mar 2020 12:32:00 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t86sm5520999ili.82.2020.03.23.12.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 12:32:00 -0700 (PDT)
Received: (nullmailer pid 32114 invoked by uid 1000);
        Mon, 23 Mar 2020 19:31:57 -0000
Date:   Mon, 23 Mar 2020 13:31:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sean Wang <sean.wang@mediatek.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: Convert generic bindings to
 json-schema
Message-ID: <20200323193157.GA8470@bogus>
References: <20200306090046.8890-1-geert+renesas@glider.be>
 <20200306090046.8890-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306090046.8890-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri,  6 Mar 2020 10:00:45 +0100, Geert Uytterhoeven wrote:
> Convert the generic serial interface Device Tree binding documentation
> to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Update references to serial.txt,
>   - Fix nodename pattern,
>   - Add missing maxItems to *-gpios,
>   - Express that uart-has-rtscts and [cr]ts-gpios are
>     mutually-exclusive,
>   - Drop examples.
> ---
>  .../bindings/serial/fsl-imx-uart.txt          |  2 +-
>  .../bindings/serial/renesas,sci-serial.txt    |  4 +-
>  .../devicetree/bindings/serial/serial.txt     | 56 ---------------
>  .../devicetree/bindings/serial/serial.yaml    | 71 +++++++++++++++++++
>  4 files changed, 74 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/serial.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/serial.yaml
> 

Applied, thanks.

Rob
