Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B89A2207AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 10:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbgGOIns (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 04:43:48 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39018 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729466AbgGOIns (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 04:43:48 -0400
Received: by mail-oi1-f196.google.com with SMTP id w17so1629890oie.6;
        Wed, 15 Jul 2020 01:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBSjJT0ORrybEKumemGZpkTJ/Tv11w9vz0K05d4A6Os=;
        b=CbIvxwbN3InWD5iqe3TXYMPN0UDxbl8A+hNhBd1LmaJF2YeZOQcYUKRqFJcY8e1dm1
         PTgb8OtSFnufGOJ879bfwEDEmsihs/vr96qon30UoDcplUgfYnoWg8ZcdKvLZZCBfm04
         a9jZRhyDA5V2P5DntpD3xL5ezyYuDl3iHgiKBNbpHwg2TVPp4tgGTwYjUnJEQ1ZPfKVm
         JaG9E+JFFTGY0pgbrafVs0hPcLvaUUdqwKusV+2Ue8+9zUC3oZhffc6Q2Vqtx6joVDTU
         ww3nwTXqJVWdluxkJJ/+wZ0sf/cXHO3FDJ7UE5dJKdZpNk1yiZTQsbOWBdyuYY75zr7u
         v0ow==
X-Gm-Message-State: AOAM532mPUm0wiPNiWb9PTI4QnH6d//rAT8s4nY6SkvEIA6tmqjyYrLe
        Qrsoh9WwHdVOIwrgzz0waV/UBVDb/0laCC7upnA=
X-Google-Smtp-Source: ABdhPJw86hPfeV6CTJ8KN+UQ+NcI3bICPWChvBe3FWmE48Q4aabU0FIIinMm3s5aHvZ94WJeCrwGRqzFJIK4nhKEjXM=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr6957983oih.54.1594802626935;
 Wed, 15 Jul 2020 01:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com> <1567584941-13690-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567584941-13690-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 10:43:36 +0200
Message-ID: <CAMuHMdVZkjGDFmeQ9XkOqq-ogfSZz99hd0=N-OYLai4UEzKwAQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 1/3] dt-bindings: usb: hd3ss3220 device tree
 binding document
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Sep 4, 2019 at 10:22 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add device tree binding document for TI HD3SS3220 Type-C DRP port
> controller driver.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> @@ -0,0 +1,38 @@
> +TI HD3SS3220 TypeC DRP Port Controller.
> +
> +Required properties:
> + - compatible: Must be "ti,hd3ss3220".
> + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> + - interrupts: An interrupt specifier.
> +
> +Required sub-node:
> + - connector: The "usb-c-connector" attached to the hd3ss3220 chip. The
> +   bindings of the connector node are specified in:
> +
> +       Documentation/devicetree/bindings/connector/usb-connector.txt
> +
> +Example:
> +hd3ss3220@47 {
> +       compatible = "ti,hd3ss3220";
> +       reg = <0x47>;
> +       interrupt-parent = <&gpio6>;
> +       interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +       connector {
> +               compatible = "usb-c-connector";
> +               label = "USB-C";
> +               data-role = "dual";
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@1 {

This does not comply with
Documentation/devicetree/bindings/connector/usb-connector.yaml:

    connector: ports: 'port@0' is a required property

> +                               reg = <1>;
> +                               hd3ss3220_ep: endpoint {
> +                                       remote-endpoint = <&usb3_role_switch>;
> +                               };
> +                       };
> +               };
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
