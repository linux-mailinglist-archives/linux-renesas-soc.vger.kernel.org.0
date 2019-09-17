Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83895B4E66
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbfIQMsb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 08:48:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:42546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727698AbfIQMsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 08:48:31 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1361E21881;
        Tue, 17 Sep 2019 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568724510;
        bh=ccmEI6jZEd0dOUV90lbi49MGNfgvUALxit4VtkX8yr8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zuYtax/u6DxLdcesja2Bzozu71Z59ywEVfBi8wEzD6d4cIJLifBIOluvDQIwMnn32
         uvbLpNEZ4qkRfT5wFMRiR9TjNgCDopsPFTSFq62J6vBDg8GroEDyM3V+IxlMxkU+jv
         /pl7BNcxp1Hf+J3szEULioPAf2sCsIAKck+brZE4=
Received: by mail-qt1-f171.google.com with SMTP id j1so4256105qth.1;
        Tue, 17 Sep 2019 05:48:30 -0700 (PDT)
X-Gm-Message-State: APjAAAWPvPXFdHPAPzLQdHSHt7BWr6FHewRkbbXlskTsHRDiougzP3ab
        h8YmBoXtxKPguPRMizUdgFcH1KY+/uBrVVddIQ==
X-Google-Smtp-Source: APXvYqyr4Sa3bzrHc9k8TKTb9uIVN+/yUg2kGr/uVQsXPc/jXmcL9I6oVZNUR0qdtqJ7ccPbnmXjS/UzryFxdZb5mwM=
X-Received: by 2002:ac8:100d:: with SMTP id z13mr3425109qti.224.1568724509250;
 Tue, 17 Sep 2019 05:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au> <20190917112937.g3jna2kc7rw7zynd@verge.net.au>
In-Reply-To: <20190917112937.g3jna2kc7rw7zynd@verge.net.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 17 Sep 2019 07:48:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmfrPZA7=uWG_DOOzFsLsHeg2=+86d_91mnmyv9UeLJg@mail.gmail.com>
Message-ID: <CAL_JsqJmfrPZA7=uWG_DOOzFsLsHeg2=+86d_91mnmyv9UeLJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to json-schema
To:     Simon Horman <horms@verge.net.au>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 6:29 AM Simon Horman <horms@verge.net.au> wrote:
>
> On Mon, Sep 16, 2019 at 05:33:56PM +0200, Simon Horman wrote:
> > Convert Simple Power-Managed Bus bindings documentation to json-schema.
> >
> > As a side effect of this change only simple-pm-bus is used in example. A
> > follow-up patch will provide an example for the separately documented
> > Renesas Bus State Controller (BSC) that uses "renesas,bsc-sh73a0" and
> > "renesas,bsc" compat strings.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > * Tested using:
> >   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> >   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> > ---
> >  .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 --------------
> >  .../devicetree/bindings/bus/simple-pm-bus.yaml     | 68 ++++++++++++++++++++++
> >  2 files changed, 68 insertions(+), 44 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
> >  create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.txt b/Documentation/devicetree/bindings/bus/simple-pm-bus.txt
> > deleted file mode 100644
> > index 6f15037131ed..000000000000
> > --- a/Documentation/devicetree/bindings/bus/simple-pm-bus.txt
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -Simple Power-Managed Bus
> > -========================
> > -
> > -A Simple Power-Managed Bus is a transparent bus that doesn't need a real
> > -driver, as it's typically initialized by the boot loader.
> > -
> > -However, its bus controller is part of a PM domain, or under the control of a
> > -functional clock.  Hence, the bus controller's PM domain and/or clock must be
> > -enabled for child devices connected to the bus (either on-SoC or externally)
> > -to function.
> > -
> > -While "simple-pm-bus" follows the "simple-bus" set of properties, as specified
> > -in the Devicetree Specification, it is not an extension of "simple-bus".
> > -
> > -
> > -Required properties:
> > -  - compatible: Must contain at least "simple-pm-bus".
> > -             Must not contain "simple-bus".
> > -             It's recommended to let this be preceded by one or more
> > -             vendor-specific compatible values.
> > -  - #address-cells, #size-cells, ranges: Must describe the mapping between
> > -             parent address and child address spaces.
> > -
> > -Optional platform-specific properties for clock or PM domain control (at least
> > -one of them is required):
> > -  - clocks: Must contain a reference to the functional clock(s),
> > -  - power-domains: Must contain a reference to the PM domain.
> > -Please refer to the binding documentation for the clock and/or PM domain
> > -providers for more details.
> > -
> > -
> > -Example:
> > -
> > -     bsc: bus@fec10000 {
> > -             compatible = "renesas,bsc-sh73a0", "renesas,bsc",
> > -                          "simple-pm-bus";
> > -             #address-cells = <1>;
> > -             #size-cells = <1>;
> > -             ranges = <0 0 0x20000000>;
> > -             reg = <0xfec10000 0x400>;
> > -             interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> > -             clocks = <&zb_clk>;
> > -             power-domains = <&pd_a4s>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> > new file mode 100644
> > index 000000000000..72a3644974e3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> > @@ -0,0 +1,68 @@
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Simple Power-Managed Bus
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description: |
> > +  A Simple Power-Managed Bus is a transparent bus that doesn't need a real
> > +  driver, as it's typically initialized by the boot loader.
> > +
> > +  However, its bus controller is part of a PM domain, or under the control
> > +  of a functional clock.  Hence, the bus controller's PM domain and/or
> > +  clock must be enabled for child devices connected to the bus (either
> > +  on-SoC or externally) to function.
> > +
> > +  While "simple-pm-bus" follows the "simple-bus" set of properties, as
> > +  specified in the Devicetree Specification, it is not an extension of
> > +  "simple-bus".
> > +
> > +
>
> There is an extra blank line above, I will plan to remove it in v2.
>
> > +properties:
> > +  compatible:
> > +    items:
> > +       - const: simple-pm-bus
>
> The following patch, for Renesas BSC, also
> describes the simple-pm-bus but also requires other compatible
> strings to be present.
>
> In order to facilitate that I tried the following:
>
>    compatible:
>       contains:
>          const: simple-pm-bus
>       additionalItems: true
>
> This allows make dtbs_check DT_SCHEMA_FILES=.../simple-pm-bus.yaml to pass
> in cases where there are more compat strings pesent. However
> make dtbs_check DT_SCHEMA_FILES=...renesas,bsc.yaml (schema file
> introduced in following patch) fails in the case
> where the only compat string is simple-pm-bus.
>
> make dtbs_check DT_SCHEMA_FILES=...renesas,bsc.yaml also fails
> due to the reg property not being present for the same compat case,
> which should be valid according to simple-pm-bus.yaml.
>
> Does anyone have any guidance on how to proceed?

You'll need a custom 'select' in renesas,bsc.yaml that leaves out
"simple-pm-bus". See "panel-lvds" users in linux-next for an example.

Rob
