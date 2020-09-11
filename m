Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135662675BF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Sep 2020 00:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgIKWPc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 18:15:32 -0400
Received: from mga02.intel.com ([134.134.136.20]:45858 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgIKWPa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 18:15:30 -0400
IronPort-SDR: WO3fhU+NFCYrq4t4I1ElNFnOH6UtAk2xWwGAUSt9LVrg43/uZP9ai5znkapWAT4NKOPXwg0jaW
 D2CIDSWY9/vg==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="146559473"
X-IronPort-AV: E=Sophos;i="5.76,417,1592895600"; 
   d="scan'208";a="146559473"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 15:15:25 -0700
IronPort-SDR: kmFJxvBTb2R6UsMBIacGJvn9dL/oIYsNMI6ZYWtySLw+ezt7gGxaFWVxfbx31EW/XhqQZL/+Ok
 ZW+9zuQ3DCfg==
X-IronPort-AV: E=Sophos;i="5.76,417,1592895600"; 
   d="scan'208";a="342433866"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 15:15:21 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4CC84206EA; Sat, 12 Sep 2020 01:15:17 +0300 (EEST)
Date:   Sat, 12 Sep 2020 01:15:17 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: media: imx274: Convert to json-schema
Message-ID: <20200911221517.GJ26842@paasikivi.fi.intel.com>
References: <20200910162009.613976-1-jacopo+renesas@jmondi.org>
 <f6b43803-1880-c5fe-dba1-fa94d1dbb182@lucaceresoli.net>
 <20200911085939.3fahuftw3o2hj4vw@uno.localdomain>
 <20200911173550.GE6808@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911173550.GE6808@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 08:35:50PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Fri, Sep 11, 2020 at 10:59:39AM +0200, Jacopo Mondi wrote:
> > On Fri, Sep 11, 2020 at 09:53:23AM +0200, Luca Ceresoli wrote:
> > > On 10/09/20 18:20, Jacopo Mondi wrote:
> > > > Convert the imx274 bindings document to json-schema and update
> > > > the MAINTAINERS file accordingly.
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >
> > > > v4->v5:
> > > > - Add optional properties that were upstreamed in v5.9-rc2 in the textual
> > > >   bindings
> > > > - Move them to be lowercase: this patch should be fast-tracked through the
> > > >   fixes branch to make sure it gets in before v5.9 is released, otherwise the
> > > >   textual bindings will have supplies names in uppercase
> > > >
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/imx274.txt  | 38 ---------
> > > >  .../bindings/media/i2c/sony,imx274.yaml       | 77 +++++++++++++++++++
> > > >  MAINTAINERS                                   |  2 +-
> > > >  3 files changed, 78 insertions(+), 39 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > > > deleted file mode 100644
> > > > index 0727079d2410..000000000000
> > > > --- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > > > +++ /dev/null
> > > > @@ -1,38 +0,0 @@
> > > > -* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
> > > > -
> > > > -The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
> > > > -an active array size of 3864H x 2202V. It is programmable through I2C
> > > > -interface. The I2C address is fixed to 0x1a as per sensor data sheet.
> > > > -Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> > > > -at 1440 Mbps.
> > > > -
> > > > -
> > > > -Required Properties:
> > > > -- compatible: value should be "sony,imx274" for imx274 sensor
> > > > -- reg: I2C bus address of the device
> > > > -
> > > > -Optional Properties:
> > > > -- reset-gpios: Sensor reset GPIO
> > > > -- clocks: Reference to the input clock.
> > > > -- clock-names: Should be "inck".
> > > > -- VANA-supply: Sensor 2.8v analog supply.
> > > > -- VDIG-supply: Sensor 1.8v digital core supply.
> > > > -- VDDL-supply: Sensor digital IO 1.2v supply.
> > > > -
> > > > -The imx274 device node should contain one 'port' child node with
> > > > -an 'endpoint' subnode. For further reading on port node refer to
> > > > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > -
> > > > -Example:
> > > > -	sensor@1a {
> > > > -		compatible = "sony,imx274";
> > > > -		reg = <0x1a>;
> > > > -		#address-cells = <1>;
> > > > -		#size-cells = <0>;
> > > > -		reset-gpios = <&gpio_sensor 0 0>;
> > > > -		port {
> > > > -			sensor_out: endpoint {
> > > > -				remote-endpoint = <&csiss_in>;
> > > > -			};
> > > > -		};
> > > > -	};
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > > new file mode 100644
> > > > index 000000000000..fe81def68466
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > > @@ -0,0 +1,77 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Sony 1/2.5-Inch 8.51MP CMOS Digital Image Sensor
> > > > +
> > > > +maintainers:
> > > > +  - Leon Luo <leonl@leopardimaging.com>
> > > > +
> > > > +description: |
> > > > +  The Sony IMX274 is a 1/2.5-inch CMOS active pixel digital image sensor with an
> > > > +  active array size of 3864H x 2202V. It is programmable through I2C interface.
> > > > +  Image data is sent through MIPI CSI-2, which is configured as 4 lanes at 1440
> > > > +  Mbps.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: sony,imx274
> > > > +
> > > > +  reg:
> > > > +    const: 0x1a
> > > > +
> > > > +  reset-gpios:
> > > > +    maxItems: 1
> > > > +
> > > > +  port:
> > > > +    type: object
> > > > +    description: |
> > > > +      Output video port. See ../video-interfaces.txt.
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  clock-names:
> > > > +    const: inck
> > > > +
> > > > +  vana-supply:
> > > > +    description: Sensor 2.8v analog supply.
> > > > +    maxItems: 1
> > > > +
> > > > +  vdig-supply:
> > > > +    description: Sensor 2.8v analog supply.
> > >
> > > Copy-paste leftover. Should be "Sensor 1.8v digital core supply."
> > 
> > oooo :(
> > I've been so sloppy on this series I'm almost ashamed.
> > 
> > I'll send a v6 with your tag in
> 
> And if you haven't already, s/v/V/ (the voltage symbol is an uppercase
> V).

Also a whitespace character before that "V" would be nice. :)

-- 
Sakari Ailus
